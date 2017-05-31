---
title: Delivering a great energy efficiency experience
description: How to deliver a great energy efficiency experience
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

# Delivering a great energy efficiency experience

Battery life and energy efficiency are among the most active topics in modern computing. Recent studies indicate that 76% of consumers rate battery life as "extremely important" when choosing a tablet and mobile PC. Because of its role as a competitive differentiator, battery life is crucial.

It’s important to take a holistic approach to optimize the power consumption (watts used) across the Windows base hardware platform, Windows image, and extensions (drivers, software preload, services, and so on).

## Considerations

The energy efficiency and battery life of your PC is affected at every step of the design and development process.

### How to select battery capacity

Determine your battery life goals, industrial design, target cost, and the target market for your PC to help you select an appropriate battery capacity. Consider this early in your planning and development phase so that you don’t acquire a battery that is too small to meet your goals. For more information about modeling battery life runtime, see the *Battery Guidelines* document included with the WEGs on Connect.

### How to design an OEM image to improve battery life

The design of a complete Windows image can improve or degrade battery performance. For example, your selection of apps, drivers, and power plans can change the power consumption of the PC.

You can run tests during all phases of image design and development to identify performance problems early and make design decisions based on the results.

## Recommended goals

The goals described in this section are intended to help you design a fully integrated platform that delivers a competitive battery life while running Windows. The goals described are not a commitment for Windows to deliver; rather, they are targets for you to meet on your hardware. The goals will continually be adjusted based on feedback from ecosystem partners, Windows development, and platform power management validation.

Carefully analyze the device's battery capacity and power draw to meet your battery life goals. To accurately project your device's battery life, measure reasonable consumer usage scenarios and environments.

The following tables show what our user research indicates is the minimum quality bar according to user expectations. You should also compare your battery life goals with in-market products. You can use the Windows battery assessment test available in the Windows Assessment and Deployment Kit (ADK), a comparable energy efficiency test tool, or a comparable test to measure reasonable consumer usage scenarios and environments to validate battery life.

| Scenario                                                                      | Tablet (CS)     | Convertible     | Notebook |
|-------------------------------------------------------------------------------|-----------------|-----------------|--------------|
| Battery life video playback @ 150 - 200 nits (hours) depending on form factor | >= 12        | >= 6         | >= 5 |


| Metric                               | Target |
|--------------------------------------|--------|
| System timer resolution              | 15 ms |
| Maximum processor state on DC and AC (Processor Power Management). Doesn’t apply to connected standby–capable systems. |   100% |

                                         


## Validation and testing

You can use the Windows Assessment Toolkit, a comparable energy efficiency test tool or a comparable test to measure reasonable consumer usage scenarios and environments to improve performance of your PC beyond minimum requirements. Windows assessments related to active workload battery life include:

<dl>
<dt>**Idle Energy Efficiency Job**</dt>
<dd>
<p>Identifies issues with software, drivers, and devices during system idle
that reduce your system’s energy efficiency.</p>
</dd>
<dt>**Battery Run Down Job**</dt>
<dd>
<p>Measures battery life during a typical system usage scenario and reports energy efficiency issues during idle periods of the system.</p>
<p>This job includes both the Idle Energy Efficiency workload and a Local Video Playback Energy Efficiency workload.</p>
</dd>
</dl>


### Changes in Energy Efficiency job parameters for ADK 8.1

In ADK 8.1, the Energy Efficiency job parameters UI have been modified:

-   If the **Loop workloads until specified battery level** checkbox is selected, then the assessment will run only one loop of the chosen workloads.

-   If you select **Generate diagnostic information**, then **diagnostics** will collect traces during the
    workload runs.

	-   Selecting **Create Power Profile Issues** will collect Powercfg.exe /energy data and add it to the report.

	-   Selecting **Collect analysis Trace** will allow you to collect an advanced Idle analysis trace which runs for 3 minutes and gathers CPU sampling stacks.

The ADK 8.0 scenarios can then be translated into the following:

-   Rundown without diagnostics:

	-   Choose **Loop workloads until specified battery level**.

		Clear **Generate diagnostic information**.

-   Rundown with diagnostics:

	-   Choose **Loop workloads until specified battery level**.

	-   Check **Generate diagnostic information**, along with **Create Power Profile Issues** and **Collect Analysis Trace**.

-   Diagnostics only:

	-   Clear **Loop workloads until specified battery level**.

	-   Select **Generate diagnostic information**, along with **Create Power Profile Issues** and **Collect Analysis Trace**.

### Configure your PC for testing

A processor-intensive driver, an incorrect firmware setting, or a poorly configured power setting can cause a significant increase in power consumption. When designing and testing your system, experiment with multiple configurations of these aspects to achieve the best balance of performance and energy efficiency. Use your test results to drive improvements back into the design of your PC and your Windows image to deliver a great active workload battery life.

