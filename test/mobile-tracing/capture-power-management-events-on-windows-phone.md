---
title: Capture power management events on Windows 10 Mobile
description: Capture power management events on Windows 10 Mobile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 23f40b02-33ec-4a67-8a1c-f036e720c5bf
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Capture power management events on Windows 10 Mobile


Tracelog and Xperf are used to capture power-management event trace logs on Windows 10 Mobile.

**Important**  
To capture trace logs, the phone image must be built with the appropriate type and packages. This is done by modifying the OEMInput file to set the **ReleaseType** element to **Test**, and adding **TESTINFRASTRUCTURE** to the **Features** element.

 

## Step 1: Install the Windows Performance Toolkit


The Windows Performance Toolkit (WPT) is required to process event trace logs with Xperf. The WPT is part of the [Windows Assessment and Deployment Kit (Windows ADK)](http://go.microsoft.com/fwlink/p/?LinkId=526803).

## Step 2: Install and configure TShell


TShell is required to run Tracelog.

## Step 3: Verify device is connected


Verify the device is connected to TShell by running the command dird in the TShell command window. Ensure a directory listing from the phone is displayed. If an error message is seen, ensure that TShell is configured correctly,, and a device command prompt is shown above the regular command prompt in the TShell window similar to the following:

``` syntax
DEVICE C:\
PS C:\>
```

## Step 4: Run Tracelog to start power management event trace logging


Using the TShell command window, run Tracelog with the recommended power management providers and settings below.

**Important**  
On Windows 10 Mobile, Tracelog must place its logs within the C:\\data directory due to partition size restrictions. Be sure to use the -f flag to configure Tracelog to use C:\\data.

 

For detailed Tracelog command line syntax, see [Tracelog Command Syntax](http://msdn.microsoft.com/library/windows/hardware/ff553012.aspx). For additional examples, see [Tracelog Examples](https://msdn.microsoft.com/library/windows/hardware/ff553026).

Use the following commands to create a session called "MyPowerTrace" and enable the Microsoft-Windows-Kernel-Power provider.

``` syntax
DEVICE C:\
PS C:\> cdd data
DEVICE C:\data
PS C:\> cmdd 'tracelog -start MyPowerTrace -b 1024 -f C:\data\MyPowerLog.etl -eflags Process'
Turning On group: PROCESS
Adding GroupMask ExtItem
Logger Started...
Operation Status:       0L      The operation completed successfully.

Logger Name:            MyPowerTrace
Logger Id:              0x1d
Logger Thread Id:       00000C38
Guid:                   52dd9cee-926c-11e1-bc7e-0011beb0dbf4
Session Security:       D:(A;;0x800;;;WD)
Buffer Size:            1024 Kb
Maximum Buffers:        26
Minimum Buffers:        4
Number of Buffers:      4
Free Buffers:           3
Buffers Written:        1
Events Lost:            0
Log Buffers Lost:       0
Real Time Buffers Lost: 0
AgeLimit:               0
Real Time Consumers:    0
ClockType:              PerfCounter
Log Mode:               Sequential
Hybrid Shutdown:        Persist
Maximum File Size:      not set
Buffer Flush Timer:     not set
Enabled tracing:        Process
Log Filename:           C:\data\MyPowerLog.etl

Exit Code : 0

DEVICE C:\data
PS C:\> cmdd 'tracelog -enable MyPowerTrace -guid #331C3B3A-2005-44C2-AC5E-77220C37D6B4'
Enabling 331c3b3a-2005-44c2-ac5e-77220c37d6b4 (Flags = 0x00000000 Level = 0  ) to logger 29
Operation Status:       0L      The operation completed successfully.

Logger Name:            MyPowerTrace
Logger Id:              0x1d
Logger Thread Id:       00000C38
Guid:                   52dd9cee-926c-11e1-bc7e-0011beb0dbf4
Session Security:       D:(A;;0x800;;;WD)
Buffer Size:            1024 Kb
Maximum Buffers:        26
Minimum Buffers:        4
Number of Buffers:      4
Free Buffers:           2
Buffers Written:        1
Events Lost:            0
Log Buffers Lost:       0
Real Time Buffers Lost: 0
AgeLimit:               0
Real Time Consumers:    0
ClockType:              PerfCounter
Log Mode:               Sequential
Hybrid Shutdown:        Persist
Maximum File Size:      not set
Buffer Flush Timer:     not set
Enabled tracing:        Process
Log Filename:           C:\data\MyPowerLog.etl

Exit Code : 0

DEVICE C:\data
PS C:\>
```

Enable additional power management related providers if desired.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Provider</th>
<th>Command line</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Microsoft.Windows.Kernel.Processor.Power</p></td>
<td><p>cmdd 'tracelog -enable MyPowerTrace -guid #0F67E49F-FE51-4E9F-B490-6F2948CC6027'</p></td>
</tr>
<tr class="even">
<td><p>Microsoft.Windows.PDC</p></td>
<td><p>cmdd 'tracelog -enable MyPowerTrace -guid #A6BF0DEB-3659-40AD-9F81-E25AF62CE3C7'</p></td>
</tr>
<tr class="odd">
<td><p>Microsoft.Windows.Kernel.ACPI</p></td>
<td><p>cmdd 'tracelog -enable MyPowerTrace -guid #C514638F-7723-485B-BCFC-96565D735D4A'</p></td>
</tr>
</tbody>
</table>

 

The following command requests the provider to log state information. The capture of state information is initiated at the beginning or end of a trace. This ensures that the information necessary to determine the state at a specific point in the trace is logged.

``` syntax
cmdd 'tracelog -capturestate MyPowerTrace -guid #331C3B3A-2005-44C2-AC5E-77220C37D6B4'
```

## Step 5: Run scenarios or tests


Event trace logging is now enabled. Run the scenarios or tests you want to analyze.

## Step 6: Run Tracelog to flush the buffers and stop event trace logging


After the scenarios or tests are complete, use Tracelog to flush the buffers and stop event trace logging.

``` syntax
cmdd 'tracelog -flush MyPowerTrace'
cmdd 'tracelog -stop MyPowerTrace'
```

## Step 7: Run Xperf on the device


Run Xperf on the device to process the log.

``` syntax
DEVICE C:\data
PS C:\> cmdd 'xperf -merge MyPowerLog.etl c:\data\MyPowerLogOut.etl'
Merged Etl: c:\data\MyPowerLogOut.etl

Exit Code : 0

DEVICE C:\data
PS C:\>
```

## Step 8: Copy trace log from device


Copy the merged trace log from the phone by using the **getd** command in the TShell command window.

``` syntax
DEVICE C:\data
PS C:\> getd MyPowerLogOut.etl C:\Users\username\Documents
C:\data\MyPowerLogOut.etl
1 file(s) copied from device.
DEVICE C:\data
PS C:\>
```

You can also rename the file at copy time.

``` syntax
DEVICE C:\
PS C:\> getd C:\data\MyPowerLogOut.etl C:\Users\username\Documents\NewName.etl
C:\data\MyPowerLogOut.etl
1 file(s) copied from device.
DEVICE C:\
PS C:\>
```

## Step 9: Run Xperf on the PC


Run Xperf on the PC for additional processing. On 32-bit operating systems, Xperf is installed in C:\\Program Files\\Windows Kits\\10\\Windows Performance Toolkit. On 64-bit operating systems, it is installed in C:\\Program Files (x86)\\Windows Kits\\10\\Windows Performance Toolkit.

``` syntax
C:\>cd Users\username\Documents
C:\Users\username\Documents>xperf -i MyPowerLogOut.etl -o MyPowerLogCSV.csv -tle
[1/2]    100.0%
[2/2]    100.0%

C:\Users\username\Documents>
```

 

 






