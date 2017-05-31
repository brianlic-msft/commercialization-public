---
title: Device.Portable
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

# Device.Portable

 - [Device.Portable.Core](#device.portable.core)
 - [Device.Portable.DigitalCamera](#device.portable.digitalcamera)
 - [Device.Portable.DigitalVideoCamera](#device.portable.digitalvideocamera)
 - [Device.Portable.MediaPlayer](#device.portable.mediaplayer)
 - [Device.Portable.MobilePhone](#device.portable.mobilephone)

<a name="device.portable.core"></a>
## Device.Portable.Core

*Core*

### Device.Portable.Core.AudioCodec

*If a portable device can capture audio content, it must do so using a format supported natively in Windows.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

If a portable device can capture audio content, it must do so in a format that Windows understands natively.

The following tables represent the list of in-box formats that Windows will render to; this is not the exhaustive of supported formats in Windows. The full list of formats supported can be found at: <http://go.microsoft.com/fwlink/?LinkID=242995&clcid=0x409>.

**Note** that for a given format in the tables below it is not required to support all given Bit rates and Sample rates, it is however required to support a format that lines up within the ranges provided.

<html>
    <p><strong>MP4 Audio Content</strong></p>
    <table>
        <thead>
            <tr class="header">
                <th></th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td rowspan="4">AAC</td>
                <td>Codec</td>
                <td>
                    AAC Standard, AAC Profile level 2 minimum (0x29),<br />
                    compatible with (0x29, 0x2A, 0x2B, 0x2C, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33)
                </td>
            </tr>
            <tr class="even">
                <td>bit rate for CBR</td>
                <td>96, 128, 160, 192 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Sample rate</td>
                <td>44.1 or 48 kHz</td>
            </tr>
            <tr class="even">
                <td>Channels</td>
                <td>2</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>MP3 Audio Content</strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th></th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td rowspan="4">MP3</td>
                <td>Codec</td>
                <td>Version1, Layer3</td>
            </tr>
            <tr class="even">
                <td>Bit rate for CBR files</td>
                <td>From 32 to 320 kilobits per second (Kbps)</td>
            </tr>
            <tr class="odd">
                <td>Sample rate</td>
                <td>16, 22.05, 24, 32, 44.1, 48 kilohertz (kHz)</td>
            </tr>
            <tr class="even">
                <td>Channels</td>
                <td>2</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>WMA Audio Content</strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th></th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td rowspan="6">WMA Standard</td>
                <td>Codec</td>
                <td>WMA9 or later</td>
            </tr>
            <tr class="even">
                <td>Bit rate for CBR files</td>
                <td>From 32 to 256 kilobits per second (Kbps)</td>
            </tr>
            <tr class="odd">
                <td>Average bit rate for VBR files</td>
                <td>From 48 to 160 Kbps</td>
            </tr>
            <tr class="even">
                <td>Maximum peak bit rate for VBR files</td>
                <td>256 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Sample rate</td>
                <td>44.1 or 48 kilohertz (kHz)</td>
            </tr>
            <tr class="even">
                <td>Channels</td>
                <td>2</td>
            </tr>
        </tbody>
    </table>
</html>
 

### Device.Portable.Core.CustomDeviceServices

*A portable device that implements custom MTP Services must meet the requirements defined in the MTP Devices Services Extension Specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The MTP Device Services Extension to the Media Transfer Protocol (MTP) helps an MTP Initiator, in this case Windows, find and access certain types of content stored on the device.  Extension mechanisms have been defined that provide greater flexibility for applications that deal with specific content types defined by the device. These mechanisms provide greater extensibility than the existing data code mechanisms currently defined by the Media Transfer Protocol Specification, Revision 1.0.

If the portable device supports a custom device service, the implementation must have a valid *ServiceInfo* dataset, a valid *ServiceCapabilities* dataset, and a valid *ServicePropertiesDesc* dataset as defined in the MTP Device Services Extension Specification. All mandatory properties defined in the specification must be supported in the custom service.

The following table is a list of operations that are required when implementing MTP Services:

| Operation              | MTP Datacode | Description                                                                                                                                                                               |
|------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GetServiceIDs          | 0x9301       | This operation returns an array of ServiceIDs.                                                                                                                                            |
| GetServiceInfo         | 0x9302       | This operation returns the ServiceInfo dataset for a service.                                                                                                                             |
| GetServiceCapabilities | 0x9303       | All object format and method format information is reported by using the GetServiceCapabilities operation.                                                                                |
| GetServicePropDesc     | 0x9304       | This operation returns theServicePropertyDesc dataset for a service.                                                                                                                      |
| GetServicePropList     | 0x9305       | This operation is similar to GetObjectPropList in the MTP specification, Revision 1.0. GetServicePropList reads properties from a service.                                                |
| SetServicePropList     | 0x9306       | This operation sets a ServiceProperty by using the ServicePropList dataset. It enables the writing of property values to a service.                                                       |
| UpdateObjectPropList   | 0x9307       | This operation sets the property list for a particular object that will be updated with a new binary object. This operation can be used to replace the binary data of an existing object. |
| DeleteObjectPropList   | 0x9308       | This operation removes the properties that are specified in the DeleteObjectPropList dataset from the specified object or objects.                                                        |
| DeleteServicePropList  | 0x9309       | This operation removes the properties that are specified in the DeleteServicePropList dataset from the specified service.                                                                 |

 
If scenarios that can be implemented using capabilities defined in the MTP specification are not implemented using the operations, device properties, etc. defined in the MTP 1.0 specification (or later), then the device must define these scenarios in terms of device services and must support these services according to the requirements defined in the MTP Device Services Extension Specification. For example, a media exchange service may be defined to manage media synchronization between the initiator and responder that replaces functionality supported by standard MTP 1.0 behavior.

To expose a custom device service in Device Stage, a custom task must be authored and defined as part of the Device Stage authoring process. This is described in the Microsoft Device Experience Development Kit.

*Design Notes*

-   Refer to the MTP Device Services Extension Specification available at *http://msdn.microsoft.com/en-us/windows/hardware/gg463541.aspx*.

-   Refer to the Microsoft Device Experience Development Kit available at *http://msdn.microsoft.com/en-us/windows/hardware/gg463154.aspx*.

### Device.Portable.Core.DeviceServices

*Portable devices that support defined MTP Services must implement these services according to the requirements defined in the MTP Device Services for Windows Specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The MTP Device Services architecture enables Windows to locate and use various services and content types located on a device. By creating extensions to the WPD API and MTP protocol, Windows can locate, consume, and interact with useful content and services on the device.

Supported Personal Information Management (PIM) Services:

-   Contact Service
-   Calendar Service
-   Notes Service
-   Tasks Service

Other Supported Services:

-   Status Service
-   Hints Service
-   Device Metadata Service
-   Ringtones Service
-   SMS Service

If the device supports one or more of the PIM services, it must also support one of two synchronization services to actually synchronize the data. Windows supports the following in-box:

-   Enumeration Sync
-   Anchor Sync

It is up to the manufacturer to choose the services that is best suited for the device.

Vendors who choose to support custom Device Stage metadata packages, should ensure that the appropriate tasks or device properties are exposed correctly within the package.

For services to be accessible by a service aware initiator, the following service related operations must also be supported by the device:

| Operation              | MTP Datacode | Description                                                                                                                                                                               |
|------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GetServiceIDs          | 0x9301       | This operation returns an array of ServiceIDs.                                                                                                                                            |
| GetServiceInfo         | 0x9302       | This operation returns the ServiceInfo dataset for a service.                                                                                                                             |
| GetServiceCapabilities | 0x9303       | All object format and method format information is reported by using the GetServiceCapabilities operation.                                                                                |
| GetServicePropDesc     | 0x9304       | This operation returns theServicePropertyDesc dataset for a service.                                                                                                                      |
| GetServicePropList     | 0x9305       | This operation is similar to GetObjectPropList in the MTP specification, Revision 1.0. GetServicePropList reads properties from a service.                                                |
| SetServicePropList     | 0x9306       | This operation sets a ServiceProperty by using the ServicePropList dataset. It enables the writing of property values to a service.                                                       |
| UpdateObjectPropList   | 0x9307       | This operation sets the property list for a particular object that will be updated with a new binary object. This operation can be used to replace the binary data of an existing object. |
| DeleteObjectPropList   | 0x9308       | This operation removes the properties that are specified in the DeleteObjectPropList dataset from the specified object or objects.                                                        |
| DeleteServicePropList  | 0x9309       | This operation removes the properties that are specified in the DeleteServicePropList dataset from the specified service.                                                                 |

 

*Design Notes*

-   For information on defined MTP Services, refer to the MTP Device Services for Windows Specification available at <http://msdn.microsoft.com/en-us/windows/hardware/gg463544>*.*

-   For information on service operations and general services details, refer to the MTP Device Services Extension Specification available at <http://msdn.microsoft.com/en-us/windows/hardware/gg463545>.

-   See also Metadata Schema and Package Format Specification available at <http://msdn.microsoft.com/en-us/windows/hardware/gg463153>*.*

### Device.Portable.Core.MediaSync

*Portable Devices that support media content must meet basic interoperability requirements to successfully transfer content with an MTP aware media player application on Windows.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An MTP based device must be able to transfer data to and from a PC using a Windows based application that supports MTP.

**Note** that if the device replaces core MTP media handling functionality with a custom MTP Service, then interoperability with Windows Media Player will not function as expected. Devices that implement a custom service must have functional parity with core MTP operations to support media transfer and synchronization with a WPD-based application.

The following requirements must be met when interacting with Windows Media Player:

**Supports digital media transfers from device to computer -** The device must support digital media transfers to computers through applications that enable such transfers, such as the Portable Device Shell Namespace Extension and Windows Media Player.

**Supports digital media transfers from computer to device -** The device must support the transfer of supported media formats from the computer to the device through Windows Media Player. The device must support the transfer of all file formats from the computer to the device through the Windows® Namespace Extension.

**Supports metadata updates - **The device must support updates to MTP metadata after the original track has been copied to the device. The metadata updates are performed using Windows Media Player.

**Supports cancellation of transfer and synchronization -** The device must support cancellations of transfers and synchronizations mid-task without crashing or hanging of the device.

**Properly identifies file types -** The device must not rely on the file name extension of a file to discover the file type. The device can use the MTP object format or can parse the file contents to determine the file type.

**Provide device object metadata -** If a host sends an empty value for Album, Artist, or Title, the device must display meaningful text in place of the empty metadata and allow the user to find the content when searching on the associated field in the device UI. For example, a device might use Unknown Artist for the artist when it receives an empty value for artist metadata. If the device supports displaying genre metadata, then if a host sends an empty value for genre, the device must display meaningful text in place of the empty metadata and allow the user to find the content when searching on the associated field in the device UI.

**Playlist transfer -** The device must support the transfer of playlists manually created by the user using Windows Media Player. When a manual playlist is transferred using Windows Media Player, both the playlist and the content the playlist references must reside on the device.

To receive playlists from Windows Media Player, a device must support object references. If object references are supported, they must be supported on all media file formats. Support for object references is indicated by supporting the following commands:

-   GetObjectReferences (0x9810)
-   SetObjectReferences (0x9811)

The device must also support the AbstractAudioVideoPlaylist (0xBA05) format. A playlist is sent as a 0-byte object with a list of references to object handles for all objects contained in the playlist.

### Device.Portable.Core.ModelID

*Portable devices may support the optional ModelID property to uniquely identify logical device functions on a multi-function device.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Plug and Play includes support for a DevNode property called DEVPKEY\_Device\_ModelId. This key is used to store the ModelID value that some devices will store in a device-class-specific or manufacturer-specific manner on the device.

The ModelID spans logical device functions on a multi-function device through an internal structure in Windows 7 called the Display Object that aggregates logical devices in a single "piece of plastic" representation.  The ModelID can be as specific or as generic as the manufacturer chooses. For example, ModelID may differ between product models, colors of an individual model, or even individual devices. To support ModelID, the device property code 0xD302 along with required properties must be supported.

*Design Notes*

-   Refer to the MTP Device Services Extension Specification that is included with the Windows Portable Device Enabling Kit, available at <http://msdn.microsoft.com/en-us/windows/hardware/gg463545>.

### Device.Portable.Core.MTP

*Portable devices must support a core set of MTP operations and devices properties as defined in the Media Transport Protocol revision 1.0 or later, along with the device properties and object formats for the specific device type.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Media Transfer Protocol (MTP) is an extension of the Picture Transfer Protocol (ISO 15740).  Both specifications include optional commands and operations, but some of these are required for certification. There is a core set of operations and device properties that must be met by each device category in order to be compliant with Windows. Implementation details for MTP are defined in the Media Transfer Protocol Specification, Revision 1.0 or later and will be used as the reference for certification of all portable devices as part of the Windows Hardware Certification Program.

 
**Supports MTP drivers**
A portable device must work with the inbox MTP drivers that ship with Windows. This means that they must install and work immediately without requiring the installation of additional drivers or software.

**Supports MTP by default**
Portable devices must ship with MTP enabled as the default connection mode. Devices can support Mass Storage Class (MSC) in addition to MTP.

-   The device must not have a persistent, user accessible setting to enable or disable the MTP or MSC mode.

-   All storage volumes on a device (both internal and external) must be accessible using the MTP protocol.

A device can have a safe mode that allows the user to boot to the MSC mode for device recovery scenarios. After the user disconnects a device connected in safe mode, the device must resume normal operation.

**Device Information Dataset**
The device must support the MTP DeviceInfo dataset. The following table describes field-specific requirements that must be implemented:

| Dataset Field               | Requirement | Notes                                                                                                                                                                                                                                               |
|-----------------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Standard Version            | R           | This identifies the PTP version this device can support in hundredths. For MTP devices, this shall contain the value 100 (representing 1.00).                                                                                                       |
| MTP Vendor Extension ID     | R           | This identifies the MTP vendor-extension version in use by this device.                                                                                                                                                                             |
| MTP Version                 | R           | This identifies the version of the MTP standard this device supports. For MTP devices implemented under MTP 1.0, this shall contain the value 100 (representing 1.00). For MTP devices implemented under MTP 2.0, this shall contain the value 200. |
| MTP Extensions              | I           | This string is used to identify any extension sets applied to MTP.                                                                                                                                                                                  |
| Functional Mode             | R           | Modes allow the device to express different states with different capabilities. If the device supports only one mode, this field shall contain the value 0x00000000. See the MTP spec for details.                                                  |
| Operations Supported        | R           | This field identifies by datacode all operations that this device supports in the current functional mode.                                                                                                                                          |
| Events Supported            | I           | This field identifies by datacode all events that this device can generate in the current functional mode.                                                                                                                                          |
| Device Properties Supported | R           | This field identifies by datacode all device properties that this device supports in the current functional mode.                                                                                                                                   |
| Capture Formats             | I           | This field identifies by datacode the object format codes for each format that this device can generate independently (that is, without the content being placed on the device).                                                                    |
| Playback Formats            | I           | This field identifies by datacode the object format codes for each format that this device can understand and parse if placed on the device.<br/><br/>If the device can carry unidentified binary objects without understanding them, it shall indicate this by including the Undefined Object (0x3000) code in its Playback formats. |
| Manufacturer                | R           | The MTP specification identifies this as an optional string; it is required for Hardware Certification. This field contains a human-readable string identifying the manufacturer of this device.                                                    |
| Model                       | R           | The MTP specification identifies this as an optional string; it is required for Hardware Certification. This field contains a human-readable string identifying the model of this device.                                                           |
| Device Version              | R           | The MTP specification identifies this as an optional string; it is required for Hardware Certification. This field contains a human-readable string identifying the software or firmware version of this device.                                    |
| Serial Number               | R           | A serial number must be unique among all devices sharing identical Model and Device Version fields.                                                                                                                                                 |

Where:<br/>
R = Required<br/>
I = If Implemented (Optional)<br/>
N/A = Not Applicable

**Supports Control Requests**
Control requests enable an MTP initiator to send out-of-band requests to the MTP responder. The device must support the following requests.

-   Get Status
-   Cancel Request
-   Reset Device Request

**Required Operations**
This core set of MTP operations and device properties must be met by each portable device in order to be compliant with Windows.  Implementation details for each operation and device property are defined in the Media Transfer Protocol Specification, Revision 1.0 or later. The highlighted operations represent the core set of MTP operations required for all portable devices.

|          &nbsp;         | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| GetDeviceInfo           | 0x1001        | R            | R            | R              | R                    | R            |
| OpenSession             | 0x1002        | R            | R            | R              | R                    | R            |
| CloseSession            | 0x1003        | R            | R            | R              | R                    | R            |
| GetStorageIDs           | 0x1004        | R            | R            | R              | R                    | R            |
| GetStorageInfo          | 0x1005        | R            | R            | R              | R                    | R            |
| GetNumObjects           | 0x1006        | R            | R            | R              | R                    | R            |
| GetObjectHandles        | 0x1007        | R            | R            | R              | R                    | R            |
| GetObjectInfo           | 0x1008        | R            | R            | R              | R                    | R            |
| GetObject               | 0x1009        | R            | R            | R              | R                    | R            |
| GetDevicePropDesc       | 0x1014        | R            | R            | R              | R                    | R            |
| GetDevicePropValue      | 0x1015        | R            | R            | R              | R                    | R            |
| DeleteObject            | 0x100B        | R            | R            | I              | I                    | I            |
| SetDevicePropValue      | 0x100A        | R            | R            | I              | I                    | I            |
| SendObjectInfo          | 0x100C        | R            | R            | I              | I                    | I            |
| SendObject              | 0x100D        | R            | R            | I              | I                    | I            |
| GetPartialObject        | 0x101B        | R            | R            | I              | I                    | I            |
| GetObjectPropsSupported | 0x9801        | R            | R            | I              | I                    | I            |
| GetObjectPropDesc       | 0x9802        | R            | R            | I              | I                    | I            |
| GetObjectPropValue      | 0x9803        | R            | R            | I              | I                    | I            |
| SetObjectPropValue      | 0x9804        | R            | R            | I              | I                    | I            |
| GetObjectReferences     | 0x9810        | R            | R            | I              | I                    | I            |
| SetObjectReferences     | 0x9811        | R            | R            | I              | I                    | I            |

See **Operations** in the MTP Specification, Revision 1.0 or later for complete list of defined MTP Operations.

The following operations are highly recommended, though not required:

-   FormatStore (0x100F)
-   GetObjectPropList (0x9805)
-   SetObjectPropList (0x9806)
-   GetInterDependentPropDesc (0x9807)
-   SendObjectPropList (0x9808) - For this command, your device must also support specification of destination, which allows the MTP initiator to dictate a parent handle for that object.

**Required Events**
The following events must be supported for all objects:

-   ObjectAdded (0x4002)
-   ObjectRemoved (0x4003)

If the device supports removable media, it must also support the following events.

-   StoreAdded (0x4004)
-   StoreRemoved (0x4005)

**Operation Responses**
An appropriate response must be returned for any and all operations. If an error is encountered, error response codes are also defined and must be provided by the device. For more information, see the "Responses" section of the MTP specification.

**Required Device Properties**

|        &nbsp;           | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| Battery Level           | 0x5001        | I            | I            | I              | I                    | I            |
| Synchronization Partner | 0xD401        | I            | I            | I              | I                    | I            |
| Device Friendly Name    | 0xD402        | R            | R            | I              | I                    | I            |
| Device Icon             | 0xD405        | I            | I            | I              | I                    | I            |

See **Device Properties** in the MTP Specification, Revision 1.0 or later for a complete list of defined Device Properties.

Device Icon is not required, but is strongly recommended. High-resolution images of the device can be used and exposed in the Windows UI.

**Object Formats**

The following table represents the list of *required* object formats for a portable device. Each object format also has a list of object properties that must be supported per object type. The highlighted object format is required for all MTP devices and is considered a core MTP requirement for Windows.

 

|           &nbsp;                | Property Code | Mobile Phone    | Media Player    | Digital Camera  | Digital Video Camera | Other (Base)    |
|---------------------------------|---------------|-----------------|-----------------|-----------------|----------------------|-----------------|
| Undefined                       | 0x3000        | I               | I               | I               | I                    | I               |
| Association                     | 0x3001        | R               | R               | R               | R                    | R               |
| Abstract Audio Album            | 0xBA03        | I<sup>(2)</sup> | I<sup>(2)</sup> | N/A             | N/A                  | I<sup>(2)</sup> |
| Abstract Audio & Video Playlist | 0xBA05        | I               | I               | N/A             | N/A                  | I               |
| WAV                             | 0x3008        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| MP3                             | 0x3009        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| AVI                             | 0x300A        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| MPEG                            | 0x300B        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| ASF                             | 0x300C        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| EXIF/JPEG                       | 0x3801        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| TIFF/EP                         | 0x3802        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| BMP                             | 0x3804        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| JPEG XR                         | 0xB804        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| WMA                             | 0xB901        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| AAC                             | 0xB903        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| WMV                             | 0xB981        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| MP4 Container                   | 0xB982        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| 3GP Container                   | 0xB984        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| 3G2                             | 0xB985        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| AVCHD                           | 0xB986        | I               | I               | I               | R<sup>(1)</sup>      | I               |

(1) Portable devices that are capable of playing audio and/or video must support at least one of these formats. This table does not represent the complete list of supported formats; it represents the list of commonly used formats.
See **Object Formats** in the MTP Specification, Revision 1.0 or later for complete list of defined Device Properties.

(2) Support for the following object properties is mandatory for AbstractAudioAlbum objects:

-   Genre (0xDC8C)
-   Album Artist (0xDC9B)
-   WMPMetadataRoundTrip (0x9201)

A device that supports both the AbstractAudioAlbum format and an image format may optionally support album art. Album art is attached to an AbstractAudioAlbum object by adding the art to the album's RepresentativeSampleData property.

If a Portable Device supports album art, then the device must support the following object properties:

-   PurchaseFlag (0xd901), an object property in the Windows Media DRM 10 for Portable Devices MTP Extensions
-   RepresentativeSampleFormat (0xdc81)
-   RepresentativeSampleSize (0xdc82)
-   RepresentativeSampleHeight (0xdc83)
-   RepresentativeSampleWidth (0xdc84)
-   RepresentativeSampleData (0xdc86)
-   User Rating (0xdc8a)
-   WMPMetadataRoundTrip (0x9201)

*Design Notes*

-   "Picture Transfer Protocol (PTP) for Digital Still Photography Devices," Version 1.0 of the PIMA15740: 2000 Picture Transfer Protocol specification.
     
-   The Media Transfer Protocol Specification, Revision 1.0 is available at *http://go.microsoft.com/fwlink/?LinkId=243145*.
     
-   Additional implementation details can be found in the Windows 7 Portable Device Enabling Kit for MTP, which is available at <http://go.microsoft.com/fwlink/?LinkId=243146>.

### Device.Portable.Core.MTPFunctionality

*A device that supports MTP must meet mandatory general functionality requirements to ensure expected behavior in Windows.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Portable devices must behave according to the requirements defined below. The device must:

 
**Persist all transferred content -** The device must not report receiving content that it has not persisted.

**Respond as expected - **A portable device must respond when it receives an MTP *GetDeviceStatus* control request issued by a host.

**Support unexpected device disconnects -** An unexpected disconnect must not cause the device to stop responding (hang or crash) or to restart.

### Device.Portable.Core.MTPMultiSession

*Portable devices that enable MTP multisession functionality must support required object session operations.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

In order to properly support MTP multisession functionality and work as expected with a multisession aware Initiator, the device must support the following session operations:

-   CreateSession
-   GetSessionResponderInfo

The RestrictSession operation is optional. This operation is supported in Windows and will honor restrictions that are defined in a responders RestrictSession dataset.

These operations are required in addition to the operations for basic session operation defined in the MTP 1.0 specification; those operations include OpenSession, CloseSession, TransactionID, SessionID, etc. There is no requirement for the minimum or maximum number of sessions that a device must support if multisession.

*Design Notes*

For implementation details see the Media Transfer Protocol Specification Revision 2.0, available at *http://go.microsoft.com/fwlink/?LinkId=243142.*

### Device.Portable.Core.MTPObjectProperties

*A MTP device must support object properties for each consumable media format.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The following device capabilities must be supported for each format reported by the device. If an MP4 container is supported, the device capability needs to include the proper properties in this entry. Based on this information, Windows can predict the proper transcode profile and transcode a file to the device that can then be played back on the device.

The following table summarizes Required (R) and recommended If Implemented (I) / Optional object property support for all object formats. This is not an exhaustive list of object properties available, for the complete list refer to the Object Format Summary Table in the MTP specification.

| Object property                     | MTP Datacode | Status              | Description                                                                                                                                                                              |
|-------------------------------------|--------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Storage ID                          | 0xDC01       | R                   | The storage area that the object is stored in.                                                                                                                                           |
| Object Format                       | 0xDC02       | R                   | The data format for the object.                                                                                                                                                          |
| Protection Status                   | 0xDC03       | R                   | The protection status of the object.                                                                                                                                                     |
| Object Size                         | 0xDC04       | R                   | The size of the data component of the object, in bytes.                                                                                                                                  |
| Object File Name                    | 0xDC07       | R                   | The file name of the object.                                                                                                                                                             |
| Date Created                        | 0xDC08       | I**<sup>(1)</sup>** | This property contains the date and time when the object was created.                                                                                                                    |
| Date Modified                       | 0xDC09       | I**<sup>(1)</sup>** | The date and time when the object was last altered.                                                                                                                                      |
| Parent Object                       | 0xDC0B       | R                   | The parent object of the object.                                                                                                                                                         |
| Persistent Unique Object Identifier | 0xDC41       | R                   | The persistent unique object identifier of the object.                                                                                                                                   |
| Name                                | 0xDC44       | R                   | The name of the object.                                                                                                                                                                  |
| Non-Consumable                      | 0xDC4F       | R                   | Indicates whether the object was transferred to the portable media player for storage only and is, therefore, not available to be consumed (for example, played) by the portable device. |

Where:<br/>
R = Required<br/>
I = If Implemented (Optional)<br/>
N/A = Not Applicable

(1) It is strongly recommended that Date Created and Date Modified be supported in order for applications to be able to distinguish which objects have been previously imported or synchronized. This is particularly important for photo acquisition scenarios.

 
The following table summarizes required and If Implemented (Optional) object property support for image, audio, and video objects. This is not an exhaustive list of all supported object properties. For a complete list, refer to the Object Property Summary Table in the MTP Specification.

| Object property              | MTP Datacode | Image | Audio               | Video |
|------------------------------|--------------|-------|---------------------|-------|
| Artist                       | 0xDC46       | N/A   | R                   | I     |
| Description                  | 0xDC48       | N/A   | I                   | I     |
| Representative Sample Format | 0xDC81       | I     | I                   | I     |
| Representative Sample Size   | 0xDC82       | I     | I                   | I     |
| Representative Sample Height | 0xDC83       | I     | I                   | I     |
| Representative Sample Width  | 0xDC84       | I     | I                   | I     |
| Representative Sample Data   | 0xDC86       | I     | I                   | I     |
| Width                        | 0xDC87       | R     | N/A                 | R     |
| Height                       | 0xDC88       | R     | N/A                 | R     |
| Duration                     | 0xDC89       | N/A   | I                   | I     |
| User Rating                  | 0xDC8a       | N/A   | I                   | I     |
| Track                        | 0xDC8b       | N/A   | R                   | I     |
| Genre                        | 0xDC8c       | N/A   | I                   | I     |
| Use Count                    | 0xDC91       | N/A   | I                   | I     |
| Parental Rating              | 0xDC94       | N/A   | I                   | I     |
| Original Release Date        | 0xDC99       | N/A   | I                   | I     |
| Album Name                   | 0xDC9A       | N/A   | R                   | N/A   |
| Album Artist                 | 0xDC9B       | N/A   | R**<sup>(2)</sup>** | N/A   |
| Bitrate Type                 | 0xDE92       | N/A   | I                   | I     |
| Sample Rate                  | 0xDE93       | N/A   | R                   | R     |
| Number of Channels           | 0xDE94       | N/A   | R                   | R     |
| ScanType                     | 0xDE97       | N/A   | I                   | R     |
| Audio WAVE Codec             | 0xDE99       | N/A   | R                   | R     |
| Audio Bitrate                | 0xDE9A       | N/A   | R                   | R     |
| Video FourCC Codec           | 0xDE9B       | N/A   | N/A                 | R     |
| Video Bitrate                | 0xDE9C       | N/A   | N/A                 | R     |
| Frames Per Thousand Seconds  | 0xDE9D       | N/A   | N/A                 | R     |
| Key Frame Distance           | 0xDE9E       | N/A   | N/A                 | I     |
| Encoding Profile             | 0xDEA1       | N/A   | I                   | R     |

(2) Note that Album Artist (0xDC9B) is only required if the entire album is available, individual audio files only need to support artist (0xDC46).

Additionally, if the device supports an If Implemented (Optional) object property, the device must do so in conformance with the MTP specification and guidelines. Tests are designed to validate optional functionality if the device supports it.

*Design Notes*

For implementation details, refer to Media Transfer Protocol Specification Revision 1.0, Appendix B - Object Properties available at *http://go.microsoft.com/fwlink/?LinkId=243143*.

### Device.Portable.Core.MTPStreams

*Portable devices that implement MTP Streams must support required object stream operations.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

In order to properly support MTP Stream functionality, a device must support the following operations:

| Operation         | Status | Description                                                                           |
|-------------------|--------|---------------------------------------------------------------------------------------|
| OpenObjectStream  | R      | This operation opens an object as a stream.                                           |
| ReadObjectStream  | R      | This operation reads a portion of data from the previously opened object stream.      |
| WriteObjectStream | R      | This operation writes the portion of data to the previously opened object stream.     |
| SeekObjectStream  | R      | This operation seeks forward reading or writing of the next data block in the stream. |
| CloseObjectStream | R      | This operation closes the previously opened object stream and releases the allocated  |

Where:<br/>
R = Required<br/>
I = If implemented (optional)<br/>
N/A = Not applicable

*Design Notes*

-   For implementation details refer to Media Transfer Protocol Specification Revision 2.0, available at <http://go.microsoft.com/fwlink/?LinkId=243144>.

### Device.Portable.Core.TransportBluetooth

*If a portable device leverages the Bluetooth transport, then the device shall support the latest required specification(s) for that transport and related tests: Bluetooth (Specification Version 2.1 or greater).*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

A portable device that uses Bluetooth must use the following specifications:

-   Bluetooth Core specification Version 2.1 + EDR (with latest errata) or newer \[<https://www.bluetooth.org/Technical/Specifications/adopted.htm>\]
-   MTP over Bluetooth Profile Specification from Microsoft \[*http://msdn.microsoft.com/en-us/windows/hardware/gg463543*\]

*Design Notes*

-   The connection must be implemented according to requirements defined for Bluetooth devices.

-   A Bluetooth-capable portable device must be able to communicate with **Window's Bluetooth Class Driver** (in a standard MTP conversation over Bluetooth similar to USB and TCP/IP). 

-   A Bluetooth-capable portable device must support Bluetooth V2.1+EDR, to ensure that Windows can leverage **Secure Simple Pairing (SSR)** for optimized pairing experience.

-   A Bluetooth-capable portable device must leverage L2CAP Transport MTP Responder Service Definition Record required parameter "**GetFormatCapabilities**" to mitigate format enumeration performance issues.

### Device.Portable.Core.TransportIP

*If a portable device leverages the IP transport, then the device shall support the latest required specification(s) for that transport and related tests: IP (Along with the MTP Network Association Extension specification and related UPnP specifications).*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

A Windows portable device that supports MTP over IP must comply with the Camera and Imaging Products Association (CIPA) PTP over Internet Protocol (PTP/IP) specification (CIPA-005/2005), which extends the PTP specification to use TCP/IP to perform PTP operations over wireless networks.

 
An MTP/IP device must support the following three technologies to ensure compatibility with the PC:

1. **UPnP Basic Device**

	MTP/IP devices must support Simple Service Discovery Protocol (SSDP) discovery as a Universal Plug and Play (UPnP„¢) basic device. Refer to the MTP Network Association Extension definition for details.

2. **Picture Transfer Protocol over IP**

	MTP/IP devices must comply with the Camera and Imaging Products Association (CIPA) PTP over Internet Protocol (PTP/IP) specification (CIPA-005/2005), which extends the PTP specification to use TCP/IP to perform PTP operations over wireless networks.

3. **MTP Network Association Extension**

	MTP/IP devices must comply with the Wi-Fi-provisioning extension to the MTP specification and the MTP Network Association extension to the MTP specification.

Support for this MTP extension is indicated by including the following string in the MTPVendorExtensionDesc field of the MTP DeviceInfo dataset, returned as a response to the MTP GetDeviceInfo operation.

| Dataset field          | Datatype                   |
|------------------------|----------------------------|
| MTPVendorExtensionDesc | "microsoft.com/WPDNA: 1.0" |

 
The device property defined by this extension supports Network Association configuration for devices that support Zero or Nominal Authentication. Secure Authentication is not supported by this extension; secure authentication can be implemented via a custom MTP Service if desired. Refer to the MTP Network Association Extension definition for details.

**Recommendations for Network Provisioning**

The MTP Wi-Fi Provisioning Extension extends the Windows Connect Now architecture to MTP devices. This extension defines a new MTP object format for WFC (Wireless Configuration File) objects. A WFC object contains the network settings that will allow the responder to join a wireless network. An initiator supporting the WCN architecture will be able to transfer WFC objects to the device. Each WFC object represents the settings for a single wireless network. The responder may receive multiple WFC objects over time. Each object will be named according to the SSID of the network.

The following DataType must be included in the MTPVendorExtensionDesc field of the DeviceInfo dataset.

| Dataset field          | Datatype                    |
|------------------------|-----------------------------|
| MTPVendorExtensionDesc | "microsoft.com/WPDWCN: 1.0" |

 
**Recommendations for Improved Performance over IP**
In order to mitigate format enumeration performance issues, MTP/IP devices should also support the **GetFormatCapabilities** operation as defined in the MTP Device Services Extensions Specification. This operation improves the performance of querying a device for the supported object properties on formats that are associated with classic MTP storages (those formats that appear in the DeviceInfo dataset). GetFormatCapabilities is a bulk operation that duplicates the functionality of GetObjectPropsSupported, GetObjectPropDesc, and GetInterdependentPropDesc. Responders should implement this operation because it replaces multiple calls to the device with a single, more efficient call.

*Design Notes*

-   Refer to the PTP/IP Specification (CIPA-005/2005) "Picture Transfer Protocol over TCP/IP Networks".

-   MTP Device Services Extension Specification at <http://msdn.microsoft.com/en-us/windows/hardware/gg463545>.

-   MTP Network Association, MTP Windows Connect Now, and MTP Wi-Fi Provisioning Extension documents are available at <http://msdn.microsoft.com/en-us/windows/hardware/gg463543>.

### Device.Portable.Core.TransportIPDLNA

*A Portable Device that functions as a DMR or DMS conforms to requirements defined for Networked Media Devices.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Portable devices can implement one or more of the DLNA device classes such as:

-   Digital Media Renderer (DMR)
-   Digital Media Server (DMS)

The device must meet the requirements defined for each device class called out in the Networked Media Device section of the Windows Hardware Certification Program Requirements. DLNA is managed independent of MTP.

*Design Notes*

-   Refer to the Networked Media Device section for requirement details. Information on DLNA Certification can be found at [http://www.dlna.org](http://www.dlna.org/).

### Device.Portable.Core.TransportUSB

*If a Portable Device leverages the USB transport, then the device shall support the latest required specification(s) for that transport and related tests: USB (Specification Version 2.0 or greater).*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

A portable device that uses USB must use the following:

-   USB Core specification Version 2.0 (with latest errata) or newer \[<http://www.usb.org/developers/docs>\]

-   USB MTP DWG Specification 1.0 (with latest errata) or newer \[<http://www.usb.org/developers/devclass_docs>\]

*Design Notes*

-   USB connected devices must support both High-Speed and Full-Speed. Super-Speed is optional.

-   The connection must be implemented according to requirements in the appropriate connection type section.

-   There are no specific Windows Hardware Certification requirements for the type of USB connector used on a portable device.

### Device.Portable.Core.VideoCodec

*If a portable device has the ability to capture video content, it must do so using a format supported natively in Windows.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

If a portable device can capture video content, it must do so in a format that Windows can decode natively without the need for additional codecs to be installed.

The following tables represent the list of in-box formats that Windows will render to; this is not the exhaustive of supported formats. The full list of formats supported can be found at: <http://go.microsoft.com/fwlink/?LinkID=242995&clcid=0x409>.

**Note** that for a given format in the tables below it is not required to support all given Bit rates and Sample rates, it is however required to support a format that lines up within the ranges provided.

<html>
    <p><strong>MP4 Container Content</strong></p>
    <table>
        <thead>
            <tr class="header">
                <th>&nbsp;</th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <th rowspan="4">AAC</th>
                <td>Codec</td>
                <td>
                    AAC Standard, minimum AAC Profile level 2 (0x29),<br />
                    compatible with 0x29, 0x2A, 0x2B, 0x2C, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33
                </td>
            </tr>
            <tr class="even">
                <td>bit rate for CBR</td>
                <td>96, 128, 160, 192 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Sample rate</td>
                <td>44.1 or 48 kHz</td>
            </tr>
            <tr class="even">
                <td>Channels</td>
                <td>2</td>
            </tr>
            <tr class="odd">
                <th rowspan="5">H.264</th>
                <td>Codec</td>
                <td>H.264 Standard</td>
            </tr>
            <tr class="even">
                <td>Codec profile</td>
                <td>Baseline, Level 3</td>
            </tr>
            <tr class="odd">
                <td>Resolution, pixel aspect ratio</td>
                <td>Any (as long as reported)</td>
            </tr>
            <tr class="even">
                <td>Frame rate</td>
                <td>Any (as long as reported)</td>
            </tr>
            <tr class="odd">
                <td>Average bit rate</td>
                <td>Any (as long as reported)</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>Mobile WMV Video Content</strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th>&nbsp;</th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <th rowspan="5">WMA Standard</th>
                <td>Codec</td>
                <td>WMA9 or later</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 48 to 96 kilobits per second (Kbps)</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>192 Kbps</td>
            </tr>
            <tr class="even">
                <td>Sample rate</td>
                <td>44.1 or 48 kHz</td>
            </tr>
            <tr class="odd">
                <td>Channels</td>
                <td>2</td>
            </tr>
            <tr class="even">
                <th rowspan="9">WMV</th>
                <td>Codec</td>
                <td>VC-1</td>
            </tr>
            <tr class="odd">
                <td>Codec profile</td>
                <td>Simple</td>
            </tr>
            <tr class="even">
                <td>Resolution, pixel aspect ratio</td>
                <td>
                    One of the following:
                    <ul>
                        <li>176Ã—144 pixels, 1:1</li>
                        <li>220Ã—176 pixels, 1:1</li>
                    </ul>
                </td>
            </tr>
            <tr class="odd">
                <td>Frame rate</td>
                <td>15 or 24 frames per second</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 96 to 384 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>768 Kbps</td>
            </tr>
            <tr class="even">
                <td>Maximum buffer</td>
                <td>3 seconds</td>
            </tr>
            <tr class="odd">
                <td>Maximum key-frame distance</td>
                <td>15 seconds</td>
            </tr>
            <tr class="even">
                <td>Color depth</td>
                <td>16 bits per pixel</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>Portable WMV Video Content</strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th>&nbsp;</th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <th rowspan="5">WMA Standard</th>
                <td>Codec</td>
                <td>WMA9 or later</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 48 to 128 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>256Kbps</td>
            </tr>
            <tr class="even">
                <td>Sample rate</td>
                <td>44.1 or 48 kHz</td>
            </tr>
            <tr class="odd">
                <td>Channels</td>
                <td>2</td>
            </tr>
            <tr class="even">
                <th rowspan="9">WMV</th>
                <td>Codec</td>
                <td>VC-1</td>
            </tr>
            <tr class="odd">
                <td>Codec profile</td>
                <td>Simple</td>
            </tr>
            <tr class="even">
                <td>Resolution, pixel aspect ratio</td>
                <td>
                    One of the following:
                    <ul>
                        <li>320 Ã—240 pixels, 1:1</li>
                        <li>480 Ã—270 pixels, 1:1</li>
                    </ul>
                </td>
            </tr>
            <tr class="odd">
                <td>Frame rate</td>
                <td>24, 25, or 29.97 frames per second</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 384 to 850 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>1,700 Kbps</td>
            </tr>
            <tr class="even">
                <td>Maximum buffer</td>
                <td>3 seconds</td>
            </tr>
            <tr class="odd">
                <td>Maximum key-frame distance</td>
                <td>15 seconds</td>
            </tr>
            <tr class="even">
                <td>Color depth</td>
                <td>16 bits per pixel</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>Standard WMV Video Content</strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th>&nbsp;</th>
                <th>Setting</th>
                <th>Requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <th rowspan="5">WMA Standard</th>
                <td>Codec</td>
                <td>WMA9 or later</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 64 to 192 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>360 Kbps</td>
            </tr>
            <tr class="even">
                <td>Sample rate</td>
                <td>44.1 or 48 kHz</td>
            </tr>
            <tr class="odd">
                <td>Channels</td>
                <td>2</td>
            </tr>
            <tr class="even">
                <th rowspan="9">WMV</th>
                <td>Codec</td>
                <td>VC-1</td>
            </tr>
            <tr class="odd">
                <td>Codec profile</td>
                <td>Main</td>
            </tr>
            <tr class="even">
                <td>Resolution, pixel aspect ratio</td>
                <td>
                    One of the following:
                    <ul>
                        <li>640 Ã—480 pixels, 1:1</li>
                        <li>720 Ã—480 pixels, 10:11</li>
                        <li>720 Ã—480 pixels, 40:33</li>
                    </ul>
                </td>
            </tr>
            <tr class="odd">
                <td>Frame rate</td>
                <td>24, 25, or 29.97 frames per second</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 1,000 to 3,000 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>6,000 Kbps</td>
            </tr>
            <tr class="even">
                <td>Maximum buffer</td>
                <td>2 seconds</td>
            </tr>
            <tr class="odd">
                <td>Maximum key-frame distance</td>
                <td>15 seconds</td>
            </tr>
            <tr class="even">
                <td>Color depth</td>
                <td>16 or 24 bits per pixel</td>
            </tr>
        </tbody>
    </table>
    <p>
        <br />
        <strong>High Definition WMV Video Content </strong>
    </p>
    <table>
        <thead>
            <tr class="header">
                <th>&nbsp;</th>
                <th>Setting</th>
                <th>Minimum requirement</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <th rowspan="5">WMA Standard</th>
                <td>Codec</td>
                <td>WMA9 or later</td>
            </tr>
            <tr class="even">
                <td>Average bit rate</td>
                <td>From 64 to 192 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum peak bit rate</td>
                <td>360 Kbps</td>
            </tr>
            <tr class="even">
                <td>Sample rate</td>
                <td>44.1 or 48 kHz</td>
            </tr>
            <tr class="odd">
                <td>Channels</td>
                <td>2</td>
            </tr>
            <tr class="even">
                <th rowspan="5">WMA Professional</th>
                <td>Codec</td>
                <td>WMA9 or later</td>
            </tr>
            <tr class="odd">
                <td>Average bit rate</td>
                <td>From 320 to 1,500 Kbps</td>
            </tr>
            <tr class="even">
                <td>Maximum peak bit rate</td>
                <td>2,500 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Sample rate</td>
                <td>44.1, 48, or 96 kHz</td>
            </tr>
            <tr class="even">
                <td>Channels</td>
                <td>up to 8</td>
            </tr>
            <tr class="odd">
                <th rowspan="9">WMV</th>
                <td>Codec</td>
                <td>VC-1</td>
            </tr>
            <tr class="even">
                <td>Codec profile</td>
                <td>Advanced</td>
            </tr>
            <tr class="odd">
                <td>Resolution, pixel aspect ratio</td>
                <td>1280 Ã—720 pixels, 1:1</td>
            </tr>
            <tr class="even">
                <td>Frame rate</td>
                <td>24, 25, or 29.97 frames per second</td>
            </tr>
            <tr class="odd">
                <td>Average bit rate</td>
                <td>From 8,000 to 10,000 Kbps</td>
            </tr>
            <tr class="even">
                <td>Maximum peak bit rate</td>
                <td>20,000 Kbps</td>
            </tr>
            <tr class="odd">
                <td>Maximum buffer</td>
                <td>2 seconds</td>
            </tr>
            <tr class="even">
                <td>Maximum key-frame distance</td>
                <td>15 seconds</td>
            </tr>
            <tr class="odd">
                <td>Color depth</td>
                <td>24 bits per pixel</td>
            </tr>
        </tbody>
    </table>
</html>


<a name="device.portable.digitalcamera"></a>
## Device.Portable.DigitalCamera

*DigitalCamera*

### Device.Portable.DigitalCamera.MTP

*Digital Cameras must support MTP operations and properties as defined in the Media Transport Protocol revision 1.0 or later, along with specific object formats per device type.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Media Transfer Protocol (MTP) is an extension of the Picture Transfer Protocol (ISO 15740).  Both specifications include optional commands and operations, but some of these are required for certification. There is a core set of operations and device properties that must be met by each device category in order to be compliant with Windows. Implementation details for MTP are defined in the Media Transfer Protocol Specification, Revision 1.0 or later and will be used as the reference for certification of all portable devices as part of the Windows Hardware Certification Program.

**Required Operations**

This core set of MTP operations and device properties must be met by each portable device in order to be compliant with Windows.  Implementation details for each operation and device property are defined in the Media Transfer Protocol Specification, Revision 1.0 or later.

|        &nbsp;           | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| GetDeviceInfo           | 0x1001        | R            | R            | R              | R                    | R            |
| OpenSession             | 0x1002        | R            | R            | R              | R                    | R            |
| CloseSession            | 0x1003        | R            | R            | R              | R                    | R            |
| GetStorageIDs           | 0x1004        | R            | R            | R              | R                    | R            |
| GetStorageInfo          | 0x1005        | R            | R            | R              | R                    | R            |
| GetNumObjects           | 0x1006        | R            | R            | R              | R                    | R            |
| GetObjectHandles        | 0x1007        | R            | R            | R              | R                    | R            |
| GetObjectInfo           | 0x1008        | R            | R            | R              | R                    | R            |
| GetObject               | 0x1009        | R            | R            | R              | R                    | R            |
| GetDevicePropDesc       | 0x1014        | R            | R            | R              | R                    | R            |
| GetDevicePropValue      | 0x1015        | R            | R            | R              | R                    | R            |
| DeleteObject            | 0x100B        | R            | R            | I              | I                    | I            |
| SetDevicePropValue      | 0x100A        | R            | R            | I              | I                    | I            |
| SendObjectInfo          | 0x100C        | R            | R            | I              | I                    | I            |
| SendObject              | 0x100D        | R            | R            | I              | I                    | I            |
| GetPartialObject        | 0x101B        | R            | R            | I              | I                    | I            |
| GetObjectPropsSupported | 0x9801        | R            | R            | I              | I                    | I            |
| GetObjectPropDesc       | 0x9802        | R            | R            | I              | I                    | I            |
| GetObjectPropValue      | 0x9803        | R            | R            | I              | I                    | I            |
| SetObjectPropValue      | 0x9804        | R            | R            | I              | I                    | I            |
| GetObjectReferences     | 0x9810        | R            | R            | I              | I                    | I            |
| SetObjectReferences     | 0x9811        | R            | R            | I              | I                    | I            |

 
Where:<br/>
R = Required<br/>
I = If Implemented (Optional)<br/>
N/A = Not Applicable<br/>

See **Operations** in the MTP Specification, Revision 1.0 or later for complete list of defined MTP Operations.

The following operations are highly recommended, though not required:

-   FormatStore (0x100F)
-   GetObjectPropList (0x9805)
-   SetObjectPropList (0x9806)
-   GetInterDependentPropDesc (0x9807)
-   SendObjectPropList (0x9808) - For this command, your device must also support specification of destination, which allows the MTP initiator to dictate a parent handle for that object.

**Required Events**

The following events must be supported for all objects:

-   ObjectAdded (0x4002)
-   ObjectRemoved (0x4003)

If the device supports removable media, it must also support the following events.

-   StoreAdded (0x4004)
-   StoreRemoved (0x4005)

**Operation Responses**

An appropriate response must be returned for any and all operations. If an error is encountered, error response codes are also defined and must be provided by the device. For more information, see the "Responses" section of the MTP specification.

**Required Device Properties**

|     &nbsp;              | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| Battery Level           | 0x5001        | I            | I            | I              | I                    | I            |
| Synchronization Partner | 0xD401        | I            | I            | I              | I                    | I            |
| Device Friendly Name    | 0xD402        | R            | R            | I              | I                    | I            |
| Device Icon             | 0xD405        | I            | I            | I              | I                    | I            |

See **Device Properties** in the MTP Specification, Revision 1.0 or later for a complete list of defined Device Properties.
Device Icon is not required but is strongly recommended. High-resolution images of the device can be used and exposed in the Windows UI.

**Object Formats**

The following table represents the list of *required* object formats for a portable device.
Each object format also has a list of object properties that must be supported per object type.

|          &nbsp;                 | Property Code | Mobile Phone    | Media Player    | Digital Camera  | Digital Video Camera | Other (Base) |
|---------------------------------|---------------|-----------------|-----------------|-----------------|----------------------|--------------|
| Undefined                       | 0x3000        | I               | I               | I               | I                    | I            |
| Association                     | 0x3001        | R               | R               | R               | R                    | R            |
| Abstract Audio Album            | 0xBA03        | I               | I               | N/A             | N/A                  | I            |
| Abstract Audio & Video Playlist | 0xBA05        | I               | I               | N/A             | N/A                  | I            |
| WAV                             | 0x3008        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| MP3                             | 0x3009        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| AVI                             | 0x300A        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I            |
| MPEG                            | 0x300B        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I            |
| ASF                             | 0x300C        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I            |
| EXIF/JPEG                       | 0x3801        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| TIFF/EP                         | 0x3802        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| BMP                             | 0x3804        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| JPEG XR                         | 0xB804        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| WMA                             | 0xB901        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| AAC                             | 0xB903        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| WMV                             | 0xB981        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| MP4 Container                   | 0xB982        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| 3GP Container                   | 0xB984        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| 3G2                             | 0xB985        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| AVCHD                           | 0xB986        | I               | I               | I               | R<sup>(1)</sup>      | I            |

(1) Portable devices that are capable of playing audio and/or video must support at least one of these formats. This table does not represent the complete list of supported formats; it represents the list of commonly used formats.

See **Object Formats** in the MTP Specification, Revision 1.0 or later for complete list of defined Device Properties.

*Design Notes*

-   "Picture Transfer Protocol (PTP) for Digital Still Photography Devices," Version 1.0 of the PIMA15740: 2000 Picture Transfer Protocol specification.

-   The Media Transfer Protocol Specification, Revision 1.0 is available at *http://go.microsoft.com/fwlink/?LinkId=243145*.

-   Additional implementation details can be found in the Windows 7 Portable Device Enabling Kit for MTP, which is available at <http://go.microsoft.com/fwlink/?LinkId=243146>.

<a name="device.portable.digitalvideocamera"></a>
## Device.Portable.DigitalVideoCamera

*DigitalVideoCamera*

### Device.Portable.DigitalVideoCamera.MTP

*Digital video cameras must support MTP operations and properties as defined in the Media Transport Protocol revision 1.0 or later, along with specific object formats per device type.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Media Transfer Protocol (MTP) is an extension of the Picture Transfer Protocol (ISO 15740).  Both specifications include optional commands and operations, but some of these are required for certification. There is a core set of operations and device properties that must be met by each device category in order to be compliant with Windows. Implementation details for MTP are defined in the Media Transfer Protocol Specification, Revision 1.0 or later and will be used as the reference for certification of all portable devices as part of the Windows Hardware Certification Program.

**Required Operations**

This core set of MTP operations and device properties must be met by each portable device in order to be compliant with Windows.  Implementation details for each operation and device property are defined in the Media Transfer Protocol Specification, Revision 1.0 or later.

|       &nbsp;            | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| GetDeviceInfo           | 0x1001        | R            | R            | R              | R                    | R            |
| OpenSession             | 0x1002        | R            | R            | R              | R                    | R            |
| CloseSession            | 0x1003        | R            | R            | R              | R                    | R            |
| GetStorageIDs           | 0x1004        | R            | R            | R              | R                    | R            |
| GetStorageInfo          | 0x1005        | R            | R            | R              | R                    | R            |
| GetNumObjects           | 0x1006        | R            | R            | R              | R                    | R            |
| GetObjectHandles        | 0x1007        | R            | R            | R              | R                    | R            |
| GetObjectInfo           | 0x1008        | R            | R            | R              | R                    | R            |
| GetObject               | 0x1009        | R            | R            | R              | R                    | R            |
| GetDevicePropDesc       | 0x1014        | R            | R            | R              | R                    | R            |
| GetDevicePropValue      | 0x1015        | R            | R            | R              | R                    | R            |
| DeleteObject            | 0x100B        | R            | R            | I              | I                    | I            |
| SetDevicePropValue      | 0x100A        | R            | R            | I              | I                    | I            |
| SendObjectInfo          | 0x100C        | R            | R            | I              | I                    | I            |
| SendObject              | 0x100D        | R            | R            | I              | I                    | I            |
| GetPartialObject        | 0x101B        | R            | R            | I              | I                    | I            |
| GetObjectPropsSupported | 0x9801        | R            | R            | I              | I                    | I            |
| GetObjectPropDesc       | 0x9802        | R            | R            | I              | I                    | I            |
| GetObjectPropValue      | 0x9803        | R            | R            | I              | I                    | I            |
| SetObjectPropValue      | 0x9804        | R            | R            | I              | I                    | I            |
| GetObjectReferences     | 0x9810        | R            | R            | I              | I                    | I            |
| SetObjectReferences     | 0x9811        | R            | R            | I              | I                    | I            |

 
Where:</br/>
R = Required</br/>
I = If Implemented (Optional)</br/>
N/A = Not Applicable

See **Operations** in the MTP Specification, Revision 1.0 or later for complete list of defined MTP Operations.
The following operations are highly recommended, though not required:

-   FormatStore (0x100F)
-   GetObjectPropList (0x9805)
-   SetObjectPropList (0x9806)
-   GetInterDependentPropDesc (0x9807)
-   SendObjectPropList (0x9808) - For this command, your device must also support specification of destination, which allows the MTP initiator to dictate a parent handle for that object.

**Required Events**

The following events must be supported for all objects:

-   ObjectAdded (0x4002)
-   ObjectRemoved (0x4003)

If the device supports removable media, it must also support the following events.

-   StoreAdded (0x4004)
-   StoreRemoved (0x4005)

**Operation Responses**

An appropriate response must be returned for any and all operations. If an error is encountered, error response codes are also defined and must be provided by the device. For more information, see the "Responses" section of the MTP specification.

**Required Device Properties**

|        &nbsp;           | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| Battery Level           | 0x5001        | I            | I            | I              | I                    | I            |
| Synchronization Partner | 0xD401        | I            | I            | I              | I                    | I            |
| Device Friendly Name    | 0xD402        | R            | R            | I              | I                    | I            |
| Device Icon             | 0xD405        | I            | I            | I              | I                    | I            |

See **Device Properties** in the MTP Specification, Revision 1.0 or later for a complete list of defined Device Properties.
Device Icon is not required but is strongly recommended. High-resolution images of the device can be used and exposed in the Windows UI.

**Object Formats**

The following table represents the list of *required* object formats for a portable device.
Each object format also has a list of object properties that must be supported per object type.

|            &nbsp;               | Property Code | Mobile Phone    | Media Player    | Digital Camera  | Digital Video Camera | Other (Base) |
|---------------------------------|---------------|-----------------|-----------------|-----------------|----------------------|--------------|
| Undefined                       | 0x3000        | I               | I               | I               | I                    | I            |
| Association                     | 0x3001        | R               | R               | R               | R                    | R            |
| Abstract Audio Album            | 0xBA03        | I               | I               | N/A             | N/A                  | I            |
| Abstract Audio & Video Playlist | 0xBA05        | I               | I               | N/A             | N/A                  | I            |
| WAV                             | 0x3008        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| MP3                             | 0x3009        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| AVI                             | 0x300A        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I            |
| MPEG                            | 0x300B        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I            |
| ASF                             | 0x300C        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I            |
| EXIF/JPEG                       | 0x3801        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| TIFF/EP                         | 0x3802        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| BMP                             | 0x3804        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| JPEG XR                         | 0xB804        | I               | I               | R<sup>(1)</sup> | I                    | I            |
| WMA                             | 0xB901        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| AAC                             | 0xB903        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I            |
| WMV                             | 0xB981        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| MP4 Container                   | 0xB982        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| 3GP Container                   | 0xB984        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| 3G2                             | 0xB985        | I               | I               | I               | R<sup>(1)</sup>      | I            |
| AVCHD                           | 0xB986        | I               | I               | I               | R<sup>(1)</sup>      | I            |

(1) Portable devices that are capable of playing audio and/or video must support at least one of these formats. This table does not represent the complete list of supported formats; it represents the list of commonly used formats.
See **Object Formats** in the MTP Specification, Revision 1.0 or later for complete list of defined Device Properties.

*Design Notes*

-   "Picture Transfer Protocol (PTP) for Digital Still Photography Devices," Version 1.0 of the PIMA15740: 2000 Picture Transfer Protocol specification.

-   The Media Transfer Protocol Specification, Revision 1.0 is available at *http://go.microsoft.com/fwlink/?LinkId=243145*.

-   Additional implementation details can be found in the Windows 7 Portable Device Enabling Kit for MTP, which is available at <http://go.microsoft.com/fwlink/?LinkId=243146>.

<a name="device.portable.mediaplayer"></a>
## Device.Portable.MediaPlayer

*MediaPlayer*

### Device.Portable.MediaPlayer.MTP

*Media players must support MTP operations and properties as defined in the Media Transport Protocol revision 1.0 or later, along with specific object formats per device type.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Media Transfer Protocol (MTP) is an extension of the Picture Transfer Protocol (ISO 15740).  Both specifications include optional commands and operations, but some of these are required for certification. There is a core set of operations and device properties that must be met by each device category in order to be compliant with Windows. Implementation details for MTP are defined in the Media Transfer Protocol Specification, Revision 1.0 or later and will be used as the reference for certification of all portable devices as part of the Windows Hardware Certification Program.

**Required Operations**

This core set of MTP operations and device properties must be met by each portable device in order to be compliant with Windows.  Implementation details for each operation and device property are defined in the Media Transfer Protocol Specification, Revision 1.0 or later.

|       &nbsp;            | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| GetDeviceInfo           | 0x1001        | R            | R            | R              | R                    | R            |
| OpenSession             | 0x1002        | R            | R            | R              | R                    | R            |
| CloseSession            | 0x1003        | R            | R            | R              | R                    | R            |
| GetStorageIDs           | 0x1004        | R            | R            | R              | R                    | R            |
| GetStorageInfo          | 0x1005        | R            | R            | R              | R                    | R            |
| GetNumObjects           | 0x1006        | R            | R            | R              | R                    | R            |
| GetObjectHandles        | 0x1007        | R            | R            | R              | R                    | R            |
| GetObjectInfo           | 0x1008        | R            | R            | R              | R                    | R            |
| GetObject               | 0x1009        | R            | R            | R              | R                    | R            |
| GetDevicePropDesc       | 0x1014        | R            | R            | R              | R                    | R            |
| GetDevicePropValue      | 0x1015        | R            | R            | R              | R                    | R            |
| DeleteObject            | 0x100B        | R            | R            | I              | I                    | I            |
| SetDevicePropValue      | 0x100A        | R            | R            | I              | I                    | I            |
| SendObjectInfo          | 0x100C        | R            | R            | I              | I                    | I            |
| SendObject              | 0x100D        | R            | R            | I              | I                    | I            |
| GetPartialObject        | 0x101B        | R            | R            | I              | I                    | I            |
| GetObjectPropsSupported | 0x9801        | R            | R            | I              | I                    | I            |
| GetObjectPropDesc       | 0x9802        | R            | R            | I              | I                    | I            |
| GetObjectPropValue      | 0x9803        | R            | R            | I              | I                    | I            |
| SetObjectPropValue      | 0x9804        | R            | R            | I              | I                    | I            |
| GetObjectReferences     | 0x9810        | R            | R            | I              | I                    | I            |
| SetObjectReferences     | 0x9811        | R            | R            | I              | I                    | I            |

 
Where:<br/>
R = Required<br/>
I = If Implemented (Optional)<br/>
N/A = Not Applicable

See **Operations** in the MTP Specification, Revision 1.0 or later for complete list of defined MTP Operations.
The following operations are highly recommended, though not required:

-   FormatStore (0x100F)
-   GetObjectPropList (0x9805)
-   SetObjectPropList (0x9806)
-   GetInterDependentPropDesc (0x9807)
-   SendObjectPropList (0x9808) - For this command, your device must also support specification of destination, which allows the MTP initiator to dictate a parent handle for that object.

**Required Events**

The following events must be supported for all objects:

-   ObjectAdded (0x4002)
-   ObjectRemoved (0x4003)

If the device supports removable media, it must also support the following events.

-   StoreAdded (0x4004)
-   StoreRemoved (0x4005)

**Operation Responses**

An appropriate response must be returned for any and all operations. If an error is encountered, error response codes are also defined and must be provided by the device. For more information, see the "Responses" section of the MTP specification.

**Required Device Properties**

|         &nbsp;          | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| Battery Level           | 0x5001        | I            | I            | I              | I                    | I            |
| Synchronization Partner | 0xD401        | I            | I            | I              | I                    | I            |
| Device Friendly Name    | 0xD402        | R            | R            | I              | I                    | I            |
| Device Icon             | 0xD405        | I            | I            | I              | I                    | I            |

See **Device Properties** in the MTP Specification, Revision 1.0 or later for complete list of defined Device Properties.
Device Icon is not required but is strongly recommended. High-resolution images of the device can be used and exposed in the Windows UI.

**Object Formats**

The following table represents the list of *required* object formats for a portable device.
Each object format also has a list of object properties that must be supported per object type.

|        &nbsp;                   | Property Code | Mobile Phone    | Media Player    | Digital Camera  | Digital Video Camera | Other (Base)    |
|---------------------------------|---------------|-----------------|-----------------|-----------------|----------------------|-----------------|
| Undefined                       | 0x3000        | I               | I               | I               | I                    | I               |
| Association                     | 0x3001        | R               | R               | R               | R                    | R               |
| Abstract Audio Album            | 0xBA03        | I<sup>(2)</sup> | I<sup>(2)</sup> | N/A             | N/A                  | I<sup>(2)</sup> |
| Abstract Audio & Video Playlist | 0xBA05        | I               | I               | N/A             | N/A                  | I               |
| WAV                             | 0x3008        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| MP3                             | 0x3009        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| AVI                             | 0x300A        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| MPEG                            | 0x300B        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| ASF                             | 0x300C        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| EXIF/JPEG                       | 0x3801        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| TIFF/EP                         | 0x3802        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| BMP                             | 0x3804        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| JPEG XR                         | 0xB804        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| WMA                             | 0xB901        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| AAC                             | 0xB903        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| WMV                             | 0xB981        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| MP4 Container                   | 0xB982        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| 3GP Container                   | 0xB984        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| 3G2                             | 0xB985        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| AVCHD                           | 0xB986        | I               | I               | I               | R<sup>(1)</sup>      | I               |

(1) Portable devices that are capable of playing audio and/or video must support at least one of these formats. This table does not represent the complete list of supported formats; it represents the list of commonly used formats.
See **Object Formats** in the MTP Specification, Revision 1.0 or later for complete list of defined Device Properties.
(2) Support for the following object properties is mandatory for AbstractAudioAlbum objects:

-   Genre (0xDC8C)
-   Album Artist (0xDC9B)
-   WMPMetadataRoundTrip (0x9201)

A device that supports both the AbstractAudioAlbum format and an image format may optionally support album art. Album art is attached to an AbstractAudioAlbum object by adding the art to the album's RepresentativeSampleData property.
If a Portable Device supports album art, then the device must support the following object properties:

-   PurchaseFlag (0xd901), an object property in the Windows Media DRM 10 for Portable Devices MTP Extensions
-   RepresentativeSampleFormat (0xdc81)
-   RepresentativeSampleSize (0xdc82)
-   RepresentativeSampleHeight (0xdc83)
-   RepresentativeSampleWidth (0xdc84)
-   RepresentativeSampleData (0xdc86)
-   User Rating (0xdc8a)
-   WMPMetadataRoundTrip (0x9201)

*Design Notes*

-   "Picture Transfer Protocol (PTP) for Digital Still Photography Devices," Version 1.0 of the PIMA15740: 2000 Picture Transfer Protocol specification.

-   The Media Transfer Protocol Specification, Revision 1.0 is available at *http://go.microsoft.com/fwlink/?LinkId=243145*.

-   Additional implementation details can be found in the Windows 7 Portable Device Enabling Kit for MTP, which is available at <http://go.microsoft.com/fwlink/?LinkId=243146>.

<a name="device.portable.mobilephone"></a>
## Device.Portable.MobilePhone

*MobilePhone*

### Device.Portable.MobilePhone.MTP

*Mobile phones must support MTP operations and properties as defined in the Media Transport Protocol revision 1.0 or later, along with specific object formats per device type.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Media Transfer Protocol (MTP) is an extension of the Picture Transfer Protocol (ISO 15740).  Both specifications include optional commands and operations, but some of these are required for certification. There is a core set of operations and device properties that must be met by each device category in order to be compliant with Windows. Implementation details for MTP are defined in the Media Transfer Protocol Specification, Revision 1.0 or later and will be used as the reference for certification of all portable devices as part of the Windows Hardware Certification Program.

**Required Operations**

This core set of MTP operations and device properties must be met by each portable device in order to be compliant with Windows.  Implementation details for each operation and device property are defined in the Media Transfer Protocol Specification, Revision 1.0 or later.

|       &nbsp;            | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| GetDeviceInfo           | 0x1001        | R            | R            | R              | R                    | R            |
| OpenSession             | 0x1002        | R            | R            | R              | R                    | R            |
| CloseSession            | 0x1003        | R            | R            | R              | R                    | R            |
| GetStorageIDs           | 0x1004        | R            | R            | R              | R                    | R            |
| GetStorageInfo          | 0x1005        | R            | R            | R              | R                    | R            |
| GetNumObjects           | 0x1006        | R            | R            | R              | R                    | R            |
| GetObjectHandles        | 0x1007        | R            | R            | R              | R                    | R            |
| GetObjectInfo           | 0x1008        | R            | R            | R              | R                    | R            |
| GetObject               | 0x1009        | R            | R            | R              | R                    | R            |
| GetDevicePropDesc       | 0x1014        | R            | R            | R              | R                    | R            |
| GetDevicePropValue      | 0x1015        | R            | R            | R              | R                    | R            |
| DeleteObject            | 0x100B        | R            | R            | I              | I                    | I            |
| SetDevicePropValue      | 0x100A        | R            | R            | I              | I                    | I            |
| SendObjectInfo          | 0x100C        | R            | R            | I              | I                    | I            |
| SendObject              | 0x100D        | R            | R            | I              | I                    | I            |
| GetPartialObject        | 0x101B        | R            | R            | I              | I                    | I            |
| GetObjectPropsSupported | 0x9801        | R            | R            | I              | I                    | I            |
| GetObjectPropDesc       | 0x9802        | R            | R            | I              | I                    | I            |
| GetObjectPropValue      | 0x9803        | R            | R            | I              | I                    | I            |
| SetObjectPropValue      | 0x9804        | R            | R            | I              | I                    | I            |
| GetObjectReferences     | 0x9810        | R            | R            | I              | I                    | I            |
| SetObjectReferences     | 0x9811        | R            | R            | I              | I                    | I            |

Where:
R = Required<br/>
I = If Implemented (Optional)<br/>
N/A = Not Applicable

See **Operations** in the MTP Specification, Revision 1.0 or later for complete list of defined MTP Operations.

The following operations are highly recommended, though not required:

-   FormatStore (0x100F)
-   GetObjectPropList (0x9805)
-   SetObjectPropList (0x9806)
-   GetInterDependentPropDesc (0x9807)
-   SendObjectPropList (0x9808) - For this command, your device must also support specification of destination, which allows the MTP initiator to dictate a parent handle for that object.

**Required Events**

The following events must be supported for all objects:

-   ObjectAdded (0x4002)
-   ObjectRemoved (0x4003)

If the device supports removable media, it must also support the following events.

-   StoreAdded (0x4004)
-   StoreRemoved (0x4005)

**Operation Responses**

An appropriate response must be returned for any and all operations. If an error is encountered, error response codes are also defined and must be provided by the device. For more information, see the "Responses" section of the MTP specification.

**Required Device Properties**

|        &nbsp;           | Property Code | Mobile Phone | Media Player | Digital Camera | Digital Video Camera | Other (Base) |
|-------------------------|---------------|--------------|--------------|----------------|----------------------|--------------|
| Battery Level           | 0x5001        | I            | I            | I              | I                    | I            |
| Synchronization Partner | 0xD401        | I            | I            | I              | I                    | I            |
| Device Friendly Name    | 0xD402        | R            | R            | I              | I                    | I            |
| Device Icon             | 0xD405        | I            | I            | I              | I                    | I            |

See **Device Properties** in the MTP Specification, Revision 1.0 or later for a complete list of defined Device Properties.

Device Icon is not required but is strongly recommended. High-resolution images of the device can be used and exposed in the Windows UI.

**Object Formats**

The following table represents the list of *required* object formats for a portable device.
Each object format also has a list of object properties that must be supported per object type.

|              &nbsp;             | Property Code | Mobile Phone    | Media Player    | Digital Camera  | Digital Video Camera | Other (Base)    |
|---------------------------------|---------------|-----------------|-----------------|-----------------|----------------------|-----------------|
| Undefined                       | 0x3000        | I               | I               | I               | I                    | I               |
| Abstract Audio Album            | 0xBA03        | I<sup>(2)</sup> | I<sup>(2)</sup> | N/A             | N/A                  | I<sup>(2)</sup> |
| Abstract Audio & Video Playlist | 0xBA05        | I               | I               | N/A             | N/A                  | I               |
| WAV                             | 0x3008        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| MP3                             | 0x3009        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| AVI                             | 0x300A        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| MPEG                            | 0x300B        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| ASF                             | 0x300C        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | R<sup>(1)</sup>      | I               |
| EXIF/JPEG                       | 0x3801        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| TIFF/EP                         | 0x3802        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| BMP                             | 0x3804        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| JPEG XR                         | 0xB804        | I               | I               | R<sup>(1)</sup> | I                    | I               |
| WMA                             | 0xB901        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| AAC                             | 0xB903        | R<sup>(1)</sup> | R<sup>(1)</sup> | I               | I                    | I               |
| WMV                             | 0xB981        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| MP4 Container                   | 0xB982        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| 3GP Container                   | 0xB984        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| 3G2                             | 0xB985        | I               | I               | I               | R<sup>(1)</sup>      | I               |
| AVCHD                           | 0xB986        | I               | I               | I               | R<sup>(1)</sup>      | I               |

(1) Portable devices that are capable of playing audio and/or video must support at least one of these formats. This table does not represent the complete list of supported formats; it represents the list of commonly used formats.

See **Object Formats** in the MTP Specification, Revision 1.0 or later for complete list of defined Device Properties.

(2) Support for the following object properties is mandatory for AbstractAudioAlbum objects:

-   Genre (0xDC8C)
-   Album Artist (0xDC9B)
-   WMPMetadataRoundTrip (0x9201)

A device that supports both the AbstractAudioAlbum format and an image format may optionally support album art. Album art is attached to an AbstractAudioAlbum object by adding the art to the album's RepresentativeSampleData property.
If a Portable Device supports album art, then the device must support the following object properties:

-   PurchaseFlag (0xd901), an object property in the Windows Media DRM 10 for Portable Devices MTP Extensions
-   RepresentativeSampleFormat (0xdc81)
-   RepresentativeSampleSize (0xdc82)
-   RepresentativeSampleHeight (0xdc83)
-   RepresentativeSampleWidth (0xdc84)
-   RepresentativeSampleData (0xdc86)
-   User Rating (0xdc8a)
-   WMPMetadataRoundTrip (0x9201)

*Design Notes*

-   "Picture Transfer Protocol (PTP) for Digital Still Photography Devices," Version 1.0 of the PIMA15740: 2000 Picture Transfer Protocol specification.

-   The Media Transfer Protocol Specification, Revision 1.0 is available at *http://go.microsoft.com/fwlink/?LinkId=243145*.

-   Additional implementation details can be found in the Windows 7 Portable Device Enabling Kit for MTP, which is available at <http://go.microsoft.com/fwlink/?LinkId=243146>.

