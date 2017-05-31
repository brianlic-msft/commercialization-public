---
title: Report Rate - Single Contact
description: This is to test the single contact reporting capabilities of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: DCF11F71-719B-4F03-8260-43F026EAB540
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Report Rate - Single Contact


This is to test the single contact reporting capabilities of a Windows Precision Touchpad device.

**Test name**

-   Test.ReportRate.json

**Core requirements tested**

-   Device.Digitizer.PrecisionTouchPad.Performance.ReportRate

**Test purpose**

-   Verifies that the device is able to report a single contact at the required report rate of 125 Hz for a single contact.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.ReportRate.json.

2. Following the instructions on the screen, move a single contact on the digitizer surface for 1, 5, or 20 seconds (a clock in the upper right corner shows how many seconds have passed since the contact has been down).

3. Repeat for a total of 11 times – Note that the length of time will change for some iterations, so please read and follow the on-screen instructions for each iteration.

4. PTLogo will fail an iteration and display an error on lift if the measured report rate is too low, or if it exceeds 250 Hz. Otherwise, the iteration will pass upon lift, and PTLogo will advance to the next iteration.

**Common errors**

-   If an iteration continues after the contacts have been lifted, the device may not have reported the clearing of the tip switch correctly.

**Passing criteria**

-   11/11 (100%) iterations must pass in order to complete with passing status.

 

 






