---
title: Enable Windows Hello for a infrared camera for Windows 10 Build 1511
description: Windows Hello provides you the ability to enable facial or fingerprint recognition to log on to a Windows 10 system or device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 82D894F5-D715-4991-92B2-287A33C48ECD
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable Windows Hello for a infrared camera for Windows 10 Build 1511
Note: this sample is deprecated and will be removed for Windows 10 version 1703 GA.

Windows Hello provides you the ability to enable facial or fingerprint recognition to log on to a Windows 10 system or device. This topic discusses how to enable Windows Hello for an infrared video camera and is meant for original equipment manufacturers (OEMs) and independent hardware vendors (IHVs) who want to provide this log on functionality in their devices. Specifically, IHVs who are producing calibrated color, IR or depth sensors for use by the app-facing Perception APIs, and OEMs who are assembling and calibrating across sensors from various IHVs to produce a final device.

**Note**  This topic does not cover the mechanics of reading data off the underlying device. If the IHV has a proprietary driver, the [**IPerceptionFrameProvider**](https://msdn.microsoft.com/library/windows/hardware/mt187468) implementation should talk to that driver. If the device is a UVC device, the IHV should leverage use Media Foundation and the class driver to pull data from the device. For more information about Media Foundation, see [Microsoft Media Foundation](https://msdn.microsoft.com/library/windows/hardware/ms694197).

 

## Windows Hello checklist


The following steps are required in order for you to support Windows Hello for Windows 10 Build 1511.

### Register a provider module for the IR camera

When installing the driver, each source provider DLL must be registered in the registry under the following key:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Analog\Providers
```

Each source provider should be registered under its own sub key under Providers. Each source provider entry needs to include the following two values:

| Name               | Data type       | Description                                                                                           |
|--------------------|-----------------|-------------------------------------------------------------------------------------------------------|
| *ModulePath*       | REG\_EXPAND\_SZ | Full path to the DLL that instantiates the IPerceptionFrameProviderManager object.                    |
| *ActivatableClass* | REG\_SZ         | Fully qualified nams of the runtime class implementing the IPerceptionFrameProviderManager interface. |

 

A single DLL can implement multiple distinct source providers by registering multiple keys sharing the same *ModulePath* but with different *ActivatableClass* values. For example, a source provider using the Kinect for Windows v2 SDK may look like this:

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Analog\Providers\KinectV2]
"ModulePath"="%SystemRoot%\System32\Kinect\KinectV2SourceProvider.dll"
"ActivatableClass"="Microsoft.Kinect.KinectV2SourceProvider"
```

### Set a registry key to indicate a Windows Hello capable device

To allow the Windows Hello enrollment user interface to display without the delay of loading and initializing cameras, the following registry value hint is required when installing the provider dll.

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Analog\Providers]
"FaceAuthenticationSourcesHint"=dword:00000001
```

### Implement a IPerceptionFrameProviderManager

The System service loads the provider DLL and initializes the manager. The dll must have an activatable class implementing [**IPerceptionFrameProviderManager**](https://msdn.microsoft.com/library/windows/hardware/mt187468manager), the system will activate this class.

```
namespace WDDP = Windows::Devices::Perception::Provider;
public ref class SampleFrameProviderManager sealed : public WDPP::IPerceptionFrameProviderManager
{
public:

    SampleFrameProviderManager();
    virtual ~SampleFrameProviderManager();

    // IFrameProviderManager interface methods
   virtual WDPP::IPerceptionFrameProvider^ GetFrameProvider(
   WDPP::PerceptionFrameProviderInfo^ frameProviderInfo);

private:
}
```

### Initialize and register the device

When a device is attached, you must create the provider and register it through [**RegisterFrameProviderInfo**](https://msdn.microsoft.com/library/windows/hardware/mt187525).

You also need to notify the source is available using [**UpdateAvailabilityForProvider**](https://msdn.microsoft.com/library/windows/hardware/mt187530).

```
   
