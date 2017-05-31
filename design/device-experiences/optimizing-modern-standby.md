---
title: Optimizing modern standby
description: Describes strategies for optimizing power consumption during modern standby, with and without Wi-Fi connectivity.
MS-HAID:
- 'cstandby.optimizing\_connected\_standby'
- 'p\_weg\_hardware.optimizing\_modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B92752C8-A538-403C-8CE2-D9C32866E70D
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Optimizing modern standby


To optimize power savings during modern standby, start by reducing the amount of power that is consumed during the power floor—the state in which all components are idle and inactive and power is dominated by hardware static leakage. After the power floor is optimized, the power consumed by the Wi-Fi and communications devices can be reduced.

During modern standby, a well-behaved platform should spend most of its time operating at the power floor. The system designer must ensure that the Wi-Fi and communications devices do not unnecessarily wake the System on a Chip (SoC), which causes additional activity in the operating system and apps.

## Optimizing power consumption


The power floor is the least amount of power that is required by the system during modern standby. The power floor is measured when the system is in airplane mode, and when:

-   The SoC is in its lowest power state (deepest runtime idle platform state, or DRIPS).
-   Memory is in self-refresh.
-   Wi-Fi and communications devices are in their radio-off states.
-   Devices outside of the SoC are in their low-power states (D3 or D3cold).

The power floor is a key metric to measure and optimize for modern standby power consumption. The system spends the majority of its modern standby time—typically well over 90 percent of a modern standby session—in the power floor state. Every milliwatt that is eliminated from the power floor significantly improves modern standby battery life.

To measure the power floor on a modern standby system, you need the following setup:

-   An instrumented system that can measure power consumption at several power rails, which include the following:
    -   Total system power
    -   SoC and DRAM
    -   The Wi-Fi/Bluetooth device
    -   The mobile broadband device (if equipped)
    -   The sensor hub
    -   The touch controller
    -   Any other microcontroller (such as the keyboard, touchpad, custom battery controller, or legacy embedded controller)
-   A power meter device that is capable of reading the power instrumentation.
-   Software that is capable of reading from the power meter and tracking power consumption over time.

You can use your own instrumentation methodology to take power measurements. For the power rails, we recommend that you take power measurements at a sample rate of 1,000 hertz or greater with at least 1-milliwatt accuracy.

In addition, you might have a larger number of test systems that are designed to measure power consumption only at the system level. These test systems are best used for regression testing before updates to firmware and drivers are made to identical systems that were previously shipped and must be maintained in the field.

To measure the power floor, connect the power meter to the pin-out wires on the test system. Then use the software power-measurement tool to start capturing power readings. Most software power-measurement tools allow you to export all the power readings taken during the test to a .csv file.

Not all readings in the .csv file represent power floor values. These readings also include brief periods when the system is performing activities. To filter out active periods, consult with your SoC vendor to pick a reasonable number to use as a threshold for the power floor. Then filter out all readings that are above this number.

The readings that remain after filtering are a safe estimate of time periods when the system is in the lowest power state. Take the average of these readings to estimate the power floor for the scenario.

The following steps summarize the process to optimize the power floor for a system:

1.  Consult with your SoC vendor to determine the expected power floor for the SoC + DRAM.
2.  Consult with the hardware designer to determine the expected power floor for the entire system, including all components outside of the SoC and DC-to-DC conversion losses.
3.  Perform power measurements and capture power readings to measure the power floor for your system.
4.  Compare the power floor from step 3 with the expected power floor in steps 1 and 2.
5.  If this comparison reveals any discrepancies, run a SleepStudy report and view the percentage of time that the system spends in software and hardware low-power states:
    1.  If there are software components that prevent the system from entering the lowest power state, consult with the owners of these components to determine how to reduce their activities.
    2.  If no software components are active but some hardware components are active, consult with the device driver vendor or Microsoft to identify the problem.
    3.  If both software and hardware allow the system to stay in the lowest power state a majority of the time, look at the power that is consumed on each power rail to identify any components that consume more power than expected. After these components are identified, you might need to consult with each device hardware vendor to diagnose the problem.

