---
title: Introduction to modern standby testing
description: Overview of the modern standby testing process.
MS-HAID:
- 'cstandby.introduction\_to\_connected\_standby\_testing'
- 'p\_weg\_hardware.introduction\_to\_modern\_standby\_testing'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1E9C9B84-3A55-4409-A4AB-73FF7ECA4ED4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Introduction to modern standby testing


Testing and validating the operation of a modern standby PC is a critical effort for the system integrator. Modern standby involves all hardware and software components on the system, and requires special attention to the core silicon or System on a Chip (SoC), networking devices (for example, Wi-Fi), and peripheral devices connected to the pins of the SoC chip.

Before you start testing, make sure that the required hardware connections are in place. The target platform must have a functioning kernel debugger connection.

The first test scenarios to validate are entry and exit from modern standby. These transitions are easily initiated by using the system power button to turn the display on and off. After entry and exit are validated, run the platform in airplane mode for increasingly long durations, and focus on reducing platform power consumption during the idle periods that occur in modern standby. For more information about the test cases and methodology for these scenarios, see [Modern standby basic test scenarios](modern-standby-basic-test-scenarios.md).

After airplane mode is validated, you can focus on scenarios in which Wi-Fi is connected and background tasks are running. Make sure that Wi-Fi power can be measured in isolation from system power so that you can verify that Wi-Fi operates in the expected low-power mode. For more information about the test cases and methodology for these scenarios, see [Modern standby Wi-Fi-connected scenarios](modern-standby-wi-fi-connected-scenarios.md).

Validation concludes with mobile broadband (cellular) testing. Remember to do regression testing after you make other platform driver and firmware fixes.

Finally, we recommend that system designers also incorporate a self-host program into their validation program for a modern standby PC. A self-host program enables local engineering and engineering-management teams to use reference designs or early retail designs for daily work and home use. The goal of the self-host program for modern standby is to find functional and power consumption issues that are otherwise not identified by planned test execution.

 

 






