---
title: Input Separation
description: This is to test the touch input separation capabilities of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B91DCF0C-B981-48D3-894F-AA0A482F4260
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Input Separation


This is to test the touch input separation capabilities of a Windows Touchscreen device.

**Test name**

InputSeparation.json
**Associated compatibility requirements**

Device.Input.Digitizer.Touch.FingerSeparation
**Test purpose**

Verifies that a Windows Touchscreen device meets the requirements for zoom, and multi-finger tap and swipe motions.
**Tools required**

PT3
**Running the test**

Users often place their fingers close together in fast-paced games, drawing applications, musical instrument applications, and other common applications. In addition, Windows supports a system of touch gestures that let users who have low vision, fully explore the user interface (UI) and accomplish common tasks. Much of this gesture language relies on multiple fingers in close proximity.

This test consists of five scenarios that enforce the requirement that contacts in close proximity must be recognized separately. Broadly, this test verifies that a device meets these requirements during horizontal, vertical, and diagonal motion, and during a pinch gesture.

**Command syntax**

Logo3.exe -config InputSeparation.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