<dl>
<dt>**Analyze hardware components**</dt>
<dd>
<p>Ask hardware manufacturers for their power-consumption test results for each hardware component.</p>
</dd>
<dt>**Analyze drivers**</dt>
<dd>
<p>Validate each new driver for battery impact. As each new driver is added to the system, observe its effect on power consumption. One poorly performing driver can greatly affect system performance.</p>
</dd>
<dt>**Analyze apps, services, and other software**</dt>
<dd>
<p>Validate each new app and system service for battery impact. As each new app is added to the system, observe the effect to power consumption. One poorly performing app can greatly affect system performance.</p>
</dd>
<dt>**Configure power plans**</dt>
<dd>
<p>Optimize Windows power-plan settings to balance performance needs and battery life. This is not applicable to connected standby–enabled systems.</p>
</dd>
<dt>**Test the power of the PC**</dt>
<dd>
<p>Compare the overall power of the PC to thepower consumed using a Windows installation with only drivers installed. Some PCs have shown a 40% decrease in battery performance when preinstalled apps and power policies are added to the image.</p>
</dd>
</dl>

We recommend that you use the environment settings in the following table when you test battery life on your PC. These settings will help you to get consistent and reliable data for realistic user scenarios.

<table>
<thead>
<tr class="header">
<th>Component</th>
<th>Setting</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Display setting</strong></td>
<td>Brightness = 150 - 200 nits depending on form factor</td>
<td>Brightness is measured on a white desktop background with the brightness meter placed in the center of the screen.</td>
</tr>
<tr class="even">
<td><strong>Power policy</strong></td>
<td><p>Balanced</p>
<p>Display dimming timeout disabled</p>
<p>Display off timeout disabled</p>
<p>Adaptive brightness disabled</p>
<p>S3 timeout disabled (does not apply to systems capable of connected standby)</p>
<p>S4 timeout disabled</p></td>
<td>n/a</td>
</tr>
<tr class="odd">
<td><strong>Radios</strong></td>
<td><p>Wi-Fi on <em>and</em> connected</p>
<p>All other radios on but not connected</p></td>
<td>Connect to a consumer class wireless router that has Internet access.</td>
</tr>
<tr class="even">
<td><strong>Other networking</strong></td>
<td>Ethernet disconnected</td>
<td><p>Disconnect before starting test</p>
<p>Reconnect after battery rundown is complete.</p></td>
</tr>
</tbody>
</table>



## Tools and technical reference

You can learn more about battery life and download tools to help you analyze performance from the resources in the following table.

| Resource title                                               | Content type | Description                                                                                                                                                                                                                                                                | Download link |
|--------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Windows Assessment and Deployment Kit<br/><br/>Idle Energy Efficiency and Battery Run Down jobs | Tool | Helps you measure energy efficiency on your PC. | Use the latest Windows ADK drop from Connect |
| Windows Engineering Readiness Training: Battery Life Session | Reference    | Includes information on user research, using the ADK tools, and selecting a battery.  | [Connect](https://connect.microsoft.com/site1304/Downloads/DownloadDetails.aspx?DownloadID=48261) |
| Delivering Great Performance and Battery Life                | Video        | Describes how to create high-performance and energy efficient experiences on the full spectrum of Windows 8 platforms. Learn app design and development practices that maximize the performance of apps and power consumption as a whole.                                  | [Channel 9](http://channel9.msdn.com/events/BUILD/BUILD2011/HW-459T) |
| Improving Battery Life and Energy Efficiency                 | Video        | Demonstrates how the Windows ADK has made it easy to consistently measure battery life, and to identify and fix energy efficiency problems. Learn how to configure battery life assessments, and design assessment workflows, for multiple scenarios.  |  [Channel 9](http://channel9.msdn.com/events/BUILD/BUILD2011/HW-149P) |
| Results for Idle Energy Efficiency                           | Document     | Helps you interpret the results produced by an Energy Efficiency job that uses the Idle workload. |  [MSDN](https://msdn.microsoft.com/en-us/library/windows/hardware/jj130809.aspx)  |
| Mobile Battery Life Solutions                                | Document     | Outlines issues and solutions for advancing battery life for portable computers that run the Windows 7 operating system. Provides system design, power policy guidelines, and preinstallation configuration recommendations as well as test configuration recommendations. | [MSDN](https://msdn.microsoft.com/en-us/library/windows/hardware/dn641606.aspx) |
| Using PowerCfg to Evaluate System Energy Efficiency          | Document     | Provides information about functionality in the PowerCfg utility for evaluating system energy efficiency for the Windows family of operating systems.  | [MSDN](https://msdn.microsoft.com/en-US/library/windows/hardware/dn550976) |


