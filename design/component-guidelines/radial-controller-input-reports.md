---
title: Windows radial controller input reports
author: windows-driver-content
description: TBD
ms.assetid:
keywords: radial dial, radial controller, dial
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows radial controller input reports

This topic details the HID input report that are used for radial controller haptic feedback support in Windows 10, version 1607 and later operating systems.

The host makes use of the following usages when extracting data from an input report:

| Member | Description | Page | ID | Mandatory/Optional |
| ---| --- | --- | --- | --- |
| Button | State of the button located on radial controller | 0x09 | 0x01 | Mandatory |
| Dial | Relative rotation of the radial controller  | 0x01 | 0x37 | Mandatory |
| X | X coordinate of contact position | 0x01 | 0x30 | Optional |
| Y | Y coordinate of contact position | 0x01 | 0x31 | Optional |
| Width | Width of bounding box around a contact | 0x0D | 0x48 | Optional |
| Height| Height of bounding box around a contact | 0x0D | 0x49 | Optional |

### Mandatory and Windows-supported optional usages

Any device that does not report all mandatory usages will be non-functional as a Windows radial controller. Mandatory usages are strictly enforced by the Windows host. Where a logical maximum value has not been restricted, it can be optimized to reduce descriptor size.

The following sections provide more details about the mandatory and the Windows-supported optional usages that were presented in the above table.

### Button

Used to indicate when the primary button on the radial controller device is depressed. This is indicated by a main item with a report size of 1 bit. When delivering an input report, the bit should be set when this button is depressed, and cleared when the button is released.

### Dial

Used to indicate the clockwise rotation of the radial controller around its own major axis. When delivering an input report, the reported value should be the magnitude of rotation relative to the previous report. This value will be positive if the radial controller is rotated in a clockwise direction, and negative if the radial controller is rotated in a counterclockwise direction.

The physical range and logical range must be specified. Degrees or radians can be used for the physical range. In either case, the logical range must be large enough to report values that are accurate to at least one decimal place.

### X/Y

X and Y report the coordinates of a radial controller’s contact on-screen. This coordinate represents the center of the contact relative to the display.

Devices that report X and Y must also report a Width or Height usage. The host uses the reported coordinate to build the bounding rectangle around the contact.

The following global items must be specified for the X and Y usages:
* Logical minimum
* Logical maximum
* Physical minimum
* Physical maximum
* Unit
* Unit exponent

The physical range for the device and the units must be accurately reported. If the information is inaccurate, the device will not work correctly. Devices must also report data within the logical range that is specified in the report descriptor.

X and Y can provide a NULL value to the system, implying the device does not currently have a position relative to a display, by providing a value outside the reported logical range and adding Null Support to the usage's input report **(Bit 6 {No Null position (0) | Null state(1)}).**  

### Width and height

The width and height usages represent the width and height of the bounding box around the radial controller contact. The width and height should be defined as constants in the report descriptor.

A Windows radial controller device is assumed to be circular by the system. Because of this, it is not required to report both width and height for an onscreen contact. If either height or width is supported, the bounds of the contact will be interpreted by the system correctly. Windows does not provide support for radial controller devices with different values for width and height.
