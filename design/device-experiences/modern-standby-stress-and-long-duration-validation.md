---
title: Modern standby stress and long-duration validation
description: Outlines methods for performing stress tests and long-duration tests on a modern standby system to identify and resolve potential reliability issues.
MS-HAID:
- 'cstandby.connected\_standby\_stress\_and\_long-duration\_validation'
- 'p\_weg\_hardware.modern\_standby\_stress\_and\_long-duration\_validation'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2C888EEC-57D1-4E44-80C8-64B37F614AD0
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby stress and long-duration validation


System designers should run stress tests and long-duration tests on their modern standby systems to help identify and resolve potential reliability issues. Modern standby enables the system to keep running, even when it is in a low-power, screen-off state. This state is different from the traditional ACPI Sleep (S3) and Hibernate (S4) states, in which much of the system hardware and software is stopped and then stays inactive until it is later restarted on resume.

Modern standby enables the system to stay up and running for a much longer total time and can therefore expose hardware and software reliability issues that would not be discovered on a system that has traditional Sleep and Hibernate states.

## Entry and exit


Every modern standby system should be validated to enter and exit modern standby for at least 1,000 cycles without failure. Entry to and exit from modern standby is the user's primary interaction with low-power operation on the system and should be extremely reliable.

Successfully entering and exiting modern standby validates a number of hardware, firmware, and device-driver components, which include:

-   The platform hardware that manages power-button operation, including the power-management IC (PMIC).
-   The display-panel management and initialization hardware.
-   The Wi-Fi and networking device firmware and driver.
-   The graphics device driver.

Stress-testing of modern standby entry and exit can be automated using the PwrTest tool. PwrTest should be installed on the target system as part of the Windows Driver Kit (WDK), which includes additional software for automating the system power button on modern standby systems.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Test scenario</th>
<th>Expected result</th>
<th>Diagnostic notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>The system can enter and exit modern standby reliably for at least 1,000 cycles.</p></td>
<td><p>Use the PwrTest tool and the /cs command-line option to automatically cycle the system through modern standby for 1,000 cycles. The expected result is that the system completes all 1,000 cycles.</p></td>
<td><p>We recommend incrementally increasing the stress test to 1,000 cycles. First, test for 100 cycles. If an error is found, connect the system to a kernel debugger and to the SoC hardware debugger, and repeat the 100-cycle test to capture and determine the root cause of the issue. After the 100-cycle test successfully completes, extend the cycle count to 500 cycles and then to 1,000 cycles.</p></td>
</tr>
</tbody>
</table>

 

## SoC low-power state transitions


The firmware and drivers that are responsible for managing SoC transitions between the idle and active power states must be highly reliable to withstand the stresses of operating for long periods in modern standby. SoC low-power state transitions should be stressed through long-duration modern standby testing. This testing helps ensure that the system remains reliably operational during long modern standby durations, such as over the weekend.

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
<td><p>The system can stay in modern standby for 100 consecutive hours and is functional on exit. The system maintains Wi-Fi connectivity during the 100 hours and Wi-Fi connectivity is functional on exit.</p></td>
<td><p>Put the system in modern standby and wake it with the power button after 100 hours.</p>
<p>The expected result is that the system powers on instantly and the Wi-Fi connection is operational without additional configuration or selection of a Wi-Fi network.</p></td>
<td><p>We recommend incrementally increasing the long-duration test to 100 hours.</p>
<p>First, test for 24 hours. If an error is found, connect the system to a kernel debugger and to the SoC hardware debugger, and repeat the 24-hour test to capture and determine the root cause of the issue.</p>
<p>After the 24-hour test successfully completes, extend the duration to 100 hours.</p></td>
</tr>
</tbody>
</table>

 

## Windows HCK modern standby stress test


The Windows Hardware Certification Kit (HCK) includes a modern standby stress test named Connected Standby Stress with Driver Verifier's Concurrency Stress (Logo) that exercises automatic connected standby transitions at the same time that device drivers are exercised for device operation. The test is designed to verify that the device and its driver(s) continue to function as the system transitions to and from the modern standby power state.

This test is a critical part of validating that the system continues to operate as expected after it exits modern standby. This test is included as part of the Windows HCK and is required for system certification.

**Test operation**

