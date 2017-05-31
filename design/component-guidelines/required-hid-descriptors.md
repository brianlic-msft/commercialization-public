---
title: Required HID Descriptors
description: This topic presents the required HID descriptors (and device attributes) for a Windows pen device in Windows 10 and later operating systems.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: FA6F2EEF-FA5E-41DD-A561-E475991A0A9A
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Required HID Descriptors


This topic presents the required HID descriptors (and device attributes) for a Windows pen device in Windows 10 and later operating systems.

## Required USB HID Descriptor


The following table shows the required USB HID descriptor. For more information, see **section 6.2.1** in [Device Class Definition for Human Interface Devices (HID) Version 1.11](http://www.usb.org/developers/hidpage#Class_Definitions).

| Member            | Size in bytes | Description              |
|-------------------|---------------|--------------------------|
| bLength           | 1             | Size of the descriptor   |
| bDescriptorType   | 1             | Type of descriptor       |
| bcdHID            | 2             | HID version number       |
| bCountryCode      | 1             | Country code             |
| bNumDescriptors   | 1             | Number of descriptors    |
| bDescriptorType   | 1             | Descriptor type          |
| bDescriptorLength | 2             | Length of the descriptor |

 

## <a href="" id="required-i2c-hid-descriptor"></a>Required I²C HID Descriptor


The following table shows the required I²C HID descriptor.

| Member              | Size in bytes | Description                                                                     |
|---------------------|---------------|---------------------------------------------------------------------------------|
| wHIDDescLength      | 2             | The length of the complete HID descriptor (in Bytes).                           |
| bcdVersion          | 2             | The version number, in binary coded decimal (BCD) format.                       |
| wReportDescLength   | 2             | The length of the Report descriptor (in Bytes).                                 |
| wReportDescRegister | 2             | The register index containing the Report descriptor.                            |
| wInputRegister      | 2             | The register number to read the input report (in unsigned Bytes).               |
| wMaxInputLength     | 2             | The length of the largest input report to be read from the input register.      |
| wOutputRegister     | 2             | The register number to send the output (in unsigned Bytes).                     |
| wMaxOutputLength    | 2             | The length of the largest output report to be sent.                             |
| wCommandRegister    | 2             | The register number to send command requests (in unsigned Bytes).               |
| wDataRegister       | 2             | The register number to exchange data with command requests (in unsigned Bytes). |
| wVendorID           | 2             | USB-IF assigned Vendor ID.                                                      |
| wDeviceID           | 2             | Device ID.                                                                      |
| wVersionID          | 2             | Firmware version number.                                                        |

 

## Required Device Attributes


The following HID properties must be provided in the device attributes. The reporting of these device attributes is bus-specific. Consult the HID-specific guidance for your choice of bus.

| Member     | Description             | USB                                | I²C                                                        |
|------------|-------------------------|------------------------------------|------------------------------------------------------------|
| wVendorID  | Vendor ID               | idVendor in USB Device Descriptor  | wVendorID in I²C HID Descriptor (see the preceding table). |
| wProduct   | Product ID              | idProduct in USB Device Descriptor | wDeviceID in I²C HID Descriptor (see the preceding table). |
| wVersionID | Firmware version number | bcdDevice in USB Device Descriptor | wVersionID I²C HID Descriptor (see the preceding table).   |