{// Initialize our IPerceptionFrameProvider object and add it to the Manager&#39;s internal map
        void SampleFrameProvider^ provider = ref new SampleFrameProvider(targetDeviceId);
        _providerMap->Insert(provider->FrameProviderInfo->Id, provider);
        
        // Register our Provider object with the service
        WDPP::PerceptionFrameProviderManagerService::RegisterFrameProviderInfo(
        this, provider->FrameProviderInfo);

        // Notify the provider is avalible because device is connected 
        WDPP::PerceptionFrameProviderManagerService:: UpdateAvailabilityForProvider(
              provider, true); 

         // Initialize a ControlGroup object which allows the clients to set/change 
        // properties on the Provider
        auto controllerModeIds = ref new Platform::Collections::Vector<Platform::String^>();
        controllerModeIds->Append(provider->FrameProviderInfo->Id);
        _controlGroup = ref new WDPP::PerceptionControlGroup(controllerModeIds->GetView());
        WDPP::PerceptionFrameProviderManagerService::RegisterControlGroup(this, _controlGroup);

        // Register our Provider for FaceAuthentication. only a single Provider in this implementation
        auto faceAuthProviderIds = ref new Platform::Collections::Vector<Platform::String^>();
        faceAuthProviderIds->Append(provider->FrameProviderInfo->Id);

        // Create handlers for the "Start" and "Stop" FaceAuthentication events
        auto startFaceAuthHandler = ref new WDPP::PerceptionStartFaceAuthenticationHandler(
            this, &amp;SampleFrameProviderManager::StartFaceAuthentication);

        auto stopFaceAuthHandler = ref new WDPP::PerceptionStopFaceAuthenticationHandler(
            this, &amp;SampleFrameProviderManager::StopFaceAuthentication);

        // Create a FaceAuthentication group containing our Providers list and event handlers
        _faceAuthGroup = ref new WDPP::PerceptionFaceAuthenticationGroup(
            faceAuthProviderIds->GetView(),
            startFaceAuthHandler,
            stopFaceAuthHandler);

        // Finally register our FaceAuthentication group with the service
        WDPP::PerceptionFrameProviderManagerService::RegisterFaceAuthenticationGroup(
        this, _faceAuthGroup); 
}
```

### Unregister the device

When device is unplugged from the computer, unregister the provider through [**UnregisterFrameProviderInfo**](https://msdn.microsoft.com/library/windows/hardware/mt187529) to notify the system that the device is no longer available.

```
   