The test uses the Windows Device Testing Framework (WDTF) SimpleIO interfaces to exercise devices that are enumerated on the system. These devices include sensors, cameras, audio, graphics, Wi-Fi, storage, and Bluetooth devices. The test places the system in modern standby for one minute, and then transitions the system out of modern standby and exercises the devices for 30 seconds. This cycle repeats 150 times.

During test execution, Driver Verifier is enabled to help identify driver bugs and memory leaks.

The test helps identify the following system or device driver problems:

-   A system crash or hang during device operation after a modern standby session.
-   The inability for the system to enter the low-power state (deepest runtime idle platform state, or DRIPS) after device activity.
-   Driver issues that are identified by Driver Verifier, including system corruption, driver failures, and memory leaks.
-   Driver issues after resume from modern standby, including unresponsiveness, crashes, or problem codes.

**Resolving test failures**

The test exercises multiple devices, which can result in different types of test failures. Identifying the type of test failure is the first step to finding the root cause of system or driver issues.

The test typically fails in one of the following three failure modes:

1.  The test fails and the failure is recorded in the Windows HCK logs, which contain data about the detected failure.
2.  The test fails, but the system does not report to the Windows HCK server as a result of the failure; however, the system is responsive and works with local interaction.
3.  The test does not complete and the system under test crashes or hangs (frozen at a black screen).

**Debugging test failures that are recorded in the Windows HCK logs**

There are two common failure types when test failures are recorded in the Windows HCK logs:

-   The system failed to enter the low-power state (DRIPS) during the test.
-   The test detected that it could no longer communicate with a driver, and a time-out occurred.

You can use the SleepStudy report, which is included as part of the test logs, to identify which components are responsible for preventing the system from entering the low-power state (DRIPS). There are several common causes:

-   Test setup and configuration problems, including using a wired Ethernet adapter that does not support NDIS 6.3 and modern standby functionality.
-   DHCP server problems on the wired LAN network.
-   A device and/or driver that does not correctly idle for its own low-power mode during modern standby.

The test logs might also include a failure message that indicates which devices did not respond to I/O requests in a timely manner. This condition is considered a test failure because it can prevent the user or an app from being functional when the system resumes from modern standby.

The test logs indicate the last devices to perform I/O operations—these devices are the source of the test failure. The test log output in the following example shows that the ACPI\\XXXX\\2&DAFA3FF&1 device timed out.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Message</p></td>
<td><p>7/16/2013 12:50:24.333 AM</p></td>
<td><p>WDTF_SIMPLEIO_STRESS_PROC : - WaitAsyncCompletion(Some Location Sensor Device ACPI\XXXX\2&amp;DAFA3FF&amp;1)</p></td>
</tr>
<tr class="even">
<td><p>Message</p></td>
<td><p>7/16/2013 12:59:50.333 AM</p></td>
<td><p>WDTF_SIMPLEIO_STRESS_PROC : - WaitAsyncCompletion(Some Other Device XXX_XXX\UART_XXX\3&amp;2F829BAD&amp;0&amp;F00D)</p></td>
</tr>
</tbody>
</table>

 

A common cause of failures is poor GPS reception, which causes the GPS device to take extremely long amounts of time to reply to I/O requests. For more information about running this test on systems with GPS devices, see Notes for systems that are equipped with GPS.

**Debugging test failures without logs (and a responsive system)**

If the system under test is still running with no signs that the test is still running, the most likely cause is that the system has encountered a fatal error or restarted. To debug these issues, check the system directory for any dump files, and disable any hardware watchdog that might reset the system.

**Debugging test failures when the system is unresponsive (black screen)**

If the system is frozen on a black screen, you must connect the system to a kernel debugger to diagnose the problem.

If the kernel debugger is already connected and the system is not responding to the kernel debugger, a hardware debugger is required to identify the reason that the system locks up. You can consult with the core silicon/SoC provider for additional assistance with debugging.

## Notes for systems equipped with GPS


If the system-under-test has a GPS device or location sensor device, you must enable the following Windows settings before running the test:

-   **Control Panel\\Hardware and Sound\\Location Settings\\Turn on the Windows Location platform**
-   **PC Settings\\Privacy\\Location: Let Windows and apps use my location**

You can use the Sensor Diagnostic Tool in the Windows Driver Kit (WDK) to confirm the reception of the GPS signal at the test site. For more information, see [Testing sensor functionality with the Sensor Diagnostic Tool](https://msdn.microsoft.com/library/windows/hardware/hh780319).

 

 






