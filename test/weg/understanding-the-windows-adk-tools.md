---
title: Understanding the Windows ADK tools
description: The ADK provides a complete solution for evaluating performance and deploying Windows to PCs.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Understanding the Windows ADK tools

The Windows Assessment Toolkit and the Windows Performance Toolkit compose the Windows Assessment and Deployment Kit (ADK). Together, they provide a complete solution for evaluating overall computer performance and automating the deployment of the Windows operating system to new PCs.

This topic focuses on the Windows Assessment Toolkit. The assessment results are used to diagnose potential problems, so that the hardware and apps you develop are responsive and have a minimal impact on battery life, startup performance, and shutdown time. The same assessments are available for OEMs, ISVs, IHVs, enthusiasts, and other members of the community to establish a common framework to measure, compare, and review various aspects of quality.

Important business objectives can be achieved by using the Windows Assessment Toolkit:

<dl>
<dt>**Measure & compare**</dt>
<dd>
<p>You can use the data to compare components (apps, drivers, or both) against other similar components to facilitate your decision-making, recommendations, and competitive benchmarking.</p>
</dd>
<dt>**Improve quality**</dt>
<dd>
<p>You can work independently or involve partners to build a component (app, driver, or both) as per pre-defined quality criteria.</p>
</dd>
<dt>**Track quality**</dt>
<dd>
<p>You can create a process for efficiently tracking the quality of component versions and detect regressions after each iteration.</p>
</dd>
</dl>

The Assessment Toolkit is typically used in these scenarios:

<table>
<thead>
<tr class="header">
<th>Scenario</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>&quot;Black box&quot;</td>
<td>Run a predefined job and examine the results for any unusual values or indications of issues with drivers, memory usage, or other areas that the assessments address.</td>
</tr>
<tr class="even">
<td>Comparing results</td>
<td><ul>
<li><p>Run a single assessment using the recommended settings on any computer that’s running a supported operating system.</p></li>
<li><p>Use the Windows AC to package the job to run on another computer.</p></li>
<li><p>Save the results to a share so that you can compare them.</p></li>
<li><p>Compare the results from any computer running Windows with those of any other supported operating system to identify differences.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td>Clean computer</td>
<td>Run assessments on a clean computer that includes only the operating system to establish baseline system results.</td>
</tr>
<tr class="even">
<td>Computer with added hardware or app components</td>
<td>Add new hardware or apps to the clean computer system and then re-run the assessments to compare the results with clean computer results.</td>
</tr>
<tr class="odd">
<td>Creating assessments</td>
<td>Use public APIs to develop or extend an assessment, or integrate assessments with your tools and infrastructure.</td>
</tr>
</tbody>
</table>

For more information, see [Windows Assessments and Deployment Kit](https://msdn.microsoft.com/en-us/library/windows/hardware/hh825420.aspx).

<table>
<thead>
<tr class="header">
<th>Tool</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Windows Assessment Toolkit</td>
<td><p>Tools to discover and run assessments on a single PC. <em>Assessments</em> are tasks that simulate user activity and examine the state of the PC. Assessments produce metrics for various aspects of the system, and provide recommendations for making improvements. The Windows Assessment Toolkit includes:</p>
<ul>
<li><p>Windows Assessment Console</p></li>
<li><p>Assessments</p></li>
</ul>
<p>For more information, see [Windows Assessment Toolkit Technical Reference](https://msdn.microsoft.com/en-us/library/windows/hardware/hh825508.aspx).</p></td>
</tr>
<tr class="even">
<td>Windows Assessment Services</td>
<td><p>App for remotely managing settings, PCs, images, and assessments in a lab environment where Windows Assessment Services is installed. This app can run on any PC that has access to the server that’s running Windows Assessment Services.</p>
<p>For more information, see [Windows Assessment Services Technical Reference](https://msdn.microsoft.com/en-us/library/windows/hardware/hh825573.aspx)</p></td>
</tr>
<tr class="odd">
<td>Windows Performance Toolkit (WPT)</td>
<td><p>Tools to record system events by using Event Tracing for Windows, and a tool to analyze performance data in a graphical user interface. Includes:</p>
<ul>
<li><p>Windows Performance Recorder</p></li>
<li><p>Windows Performance Analyzer</p></li>
<li><p>Xperf</p></li>
</ul>
<p>For more information, see [Windows Performance Toolkit Technical Reference](https://msdn.microsoft.com/en-us/library/hh162945.aspx).</p></td>
</tr>
<tr class="even">
<td>Assessment Execution Engine (AXE)</td>
<td><p>The Assessment Execution Engine (AXE) lets you manage and execute Windows system assessments. AXE provides infrastructure needed to manage assessments using a UX tool or script, run assessments, make measurements, process raw data into results, run diagnostics, and publish the results.</p>
<p>For more information, see [Assessment Execution Engine](https://msdn.microsoft.com/library/windows/desktop/hh437709.aspx).</p></td>
</tr>
</tbody>
</table>


## Understanding the Windows Performance Toolkit

| Resource title                                               | Content type  | Description                                                                                                                                                                                                                                                                                                                 | Link |
|--------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Windows Performance Analyzer                                 | Documentation | WPT Documentation and videos                                                                                                                                                                                                                                                                                                | [MSDN](https://msdn.microsoft.com/en-us/library/windows/hardware/hh448170.aspx) |
| CPU Analysis Techniques                                      | White paper   | This guide provides detailed techniques that you can use to investigate Central Processing Units (CPU)-related issues that impact assessment metrics.                                                                                                                                                                       | [MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/jj679884.aspx) |
| Improving performance with the Windows Performance Toolkit | Video         | The Windows Performance Toolkit (WPT) is a powerful tool, used widely by the Windows engineering team within Microsoft, for improving app and system performance. This session focuses on providing tips and tricks, in a case study format with videos, for using the WPT along with WPS traces to optimize your own apps. | [Channel 9](https://channel9.msdn.com/events/BUILD/BUILD2011/HW-59T) |