6.  Repeat steps 2 through 4 until the power floor is within the expected range from step 1.

The power floor is the baseline metric that is used to measure the power for key modern standby scenarios. It is used as a reference to gauge whether a particular modern standby scenario is consuming the expected power. To establish a baseline expectation, you'll need to get the power floor for modern standby working correctly in airplane mode before you progress to more advanced modern standby scenarios.

Any optimizations made to the power floor have a cascading effect on all scenarios that depend on it and are crucial in improving overall system power.

## Optimizing modern standby Wi-Fi connectivity


Optimizing the power consumption of modern standby with Wi-Fi connected requires measurement and investigation of these two separate problem areas:

-   Wi-Fi radio power consumption.
-   Extra system activity due to a network connection.

Measuring and optimizing Wi-Fi radio power consumption is critical to modern standby because most modern standby-capable PCs are put in modern standby with the Wi-Fi radio connected. Moreover, the Wi-Fi radio is one of the few devices outside of the SoC that is capable of very high power consumption when the SoC is in its low-power (DRIPS) state.

The Wi-Fi radio can use several power-saving techniques, but these techniques typically require the cooperation of the access point to which the radio is connected. As a result, power consumption for the Wi-Fi radio can vary, depending on the capabilities of the connected access point.

To start measuring Wi-Fi radio power consumption, connect the system to a Wi-Fi access point that does not have public Internet connectivity. This helps to isolate the added power of the Wi-Fi connection from the added power of increased system activity due to an active Internet connection. You should use an instrumented system that is capable of measuring Wi-Fi module power in isolation to verify that Wi-Fi power consumption is much less than 15 milliwatts on average when connected to the Wi-Fi access point. Most Wi-Fi parts consume between 5 and 10 milliwatts when they are connected and power-save mode (PSM) is enabled.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Measurement scenario</th>
<th>Expected result</th>
<th>Power notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Wi-Fi module power when connected to an access point without a public Internet connection.</p></td>
<td><p>Average power for the Wi-Fi module itself should be less than 15 milliwatts. When the Wi-Fi radio is connected, it does not have a constant power consumption due to beacon events. Measuring average power over an hour or more is critical.</p></td>
<td><p>Measurement should be performed while the system under test is on battery power.</p>
<p>You should connect the Wi-Fi radio to several different brands of Wi-Fi access points to validate consistent power consumption.</p>
<p>You should validate power consumption over several very long runs, including runs of up to 24 hours.</p>
<p>Note that the Wi-Fi radio firmware and driver must be very mature to maintain connectivity for 24 hours. We recommend that you test connectivity for 24 hours with the system screen turned on (that is, outside of modern standby) before testing connectivity for 24 hours in modern standby.</p></td>
</tr>
</tbody>
</table>

 

After measuring Wi-Fi module power, you should validate the system for SoC activity during modern standby with Wi-Fi connected to the public Internet. For this scenario, the Wi-Fi access point should be connected to the public Internet and the system should remain in modern standby on battery power for several hours. The purpose of the measurement is to verify that system activity stays within the expected levels (active no more than 10 percent of the time).

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Measurement scenario</th>
<th>Expected result</th>
<th>Power notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>System activity is no more than 10 percent of the modern standby session when Wi-Fi is connected to the public Internet.</p></td>
<td><p>Place the system in modern standby for 4 hours with Wi-Fi connected to a public Internet connection. At the end of the test duration, wake the system and generate a SleepStudy report.</p>
<p>The modern standby session should stay in the low-power state more than 90 percent of the time.</p></td>
<td><p>If the session has less than 90 percent low-power state time, use the Top Offenders table in a SleepStudy report to identify the active components.</p>
<p>If the SleepStudy report is not helpful, capture a trace of the modern standby session, as explained in [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md).</p>
<p>If you send a bug report to Microsoft for this problem, please include the SleepStudy-Report.html file and an ETW trace that is captured by using the instructions in [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md).</p></td>
</tr>
</tbody>
</table>

 

 

 






