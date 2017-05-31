---
title: Report Rate - Multiple Contacts
description: This is to test the multiple contact reporting capabilities of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ABA7F9A6-1DD6-4054-A627-D6C1E5BD44FD
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Report Rate - Multiple Contacts


This is to test the multiple contact reporting capabilities of a Windows Precision Touchpad device.

**Test name**

-   Test.ReportRateMultiple.json

**Core requirements tested**

-   Device.Digitizer.PrecisionTouchPad.Performance.ReportRate

**Test purpose**

-   Verifies that the device is able to report the maximum number of contacts at the required report rate of 10 higher than the screen’s refresh rate (this requirement will not exceed the 125hz).

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.ReportRate.json.

2. Following the instructions on the screen, move around the required number of contacts on the touchpad for 1, 5, or 20 seconds (a clock in the upper right corner shows how many seconds have passed since all contacts have been down).

Contacts should be kept at least 8mm apart edge to edge.

3. Repeat for a total of 11 times – Note that the length of time will change for some iterations, so please read and follow the on-screen instructions for each iteration.

4. PTLogo will fail an iteration, and display an error if the measured report rate is lower than required, or exceeds 250 Hz. Otherwise, the iteration will pass upon lift, and PTLogo will advance to the next iteration.

**Common errors**

-   If an iteration continues after the contacts have been lifted, then be aware that the device might not have reported the clearing of the tip switch correctly.

**Passing criteria**

-   11/11 (100%) iterations must pass in order to complete with passing status.

 

 






