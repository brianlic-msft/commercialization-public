---
title: Buffering
description: This is to test the data buffering behavior of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 93E19695-816F-4F25-B649-E61E58D2A3E5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Buffering


This is to test the data buffering behavior of a Windows Precision Touchpad device.

**Test name**

-   Test.Buffering.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.Buffering

**Test purpose**

-   Verifies that the device has no data loss on wake from low power states.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.Buffering.json.

2. Follow the directions on the screen and perform a swipe with the maximum number of supported fingers on the touchpad.
3. The swipe should start at the top of the touchpad, and continue past the center of the device – this motion should be quick, no longer than a half second.

4. The test will pass if the swipe was fully registered.

5. Repeat this test 5 times.

**Common error messages**

-   None.

**Passing criteria**

-   5/5 (100%) iterations must pass in order to complete with passing status.

 

 






