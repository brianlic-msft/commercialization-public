---
title: Windows Store app performance
description: Windows Store app performance
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dfd6d400-fd14-4fbb-b75f-657b4a213026
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Store app performance


The Windows Store app performance assessment can help you optimize your app for a better customer experience. The assessment measures how quickly the app opens and suspends, and the amount of resources it uses on the PC. You can use this assessment to help you improve an individual app, or to help you optimize a Windows image by picking fast and fluid apps that run well on your PC.

In this topic:

-   [Before You Begin](#bkmk-begin)

-   [Settings](#bkmk-settings)

For more information about results and issues produced by this assessment, see [Results for the Windows Store App Performance Assessment](results-for-the-windows-store-app-performance-assessment.md).

## <a href="" id="bkmk-begin"></a>Before You Begin


**Warning**  
The first-run help tips in Windows 8.1 can negatively affect assessment results. To disable these, run the following command from an elevated command prompt, and reboot the computer: `reg.exe add "HKLM\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableHelpSticker /t REG_DWORD /d "1" /f`

 

**Warning**  
Run this assessment only while the desktop is full screen. Do not run this assessment if you have another Windows Store app opened side-by-side with the desktop.

 

**Note**  
The Windows Store app performance assessment only provides results for Windows Store apps on the PC, it does not assess desktop applications.

 

For best results:

-   Exit any open desktop applications.

-   Complete any first-run tasks on apps you want to assess. For example, some apps require a user login, user acceptance of a license agreement, or UI settings the first time the app is run.

-   Make sure all apps are up-to-date. You can open the Windows Store to check for any pending updates on apps installed on your PC.

-   Do not interact with the PC while the assessment is running.

-   Ensure that Ngen.exe has been run for each app prior to the first run of the assessment by doing one of the following:

    1.  Manually run Ngen.exe by running the following command via an elevated prompt, substituting *&lt;DotNetVersion&gt;* for any version of .NET that is installed on the computer:

        `%WinDir%\Microsoft.NET\Framework\<DotNetVersion>\Ngen.exe ExecuteQueuedItems`

    2.  Run the app for approximately 30 seconds. This causes a scheduled task to run that includes Ngen.exe.

### System requirements

You can run this assessment on the following operating systems:

-   Windows 8

-   Windows® RT

-   Windows 8.1

-   Windows RT 8.1

-   Windows 10

Supported architectures include x86-based, x64-based, and ARM-based systems.

You can run this assessment on a Windows RT 8.1 system in either of the following ways:

-   Package the assessment job in the Windows® Assessment Console, and then run it on Windows RT 8.1. For more information about this option, see [Package a Job and Run It on Another Computer](package-a-job-and-run-it-on-another-computer.md).

-   Use Windows Assessment Services. For more information, see [Windows Assessment Services Technical Reference](http://go.microsoft.com/fwlink/?LinkId=215628).

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
<td><p>You can use this setting to specify the number of times that the assessment runs. The results are an average of the iterations. By default, three iterations are run to give you a more accurate result.</p>
<div class="alert">
<strong>Note</strong>  
<p>During each iteration, the assessment opens each Windows Store app. The length of each iteration is proportional to the total number of apps being assessed. Apps may also open in the preparation phase of the assessment.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>Restart each Windows Store app</p></td>
<td><p>You can use this setting to force each app to restart instead of resuming an app that may already be open on the PC.</p></td>
</tr>
<tr class="even">
<td><p>Enter Windows Store app name</p></td>
<td><p>You can use this setting to specify an app name to use for the assessment instead of running the assessment on all apps. The assessment will include all apps that match the name you enter. You can use a partial app name to match more than one app. For example, if you enter <strong>Contoso</strong> on a PC with a <strong>Contoso Finance</strong> app and a <strong>Contoso News</strong> app installed, the assessment would include both apps.</p></td>
</tr>
<tr class="odd">
<td><p>Enable detailed CPU metrics</p></td>
<td><p>You can use this setting to get detailed information about the CPU usage breakdown of an app. You need to configure symbols to use this setting. For more information, see [Symbol Support](../wpt/symbol-support.md).</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Results for the Windows Store App Performance Assessment](results-for-the-windows-store-app-performance-assessment.md)

 

 







