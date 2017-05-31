---
title: Windows Assessment Console overview
description: Windows Assessment Console overview
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 12afc4f2-74be-41d9-ac09-a9e7c7d79d37
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Assessment Console overview


The Windows Assessment Console and assessments are installed as part of the Windows Assessment Toolkit. The Windows Assessment Console is a GUI that you can use to discover assessments and predefined jobs, group assessments to create new jobs, change existing jobs, run jobs, and manage job results. A job is a collection of one or more assessments (and their settings) that run at the same time on a computer. The results of a job often include diagnostics and remediation information that help you determine areas that need additional investigation and corrective action. For more information about how to use the Windows Assessment Console, see [Windows Assessment Console step-by-step Guide](windows-assessment-console-step-by-step-guide.md).

An assessment is a combination of .xml and binary files that induce a specific set of states on a computer, measure and record the activity, and preserve the recorded results. You can review the available assessments to determine what you want to assess. You can then add the assessments to a job or configure a predefined job to include the assessments and settings that meet your needs. For more information about individual assessments, see [Assessments](assessments.md).

In this topic:

-   [System Requirements](#asmt-sysreq)

-   [Benefits](#asmt-benefits)

-   [Limitations](#asmt-limitations)

-   [Common Scenarios](#asmt-scenarios)

## <a href="" id="asmt-sysreq"></a>System Requirements


The Windows Assessment Console can be installed on any of the following operating systems:

-   Windows 8

-   Windows 10

**Note**  
Some assessments must be run on a specific operating system. For more information about system requirements for individual assessments, see [Assessments](assessments.md).

 

In addition, the system partition where you install the Windows Assessment Console must have a minimum of 200 megabytes (MB) of free disk space to run assessments. This requirement is needed for Event Tracing for Windows (ETW), a feature that all assessments use. Over time, assessment results and log files can consume a large amount of disk space.

## <a href="" id="asmt-benefits"></a>Benefits


The Windows Assessment Console offers these benefits:

-   A GUI that you can use to assess a computer, investigate issues, review recommendations, and compare results.

-   Some job results provide links to additional information that can help you improve the computer, and direct links to Windows Performance Analyzer (WPA) so that you can trace the cause of an issue back to the source.

-   The ability to compare a few results in a details view, and the ability to compare hundreds of results in a summary view. For more information, see [Compare results](compare-results.md).

-   The ability to package a job and save it on a USB flash drive, and then run it on another computer. For more information, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md).

-   The ability to import results to the default results library from other locations, like removable media or a network share.

-   Predefined jobs that are easy to find and run.

-   The ability to restore the recommended assessment settings if you've modified them.

-   The ability to restore the default template settings if you've modified a predefined job.

-   The ability to customize a job to include the assessments and settings that you want to use.

-   The ability use custom assessments that are compatible with the Assessment Platform in the Windows Assessment Console, in the same way that you use the assessments that the toolkit provides. For more information, see [Register custom assessments](register-and-unregister-custom-assessments.md).

    **Note**  
    You can use a set of public APIs to create and extend assessments that are compatible with the Assessment Platform. For more information, see [MSDN: Assessment Execution Engine](http://go.microsoft.com/fwlink/?LinkId=236367).

     

## <a href="" id="asmt-limitations"></a>Limitations


These limitations apply to the Windows Assessment Console:

-   The Windows Assessment Console assesses one computer at a time. For more information about remotely assessing multiple computers at the same time, see [Windows Assessment Services](windows-assessment-services-technical-reference.md).

-   The Windows Assessment Console can't be installed on a server and isn't designed to assess server computers.

-   The Windows Assessment Console can't be installed on Windows RT. But, you can package a job and run it on Windows RT if the assessment supports ARM-based processors. Not all assessments support running on ARM-based processors. For more information, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md). For more information about system requirements for assessments, see [Assessments](assessments.md).

## <a href="" id="asmt-scenarios"></a>Common Scenarios


The Windows Assessment Console and the assessments fulfill a general industry need for assessing a computer in a unified manner based on specific scenarios. They are intended for these audiences:

-   System builders who want to gauge key quality metrics and the effect that various component combinations have on the systems that they build

-   Computer reviewers and analysts who want a consistent way to measure performance, reliability, and functionality

The Windows Assessment Console is typically used in these scenarios:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Scenario</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Black box</p></td>
<td><p>Run a predefined job and examine the results for any unusual values or indications of issues with drivers, memory usage, or other areas that the assessments address.</p></td>
</tr>
<tr class="even">
<td><p>Comparison of results</p></td>
<td><p>Run a predefined job, or a single assessment with recommended assessment settings, on any computer that's running a supported operating system. Use the Windows Assessment Console to package the job to run on another computer. After you run the job on the other computer, import the results to the default results library. You can compare the results from any Windows 10-based computer with those of any other supported operating system to identify differences.</p></td>
</tr>
<tr class="odd">
<td><p>Clean computer</p></td>
<td><p>Run assessments on a <em>clean computer</em> (a computer that includes only the operating system) to establish baseline system results. For instructions, see [Create baseline results](create-baseline-results-for-comparing-windows-images.md).</p></td>
</tr>
<tr class="even">
<td><p>Added hardware or software components</p></td>
<td><p>Add new hardware or software to the clean computer system and then rerun the assessments to compare the results with clean-computer results. For instructions, see [Create baseline results](create-baseline-results-for-comparing-windows-images.md).</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

[Assessments](assessments.md)

[Assessment Platform Command-Line Syntax](assessment-platform-command-line-syntax.md)

 

 







