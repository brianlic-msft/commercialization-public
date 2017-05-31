---
title: Custom Gestures
description: This is a test to indicate whether or not a Windows pen device supports custom gestures.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3DF855C3-98F5-4B39-8CE4-70F6F15DF7CA
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Custom Gestures


This is a test to indicate whether or not a Windows pen device supports custom gestures.

**Test name**

-   Custom Gestures

**Core requirements tested**

-   Device.Input.Digitizer.Base.CustomGestures

**Test purpose**

-   Verifies that the pen does not have custom runtime gestures.

**Tools required**

-   None.

**Validation steps**

1. Run test case for Custom Gestures.
2. Click the "Fail" button, if your device has custom runtime gestures, otherwise click "Pass."

Here's a screenshot from the Custom Gestures test.

![screenshot from the custom gestures test for a windows pen device.](../images/pen-test-custgesture.png)

**Common error messages**

-   "Manually failed by user"
    
    Occurs if the operator manually Fails the test (fails the Custom Gestures requirement).

**Passing criteria**

-   1/1 test iterations must pass for the test to succeed.
