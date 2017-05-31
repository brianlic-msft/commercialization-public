---
title: Out Of Box Experience
description: Out Of Box Experience
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D97B30B5-A604-483F-821C-9831218F2AA7
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Out Of Box Experience


Applies To: Windows 8.1, Windows 10

This assessment measures the duration of key aspects of the first startup experience (OOBE) that are typically impacted by image customizations and software add-ons applied to the Windows retail image. The measurements are obtained from performance traces collected using Event Tracing for Windows (ETW) during a Windows 10 system’s first startup. The assessment measures the duration of First Logon as well as specific aspects such as Active Setup and Provisioned App Install.

In this topic:

-   [Before You Begin](#beforebegin)

-   [Manual execution of assessment](#bkmk-streamingworkloads)

-   [Settings](#settings)

## <a href="" id="beforebegin"></a>Before You Begin


**Warning**  This assessment does not execute in an automated fashion.

 

**Warning**  The image being tested needs to be in a never-been-booted state in order for measurements to be successfully collected. Attempting to revert an assessed image back to the pre-OOBE state will not yield comparable results and is not a supported scenario.

 

## <a href="" id="bkmk-streamingworkloads"></a>Manual execution of assessment


This assessment requires manual execution in order to collect the data necessary to provide results. Please follow the following instructions.

1.  Create a new package job with just the OOBE assessment.
    1.  In the Windows Assessment Console, select the Manufacturing and Deployment tab. If the tab is not opened, click the Home page and then double-click the job to open it.
    2.  Click Package.
    3.  In the Package a Job to Run on Another Computer dialog box, enter notes that will help you identify this job when you select results to open and view, such as Packaged Manufacturing and Deployment Job.
    4.  In the Package path box, type the location where you want to store the job package. For this exercise, the location should be on removable media such as a USB flash drive.
    5.  In the Results path box, type the location where you want to store the results. By default, this is the relative path of a .\\Results folder in the same location where the job is run.
    6.  Click OK. When the job is packaged, the location where you stored the job will open.
    7.  Eject the USB flash drive.

2.  Prepare a machine by installing the Windows image that will be assessed.
3.  Copy the package to this machine (ideally on a different disk and partition).
4.  Boot the machine.
5.  When the first prompt appears, press “shift + F10” to open an admin command prompt.
6.  Navigate to your ADK package. Run “cd Assessment1\\%PROCESSOR\_ARCHITECTURE%” and then run “add\_autologger.reg”. Confirm the registry settings were imported successfully.
7.  Run “shutdown /r /t 0” in the command prompt. The machine will reboot.
8.  Upon reboot, enter the required data to have the machine proceed through OOBE. Use a local or live account depending on the scenario you wish to test..
9.  Upon reaching the desktop, navigate to your ADK package. Run “cd Assessment1\\%PROCESSOR\_ARCHITECTURE%” and run ”stop\_autologger.cmd”. This will collect the ETW trace that was started with the autologger and other relevant logs. The folder named “Assessment1\\%PROCESSOR\_ARCHITECTURE%\\&lt;date-time&gt;\_&lt;username&gt;\_&lt;machinename&gt;” is where results are created.
10. Copy these contents to a machine that has the ADK installed to analyze the results.

## Settings


By default, this assessment uses the recommended settings. These settings are defined by Microsoft to ensure that the results can be compared across different computer configurations or over time on the same computer. When you review the results, the run information includes metadata that indicates that the recommended settings were used so that you can easily identify results that use recommended settings in addition to those that don’t.

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
<td><p>Manually Collected OOBE Logs</p></td>
<td><p>This is the full path to the folder that contains the trace and logs from the manual execution of OOBE.</p>
<p>This is a required parameter for analysis.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Results for the Out of the Box Experience assessment](results-for-the-out-of-box-experience-assessment.md)

[Windows Assessment Toolkit Technical Reference](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

 

 







