---
title: Internet Explorer Security Software Impact
description: Internet Explorer Security Software Impact
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d71e8ac3-f160-4554-8a26-2d3a95ac059e
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Internet Explorer Security Software Impact


The Internet Explorer security software impact assessment measures aspects of Internet Explorer that are typically impacted by antimalware and other browser add-ins. The assessment measures the impact of security software on the display time, CPU time, and resource utilization of Internet Explorer.

For more information about results and issues produced by this assessment, see [Results for Internet Explorer Security Software Impact Assessment](results-for-internet-explorer-security-software-impact-assessment.md).

## Before You Begin


The first-run help tips in Windows 8.1 can negatively affect assessment results. To disable these, run the following command from an elevated command prompt, and reboot the computer: `reg.exe add "HKLM\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableHelpSticker /t REG_DWORD /d "1" /f`

For best results:

-   Compare results from this assessment to results from the same assessment on the same PC with a clean Windows image with only Windows Defender running. This will help you identify the impact of the antimalware software added to the image.

### System requirements

You can run this assessment on the following operating systems:

-   Windows 8

-   Windows RT

-   Windows 8.1

-   Windows RT 8.1

-   Windows 10

Supported architectures include x86-based, x64-based, and ARM-based systems.

You can run this assessment on a Windows RT 8.1 system in either of the following ways:

-   Package the assessment job in the Windows Assessment Console, and then run it on Windows RT 8.1. For more information about this option, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md).

-   Use Windows Assessment Services. For more information, see [Windows Assessment Services](windows-assessment-services-technical-reference.md).

## <a href="" id="bkmk-settings"></a>Settings


You can use the default settings or customize the settings for an assessment. When you review the results, you can see whether the assessment used the recommended settings or custom settings so that you can compare results from the same jobs across multiple computers or over time.

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
<td><p>By default, this check box is selected and recommended settings are used. To change the settings for this assessment, you must first clear this check box.</p></td>
</tr>
<tr class="even">
<td><p>Iterations</p></td>
<td><p>You can use this setting to specify the number of times that the assessment runs. The results are an average of the iterations. By default, ten iterations are run to give you a more accurate result.</p></td>
</tr>
<tr class="odd">
<td><p>URL</p></td>
<td><p>You can use this setting to specify a website for the assessment to use as part of the test instead of using the local test page included with the assessment.</p>
<div class="alert">
<strong>Note</strong>  
<p>We recommend that you use the default setting. The local test page is included with the assessment and can be run without internet connectivity. If you specify a website that requires internet connectivity for the assessment, you could introduce new variables that could affect the results of your test.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

## Related topics


[Results for Internet Explorer Security Software Impact Assessment](results-for-internet-explorer-security-software-impact-assessment.md)

 

 







