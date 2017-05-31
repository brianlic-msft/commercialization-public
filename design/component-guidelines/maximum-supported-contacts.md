---
title: Maximum Supported Contacts
description: This is to test the maximum number of contacts supported by a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: F96C2AAB-5F98-4BB9-904F-B83FF40A0FEB
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maximum Supported Contacts


This is to test the maximum number of contacts supported by a Windows Precision Touchpad device.

**Test name**

-   Test.MinMaxContacts.json

**Core requirements tested**

-   Device.Digitizer.PrecisionTouchPad.Performance.MinMaxContacts

**Test purpose**

-   Verifies that the device is able to support between 3 and 5 simultaneous contacts.

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test.MinMaxContacts.json.

2. PTLogo will automatically pass or fail depending on the maximum number of contacts the touchpad device supports.

**Common error messages**

-   "\[23\] device doesn’t support minimum number of contacts:\#"

    o The device supports less than three contact minimum.

    o The displayed value (\#) indicates the number of supported contacts.

-   "\[24\] device supports too many contacts:\#"

    o The device supports more than a maximum of five contacts.

    o The displayed value (\#) indicates the number of supported contacts.

**Passing criteria**

-   1/1 (100%) iterations must pass in order to complete with passing status.

 

 






