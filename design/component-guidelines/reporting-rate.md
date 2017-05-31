---
title: Reporting Rate
description: This is to test the contact reporting rate of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7D257BB3-786E-4D7F-BF54-01F4718E4D88
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Reporting Rate


This is to test the contact reporting rate of a Windows Touchscreen device.

**Test names**

-   ReportingRateOneContact.json
-   ReportingRateFiveContacts.json
-   ReportingRateMaxContacts.json

**Associated compatibility requirements**

Device.Input.Digitizer.Touch.ReportRate
**Test purpose**

Verifies that a Windows Touchscreen device correctly reports physical contact at a rate greater than, or equal to the display refresh rate.
**Tools required**

PT3
**Running the test**

A packet rate that is equal to, or greater than the display rate will ensure that no visual glitches appear when using the touchscreen. A high packet rate helps ensure smooth, fluid motion, and it supports the feeling that the user interface (UI) is connected to the user's finger. The input rate data and the increased data throughput both improve gesture recognition.

This test includes four separate reporting rate scenarios that are distinguished by single and multiple contacts and stationary contact versus motion. In each scenario, the test validates that the minimum reporting rate is maintained for each contact (and specifically not just the average reporting rate).

**Command syntax**

Logo3.exe -config ReportingRate.json
**Passing criteria**

100% of the iterations must pass in order to complete with passing status.
 

 






