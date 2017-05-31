---
title: Results for the Driver Verification Assessment
description: Results for the Driver Verification Assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 16514264-4581-408b-bd7a-778ca245f0bc
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Driver Verification Assessment


The Driver Verification assessment helps you verify that your offline Windows image or a running Windows operating system contains the correct set of drivers. The results help you identify issues such as missing, unnecessary and outdated drivers.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-driverresults)

-   [Issues](#bkmk-driverissues)

For more information about system requirements and assessment settings, see [Driver Verification](driver-verification.md).

## <a href="" id="bkmk-goals"></a>Goals File


You can create custom goals to measure your improvements in the Results View. Goals files are a triage tool that can help you understand how a PC is performing and to compare PCs in your business.

For example, goals for a basic laptop might be different than the goals you set for a high end desktop computer, or market expectations might change in such a way that you want the flexibility to define different goals and key requirements as time passes and technology improves.

When a metric value is compared to the goal for that metric, the status is color coded in the Result View as follows:

-   Light purple means that the system has a great user experience and that there are no perceived problems.

-   Medium purple means that the user experience is tolerable and you can optimize the system. Review the recommendations and analysis to see what improvements can be made to the system. These can be software changes, configuration changes or hardware changes.

-   Dark purple means that the system has a poor user experience and that there is significant room for improvements. Review the recommendations and analysis to see the improvements that can be made to the system. These can be software changes, configuration changes or hardware changes. You might have to consider making tradeoffs to deliver a high quality Windows experience.

-   No color means that there are no goals defined for the metric.

In the Windows Assessment Toolkit for Windows 8, some assessments include default goals files. The first time you view results using this version of the tools, the default goals file is used. However, you can also define custom goals for Windows 8 the same way that you can for Windows 8.1 and Windows 10.

You can set the goals file location and add a goals file to that location before you can use the UI to apply the custom goals. Once a goals file is selected it will continue to be the goals file that is used for any results that are opened.

Only one goals file can be used at a time. Goals for all assessments are set in a single goals file. The assessment tools will search for goals in the following order:

1.  A custom goals file

2.  Goals that are defined in the results file

3.  Goals that are defined in the assessment manifest

You can use the sample goals file that is provided at %PROGRAMFILES%\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Assessment Toolkit\\SDK\\Samples\\Goals to create your own goals file.

**Note**  
You cannot package a goals file with a job, but you can store it on a share for others to use.

 

## <a href="" id="bkmk-driverresults"></a>Metrics


The Driver Verification assessment evaluates the drivers on your computer and produces results that can help you manage the drivers that are installed. The following table describes the metrics that are available after you run the Driver Verification assessment.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>All Devices</p></td>
<td><p>Lists all devices that the assessment discovered. You can expand the metric to see a list of devices and to identify the device name and device class.</p></td>
</tr>
<tr class="even">
<td><p>Devices with Other Issues</p></td>
<td><p>The number of devices that have other issues than those specifically listed in this table.</p></td>
</tr>
<tr class="odd">
<td><p>Devices Missing Drivers</p></td>
<td><p>The number of devices that have missing drivers. You can expand this metric to see a list of the devices that are missing a driver and to identify the device names and device classes.</p></td>
</tr>
<tr class="even">
<td><p>Devices with Driver Updates Available</p></td>
<td><p>The number of devices that have driver updates available. You can expand this metric to see a list of devices and to identify the device name, a better driver, the driver file, the driver vendor and the driver version.</p></td>
</tr>
<tr class="odd">
<td><p>Devices with Multiple Drivers</p></td>
<td><p>The number of devices that have multiple drivers. You can expand this metric to see a list of devices with more than one associated driver and to identify the device name and device class.</p></td>
</tr>
<tr class="even">
<td><p>Legacy Devices</p></td>
<td><p>The number of devices that were identified as legacy devices. You can expand this metric to see a list of legacy devices and to identify the device name, device class, device description, instance ID and device manufacturer.</p></td>
</tr>
<tr class="odd">
<td><p>Unnecessary Drivers</p></td>
<td><p>The number of devices that have unnecessary software drivers that are not associated with any hardware device. You can expand this metric to see a list of unnecessary drivers and to identify the driver file, driver description driver vendor, and driver versions.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="bkmk-driverissues"></a>Issues


The Driver Verification assessment identifies issues with drivers, provides information about the way that these issues affect the system, and suggests possible resolutions. The following issues and recommendations can appear after you run the Driver Verification assessment. Issue descriptions, recommendations and links to additional information are also available in the UI.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Issue</th>
<th>Description</th>
<th>Recommendation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Missing Driver</p></td>
<td><p>There was no driver found for this device. The device will not work without the appropriate driver.</p></td>
<td><p>When connected to the Internet, search Windows Update for the driver for this device. To automatically search Windows Update for missing drivers, run the assessment again while connected to the Internet and use the default settings. In some cases you might have to contact the OEM or the device manufacturer to obtain the driver.</p></td>
</tr>
<tr class="even">
<td><p>Multiple Drivers</p></td>
<td><p>Lists devices with more than one available driver.</p></td>
<td><p>Extra drivers waste space and can contain vulnerabilities that compromise computer security. We recommend that you include only required drivers. Remove the extra drivers from the offline image by using DISM, or uninstall the drivers from the running computer by using Device Manager. For more information about how to use DISM to remove drivers, see [Driver Servicing Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=225962).</p></td>
</tr>
<tr class="odd">
<td><p>Unnecessary Drivers</p></td>
<td><p>Lists drivers not associated with any of the available hardware devices. Unnecessary drivers could be either a software or service driver.</p></td>
<td><p>If you do not use this software or service, consider removing it. Extra drivers can be removed offline using DISM, or by using Device Manager. See [Driver Servicing Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=225962).</p></td>
</tr>
<tr class="even">
<td><p>Updated Better Driver</p></td>
<td><p>An updated driver is available.</p></td>
<td><p>We recommend that you update the driver for optimal device functionality. There is a more up-to-date driver available on Windows Update. Use the provided link to download the driver or contact the device manufacturer for additional updates. See [Windows Update Driver Publishing](http://go.microsoft.com/fwlink/?LinkId=242240) for information about how to use Windows Update.</p></td>
</tr>
<tr class="odd">
<td><p>Legacy Devices</p></td>
<td><p>Lists the devices that do not have a Plug and Play ID.</p></td>
<td><p>The Microsoft Device Association Root Enumerator device does not have a Plug and Play ID. Such devices cannot be evaluated by this assessment. Use alternative methods to verify the functionality of this device.</p></td>
</tr>
</tbody>
</table>

 

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[Driver Verification](driver-verification.md)

[Windows Assessment Toolkit](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

 

 







