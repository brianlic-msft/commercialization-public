---
title: Buffering
description: This is to test the data buffering capabilities of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1DBEC5B9-C6D7-4AD9-BDD9-330D7D3B3BEC
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

#  Buffering


This is to test the data buffering capabilities of a Windows Touchscreen device.

**Test name**

Buffering.json
**Associated compatibility requirements**

Device.Input.Digitizer.Touch.Buffering
**Test purpose**

Verifies that a Windows Touchscreen device supports the required amount of buffering that prevents data loss.
**Tools required**

None.
**Running the test**

Because some touch events can be lost while the digitizer is waking up, it is necessary to test that the touch buffer correctly stores data. The test also ensures that the user experience is not degraded by data loss, for example, losing an edge swipe.

Launch the test and follow the instructions. When you swipe the screen, the test will check to see if enough touch data was registered. If enough data was registered, then the test will pass. Please ensure that the swipe is quick – no longer than half a second.

**Command syntax**

Logo3.exe -config Buffering.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






