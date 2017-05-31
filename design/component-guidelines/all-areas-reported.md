---
title: All Areas Reported
description: This is to test the reporting area coverage of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 142C9BC9-E3C2-4D3B-9D0F-3EFB65DB3B2F
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# All Areas Reported


This is to test the reporting area coverage of a Windows Precision Touchpad device.

**Test name**

-   Test.AllAreas.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.Accuracy

**Test purpose**

-   Verifies that the device can report contacts in all areas of the digitizer surface.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.AllAreas.json.

2. Following the directions on the screen, you will perform 5 taps in each general region of the touchpad (top-left, top-right, bottom-left, bottom-right, and center):
a. Tap anywhere inside the specified region. For example, if top-left is specified, tap anywhere left of center and above the middle of the touchpad.

i. Tap a different random location for each of the 5 iterations.

ii. If the tap occurs in the expected region, PTLogo will automatically pass the iteration.

iii. If no tap is registered for a given region, manually fail the iteration.

b. After 5 taps, the onscreen instructions will indicate the next region to tap. Repeat the preceding **Step 2.a** for each subsequent region as indicated.
**Common error messages**

-   None.

**Passing criteria**

-   25/25 (100%) iterations must pass in order to complete with passing status.

 

 






