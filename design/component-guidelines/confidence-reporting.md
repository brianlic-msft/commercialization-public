---
title: Confidence Reporting
description: This is to test the confidence reporting capabilities of the Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 572A62B8-87A0-458A-9930-C4333E027743
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Confidence Reporting


This is to test the confidence reporting capabilities of the Windows Precision Touchpad device.

**Test name**

-   Test.Confidence.json

**Core requirements tested**

-   Device.Input.Digitizer.Base.HIDCompliant

**Test purpose**

-   Verifies that the device can report a lack of confidence (by turning off the confidence bit for a contact), when a contact exceeds the sizing of an intentional finger contact.

**Tools required**

-   PTLogo.exe
-   A 140g or 190g slug ordered from ITRI or Triex. See [Hardware Requirements and Vendor Information](touchscreen-hardware-requirements-and-vendor-information.md) for vendor information.

**Validation steps**

1. Launch Test.Confidence.json.

2. Place a 27mm-29mm diameter contact straight down onto the surface of the touchpad for at least 5 seconds.
a. One of the weighted contacts from the [Device Click Pressure](device-click-pressure.md) test can be turned upside down to get a large, uniform contact.
3. Remove the contact. PTLogo will automatically verify that the confidence bit was cleared in the required time, and remained cleared for the contact lifetime. If no reporting errors were detected, it will automatically pass the iteration.

**Common error messages**

-   "\[30\] confidence bit set too long."
    The device is not clearing the confidence bit within 50ms of contact reporting.
-   "\[7\] test didn’t receive enough data."
    User lifted off of the touchpad too early.

**Passing criteria**

-   1/1 (100%) iterations must pass in order to complete with passing status.

 

 






