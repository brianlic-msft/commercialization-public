---
title: Results for the Edge Security Software Impact assessment
description: Results for the Edge Security Software Impact assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 47dd67f5-e980-4bb0-a17b-2e4aa241b752
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Edge Security Software Impact assessment


Applies To: Windows 10

The Edge Security Software Impact assessment measure aspects of Microsoft Edge that are typically impacted by antimalware. The assessment measures the impact on the launch and navigate times of Microsoft Edge.

This topic helps you interpret the results produced by the Edge Security Software Impact assessment.

In this topic:

-   [Metrics](#metrics)

-   [Issues](#issues)

## Metrics


The following metrics are reported by the Edge Security Software Impact assessment.

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
<td><p>Edge Launch and Navigate</p></td>
<td><p>Time in milliseconds for the Microsoft Edge application to launch and have the requested URL available.</p></td>
</tr>
<tr class="even">
<td><p>App Activate</p></td>
<td><p>Time in milliseconds for the Microsoft Edge application to activate.</p></td>
</tr>
<tr class="odd">
<td><p>Tab Create</p></td>
<td><p>Time in milliseconds for the tab to create in Microsoft Edge.</p></td>
</tr>
<tr class="even">
<td><p>Page Available</p></td>
<td><p>Time in milliseconds for the page to be visible to the user.</p></td>
</tr>
<tr class="odd">
<td><p>After Page Available Completion of Page Load</p></td>
<td><p>Time in milliseconds for the page to be completely loaded after the page was visible. Only present if the page was available before it was completely loaded.</p></td>
</tr>
</tbody>
</table>

 

## Issues


A recommended approach to identifying the sources of performance issues is to follow the model documented in Windows Assessment Toolkit Usage and best practices that involves collecting results from a "baseline" system with a retail Windows image and comparing to results collected from a ‘test’ system with a customized Windows image that contains the relevant extensions and add-on software.

The assessment results for the two configurations can be compared side by side in the Windows Assessment Console (WAC) to identify the metrics with the largest differences. Clicking on the links to the ETW traces displayed in WAC will display the corresponding performance trace in Windows Performance Analyzer (WPA). WPA can be used to drill down into the CPU and disk utilization of each configuration and similarly comparing the two configurations side by side will help identify the processes that are showing the largest deltas in their use of the CPU and disk.

## Related topics


[Edge Security Software Impact](edge-security-software-impact.md)

[Windows Assessment Toolkit Technical Reference](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

 

 







