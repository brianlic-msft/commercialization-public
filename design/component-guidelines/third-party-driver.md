---
title: Third Party Driver
description: This is to ensure that there is no 3rd party driver for a Windows pen device that is connected via a Windows-supported bus.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 78EECD29-344F-4C0D-87B9-D8702499CEDA
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Third Party Driver


This is to ensure that there is no 3rd party driver for a Windows pen device that is connected via a Windows-supported bus.

**Test name**

-   3rd Party Driver

**Core requirements tested**

-   Device.Input.Digitizer.Pen.ThirdPartyDrivers.

**Test purpose**

-   Verifies that the pen does not have a 3rd party driver if the device is on a USB, I²C, or Bluetooth bus.

**Tools required**

-   None.

**Validation steps**

1. Run the test case for 3rd party drivers.

2. In the dialog box that appears, answer "Yes" if your device is on a USB, I²C, or Bluetooth bus, otherwise, answer "No."

**Common error messages**

-   "Must not require additional drivers."

    Occurs if the pen fails the third party driver requirement.

**Passing criteria**

-   1/1 test iterations must pass for the test to succeed.
