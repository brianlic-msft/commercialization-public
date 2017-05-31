---
title: Noise Suppression
description: This is to test the ability of a Windows Touchscreen device to suppress invalid input (noise) that could otherwise be mistaken as touch input.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2DCB4F4F-8E27-4505-BC1A-93B03A640955
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Noise Suppression


This is to test the ability of a Windows Touchscreen device to suppress invalid input (noise) that could otherwise be mistaken as touch input.

**Test name**

NoiseSuppression.json
**Associated compatibility requirements**

Device.Input.Digitizer.Base.ContactReports
**Test purpose**

Verifies that a Windows Touchscreen device does not report data for locations where touch input does not occur.
**Tools required**

PT3
**Running the test**

This test can help to ensure that touch systems can effectively tolerate common environmental conditions.

This test presents two scenarios: the only distinction between the two scenarios is the power source. For the Battery portion of the test, you should remove the external power source from a mobile system. For AIOs and external monitors, perform the test with AC power. In each case, the test validates that a contact that is held at the minimum required distance from the screen does not register any touch contacts.

**Command syntax**

Logo3.exe -config NoiseSuppression.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