void SampleFrameProviderManager::OnDeviceDisconnect()
{
    // Unregister the FaceAuthentication group
    if (_faceAuthGroup != nullptr)
    {
        WDPP::PerceptionFrameProviderManagerService::UnregisterFaceAuthenticationGroup(
this, _faceAuthGroup);
        _faceAuthGroup = nullptr;
    }

    // Unregister the ControlGroup
    if (_controlGroup != nullptr)
    {
        WDPP::PerceptionFrameProviderManagerService::UnregisterControlGroup(this, _controlGroup);
        _controlGroup = nullptr;
    }

    // Unregister the Provider object and release it. Following sample assume there’s only 1 provider.
    if (_providerMap->Size > 0)
    {
        auto firstItem = _providerMap->First();
        WDPP::PerceptionFrameProviderInfo^ providerInfo =
 firstItem->Current->Value->FrameProviderInfo;
        if (providerInfo != nullptr)
        {
            WDPP::PerceptionFrameProviderManagerService::UnregisterFrameProviderInfo(
this, providerInfo);
        }

        _providerMap->Clear();

```

### Enumerate and filter available frame sources

This code demonstrates how to enumerate and filter the available frame sources, with notifications when the frame sources are registered and unregistered.

```
void SampleFrameProviderManager::OnDeviceDisconnect()
{
    // Unregister the FaceAuthentication group
    if (_faceAuthGroup != nullptr)
    {
        WDPP::PerceptionFrameProviderManagerService::UnregisterFaceAuthenticationGroup(
this, _faceAuthGroup);
        _faceAuthGroup = nullptr;
    }

    // Unregister the ControlGroup
    if (_controlGroup != nullptr)
    {
        WDPP::PerceptionFrameProviderManagerService::UnregisterControlGroup(this, _controlGroup);
        _controlGroup = nullptr;
    }

    // Unregister the Provider object and release it. Following sample assume there’s only 1 provider.
    if (_providerMap->Size > 0)
    {
        auto firstItem = _providerMap->First();
        WDPP::PerceptionFrameProviderInfo^ providerInfo =
 firstItem->Current->Value->FrameProviderInfo;
        if (providerInfo != nullptr)
        {
            WDPP::PerceptionFrameProviderManagerService::UnregisterFrameProviderInfo(
this, providerInfo);
        }

        _providerMap->Clear();
    }
 }

```

### Respond to Start requests

The provider must turn on the camera and start publishing frames using [**PerceptionFrameProviderManagerService.PublishFrameForProvider**](https://msdn.microsoft.com/library/windows/hardware/mt187521)in less than 400ms after receiving a Start request. If the Start request arrives when the device is unavailable, the provider should queue this request and start publishing frames when the device becomes available.

```
   

void SampleFrameProvider::Start()
{
    // Normally, a source would communicate to underlying device that actually produces
    // the desired data.  For simplicity this sample frameprovider is a synthetic  
    // source backed by a timer.
 
    _threadPoolTimer = WST::ThreadPoolTimer::CreatePeriodicTimer(
        ref new WST::TimerElapsedHandler(this, &amp;SampleFrameProvider::OnFrameArrived),
        _frameDuration);
}
```

### Respond to Stop requests

The provider must stop publishing frames and turn off the camera.

```
void SampleFrameProvider::Stop()
{
    // Normally, a source would communicate to underlying device that actually produces
    // the desired data.  For simplicity this sample frameprovider is a synthetic  
// source backed by a timer.

    if (_threadPoolTimer)
    {
        _threadPoolTimer->Cancel();
        _threadPoolTimer = nullptr;
    }
}
```

### Enter or exit face authentication mode

The provider is notified when face authentication actually begins and ends via the [**PerceptionStartFaceAuthenticationHandler**](https://msdn.microsoft.com/library/windows/hardware/mt187539) and [**PerceptionStopFaceAuthenticationHandler**](https://msdn.microsoft.com/library/windows/hardware/mt187540) events respectively. Respond to these events if your device requires a state or mode change to support face authentication. For example, switching the camera from “RGB mode” to “IR mode” and back again.

```
   
void SampleFrameProvider:: StartFaceAuthentication ()
{
    // A request from the system to Start face authentication.  For some sensors, 
    // this can be a no-op, while other sensors must fine tune behavior
    // NOTE: if this device exposes multiple FrameProviders to support face auth,
    // StartFaceAuthentication and StopFaceAuthentication mode should be 
    // atomic between the 2 providers
 
    if (!_inFaceMode)
    {
        for (WDPP::IFrameProvider^ provider: _frameProviders)
        {
            safe_cast<SampleFrameProvider^>(provider)->SetFaceMode(true);
        }
 
        _inFaceMode = true;
    }
}

```

Here's how to respond to a request to exit face authentication mode.

```
   
void SampleFrameProvider::ExitFaceAuthenticationMode()
{
    // A request from the system to exit face authentication.  For some sensors, 
    // this can be a no-op, while other sensors must fine tune behavior
    // NOTE: if this device exposes multiple FrameProviders to support face auth
    // StartFaceAuthentication and StopFaceAuthentication mode should be 
    // atomic between the 2 providers
 
    if (_inFaceMode)
    {
        for (WDPP::IFrameProvider^ provider: _frameProviders)
        {
            safe_cast<SampleFrameProvider^>(provider)->SetFaceMode(false);
        }
 
        _inFaceMode = false;
    }
}

```

### Report AmbientSubtractionEnabled through IPerceptionFrameProvider.Properties

Windows Hello requires “clean IR” to perform face authentication with high accuracy, which is produced through Ambient Light Subtraction of illuminated and non-illuminated frame pairs. The [**IPerceptionFrameProvider**](https://msdn.microsoft.com/library/windows/hardware/mt187468) is required to configure the system for this operation by setting the [**AmbientSubtractionEnabled**](https://msdn.microsoft.com/library/windows/hardware/mt187404) property:

-   Set AmbientSubtractionEnabled=False
    **Important**  Frame providers are not permitted to use custom Ambient Light Subtraction algorithms for frames passed to Windows Hello and must set AmbientSubtractionEnabled=False for face authentication.

     

In addition, the frame provider is required to tag each IR frame as “illuminated” or “non-illuminated” before passing it up to the system. This is performed by setting the [**ActiveIlluminationEnabled**](https://msdn.microsoft.com/library/windows/hardware/mt187403) property according to the following situations:

-   The LED emitter is on (frame is illuminated): set ActiveIlluminationEnabled=True
-   The LED emitter is off (frame is not illuminated): set ActiveIlluminationEnabled=False

**Note**  The Windows Hello infrared camera sample demonstrates setting [**AmbientSubtractionEnabled**](https://msdn.microsoft.com/library/windows/hardware/mt187404) and [**ActiveIlluminationEnabled**](https://msdn.microsoft.com/library/windows/hardware/mt187403) properties for illuminated/non-illuminated frame pairs.

 

### Notify system that new frames are available on a frame source

```
   
void SampleFrameProvider::OnFrameArrived(/* NewFrame */)
{
    WDPP::PerceptionFrame^ frame = _allocator->AllocateFrame();
    if (frame != nullptr)
    {
        BYTE* buffer = nullptr;
        UINT32 capacity = 0;
        MemoryBufferByteAccess bufferByteAccess;
        bufferByteAccess.GetBuffer(
            reinterpret_cast<IInspectable*>(frame->FrameData), &amp;buffer, &amp;capacity);
 
        // copy the new content into buffer, this is just a sample
        // Ideally, the driver would fill this buffer directly
        memset(buffer, _frameCounter &amp; 0xFF, capacity);

        _frameCounter++;
 
    // When frame is illuminated/unilluminated pairs, make sure set property
         outputFrame->Properties->Insert(
             WDP::KnownPerceptionInfraredFrameSourceProperties::ActiveIlluminationEnabled,
             illuminationEnabled != 0 ? true : false);

         WDPP::PerceptionFrameProviderManagerService::PublishFrameForProvider(this, outputFrame);
    }
}

```

### Respond to changes in properties

You can respond to changes in properties like [**ExposureCompensation**](https://msdn.microsoft.com/library/windows/hardware/mt187407), as shown in the following code example.

```
   
void SampleFrameProvider::SetProperty(_In_ WWP::PerceptionPropertyChangeRequest^ request)
{
    WDP::PerceptionFrameSourcePropertyChangeStatus status =
        WDP::PerceptionFrameSourcePropertyChangeStatus::PropertyNotSupported;

    auto propertyName = request->Name;
    auto value = request->Value;

    // An actual device backed provider will likely require additional validation
    if (propertyName == WDP::KnownPerceptionVideoFrameSourceProperties::VideoProfile)
    {
        // NOTE: videoprofiles are also wired via properties.  Setting VideoProfile
        // should also update VideoProfilesSupported and VideoProfilesAvailable,
        // if necessary.
        if (_TrySetVideoProfile(safe_cast<WFC::IPropertySet^>(request->Value)))
        {
            status = WDP::PerceptionFrameSourcePropertyChangeStatus::Accepted;
        }
        else
        {
            status = WDP::PerceptionFrameSourcePropertyChangeStatus::ValueOutOfRange;
        }
    }
    else if ((propertyName == WDP::KnownPerceptionVideoFrameSourceProperties::SupportedVideoProfiles)
        || (propertyName == WDP::KnownPerceptionVideoFrameSourceProperties::AvailableVideoProfiles))
    {
        status = WDP::PerceptionFrameSourcePropertyChangeStatus::PropertyReadOnly;
    }
    else if (propertyName == WDP::KnownPerceptionInfraredFrameSourceProperties::ExposureCompensation)
    {
        // NOTE: actually control the sensor device and change exposure compensation
        _properties->Insert(request->Name, request->Value);
        status = WDP::PerceptionFrameSourcePropertyChangeStatus::Accepted;
}
    else
    {
        // NOTE: If this provider does not explicitly support the property,
        // it should return PropertyNotSupported.
        status = WDP::PerceptionFrameSourcePropertyChangeStatus::PropertyNotSupported;
}

    request->Status = status;
} 


```

### Handle life cycle methods

[**IPerceptionFrameProvider**](https://msdn.microsoft.com/library/windows/hardware/mt187468) and [**IPerceptionFrameProviderManager**](https://msdn.microsoft.com/library/windows/hardware/mt187468manager) both utilize the [**Windows.Foundation.IClosable**](https://msdn.microsoft.com/library/windows/hardware/hh700638) interface, which projects a Close method onto the C++ class destructor. This method may be invoked directly by the service when your Provider objects are being uninitialized but the object RefCounts haven’t reached 0. This means, the class destructor may be called twice: once when the service calls Close on your object and again when the RefCount reaches 0. Therefore, it’s important to code your provider so that it tracks its own initialized state, i.e. checks that an object or resource hasn’t been already cleaned up before releasing it.

```
   
ref class FrameProvider sealed : Windows::Devices::Perception::IPerceptionFrameProvider
{
public:
    virtual ~FrameProvider()
    {
        Cleanup();
    }

    void Cleanup()
    {
        if (!_alreadyCleaned)
        {
            _alreadyCleaned = true;

            // cleanup code
        }
    }
private:
    bool _alreadyCleaned { false };

```

### ISoftwareBitmap requirements

The following requirements must be met in order for your IR camera to function correctly for Windows Hello.

-   [**PixelWidth**](https://msdn.microsoft.com/library/windows/hardware/br226203) must be equal or less than the maximum listed in [Windows Hello biometric requirements](biometric-requirements.md).
-   [**PixelHeight**](https://msdn.microsoft.com/library/windows/hardware/br226244) must be equal or less than the maximum listed in [Windows Hello biometric requirements](biometric-requirements.md).
-   [**BitmapPixelFormat**](https://msdn.microsoft.com/library/windows/hardware/br226179) must be Gray8.

### PerceptionVideoProfile.FrameDuration requirements

The minimum requirement for [**PerceptionVideoProfile.FrameDuration**](https://msdn.microsoft.com/library/windows/hardware/mt187672) is 15 fps; recommended &gt;=30fps.

### IVideoFrame::RelativeTime requirements

[**RelativeTime**](https://msdn.microsoft.com/library/windows/hardware/dn930925) must be equal to the time when the frame was captured in 100-nanosecond units.

### Report KnownPerceptionVideoFrameSourceProperties.IsMirrored

Default is false if property is not set.

### Report KnownPerceptionInfraredFrameSourceProperties.AutoExposureEnabled

Default is true if property is not set.

## Biometric framework extensibility features


The following features are available to IHVs and OEMs using this extensibility API. The notifications mentioned below are triggered either by changes to the device (e.g. peripheral attach/detach) or requests made by apps that are aggregated by the system, for instance, starting to read from an IR frame source. None of these features are required by Windows Hello.

### Set the correlation between depth, IR, and color

```
void SampleFrameProviderManager::SetCorrelation (Platform::String^ serialNumber)
{

 
    // infrared and depth are backed by the same sensor.  
    // As such, they are in identical positons, and the offsets are all 0.

    // the IR (and Depth) camera forms the origin of the device
    WF::Numerics::Vector3 depthAndInfraredPosition;
    depthAndInfraredPosition.X = 0;
    depthAndInfraredPosition.Y = 0;
    depthAndInfraredPosition.Z = 0;
 
    WF::Numerics::Quaternion depthAndInfraredOrientation;
    depthAndInfraredOrientation.W = 1;
    depthAndInfraredOrientation.X = 0;
    depthAndInfraredOrientation.Y = 0;
    depthAndInfraredOrientation.Z = 0;
 
    // Color is offset from the the IR/Depth camera by 5 cm to the right
    // In a real implementation this would likely load a factory calibrated value from          
    // device firmware rather than relying on a nominal value 
    WF::Numerics::Vector3 colorPosition;
    colorPosition.X = 0.05;
    colorPosition.Y = 0;
    colorPosition.Z = 0;
 
    WF::Numerics::Quaternion colorOrientation;
    colorOrientation.W = 1;
    colorOrientation.X = 0;
    colorOrientation.Y = 0;
    colorOrientation.Z = 0;
 
auto depthCorrelation = ref new WDPP::PerceptionCorrelation(
    _depthFrameProviderId, depthAndInfraredPosition, depthAndInfraredOrientation);
auto infraredCorrelation = ref new WDPP::PerceptionCorrelation(
    _InfraredFrameProviderId, depthAndInfraredPosition, depthAndInfraredOrientation);
    auto colorExtrinsics = ref new WDPP::FrameProviderTransform(
_colorFrameProviderId, colorPosition, colorOrientation);
 
    auto correlations = ref new Platform::Collections::Vector<WWP::PerceptionCorrelation^>();
    correlations->Append(depthCorrelation);
    correlations->Append(infraredCorrelation);
    correlations->Append(infraredHiddenLocation);
    correlations->Append(colorExtrinsics);

    _correlationGroup = ref new WWP::PerceptionCorrelationGroup(correlations->GetView());
    WWP::PerceptionFrameProviderManagerService::RegisterCorrelationGroup(this, _correlationGroup);
 }

```

### <a href="" id="notify-system-of-a-given-frame-source-camera-s-lens-distortion-model"></a>Notify system of a given frame source camera’s lens distortion model

```
   
SampleFrameProvider::SampleFrameProvider()
{
    // ... ctor

    // Initial CameraModel
    auto cameraIntrinsicsData = ref new Windows::Foundation::Collections::PropertySet();
    {
        auto fl = ref new Platform::Array<float>{ 300.0f, 200.0f };
        cameraIntrinsicsData->Insert(
            WDP::KnownCameraIntrinsicsProperties::FocalLength,
            fl);

        auto pp = ref new Platform::Array<float>{ 150.0f, 100.0f };
        cameraIntrinsicsData->Insert(
            WDP::KnownCameraIntrinsicsProperties::PrincipalPoint,
            pp);

        auto rd = ref new Platform::Array<float>{ 0.5f, 0.25f, 0.125f};
        cameraIntrinsicsData->Insert(
            WDP::KnownCameraIntrinsicsProperties::RadialDistortion,
            rd);

        auto td = ref new Platform::Array<float>{ 0.1f, 0.2f };
        cameraIntrinsicsData->Insert(
            WDP::KnownCameraIntrinsicsProperties::TangentialDistortion,
            td);
    }

    _properties->Insert(
        WDP::KnownPerceptionVideoFrameSourceProperties::CameraIntrinsics,
        cameraIntrinsicsData);
}

```

### Notify system of calibration between frame sources

For the full function example, see the "Set the correlation between depth, IR, and color "section of this topic.

```
   
    WF::Numerics::Vector3 colorPosition;
    colorPosition.X = 0.05;
    colorPosition.Y = 0;
    colorPosition.Z = 0;
 
    WF::Numerics::Quaternion colorOrientation;
    colorOrientation.W = 1;
    colorOrientation.X = 0;
    colorOrientation.Y = 0;
    colorOrientation.Z = 0;
 
auto depthCorrelation = ref new WDPP::PerceptionCorrelation(
    _depthFrameProviderId, depthAndInfraredPosition, depthAndInfraredOrientation);
auto infraredCorrelation = ref new WDPP::PerceptionCorrelation(
    _InfraredFrameProviderId, depthAndInfraredPosition, depthAndInfraredOrientation);
    auto colorExtrinsics = ref new WDPP::FrameProviderTransform(
_colorFrameProviderId, colorPosition, colorOrientation);
 
    auto correlations = ref new Platform::Collections::Vector<WWP::PerceptionCorrelation^>();
    correlations->Append(depthCorrelation);
    correlations->Append(infraredCorrelation);
    correlations->Append(infraredHiddenLocation);
    correlations->Append(colorExtrinsics);

    _correlationGroup = ref new WWP::PerceptionCorrelationGroup(correlations->GetView());
    WWP::PerceptionFrameProviderManagerService::RegisterCorrelationGroup(this, _correlationGroup);
 }

```

 

 






