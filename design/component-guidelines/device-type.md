---
title: Device Type
description: This is to test the pad type reporting of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 20776726-AE11-44EE-8F85-11E6FFCA3B55
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device Type


This is to test the pad type reporting of a Windows Precision Touchpad device.

**Test name**

-   Test.DeviceType.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.DeviceTypeReporting

**Test purpose**

-   Verifies that the device reports its pad type correctly.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.DeviceType.json.

2. If the device is a click-pad and PTLogo reports that the device is a click-pad, then manually pass the iteration.

3. If the device is a pressure-pad and PTLogo reports the device as a pressure-pad, then manually pass the iteration.

4. If the device is a non-clickable touchpad, or discrete-pad, and PTLogo reports the device as No Pad Type, then manually pas the iteration.

5. If the device type reported in PTLogo does not match the actual device type, manually fail the iteration.

**Common error messages**

-   None.

**Passing criteria**

-   1/1 (100%) iterations must pass in order to complete with passing status.

 

 






