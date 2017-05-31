---
title: Digitizer Jitter
description: This is to test the jitter characteristics of a Windows Touchscreen device (or digitizer).
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A73359D8-BB78-4658-B8B8-0A755E332538
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Digitizer Jitter


This is to test the jitter characteristics of a Windows Touchscreen device (or digitizer).

**Test name**

-   DigitizerJitterOneContact.json
-   DigitizerJitterFiveContacts.json

**Associated compatibility requirements**

Device.Input.Digitizer.Touch.Jitter
**Test purpose**

Verifies that a Windows Touchscreen device does not exceed the allowable amount of jitter – moving and stationary.
**Tools required**

PT3
**Running the test**

Clean input is important throughout the system and across applications. Whether a user is performing a hold gesture to learn more about a user interface (UI) element, playing a game, or holding a key on the software keyboard, this fidelity allows software to correctly interpret a user's intention and provide an optimal touch experience.

This test presents twelve distinct scenarios that examine jitter during static contact and linear motion. Most of these interactions require the use of assistive technology.

**Command syntax**

Logo3.exe -config DigitizerJitter.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






