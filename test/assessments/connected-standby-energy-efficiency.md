---
title: Connected Standby energy efficiency
description: Connected Standby energy efficiency
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9a23aaaa-922c-410d-a27d-ffd5eb67b546
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Connected Standby energy efficiency


As part of the **Battery life during connected standby** job, the **Connected Standby energy efficiency** assessment measures the impact of software and devices on the battery life of a system while it is in Connected Standby. The assessment also measures the time spent transitioning into and out of Connected Standby.

In this topic:

-   [Workloads](#bkmk-photoworkloads)

-   [Settings](#settings)

For more information about results and issues produced by this assessment, see [Results for the Connected Standby energy efficiency assessment](results-for-the-connected-standby-energy-efficiency-assessment.md).

## <a href="" id="beforeyoubegin"></a>Before You Begin


The first-run help tips in Windows 8.1 can negatively affect assessment results. To disable these, run the following command from an elevated command prompt, and reboot the computer: `reg.exe add "HKLM\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableHelpSticker /t REG_DWORD /d "1" /f`

When running this assessment on Windows 8.1, make sure the **Collect Analysis Trace** setting is unchecked when assessing expected battery life. When checked, this option will produce an incorrect estimation.

Enable analysis trace collection only when you need additional information to investigate other energy-related problems.

### Requirements

-   The system must support Connected Standby. To verify that this sleep state is supported, open a command prompt window, and run the following command:

    **powercfg /a**

    If your system supports Connected Standby, **Standby (Connected)** will be in the list of available sleep states.

-   Ensure that the system is running on DC (battery) power. Energy efficiency jobs are designed to run only on mobile devices. If a battery is not detected, you will receive an error.

**Important**  
To run the Connected Standby energy efficiency assessment on a Windows RT or Windows RT 8.1 device, you must do the following:

1.  Insert a USB storage device into the computer running WAC. The storage device should have at least 60MB of available space.

2.  In WAC, package the assessment, and select the USB storage device as the target. For more information, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md).

3.  Transfer the USB storage device to the device that is running Windows RT or Windows RT 8.1.

4.  Copy the contents of the USB storage device to a destination on the device that is running Windows RT or Windows RT 8.1.

5.  On the device that is running Windows RT or Windows RT 8.1, open a command prompt with administrator privileges.

6.  Navigate to the location of the assessment package.

7.  Navigate to the Assessment1\\arm directory.

8.  Run InstallKitsPolicy.cmd. This will reboot the device.

9.  After reboot, navigate back to the root of the assessment package location, and run RunJob.cmd.

To remove the policy, do the following:

1.  Navigate to the location of the assessment package.

2.  Navigate to the Assessment1\\arm directory.

3.  Run DeleteKitsPolicy.cmd. This will reboot the device.

 

### Recommendations

Before you begin, configure the settings on the portable computer to reduce the risk of generating warnings in the results and adversely affecting power usage. The following guidelines are recommended settings. They are not required for the job to run, but the results may be affected if the computer is not appropriately configured.

-   Make sure that wireless functionality is enabled and that the computer is connected to a network. Otherwise, the results might not reflect realistic scenarios.

    In Control Panel, open **Manage Wireless Networks**. If wireless functionality is not enabled, turn it on and connect to a wireless network.

    **Note**  
    If wireless connectivity is on, but there is no network to connect to, results are still affected.

     

-   Install and enable antivirus software. If antivirus software isn't enabled and running, the results might not reflect realistic scenarios.

    In Control Panel, open **Action Center**, choose **Security**, and check that the **Virus protection** is **On**. If not, choose **Change Action Center Settings** and then choose the **Virus protection** check box.

-   Make sure that the power policy is set to **Balanced**. By default, any other power policy generates a warning that may affect the results.

    In Control Panel, open **Power Options**, and then choose **Balanced**.

-   Make sure that the computer is configured so that a password isn't required when the computer resumes from a screen saver.

-   Make sure that all device drivers are correctly installed. Results might vary significantly if your computer has missing or incorrect drivers. You can use the [Driver Verification](driver-verification.md) assessment to identify driver issues on the computer that you want to assess.

-   For best results, we recommend that you run the job as a packaged job. For information about how to create and run a packaged job, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md).

### System requirements

You can run this assessment on the following operating systems:

-   Windows 8

-   Windows 8.1

-   Windows RT

-   Windows RT 8.1

-   Windows 10

Supported architectures include x86-based, x64-based, and ARM-based systems.

## <a href="" id="bkmk-photoworkloads"></a>Workloads


A workload is a set of automated tasks that simulate user activity in a predefined, repeatable manner. The workloads run independent of each other. You can select any combination of these workloads to run during the assessment. This assessment measures durations and throughput for each workload that you use, and stores the metrics in the results file.

The following table describes the workloads that are available for this assessment.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Workload</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Diagnostic mode</p></td>
<td><p>Uses heavyweight tracing, generating additional tracing, metrics, and issues that are used to help diagnose energy efficiency problems. If the <strong>Generate diagnostics information</strong> option is enabled under <strong>Energy efficiency settings</strong>, the first iteration runs in diagnostic mode.</p></td>
</tr>
<tr class="even">
<td><p>Workload mode</p></td>
<td><p>Uses lightweight tracing. Workload mode does not generate any metrics or issues. If the <strong>Generate diagnostics information</strong> option is enabled under <strong>Energy efficiency settings</strong>, the first iteration runs in diagnostic mode, while the remaining iterations run in workload mode. Otherwise, all iterations run in workload mode.</p></td>
</tr>
</tbody>
</table>

 

## Settings


Microsoft defines recommended settings so that you can compare the results across multiple computer configurations or over time on the same computer. When you review the results, the run information includes metadata that indicates whether the assessment used the recommended settings. If desired, you can change these settings.

The following table describes the Connected Standby energy efficiency assessment settings.

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
<td><p>Minute(s)</p></td>
<td><p>Specifies the amount of time per iteration, in minutes, that the computer will spend in Connected Standby.</p></td>
</tr>
<tr class="odd">
<td><p>Disable Quiet Hours</p></td>
<td><p>Specifies whether to disable the Quiet Hours feature during the assessment. By default, the Quiet Hours feature is not disabled.</p></td>
</tr>
</tbody>
</table>

 

 

 






