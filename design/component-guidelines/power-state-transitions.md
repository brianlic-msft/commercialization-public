---
title: Power State Transitions
description: This is to test the behavior of a Windows Precision Touchpad device during power state transitions.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5B1F4D44-D8BB-407E-B004-BFC32CE02408
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Power State Transitions


This is to test the behavior of a Windows Precision Touchpad device during power state transitions.

**Test name**

-   Test.PowerStateReliability.json

**Core requirements tested**

-   Device.Input.Digitizer.Base.ContactReports

-   Device.Input.Digitizer.PrecisionTouchpad.Latency

**Test purpose**

-   Verifies that the device is able to wake the system from sleep state S3, with both contact and button presses, and also handle power state transitions gracefully.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Verify that the touchpad calibrates from a small contact on boot. Perform the following steps:
a. Shut down the system.

b. While the system is powered off, place one small capacitive contact (either a finger or the PT3 device) on the digitizer surface.

c. Power on the system and leave the contact there until login is complete.

d. Lift contact, then interact with the PTP (move cursor, 1-finger tap, 2-finger tap, and 2 finger panning).

e. Verify that the touchpad behaves as expected.

2. Verify that the touchpad calibrates from a large contact on boot. Perform the following steps:

a. Shut down the system.

b. While the system is powered off, place an entire palm on the digitizer surface.

c. Power on the system and leave the contact there until login is complete.

d. Lift contact, then interact with the PTP (move cursor, 1-finger tap, 2-finger tap, and 2 finger panning).

e. Verify that the touchpad behaves as expected.

3. Verify that the touchpad powers up quickly. Perform the following steps:

a. Completely shut down the system, then boot it up again.

b. As soon as the logon screen comes up, start performing quick swipes on the touchpad.

c. Verify that the cursor moves.

4. Launch Test.PowerstateReliability.json.

5. If the touchpad behaved as expected in each of the preceding scenarios, manually pass the test. If not, fail the test.

**Common error messages**

-   None.

**Passing criteria**

-   6/6 manual iterations must pass in order to complete with passing status.

 

 






