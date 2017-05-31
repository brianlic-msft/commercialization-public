---
title: Touch Test
description: This is to test the type of touch input that falls into the category of Custom Gestures for a Windows Touchscreen device. This test also checks the 3rd party driver dependencies for the Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: CAE8DAEF-8798-4FB9-8FE6-0A96C55DAD16
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Touch Test


This is to test the type of touch input that falls into the category of Custom Gestures for a Windows Touchscreen device. This test also checks the 3rd party driver dependencies for the Touchscreen device.

**Test names**

Other.json
**Associated compatibility requirements**

-   Device.Input.Digitizer.Touch.CustomGestures
-   Device.Input.Digitizer.Base.ThirdPartyDrivers
-   Device.Input.Digitizer.Base.HIDCompliant

**Test purpose**

Verifies that a Windows Touchscreen device meets the custom gestures and third party driver requirements.
**Tools required**

None.
**Running the test**

The Windows Touch Test combines a set of simple manual tests. The requirements that are tested, include the absence of third party drivers, the absence of custom touch gestures, and the allowed physical dimensions of the device.

**Command syntax**

Other.json
**Passing criteria**

-   100% of the iterations must pass in order to complete with passing status.

 

 






