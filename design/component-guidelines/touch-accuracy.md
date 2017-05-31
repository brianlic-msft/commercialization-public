---
title: Touch Accuracy
description: This is to test the touch input reporting accuracy for a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: E6C6CEA0-B228-40B3-8BC6-F08176C2F09C
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Touch Accuracy


This is to test the touch input reporting accuracy for a Windows Touchscreen device.

**Test name**

PhysicalInputPosition.json
**Associated compatibility requirements**

-   Device.Input.Digitizer.Touch.Accuracy
-   Device.Digitizer.Touch.HIDCompliantFirmware

**Test purpose**

Verifies that a Windows Touchscreen device reports all inputs that meet the following criteria:
o Inputs within +/- 1 mm of the center of the physical input for all touchable areas outside 3.5mm of the digitizer's edge.
o Inputs within +/-2 mm within 3.5 mm of the digitizer's edge.
**Tools required**

-   PT3
-   16mm slug, or a human thumb for running the thumb tests.
-   Free hand for running the edge tests.

**Running the test**

Minimal offset between the actual and the reported point of contact, is a primary factor in real and perceived system accuracy.

The Touch Accuracy Test suite includes tests for linear accuracy (offset) and edge performance, totaling seven scenarios. For the Edge (Inward) scenario, speed is measured and enforced. The tool warns you when motion is too slow, and then asks you to repeat the interaction. Note that moving too slowly does not generate a failure.

**Command syntax**

Logo3.exe -config PhysicalInputPosition.json
**Passing criteria**

95% of the iterations must pass in order to complete with passing status.
 

 






