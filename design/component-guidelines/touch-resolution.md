---
title: Touch Resolution
description: This is to test the resolution of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 100FBD31-29F3-4AFF-B94C-F0C0888C0788
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Touch Resolution


This is to test the resolution of a Windows Touchscreen device.

**Test name**

TouchResolution.json
**Associated compatibility requirements**

Device.Input.Digitizer.Touch.Resolution
**Test purpose**

Verifies that a Windows Touchscreen device has a resolution that is greater than, or equal to the native display resolution.
**Tools required**

None.
**Running the test**

To support the assertion that every pixel is touchable, the resolution of the touch screen must be at least as high as the resolution of the display. This test verifies that capability. To complete this test, simply touch the screen. The program validates that the digitizer that reports the contact has a resolution that is at least as high as the connected display.

**Command syntax**

Logo3.exe –config TouchResolution.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






