---
title: Device Height
description: This is to validate the height of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 12175D3C-A579-489D-86C3-AC287FCA0E74
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device Height


This is to validate the height of a Windows Precision Touchpad device.

**Test name**

-   Test.DeviceHeight.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.Dimensions

**Test purpose**

-   Verifies that the device sensor meets or exceeds minimum height requirement of 32mm.

**Tools required**

-   Ruler or Micrometer
-   PTLogo.exe

**Validation steps**

1. Launch Test.DeviceHeight.json.

2. Measure touchpad height with a ruler or micrometer.

3. Assuming Y is the reported sensor width, verify that:
a. The measured device width is between Y and (Y + 4).

b. Y is greater than or equal to 32mm.

4. If these conditions are true, then manually pass the iteration, otherwise manually fail the iteration.

Because the sensor may be slightly smaller than the cover sheet, the measured height may be as much as 4mm greater than the height that is reported by the device.

**Common error messages**

-   None.

**Passing criteria**

-   1/1 (100%) iterations must pass in order to complete with passing status.

 

 






