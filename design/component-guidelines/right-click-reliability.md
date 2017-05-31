---
title: Right Click Reliability
description: This is to test the right-click detection capabilities of a Windows Precision Touchpad device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6F08394B-3AE6-4D54-8518-0E9D980927F3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Right Click Reliability


This is to test the right-click detection capabilities of a Windows Precision Touchpad device.

**Test name**

-   Test.RightClickReliability.json

**Core requirements tested**

-   No requirement – recommended for experience testing on click-pads and pressure-pads.

**Test purpose**

-   Provides testing for the reliability of right clicks with contacts that are in the far corner of the digitizer and very quick button presses

**Tools required**

-   PTLogo.exe

**Validation steps**

1. Launch Test. RightClickReliability.json.

2. Test the far corner’s reliability:

a. Place a finger in the far bottom-right corner of the touchpad.

b. Press the touchpad button. The test will pass, if a right-click is recognized.

c. Release the contact.

c. Repeat once - for a total of two total iterations.

3. Test the device’s responsiveness to quick presses:

a. Quickly press and lift a contact in the bottom-right corner of the touchpad, such that a button click occurs. The test will pass, if a right-click is recognized.

b. Repeat two more times - for a total of three total iterations.

**Common errors**

-   If the far corner test fails, the device may report left clicks when a user is attempting to produce a right click in the region.

-   If the quick press test fails, the device may report left clicks when a user quickly attempts to right click.

**Passing criteria**

-   5/5 (100%) iterations must pass in order to complete with passing status.

 

 






