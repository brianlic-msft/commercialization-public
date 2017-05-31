---
title: Recording for Basic System Diagnosis
description: Recording for Basic System Diagnosis
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bfaa08d7-0bb0-4786-a925-dc54c6f78ffc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Recording for Basic System Diagnosis


By default, Windows Performance Recorder (WPR) runs the **General** profile for every recording. This profile records basic system issues and performance data.

In this article:

-   [General Profile Settings](#generalpro)

-   [Identify Sustained Performance Issues](#sus)

-   [Identify Transient Performance Issues](#trans)

## <a href="" id="generalpro"></a>General Profile Settings


The **General** profile uses the following collectors:

**NT Kernel Logger Collector**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Buffer Size (KB)</p></td>
<td><p>1024</p></td>
</tr>
<tr class="even">
<td><p>Number of Buffers</p></td>
<td><p>198</p></td>
</tr>
<tr class="odd">
<td><p>System Keywords</p></td>
<td><p>CpuConfig, CSwitch, DiskIO, DPC, HardFaults, Interrupt, KernelQueue, Loader, MemoryInfo, ProcessCounter, Power, ProcessThread, ReadyThread, SampledProfile, ThreadPriority</p></td>
</tr>
</tbody>
</table>

 

**WPR\_initiated\_WPR Event Collector**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Buffer Size (KB)</p></td>
<td><p>1024</p></td>
</tr>
<tr class="even">
<td><p>Number of Buffers</p></td>
<td><p>39</p></td>
</tr>
<tr class="odd">
<td><p>Providers</p></td>
<td><p>PerfTrack: : 0x04</p>
<p>Microsoft-Windows-Immersive-Shell: 0x0000000000100000: 0x04</p>
<p>Microsoft-Windows-Kernel-Power: 0x0000000000000004: 0xff</p>
<p>Microsoft-Windows-Win32k: 0x0000000000402000: 0xff</p>
<p>Microsoft-Windows-WLAN-AutoConfig: 0x0000000000000200: 0xff</p>
<p>.NET Common Language Runtime: 0x0000000000000098: 0x05</p>
<p>Microsoft-JScript: 0x0000000000000001: 0xff e7ef96be-969f-414f-97d7-3ddb7b558ccc: 0x0000000000002000: 0xff</p>
<p>MUI Resource Trace: : 0xff</p>
<p>Microsoft-Windows-COMRuntime: 0x0000000000000003: 0xff</p>
<p>Microsoft-Windows-Networking-Correlation: : 0xff</p>
<p>Microsoft-Windows-RPCSS: : 0x04</p>
<p>Microsoft-Windows-RPC: : 0x04 a669021c-c450-4609-a035-5af59af4df18: : 0x00</p>
<p>Microsoft-Windows-Kernel-Processor-Power: : 0xff</p>
<p>Microsoft-Windows-Kernel-StoreMgr: : 0xff e7ef96be-969f-414f-97d7-3ddb7b558ccc: : 0xff</p>
<p>Microsoft-Windows-UserModePowerService: : 0xff</p>
<p>Microsoft-Windows-Win32k: : 0xff</p>
<p>Microsoft-Windows-ReadyBoostDriver: : 0xff</p></td>
</tr>
</tbody>
</table>

 

For more information about collectors and providers, see [Collectors](collectors.md) and [Providers](providers.md).

## <a href="" id="sus"></a>Identify Sustained Performance Issues


To identify sustained performance issues, you can run the **General** profile together with the other default settings. These are: **Verbose** logging detail and log to **Memory**. After you start the recording in WPR, it will persist until you stop and save the recording.

## <a href="" id="trans"></a>Identify Transient Performance Issues


Because you cannot predict when transient performance issues will occur, you must run the **General** profile until the issue transpires.

**To identify transient performance issues**

1.  On the WPR screen, if the options are hidden, click **More options**.

2.  From the **Performance scenarios** dropdown menu, select **General**.

3.  From the **Logging mode** dropdown menu, select **Memory**.

4.  Click **Start** and run the recording until the issue occurs.

5.  Click **Save**, and then click **Browse** to save the file by using a name or a location other than the default. The default location is the **\\Users\\%username%\\Documents\\WPR Files** folder on the system drive.

6.  Enter a problem description.

7.  Click **Save**.

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Performance Scenarios](performance-scenarios.md)

 

 







