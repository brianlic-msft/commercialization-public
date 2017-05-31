---
title: Device Button Reporting
description: This is to test the integrated buttons in a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1A6D1FF4-D4AE-446C-AD8F-C2E60284C50D
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device Button Reporting


This is to test the integrated buttons in a Windows Precision Touchpad device.

**Test name**

-   Test.DeviceButton.json

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.Buttons

**Test purpose**

-   Verifies that the device reports button presses correctly for integrated buttons.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.DeviceButton.json.

2. *Iteration One*: Button presses with capacitive contacts:
a. Place a finger in the center area of the digitizer surface, and exert sufficient activation force to depress the physical button. Verify that the button state is down (the grey bar at the bottom of PTLogo tool should turn green), and that the button state returns to off when your finger is lifted from the button.

b. Repeat the preceding step with 2, 3… N contacts, where N is the maximum number of contacts supported by the device. Contacts should always maintain a minimum separation distance of 15mm.

c. Place 2 fingers on the touchpad surface, and press down on the physical button. Keeping the button pressed with one finger, lift the second. PTLogo with automatically check that the button state is reported consistently.

d. Depress the physical button with three fingers on the touchpad surface. Maintaining downward pressure, flick the fingers downward so that they move off the touchpad. Verify that the physical button state does not stay on, and that the bar beneath the PTP visualization returns from green to grey once the fingers are off the touchpad.

e. Upon successful validation, manually pass the iteration. Otherwise, manually fail the iteration.

3. *Iteration Two*: Button presses with non-capacitive contacts:

For Clickpads only: Place a non-capacitive contact on the center area of the digitizer surface, and exert sufficient activation force. Verify that the button state is down (the grey bar in PTLogo should turn green), and that the button state returns to off when force exerted is less than the activation force.

**Note:** If touchpad is a pressure pad implementation, manually pass the iteration to skip it.

Otherwise, upon successful validation, manually pass the iteration otherwise. If validation is unsuccessful, then manually fail the iteration.

**Common error messages**

-   None.

**Passing criteria**

-   2/2 (100%) iterations must pass in order to complete with passing status

 

 






