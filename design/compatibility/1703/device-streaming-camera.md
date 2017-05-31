---
title: Device.Streaming.Camera
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.Streaming.Camera

 - [Device.Streaming.Camera.Base](#device.streaming.camera.base)
 - [Device.Streaming.Camera.Base.Sharing](#device.streaming.camera.base.sharing)
 - [Device.Streaming.Camera.UVC](#device.streaming.camera.uvc)

<a name="device.streaming.camera.base"></a>
## Device.Streaming.Camera.Base

### Device.Streaming.Camera.Base.AVStreamClassInterfaceAndWDM 

*Camera implementation must be based on AVStream class and WDM, and must meet interface requirements*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

Camera implementations must be based on the AVStream class interface and Windows Driver Model (WDM) as defined in the Windows Driver Kit. AVStream is the replacement technology for Stream class interface, which is no longer supported.

Camera drivers must support all of the required pins, properties, and settings as defined in the Windows Driver Kit.

*Camera Profiles *(If Implemented)*:*

The driver may advertise profiles which are combinations of camera capabilities that are guaranteed to work simultaneously. More information on Camera Profiles can be found in the WDK.

*Independent Pins:*

All pins advertised by the camera driver must be able to operate independently and in combination according to the capabilities listed in the Profiles advertised by the device. If the device does not support Profiles, then concurrent streaming of pins for all advertised capabilities for all media types should be supported. If the record and image pins of the camera are not able to stream concurrently, the driver must explicitly advertise this by setting the KSPROPERTY\_CAMERACONTROL\_IMAGE\_PIN\_CAPABILITY\_EXCLUSIVE\_WITH\_RECORD and KSPROPERTY\_CAMERACONTROL\_IMAGE\_PIN\_CAPABILITY\_SEQUENCE\_EXCLUSIVE\_WITH\_RECORD flags in the driver INF (see additional documentation about these flags here: https://msdn.microsoft.com/en-us/library/windows/hardware/jj553707.aspx. All other pin combinations must be supported.

USB based cameras must be USB Video Class (UVC) compliant as defined in **Device.Streaming.Camera.UVC.UVCDriver** and **Device.Streaming. Camera.UVC.USBClassDriver**.

**Error Conditions**

Error Conditions include (but are not limited to) forced invalid pin connections, invalid property sets, buffers with invalid data, null pointers, and error conditions from drivers above or below on the stack

### Device.Streaming.Camera.Base.DirectShow

*RGB camera implementation must support DirectShow.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
</td></tr></table>

**Description**

RGB cameras must work with Microsoft DirectShow in order to support legacy applications.

### Device.Streaming.Camera.Base.KSCategoryVideoCameraRegistration

*RGB cameras must register under KSCategory\_Video\_Camera*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

RGB cameras must register under KSCategory\_Video\_Camera for Windows to detect the camera

### Device.Streaming.Camera.Base.MediaFoundation

*Camera implementation must support Media Foundation architecture.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

Cameras must work with Microsoft Media Foundation in order to support legacy (Win32) and Windows Store applications.

### Device.Streaming.Camera.Base.MultipleClientAppSupport

*Camera implementation must support multiple KS filter instances and independent streaming*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

*Multiple filter instance of the same device: *

Each camera must allow multiple filter instances to be created. Devices may only allow one filter instance to actively stream.

### Device.Streaming.Camera.Base.NonRGBCameras

*Non-RGB Cameras must register under KSCategory\_Sensor\_Camera*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

To differentiate the functionality between RGB cameras and other types of sensors, Cameras that are not RGB video streaming cameras must register under category KSCategory\_Sensor\_Camera

### Device.Streaming.Camera.Base.PnPandPowerPolicies 

*Camera implementation must comply with Microsoft PNP and power policies.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

Cameras must comply with Microsoft PNP and power policies and also support connected stand by configurations.

More info can be found at the following link:

-   <http://go.microsoft.com/fwlink/?LinkID=733968>

### Device.Streaming.Camera.Base.SurpriseRemoval

*Hot-pluggable cameras must support surprise removal.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

All hot-pluggable cameras must support their surprise removal from the host bus.

### Device.Streaming.Camera.Base.UsageIndicator

*Cameras must have a visual indicator to indicate usage*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

A camera must have a visual indicator that indicates when it is streaming. The visual indicator must be on when device is streaming and off when the device is not streaming. If there are multiple cameras on the system but only a single indicator, the indicator must be on when any of the devices are streaming.

A hardware usage indicator (physical LED) is strongly recommended. In lieu of a physical LED, the following regkey may be set:

<dl><dt>Path</dt><dd><p>HKLM\\SOFTWARE\\Microsoft\\OEM\\Device\\Capture</p></dd><dt>Entry</dt><dd><p>NoPhysicalCameraLED (REG\_DWORD).</p></dd><dt>0x1</dt><dd><p>Turn on the feature (= No Physical camera LED on the system).</p></dd><dt>0x0</dt><dd><p>Default. Turn off the feature (= Physical camera LED on the system)</p></dd></dl>

When this is set, the operating system will be able to show UI indicating when the camera is streaming.

<a name="device.streaming.camera.base.sharing"></a>
## Device.Streaming.Camera.Base.Sharing

### Device.Streaming.Camera.Base.Sharing.CustomMediaSource

*Custom media sources must support the Media Foundation architecture and interfaces*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

Cameras and by extension custom media sources that act as cameras must work with Microsoft Media Foundation in order to support Windows applications. In addition to the normal MediaSource interfaces and attributes, the custom media source must be installable as part of a driver package.

### Device.Streaming.Camera.Base.Sharing.DeviceMFT

*Sharing Camera’s DeviceMFT and MFT0 must run out of process as the user mode application*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

To support the sharing experience, the device driver and user mode components associated with the driver (DeviceMFT or MFT0) will be run out of a different process than the user mode application using the capture APIs. This means that the user mode components can take no dependencies on running in process as the user mode application. Some examples of this are a private interface to the DeviceMFT from the application or taking a reference to the CaptureEngine object.

### Device.Streaming.Camera.Base.Sharing.FaceAuthMode

*To support Face Authentication DDI as supported, Windows Hello additional requirements must also be met*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

To advertise that Face Authentication is supported by a device, additional Windows Hello requirements must be met. These include minimum resolutions and frame rates. Please see the Windows Hardware Guidance for Delightful Face Authentication Scenario (V2.0 or above) document for further details.

### Device.Streaming.Camera.Base.Sharing.MemoryAllocation

*Memory allocation by drivers must be aligned to 4k (4096 bytes) page boundaries.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

Memory allocation by drivers must be aligned to 4k page boundaries.  It is recommended that the driver’s user mode component use the MF (Media Foundation) allocator.

### Device.Streaming.Camera.Base.Sharing.NonConsumableData

*Streams not meant for user consumption must be hidden*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
</td></tr></table>

**Description**

Any stream exposed by the driver should be usable in some way by an application. The data type for the stream being well understood is not required, but the stream should be functional in all other aspects of streaming. If the data from a stream cannot be consumed by another component or application, this must be marked on the pin so that it will be hidden from applications.

<a name="device.streaming.camera.uvc"></a>
## Device.Streaming.Camera.UVC

### Device.Streaming.Camera.UVC.USBClassDriver 

*USB Streaming video cameras must comply with USB Video Class specifications and work with the Microsoft UVC driver (USBVideo.sys) *

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
</td></tr></table>

**Description**

All USB streaming video Cameras must be compatible with Microsoft USB Video class driver (USBVideo.sys).

### Device.Streaming.Camera.UVC.UVCDriver

*USB streaming video cameras must comply with USB Video Class specifications*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
</td></tr></table>

**Description**

All USB streaming video cameras, including those not natively using the Microsoft USB Video Class driver (USBVideo.sys), must comply with the USB Video Class specifications. At a minimum, all mandatory properties and commands must be implemented. All implemented commands must comply with the specifications.

*Non Microsoft Driver (If Implemented)*

USB Camera implementations that do not use the Microsoft USB Video Class driver must still be compatible with USBVideo.sys (per **Device.Streaming.Camera.UVC.USBClassDriver**)

*Native H264 Support (If Implemented*)*

If H.264 format is supported natively by the camera, the implementation must be compliant with the USB Video Class specification. For reference, see: <http://go.microsoft.com/fwlink/?LinkId=233063>. In addition, the H.264 bitstream must be compliant with Media Foundation.

At minimum 2 pins must be supported:

1. A preview pin on the same device with uncompressed output type YUY2 and/or NV12

2. H.264 format must be on a separate video capture pin

