---
title: Selective Reporting
description: This is to test the selective reporting capabilities of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: EF217AC1-4887-4661-A6F5-143334A27001
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Selective Reporting


This is to test the selective reporting capabilities of a Windows Precision Touchpad device.

**Test name**

-   Test.SelectiveReporting

**Core requirements tested**

-   Device.Digitizer.PrecisionTouchPad.HIDCompliance.SelectiveReporting

**Test purpose**

-   Verifies that the device is able to correctly respond to selective reporting requests from the host.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.SelectiveReporting.json as an Administrator (elevated).

2. Move 1 contact on the touchpad, and exert activation force.

3. Manually Pass the iteration, if the following is true (otherwise, manually Fail the iteration): then manually pass the iteration, otherwise manually fail the iteration.

The touchpad *does not* respond (the mouse cursor does not move, no contacts are displayed in PTLogo, and button clicks do not turn the on-screen bar green).
**Common error messages**

-   None.

**Passing criteria**

-   1/1 (100%) iterations must Pass in order to complete with passing status.

 

 






