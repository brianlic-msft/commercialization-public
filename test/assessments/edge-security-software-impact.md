---
title: Edge Security Software Impact
description: Edge Security Software Impact
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 216cee5b-9665-4324-a25c-a0d3b2d429fd
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Edge Security Software Impact


Applies To: Windows 10

The Edge Security Software Impact assessment measure aspects of Microsoft Edge that are typically impacted by antimalware. The assessment measures the impact on the launch and navigate times of Microsoft Edge.

In this topic:

-   [Before You Begin](#beforebegin)

-   [Settings](#settings)

For more information about results produced by this assessment, see [Results for the Edge Security Software Impact Assessment](results-for-the-edge-security-software-impact-assessment.md).

## <a href="" id="beforebegin"></a>Before You Begin


**Warning**  Ensure that Microsoft Edge is your default HTTP protocol handler. To verify this, launch the Settings app and navigate to "System -&gt; Default apps -&gt; Choose default apps by protocol". Check that Microsoft Edge is selected for HTTP.

 

For best results:

-   Exit any open desktop apps or Windows apps.
-   Complete any first-run tasks you want to assess, particular related to security applications being installed and prepped.
-   Do not interact with the PC while the assessment is running.

## Settings


By default, this assessment uses the recommended settings.

You can also customize these settings if you want to gather different data than what is captured by default. For example, you might identify specific data that would help you do a more detailed analysis of a particular aspect of the computer.

The following table describes the assessment settings, recommended setting values, and alternative values for each setting.

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
<td><p>By default, this checkbox is selected and recommended settings are used. To change the settings for this assessment, you must first clear this checkbox.</p></td>
</tr>
<tr class="even">
<td><p>URL</p></td>
<td><p>You can use this setting to specify a website for the assessment to use as part of the test instead of using the local test page included with the assessment. If this is not specified, the local test page will be used. You can test live or local URLs.</p></td>
</tr>
<tr class="odd">
<td><p>Iterations</p></td>
<td><p>You can use this setting to specify the number of times that the assessment runs. The results are an average of the iterations.</p></td>
</tr>
<tr class="even">
<td><p>Maximize Edge</p></td>
<td><p>This setting has no effect.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Results for the Edge Security Software Impact Assessment](results-for-the-edge-security-software-impact-assessment.md)

[Windows Assessment Toolkit Technical Reference](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

 

 







