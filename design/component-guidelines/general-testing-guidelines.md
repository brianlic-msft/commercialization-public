---
title: General Testing Guidelines
description: This topic provides general guidelines for testing a Windows pen device, using the Windows Hardware Lab Kit (HLK) for Windows 10.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 42ABD76B-3427-4765-B76E-D2C9E1BB0FBC
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# General Testing Guidelines


This topic provides general guidelines for testing a Windows pen device, using the Windows Hardware Lab Kit (HLK) for Windows 10.

-   Unless otherwise specified, the device should always have AC power when performing HLK tests.

-   Unless otherwise specified, all numbers in error messages which report distance or location are in himetric (0.01mm).

-   Unless otherwise specified, a nominal weight of 150g should be applied to the pen holder for all tests.

    + When applying the 150g of weight, distribute the weight as evenly as possible onto both sides of the pen holder. This can be either a 50g/100g split, or a 75g/75g split, if enough weights are available.

    + Except for tests that require precise application of weights, it is acceptable that the total applied weight at pen tip exceeds 150g due to the weight of the pen and the pen holder.

-   Unless otherwise specified, the pen holder should be held at an angle of 90 degrees i.e. placed vertically against the screen.

-   Unless otherwise specified, no input for HLK testing should be collected within 8mm of the edge of the screen.

-   Before running each test, ensure the device is lying flat on the PT3 or RA tool.

-   Before running the tests, ensure screen resolution is adjusted to the device’s default or highest resolution.

-   Before running the tests, ensure the device’s orientation matches the orientation of the digitizer and the HLK application is full screen.

-   The Windows 10 HLK only supports testing a single pen digitizer at a time. If your device exposes multiple pen TLCs, you will need to do the following to ensure that the correct pen digitizer is being tested:
    1. Open **Device Manager**, then expand the **Human Interface Devices** node.
    2. Find and disable all HID-compliant pen digitizers, with the exception of the one that you want to validate.
