---
title: Using Windows Performance Analyzer to analyze modern standby issues
description: The Windows Performance Analyzer (WPA) lets you view traces of system activity displayed in a graphical format.
MS-HAID:
- 'cstandby.using\_windows\_performance\_analyzer\_to\_analyze\_connected\_standby\_issues'
- 'p\_weg\_hardware.using\_windows\_performance\_analyzer\_to\_analyze\_modern\_standby\_issues'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
Search.SourceType: Video
ms.assetid: CE7038EE-7578-48FD-8A1B-25DC5E121E92
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Using Windows Performance Analyzer to analyze modern standby issues


The Windows Performance Analyzer (WPA) lets you view traces of system activity displayed in a graphical format. WPA is used for many Windows performance and debugging scenarios, and is the second-level triage tool for modern standby issues that cannot be resolved by using SleepStudy. WPA presents a graphical format of a trace file that contains events collected during a modern standby session.

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/bd4080eb-b9df-4c1f-9df7-534347404937/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no">A video describing  how to use WPA to analyze traces of modern standby sessions.</iframe>
Watch this video to learn how to use WPA to analyze traces of modern standby sessions.

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/4c927140-ccea-40be-8fa9-1885f61bb28f/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no">A video describing how to use the Platform Idle State graph and PDC Resiliency Activity graph to identify the cause of software activity</iframe>

This video shows how to use the Platform Idle State graph and PDC Resiliency Activity graph to identify the cause of software activity that prevents the hardware platform from spending sufficient time in the DRIPS state.

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/77ba406f-299d-4262-ab3b-a3c6e7e55d60/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no">A video describing how to use the Platform Idle State graph and Device Dstate graph to track down a hardware device that causes the hardware platform to spend too little time in the DRIPS state.</iframe>

Watch this video to learn how to use the Platform Idle State graph and Device Dstate graph to track down a hardware device that causes the hardware platform to spend too little time in the DRIPS state.

For more information about the Platform Idle State graph, see [Common WPA graphs for connected standby power management](common-wpa-graphs-for-modern-standby-power-management.md). For more information about the PDC Resiliency Activity graph and Device Dstate graph, see [View a WPA trace](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md#view-a-wpa-trace).

WPA is available in the Windows Assessment and Deployment Kit (Windows ADK) download package and includes scripts and documentation for modern standby analysis.

The remainder of this section refers to the documents and scripts that are provided in this download.

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md)</p></td>
<td><p>Describes how to capture and view a WPA trace for modern standby diagnostics.</p></td>
</tr>
<tr class="even">
<td><p>[Common WPA graphs for modern standby power management](common-wpa-graphs-for-modern-standby-power-management.md)</p></td>
<td><p>Describes the two common WPA graphs (<strong>Platform Idle State</strong> and <strong>DRIPS</strong>) for modern standby power management.</p></td>
</tr>
</tbody>
</table>

 

 

 






