---
title: Required Descriptors
description: Required Descriptors
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1EE2882D-A69A-4BC8-A12C-27E7240CC3EB
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Required Descriptors


## Required OS Descriptors


If your device uses the internal USB bus, you must enable the USB selective suspend feature for your HID device by using the USB [Microsoft OS descriptor](http://go.microsoft.com/fwlink/p/?linkid=254381). With a properly formatted Microsoft OS extended property descriptor, the USB selective suspend feature can be enabled automatically whenever the HID device is connected. For more details about how the Microsoft OS extended property descriptor can be used to automatically enable selective suspend, see [Microsoft OS descriptor](http://go.microsoft.com/fwlink/p/?linkid=254381).

## Required HID Descriptors


A Windows pointer device must provide the following HID descriptors, attributes, and strings.

### Required USB HID Descriptor

The following table shows the required USB HID descriptor. For more information, see section 6.2.1 in [Device Class Definition for Human Interface Devices (HID) Version 1.11](http://www.usb.org/developers/hidpage/HID1_11.pdf).

| Member            | Size in Bytes | Description              |
|-------------------|---------------|--------------------------|
| bLength           | 1             | Size of the descriptor   |
| bDescriptorType   | 1             | Type of descriptor       |
| bcdHID            | 2             | HID version number       |
| bCountryCode      | 1             | Country code             |
| bNumDescriptors   | 1             | Number of descriptors    |
| bDescriptorType   | 1             | Descriptor type          |
| bDescriptorLength | 2             | Length of the descriptor |

 

### Required I2C HID Descriptor

The following table shows the required I2C HID descriptor.

| Member              | Size in Bytes | Description                                                      |
|---------------------|---------------|------------------------------------------------------------------|
| bLength             | 2             | The length of the complete HID descriptor, in bytes.             |
| bcdVersion          | 2             | The version number, in binary coded decimal (BCD) format.        |
| dwReportDescLength  | 2             | The length of the Report descriptor, in bytes.                   |
| wReportDescRegister | 2             | The register index containing the Report descriptor.             |
| wInputRegister      | 2             | The register number to read the input report, in unsigned bytes. |
| wOutputRegister     | 2             | The register number to send the output, in unsigned bytes.       |
| wVendorID           | 2             | USB-IF assigned Vendor ID.                                       |
| wDeviceID           | 2             | Device ID.                                                       |
| wRevisionID         | 2             | Firmware version number                                          |

 

### Required Device Attributes

The following HID properties must be provided in the device attributes. The reporting of these device attributes is bus specific. Consult the HID specific guidance for your choice of bus.

| Member         | Description                   |
|----------------|-------------------------------|
| bSize          | Size of the Device descriptor |
| wVendorID      | Vendor Id                     |
| wProduct       | Product Id                    |
| Version Number | Firmware version number       |

 

### HID Strings

The following strings must be supported by devices that support Windows pointer functionality:

-   Manufacturer Name
-   Product String

 

 






