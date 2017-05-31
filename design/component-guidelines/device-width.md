---
title: Device Width
description: This is to validate the width of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6DE43A9E-3916-4C71-B0A2-905F9A3017DA
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device Width


This is to validate the width of a Windows Precision Touchpad device.

**Test name**

-   Test.DeviceWidth.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.Dimensions

**Test purpose**

-   Verifies that the device sensor meets or exceeds minimum width requirement of 64mm.

**Tools required**

-   Ruler or Micrometer
-   PTLogo.exe

**Validation steps**

1. Launch Test.DeviceWidth.json

2. Measure touchpad width with a ruler or micrometer.

3. Assuming X is the reported sensor width, verify that:

a. The measured device width is between X and (X + 4).
b. X is &gt;= 64mm.
4. If these conditions are true, then manually pass the iteration, otherwise manually fail the iteration.
Because the sensor may be slightly smaller than the cover sheet, the measured height may be as much as 4mm greater than that reported by the device.
**Common error messages**

-   None.

**Passing criteria**

-   1/1 (100%) iterations must pass in order to complete with passing status.

 

 






