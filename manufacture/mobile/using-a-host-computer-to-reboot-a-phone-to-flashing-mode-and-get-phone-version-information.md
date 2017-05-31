---
author: kpacquer
Description: Using a host PC to reboot a device to flashing mode and get version information
ms.assetid: 19499cb0-b45d-4971-9934-778f17a87e52
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Using a host PC to reboot a device to flashing mode and get version information
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Using a host PC to reboot a device to flashing mode and get version information


When a Windows 10 Mobile device is connected to a host PC via a USB cable, you can perform the following tasks in an application that is running on the host PC. These tasks are useful in certain manufacturing or customer care scenarios.

-   Reboot the device into flashing mode.

-   Retrieve version information from the device.

The host app uses the Windows Portable Devices API to accomplish these tasks.

## <span id="Understanding_the_Windows_Portable_Devices_API"></span><span id="understanding_the_windows_portable_devices_api"></span><span id="UNDERSTANDING_THE_WINDOWS_PORTABLE_DEVICES_API"></span>Understanding the Windows Portable Devices API


The Windows Portable Devices (WPD) API is a COM-based API that enables computers to communicate with attached devices. To learn more about this API, refer to the following resources:

-   [Windows Portable Devices](http://msdn.microsoft.com/library/windows/desktop/dd388998.aspx): This section of the MSDN library provides architecture guidance and reference documentation for the Windows Portable Devices API.

-   [Portable Devices COM API Sample](http://code.msdn.microsoft.com/windowsdesktop/Portable-Devices-COM-API-fd4a5f7d): This sample demonstrates how to use the Windows Portable Devices API to perform a variety of tasks, including enumerating connected devices, reading properties of content on a connected device, and sending MTP commands to a device.

-   [Portable Devices Services COM API Sample](http://code.msdn.microsoft.com/windowsdesktop/Portable-Devices-COM-API-b1e2db21): This sample demonstrates how to use the Windows Portable Devices API to perform a variety of operations on device services, including enumerating services and service content.

## <span id="Discovering_Windows_10_Mobile_devices_that_are_connected_to_the_host_computer"></span><span id="discovering_windows_10_mobile_devices_that_are_connected_to_the_host_computer"></span><span id="DISCOVERING_WINDOWS_10_MOBILE_DEVICES_THAT_ARE_CONNECTED_TO_THE_HOST_COMPUTER"></span>Discovering Windows 10 Mobile devices that are connected to the host computer


Before the host app can reboot a device to flashing mode or retrieve version information from the device, the host apps must discover all devices that are connected to the computer.

1.  Create an [IPortableDeviceManager](http://msdn.microsoft.com/library/windows/desktop/dd388688.aspx) object and use the [IPortableDeviceManager::GetDevices](http://msdn.microsoft.com/library/windows/desktop/dd388693.aspx) function to get the collection of device IDs for all connected devices.

2.  Enumerate through the collection of device IDs to determine which connected device is a Windows 10 Mobile For each device ID, create an [IPortableDevice](http://msdn.microsoft.com/library/windows/desktop/dd319361.aspx) object and then use the [IPortableDevice::Content](http://msdn.microsoft.com/library/windows/desktop/dd375688.aspx) and [IPortableDeviceContent::Properties](http://msdn.microsoft.com/library/windows/desktop/dd388540.aspx) functions to retrieve the value of the WPD\_DEVICE\_MODEL\_UNIQUE\_ID device property for the device. If the device is a Windows 10 Mobile device, the value of the WPD\_DEVICE\_MODEL\_UNIQUE\_ID property is a GUID with the following value.

    ``` syntax
    0x59f12ea9, 0x53ce, 0x452d, 0x97, 0x11, 0xca, 0x4e, 0xea, 0xf1, 0x80, 0x89
    ```

### <span id="Examples_and_additional_resources"></span><span id="examples_and_additional_resources"></span><span id="EXAMPLES_AND_ADDITIONAL_RESOURCES"></span>Examples and additional resources

The following code examples in the [Portable Devices COM API Sample](http://code.msdn.microsoft.com/windowsdesktop/Portable-Devices-COM-API-fd4a5f7d) demonstrate the following related tasks:

-   Creating an [IPortableDeviceManager](http://msdn.microsoft.com/library/windows/desktop/dd388688.aspx) object: see the `ChooseDevice` function in DeviceEnumeration.cpp.

-   Getting the device IDs of all connected devices: see the `EnumerateAllDevices` function in DeviceEnumeration.cpp.

-   Retrieving device properties: see the `ReadContentProperties` function in ContentProperties.cpp.

For more info about enumerating devices and retrieving device properties, see the following articles:

-   [Enumerating Devices](http://msdn.microsoft.com/library/windows/desktop/dd319331.aspx)

-   [Device Properties](http://msdn.microsoft.com/library/windows/desktop/dd319322.aspx)

-   [Retrieving Properties for a Single Object](http://msdn.microsoft.com/library/windows/desktop/dd375726.aspx)

## <span id="Rebooting_a_Windows_10_Mobile_device_into_flashing_mode"></span><span id="rebooting_a_windows_10_mobile_device_into_flashing_mode"></span><span id="REBOOTING_A_WINDOWS_10_MOBILE_DEVICE_INTO_FLASHING_MODE"></span>Rebooting a Windows 10 Mobile device into flashing mode


After you have an [IPortableDevice](http://msdn.microsoft.com/library/windows/desktop/dd319361.aspx) object that represents a Windows 10 Mobile device, you can send an MTP command to reboot the phone into flashing mode.

1.  Create an [IPortableDeviceValues](http://msdn.microsoft.com/library/windows/desktop/dd319461.aspx) object and configure it to set up the MTP command parameters:

    1.  Call [IPortableDeviceValues::SetGuidValue](http://msdn.microsoft.com/library/windows/desktop/dd375671.aspx). Pass WPD\_PROPERTY\_COMMON\_COMMAND\_CATEGORY to the *key* parameter and pass WPD\_COMMAND\_MTP\_EXT\_EXECUTE\_COMMAND\_WITHOUT\_DATA\_PHASE.fmtid to the *Value* parameter.

    2.  Call [IPortableDeviceValues::SetUnsignedIntegerValue](http://msdn.microsoft.com/library/windows/desktop/dd375681.aspx). Pass WPD\_PROPERTY\_COMMON\_COMMAND\_ID to the *key* parameter and pass WPD\_COMMAND\_MTP\_EXT\_EXECUTE\_COMMAND\_WITHOUT\_DATA\_PHASE.pid to the *Value* parameter.

    3.  Call [IPortableDeviceValues::SetUnsignedIntegerValue](http://msdn.microsoft.com/library/windows/desktop/dd375681.aspx) again. Pass WPD\_PROPERTY\_MTP\_EXT\_OPERATION\_CODE to the *key* parameter and pass the value **0x9401** to the *Value* parameter. This value represents the MTP command that reboots the phone into flashing mode.

    4.  Create an [**IPortableDevicePropVariantCollection**](https://msdn.microsoft.com/library/windows/hardware/ff597589) object.

    5.  Call [**IPortableDeviceValues::SetIPortableDevicePropVariantCollectionValue**](https://msdn.microsoft.com/library/windows/hardware/ff597632). Pass WPD\_PROPERTY\_MTP\_EXT\_OPERATION\_PARAMS to the *key* parameter and pass the [**IPortableDevicePropVariantCollection**](https://msdn.microsoft.com/library/windows/hardware/ff597589) object to the *pValue* parameter.

2.  Call [IPortableDevice::SendCommand](http://msdn.microsoft.com/library/windows/desktop/dd375691.aspx) to send the MTP command. Pass the initialized [IPortableDeviceValues](http://msdn.microsoft.com/library/windows/desktop/dd319461.aspx) object to the *pParameters* parameter. This operation sends the MTP command to reboot the phone into flashing mode.

### <span id="Examples_and_additional_resources"></span><span id="examples_and_additional_resources"></span><span id="EXAMPLES_AND_ADDITIONAL_RESOURCES"></span>Examples and additional resources

The following code examples demonstrate how to set up MTP command parameters and send an MTP command:

-   [Issuing the GetNumObjects Command](http://msdn.microsoft.com/library/windows/desktop/ff384842.aspx): This topic in the MSDN library demonstrates how to send the standard GetNumObjects MTP command.

-   The `SendhintsCommand` function in ContentEnumeration.cpp in the [Portable Devices COM API Sample](http://code.msdn.microsoft.com/windowsdesktop/Portable-Devices-COM-API-fd4a5f7d).

For more information about sending MTP commands using the Windows Portable Devices API, see [Supporting MTP Extensions](http://msdn.microsoft.com/library/windows/desktop/ff384848.aspx).

## <span id="Retrieving_version_information_from_a_Windows_10_Mobile_device"></span><span id="retrieving_version_information_from_a_windows_10_mobile_device"></span><span id="RETRIEVING_VERSION_INFORMATION_FROM_A_WINDOWS_10_MOBILE_DEVICE"></span>Retrieving version information from a Windows 10 Mobile device


After you determine the device ID for a Windows 10 Mobile device that is connected to the host computer, you can use a Windows 10 Mobile-specific device service named MtpDuDeviceService to retrieve version information from the device.

**Note**  
If the device is protected with a PIN, the MtpDuDeviceService is only available if the PIN has been entered and the device is unlocked.

 

### <span id="Open_the_MtpDuDeviceService"></span><span id="open_the_mtpdudeviceservice"></span><span id="OPEN_THE_MTPDUDEVICESERVICE"></span>Open the MtpDuDeviceService

First, enumerate through the device services to open an [IPortableDeviceService](http://msdn.microsoft.com/library/windows/desktop/dd319445.aspx) object for the MtpDuDeviceService.

1.  Get an array of IDs for all device services supported by the device. To do this, cast the existing [IPortableDeviceManager](http://msdn.microsoft.com/library/windows/desktop/dd388688.aspx) object to an [IPortableDeviceServiceManager](http://msdn.microsoft.com/library/windows/desktop/dd319402.aspx) and call the [IPortableDeviceServiceManager::GetDeviceServices](http://msdn.microsoft.com/library/windows/desktop/dd319408.aspx) method. Pass the device ID for the Windows 10 Mobile device to the *pszPnPDeviceID* parameter and the value [GUID\_DEVINTERFACE\_WPD\_SERVICE](http://msdn.microsoft.com/library/windows/desktop/dd319319.aspx) to the *guidServiceCategory* parameter. The array of service IDs is returned in the *pServices* parameter.

2.  Iterate through the array of service IDs, and perform the following tasks for each service ID:

    1.  Create an [IPortableDeviceService](http://msdn.microsoft.com/library/windows/desktop/dd319445.aspx) object and call the [IPortableDeviceService::Open](http://msdn.microsoft.com/library/windows/desktop/dd319453.aspx) function to open the service. Pass the current service ID to the *pszPnPServiceID* parameter.

    2.  Get the service object ID by calling the [IPortableDeviceService::GetServiceObjectID](http://msdn.microsoft.com/library/windows/desktop/dd319449.aspx) function. You need the service object ID to access properties of the service.

    3.  Use the [IPortableDeviceService::Content](http://msdn.microsoft.com/library/windows/desktop/dd319445.aspx) and [IPortableDeviceContent::Properties](http://msdn.microsoft.com/library/windows/desktop/dd388540.aspx) functions to retrieve the collection of properties for the service (an [IPortableDeviceProperties](http://msdn.microsoft.com/library/windows/desktop/dd388696.aspx) object).

    4.  Create an [IPortableDeviceKeyCollection](http://msdn.microsoft.com/library/windows/desktop/dd388548.aspx) object and add the WPD-defined WPD\_OBJECT\_NAME property key to this collection. This property key indicates that you are retrieving the display name for the service.

    5.  Call the [IPortableDeviceProperties::GetValues](http://msdn.microsoft.com/library/windows/desktop/dd388714.aspx) function to retrieve an [IPortableDeviceValues](http://msdn.microsoft.com/library/windows/desktop/dd319461.aspx) object that contains the property values. Pass the service object ID to the *pszObjectID* parameter and the initialized [IPortableDeviceKeyCollection](http://msdn.microsoft.com/library/windows/desktop/dd388548.aspx) object to the *pKeys* parameter.

    6.  Call the [IPortableDeviceValues::GetStringValue](http://msdn.microsoft.com/library/windows/desktop/dd375661.aspx) function, and pass the WPD-defined WPD\_OBJECT\_NAME property key to the *key* parameter.

    7.  If the [IPortableDeviceValues::GetStringValue](http://msdn.microsoft.com/library/windows/desktop/dd375661.aspx) function returns the string **MtpDuDeviceService**, you have found the service object you need to retrieve version information from the phone. Exit the loop and proceed to the next section.

        If the name of the service is not **MtpDuDeviceService**, call the [IPortableDeviceService::Close](http://msdn.microsoft.com/library/windows/desktop/dd319441.aspx) function, iterate to the next service ID returned by [IPortableDeviceServiceManager::GetDeviceServices](http://msdn.microsoft.com/library/windows/desktop/dd319408.aspx), and return to step 2.

### <span id="Retrieve_version_information_from_the_device"></span><span id="retrieve_version_information_from_the_device"></span><span id="RETRIEVE_VERSION_INFORMATION_FROM_THE_DEVICE"></span>Retrieve version information from the device

After you have opened an [IPortableDeviceService](http://msdn.microsoft.com/library/windows/desktop/dd319445.aspx) object for the MtpDuDeviceService, you can use this object to retrieve version information from the device

1.  Use the [IPortableDeviceService::Content](http://msdn.microsoft.com/library/windows/desktop/dd319445.aspx) and [IPortableDeviceContent::Properties](http://msdn.microsoft.com/library/windows/desktop/dd388540.aspx) functions to retrieve the collection of properties for the service (an [IPortableDeviceProperties](http://msdn.microsoft.com/library/windows/desktop/dd388696.aspx) object).

2.  Create an [IPortableDeviceKeyCollection](http://msdn.microsoft.com/library/windows/desktop/dd388548.aspx) object and add a [PROPERTYKEY](http://msdn.microsoft.com/library/windows/desktop/bb773381.aspx) value to this collection that specifies the version data you want to retrieve from the device. The [PROPERTYKEY](http://msdn.microsoft.com/library/windows/desktop/bb773381.aspx) value must have the following structure:

    -   The *fmtid* field must have the following GUID value:

        ``` syntax
        0x9BFC64C1, 0x19C9, 0x4F3D, 0xA1, 0x4D,  0xC8,  0xDB,  0xE0,  0x47,  0x5D,  0x13
        ```

    -   The *pid* field must have one of the values shown in the table below

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Device data to retrieve</th>
    <th align="left">pid value</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>The build string for the image on the device</p></td>
    <td align="left"><p>Use the data returned by the following pid values to construct the build string:</p>
    <ul>
    <li><p>4 (the name of the internal Microsoft branch the OS was built from)</p></li>
    <li><p>6 (the Windows build number)</p></li>
    <li><p>7 (the Windows 10 Mobile build number)</p></li>
    <li><p>8 (the time stamp for the build)</p></li>
    </ul>
    <p>An example build string is WPMAIN.9600.12186.20130906-1624.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>The OS version</p></td>
    <td align="left"><p>12</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>The OEM device name</p></td>
    <td align="left"><p>15</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>The firmware version</p></td>
    <td align="left"><p>16</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>The SoC version</p></td>
    <td align="left"><p>17</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>The radio software version</p></td>
    <td align="left"><p>18</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>The radio hardware version</p></td>
    <td align="left"><p>19</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>The bootloader version</p></td>
    <td align="left"><p>20</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>The platform ID (from SMBIOS).</p></td>
    <td align="left"><p>29</p></td>
    </tr>
    </tbody>
    </table>

     

3.  Call the [IPortableDeviceProperties::GetValues](http://msdn.microsoft.com/library/windows/desktop/dd388714.aspx) function to retrieve an [IPortableDeviceValues](http://msdn.microsoft.com/library/windows/desktop/dd319461.aspx) object that contains the requested version information. Pass the service object ID to the *pszObjectID* parameter and the initialized [IPortableDeviceKeyCollection](http://msdn.microsoft.com/library/windows/desktop/dd388548.aspx) object to the *pKeys* parameter.

4.  Call the [IPortableDeviceValues::GetStringValue](http://msdn.microsoft.com/library/windows/desktop/dd375661.aspx) function. For the *key* parameter, pass the same [PROPERTYKEY](http://msdn.microsoft.com/library/windows/desktop/bb773381.aspx) value that you used earlier. This function returns the requested version information in the *pValue* parameter.

### <span id="Examples_and_additional_resources"></span><span id="examples_and_additional_resources"></span><span id="EXAMPLES_AND_ADDITIONAL_RESOURCES"></span>Examples and additional resources

The following code examples in the [Portable Devices Services COM API Sample](http://code.msdn.microsoft.com/windowsdesktop/Portable-Devices-COM-API-b1e2db21) demonstrate the following related tasks:

-   Enumerating through device services: see the `EnumerateContactsServices` function in ServiceEnumeration.cpp.

-   Reading properties of a service: see the `ReadContentProperties` function in ContentProperties.cpp.

For more info about working with device services, see [Opening a service](http://msdn.microsoft.com/library/windows/desktop/dd375706.aspx), [Accessing service object properties](http://msdn.microsoft.com/library/windows/desktop/dd743198.aspx) and [Retrieving Object Properities](http://msdn.microsoft.com/library/windows/desktop/dd375722.aspx).

 

 





