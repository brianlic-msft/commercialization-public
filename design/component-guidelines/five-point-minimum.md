---
title: Five Point Minimum
description: This is to test the five-point contact capabilities of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 326F7135-31E4-4A1F-BC20-72795AFA1894
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Five Point Minimum


This is to test the five-point contact capabilities of a Windows Touchscreen device.

**Test name**

5TouchPointMinimum.json
**Associated compatibility requirements**

-   Device.Input.Digitizer.Touch.MinContactCount
-   Device.Input.Digitizer.Base.HIDCompliant

**Test purpose**

Verifies that a Windows Touchscreen device supports a minimum of five simultaneous touch inputs.
**Tools required**

None. Can optionally use PT3.
**Running the test**

Because touch capabilities must be consistent across all computers, a minimum number of supported touch points are required. Five-finger support allows for whole-hand interactions in addition to quick and efficient touch-screen typing.

This test presents a single scenario that asks you to briefly place five or more contacts on the screen. All contacts that are placed at the beginning of the test must continue to report for the full duration of the test.

**Command syntax**

Logo3.exe -config 5TouchPointMinimum.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






