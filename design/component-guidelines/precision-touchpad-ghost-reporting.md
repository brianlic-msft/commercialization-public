---
title: Ghost Reporting
description: This is to test the accuracy of the reported contacts for a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A5942B71-E35A-478B-BDE5-7B805E755AD3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Ghost Reporting


This is to test the accuracy of the reported contacts for a Windows Precision Touchpad device.

**Test name**

-   Test.GhostReporting.json

**Core requirements tested**

-   Device.Input.Digitizer.Base.ContactReports

**Test purpose**

-   Verifies that the device does not report false contacts (noise) when it is running on AC, or DC power (if applicable).

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.GhostReporting.json.

2. Make sure the system connected to the device is plugged in during this iteration.

3. Allow the test to run for 60 seconds, during which time you do not make any contact with the touchpad.

**Note**  There is a timer in the top-right corner of the screen for reference.

 

4. PTLogo will automatically verify that no contacts have been reported by the device, and advance to the next iteration.

5. If the host device has battery power, unplug it and repeat **Step 3** and **Step 4** for the second iteration.

**Common error messages**

-   None.

**Passing criteria**

-   2/2 (100%) iterations must pass in order to complete with passing status.

 

 






