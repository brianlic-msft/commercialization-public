---
title: Windows Media Player Performance and Quality
description: Windows Media Player Performance and Quality
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0c0c1485-ab34-42a4-bcc7-690b09b51347
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Media Player Performance and Quality


The Windows Media Player Performance and Quality assessment starts Windows Media Player and plays multiple media clips one after another. The focus of this assessment is on the quality and performance of steady-state playback in Windows Media Player, which mimics the workload of a user watching a movie. The results produced by this assessment can help you assess media playing capabilities and performance and quality issues. This assessment does not evaluate any seeking or pausing functionality. For more information about the results that are produced by this assessment, see [Results for the Windows Media Player Performance and Quality Assessment](results-for-the-windows-media-player-performance-and-quality-assessment.md).

The following graphic illustrates the assessment process.

![workflow graphic for windows media player p & q](images/dep-win8-8-techref-wmpassessmentflow.jpg)

In this topic:

-   [System Requirements](#bkmk-systemrequirements)

-   [Settings](#assesssettings)

## <a href="" id="bkmk-systemrequirements"></a>System Requirements


When running this assessment on Windows 8.1, make sure the **Collect Analysis Trace** setting is unchecked when assessing expected battery life. When checked, this option will produce an incorrect estimation.

Enable analysis trace collection only when you need additional information to investigate other energy-related problems.

You can run this assessment on the following operating systems:

-   Windows 8

-   Windows 10

Supported architectures include x86-based and x64-based systems.

## <a href="" id="assesssettings"></a>Settings


By default, this assessment uses the recommended settings. Microsoft defines these settings so that you can compare the results across multiple computer configurations or over time on the same computer. When you review the results, the run information includes metadata that indicates whether the assessment used the recommended settings.

The following table describes the assessment settings, recommended values, and alternative values for each setting.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Setting</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Use recommended settings</p></td>
<td><p>Specifies whether the assessment uses the recommended settings. By default, this check box is selected. To change the settings for this assessment, you must first clear this check box.</p></td>
</tr>
<tr class="even">
<td><p>Content path</p></td>
<td><p>Specifies the source folder for the media files. By default, the folder is located at <code>..\Content\Streaming Media Assessment</code>. You can use the media files in the default location or specify a different folder. If you supply your own media files, the assessment supports the use of a network folder.</p></td>
</tr>
<tr class="odd">
<td><p>Test pass type</p></td>
<td><p>Specifies a power option for the assessment. Select one of the following options from the drop-down list. By default, the power option on a laptop is <strong>Tests on AC and DC</strong>.</p>
<ul>
<li><p><strong>Tests on AC and DC</strong></p></li>
<li><p><strong>Tests on AC only</strong></p></li>
<li><p><strong>Tests on DC only</strong></p></li>
</ul></td>
</tr>
</tbody>
</table>

 

## Related topics


[Windows Assessment Toolkit](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

[Results for the Windows Media Player Performance and Quality Assessment](results-for-the-windows-media-player-performance-and-quality-assessment.md)

[Media Transcoding Performance](media-transcoding-performance.md)

 

 







