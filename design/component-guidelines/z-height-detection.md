---
title: Z-Height Detection
description: This is to test the z-axis reporting behavior of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 06568B54-C2ED-44AD-A820-4E889D25EFBF
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Z-Height Detection


This is to test the z-axis reporting behavior of a Windows Precision Touchpad device.

**Test name**

-   Test.ZHeight

**Core requirements tested**

-   Device.Input.Digitizer.PrecisionTouchpad.ContactTipSwitchHeight

**Test purpose**

-   Verifies that the device does not report contacts that exceed the allowable detection threshold in the z-axis.

**Tools required**

-   PT3 w/Precision Touchpad Modifications

-   PTLogo.exe

-   1mm thick non-conductive material (such as a business card)

**Validation steps**

1. Place 1mm thick material on top of touchpad.

2. Lower 1 PT3 contact until it just touches the non-conductive material.

3. Remove the material, leaving PT3 contact 1mm above the touchpad.

4. Launch Test.ZHeight.json.

5. Leave contact in place above touchpad for 1 minute.

6. Verify that no contact is reported – and if that is the case, then manually Pass the iteration. Otherwise manually Fail the iteration.

**Common error messages**

-   None.

**Passing criteria**

-   1/1 (100%) iterations must pass in order to complete with passing status.

 

 






