---
title: Ghost Reporting
description: This is to test the ghost reporting aspect of a Windows pen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3BF6F31F-ED3A-4997-9941-61609CF42278
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Ghost Reporting


This is to test the ghost reporting aspect of a Windows pen device.

**Test name**

-   Pen.GhostReporting

**Core requirements tested**

-   Device.Input.Digitizer.Base.ContactReports

**Test purpose**

-   Verifies that the pen does not report ghost points.

**Tools required**

-   None.

**Validation steps**

1. Ensure that the device is using the power source.

2. Leave the pen out of range for 60 seconds.

3. Disconnect power source.

4. Leave the pen out of range for 60 seconds.

Here's a screenshot from the Ghost Reporting test.

![screenshot from the ghost reporting test for a windows pen device.](../images/pen-test-ghostrep.png)

**Common error messages**

-   "Ghost input detected"
    
    Occurs if any pen input is detected during the test.

**Passing criteria**

-   2/2 test iterations must pass for the test to succeed.
