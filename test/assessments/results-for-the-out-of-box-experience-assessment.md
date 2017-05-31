---
title: Results for the Out Of Box Experience assessment
description: Results for the Out Of Box Experience assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: CE1CE800-D2DB-41DD-B98E-650E5D676C28
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Out Of Box Experience assessment


Applies To: Windows 8.1, Windows 10

This assessment measures the duration of key aspects of the first startup experience (OOBE) that are typically impacted by image customizations and software add-ons applied to the Windows retail image. The measurements are obtained from performance traces collected using Event Tracing for Windows (ETW) during a Windows 10 system’s first startup. The assessment measures the duration of First Logon as well as specific aspects such as Active Setup and Provisioned App Install.

This topic helps you interpret the results produced by the OOBE Performance assessment. It also provides guidance on how to use the results to identify and resolve issues that impact the OOBE experience.

## Metrics


The following metrics are reported by the OOBE Performance assessment.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>First Logon Time</p></td>
<td><p>Measures the time in seconds to logon. This is the time from the user providing the last input prior to the logon movie beginning playback until the desktop is launched after the logon movie playback is complete.</p></td>
</tr>
<tr class="even">
<td><p>Shell Logon Framework</p></td>
<td><p>Measures the time in seconds of portion of login where the shell’s framework is initializing.</p></td>
</tr>
<tr class="odd">
<td><p>Active Setup</p></td>
<td><p>Measures the time in seconds of Active Setup.</p></td>
</tr>
<tr class="even">
<td><p>Provisioned App Install Time</p></td>
<td><p>Measures the time in seconds for provisioned applications to install.</p></td>
</tr>
<tr class="odd">
<td><p>Run Once First Logon Commands</p></td>
<td><p>Measures the time in seconds to complete execution of the run once first logon commands.</p></td>
</tr>
</tbody>
</table>

 

## Issues


The performance of the Out Of the Box Experience can be significantly impacted by additional CPU and Disk IO activity consumed by drivers, services, and applications that are executing during the scenario.

A recommended approach to identifying the sources of performance issues in OOBE is to follow the model documented in Windows Assessment Toolkit Usage and best practices that involves collecting results from a ‘baseline’ system with a retail Windows image and comparing to results collected from a ‘test’ system with a customized Windows image that contains the relevant extensions and add-on software. The assessment results for the two configurations can be compared side by side in the Windows Assessment Console (WAC) to identify the metrics with the largest differences. Clicking on the links to the ETW traces displayed in WAC will display the corresponding performance trace in Windows Performance Analyzer (WPA). WPA can be used to drill down into the CPU and disk utilization of each configuration and similarly comparing the two configurations side by side will help identify the processes that are showing the largest deltas in their use of the CPU and disk.

## Related topics


[Assessments](assessments.md)

[Out of Box Experience](out-of-box-experience.md)

[Windows Assessment Toolkit](index.md)

 

 







