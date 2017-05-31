---
title: Touch Response Latency (Down)
description: This is to test the down latency behavior of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 76E06674-169C-4958-828D-90DC830D4DAA
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Touch Response Latency (Down)


This is to test the down latency behavior of a Windows Touchscreen device.

**Test name**

audiotouch.exe
**Associated compatibility requirements**

Device.Input.Digitizer.Touch.Latency
**Test purpose**

Verifies that a Windows Touchscreen device meets the response down latency requirements when the digitizer is active.
**Tools required**

RA tool. See [Hardware Requirements and Vendor Information](touchscreen-hardware-requirements-and-vendor-information.md).
**Running the test**

Low response *latency* plays a large role in ensuring fast and fluid motion. This is similar to the [Reporting Rate](reporting-rate.md) test, where a high packet rate helps ensure smooth, fluid motion. Conversely, a high degree of response latency breaks the illusion that the user is manipulating a physical object.

This test uses specialized hardware to measure the latency in touch packet delivery for touch-down. For more detailed instructions, see [How to measure Touch Down Latency by using an Acoustic Measurement Tool](https://msdn.microsoft.com/library/windows/hardware/dn195876).

Only 50 taps are required during the collection phase.

**Command syntax**

audiotouch.exe
**Passing criteria**

Average latency recorded during the test must meet the requirement to complete with passing status.
 

 






