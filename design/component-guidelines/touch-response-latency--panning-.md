---
title: Touch Response Latency (Panning)
description: This is to test the response panning latency characteristics of a Windows Touchscreen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B7C5BC51-A0D1-4214-B70F-556A134DD597
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Touch Response Latency (Panning)


This is to test the response panning latency characteristics of a Windows Touchscreen device.

**Test name**

stepmotor.exe
**Associated compatibility requirements**

Device.Input.Digitizer.Touch.Latency
**Test purpose**

Verifies that a Windows Touchscreen device meets the response panning latency requirement.
**Tools required**

RA tool. See [Hardware Requirements and Vendor Information](touchscreen-hardware-requirements-and-vendor-information.md).
**Running the test**

Low response *latency* plays a large role in ensuring fast and fluid motion. This is similar to the [Reporting Rate](reporting-rate.md) test, where a high packet rate helps ensure smooth, fluid motion. Conversely, a high degree of response latency breaks the illusion that the user is manipulating a physical object.

This test uses specialized hardware to measure the latency in touch packet delivery for panning. For more detailed information, see [How to measure Touch Panning Latency](https://msdn.microsoft.com/library/windows/hardware/dn266003.aspx).

**Note**  For Windows 10 testing, please use the 7mm contacts instead of the 9mm contacts.

 

Also note that the Touch panning latency test is designed to evaluate device latency during active use on the touchscreen. The test utilizes the acoustic latency measurement tool that requires calibration to complete the test.

On USB systems that have selective suspend enabled, this calibration period may cause errors in the device due to wake times. For the purpose of this test, selective suspend may be disabled to ensure the device is in active mode for the full duration of the calibration and validation.

It is important to note that selective suspend must be re-enabled after the operator is done running the panning latency test since the rest of the test in the suite will not correctly evaluate the device with selective suspend disabled.

**Command syntax**

stepmotor.exe
**Passing criteria**

Average latency recorded during the test must meet the requirement to complete with passing status. There is a 20% tolerance on panning latency tests.
 

 






