---
title: Results for the Memory Footprint assessment
description: Results for the Memory Footprint assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fd625d98-5d3a-401d-9639-516135f8d968
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Memory Footprint assessment


This topic can help you interpret the metrics produced by the Memory Footprint assessment. It also provides guidance on how to use the results to identify and resolve a number of common issues that negatively impact the customer’s experience. Memory is a key resource, and optimizing memory usage ensures a consistent and responsive user experience.

This assessment creates a snapshot of memory use during a series of reboots of the system and immediately after the appearance of the start screen in Windows 8 or Windows 10. It does not evaluate memory use during ordinary computer operations. However, you can use the Memory Footprint assessment results to understand how memory is being used before applications are launched. Many processes and services are in use all the time and they take up memory. This assessment helps you see how drivers and applications that always run impact the boot process.

**Note**  
The computer being assessed should have retail versions of drivers installed to get an accurate picture of memory allocations.

 

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-memorymetrics)

-   [Issues](#bkmk-memoryissues)

For more information about the assessment, system requirements, and assessment settings, see [Memory Footprint](memory-footprint.md).

## <a href="" id="bkmk-goals"></a>Goals File


You can create custom goals to measure your improvements in the Results View. Goals files are a triage tool that can help you understand how a PC is performing and to compare PCs in your business.

For example, goals for a basic laptop might be different than the goals you set for a high end desktop computer, or market expectations might change in such a way that you want the flexibility to define different goals and key requirements as time passes and technology improves.

When a metric value is compared to the goal for that metric, the status is color coded in the Result View as follows:

-   Light purple means that the system has a great user experience and that there are no perceived problems.

-   Medium purple means that the user experience is tolerable and you can optimize the system. Review the recommendations and analysis to see what improvements can be made to the system. These can be software changes, configuration changes or hardware changes.

-   Dark purple means that the system has a poor user experience and that there is significant room for improvements. Review the recommendations and analysis to see the improvements that can be made to the system. These can be software changes, configuration changes or hardware changes. You might have to consider making tradeoffs to deliver a high quality Windows experience.

-   No color means that there are no goals defined for the metric.

**Note**  
In the Windows Assessment Toolkit for Windows 8, some assessments include default goals files. The first time you view results using this version of the tools, the default goals file is used. However, you can also define custom goals for Windows 8 the same way that you can for Windows 8.1 and Windows 10.

 

You can set the goals file location and add a goals file to that location before you can use the UI to apply the custom goals. Once a goals file is selected it will continue to be the goals file that is used for any results that are opened.

Only one goals file can be used at a time. Goals for all assessments are set in a single goals file. The assessment tools will search for goals in the following order:

1.  A custom goals file

2.  Goals that are defined in the results file

3.  Goals that are defined in the assessment manifest

You can use the sample goals file that is provided at %PROGRAMFILES%\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Assessment Toolkit\\SDK\\Samples\\Goals to create your own goals file.

**Note**  
You cannot package a goals file with a job, but you can store it on a share for others to use.

 

## <a href="" id="bkmk-memorymetrics"></a>Metrics


Various factors affect the memory usage of a computer. These factors include architecture, physical memory, edition of operating system, graphics configuration, computer class, language, and network connectivity. Memory footprint is the amount of physical memory that a program uses or references while it runs. Memory footprint includes the following:

-   Binaries, dynamic-link libraries (DLLs), and other executable files that are loaded into memory

-   Dynamic allocations, including heap/VA

-   Driver allocations, primarily in pool, symbol tables, and stacks

By understanding the memory footprint of a computer, you can identify ways to improve performance and efficiency. Optimizing memory creates a more efficient and scalable operating system, increases the memory that is available for applications and processes, and improves performance under an increased or expanding workload.

This assessment focuses on the following usage of system memory:

-   Driver allocations that are provided during boot for the paged pool, the non-paged pool, and driver-locked pages.

-   Dynamic allocations that are made by boot applications, antivirus programs, and other software. These remain in memory after boot, when the system stabilizes.

**Optimization of In-Use Memory**

Memory use affects performance because computers can access more code and data than can ﬁt in physical memory. For example:

-   Total physical memory is the total RAM on a system.

-   Available memory is the part of this RAM that is available for the user's applications after the required system and boot applications have been loaded into memory.

-   In use memory contains everything running when booting is completed and the desktop or start screen appears.

The Memory Footprint assessment enumerates the contents of the in-use memory to help driver manufacturers and system builders optimize the system performance of the computers that they are creating. The assessment highlights the memory allocations of drivers and boot applications.

In-use memory includes more than just the Windows system processes. You can use this assessment to understand what is in memory after boot. Then, you can try to lower or eliminate some unnecessary or excessive memory allocations in the categories of working sets, non-paged memory, and modified pages. Optimizing the amount of in-use memory has the effect of shifting that released memory to the category of available memory. This increases the quantity of memory in the free and standby categories. The following table describes those categories.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Overall memory category</th>
<th>Subcategories of memory use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Total memory</p></td>
<td><p>In-use memory + available memory</p></td>
</tr>
<tr class="even">
<td><p>In-use memory</p></td>
<td><p>Working sets + non-paged memory + modified pages</p></td>
</tr>
<tr class="odd">
<td><p>Available memory</p></td>
<td><p>Standby memory + free memory</p></td>
</tr>
</tbody>
</table>

 

The Memory Footprint assessment provides a more detailed description of memory use than Task Manager does.

The metrics produced by this assessment show a quantitative overview of system memory usage. Some of these metrics have extra memory parameters that can be exposed by expanding the **Group By** drop-down list. The following metrics are measured during the Memory Footprint assessment.

### Available Memory

The available memory in total megabytes, as shown in Task Manager after boot. Available memory is in-use memory subtracted from total memory. This includes free memory, standby memory, and pages on the standby list.

### Memory in Use

The sum of non-pageable memory in megabytes and any allocations in process working sets or modified working sets.

### Standby Memory

The standby memory in megabytes. Standby memory becomes available as an application needs it. The value of standby pages is the quantity of cached data and files that are in memory but not in active use.

### Total Memory

The total available memory in megabytes, as shown in Task Manager after boot. The value of total pages is the RAM that is visible after the operating system allocates its share.

### Driver Paged Allocations

**Most applicable to:** Driver developers, OEMs

Driver developers can influence this number with the way the driver is implemented. OEMs can influence this number by adding or removing devices from the system.

This is the memory that is allocated by drivers and is backed by the paging file. This means the memory could be swapped out to disk, in order to make room for some other code or data, and then retrieved later via a hard fault. This metric is only the data allocated by the driver, and does not include the memory space required to load the driver into memory. For more information about pageable code, see [Driver Paged Code](#memmetrics-driverpagedcode).

**Detailed Sub-metrics**

The assessment subdivides these memory allocations by the session they occur in. Session 0 is used by the system for system services and processes. The first user session is session 1. Non-session contains allocations by the system unrelated to any individual session.

**Typical Influencing Factors**

OEMs can influence this metric by swapping out hardware or software whose driver has lower memory requirements. In addition OEMs can reduce the number of devices on the system. OEMs should know what drivers are on the system and what memory they are using.

**Analysis and Remediation Steps**

The driver vendor has the most influence over this metric by the way he or she designs the driver. A list of allocations charged to all drivers in the system is available. In addition the driver vendors can be given WPA traces (stored in the same directory as the assessment results) for this assessment. These can be used to find areas of heavy memory allocations that are candidates for investigations into reducing memory use.

### Driver Non-Paged Allocations

**Most applicable to:** Driver developers, OEMs

Driver developers can influence this number with the way the driver is implemented. OEMs can influence this number by adding or removing devices from the system.

This metric is similar to the paged allocations except these allocations use physical memory that cannot be paged out. This reflects physical memory that is pinned, and therefore is unavailable for paged memory or use by other processes and services. Acquiring too much non paged memory reduces the amount of memory that can be used by page backed memory.

Non-paged memory allocations are sometimes required for a driver’s data structures which need to be accessed during execution of interrupt service routines (ISRs) and deferred procedure calls (DPCs). ISRs and DPCs are functions related to hardware interrupts and page faults cannot occur while executing these functions. Hence the driver needs to allocate these data structures in Non-paged Pool in order to avoid any crashes.

**Detailed Sub-metrics**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Sub-metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Driver Locked System Pages</p></td>
<td><p>This is memory that is loaded in from paged memory and then locked by the driver until it is no longer useful. An example of this would be a device such as a modem that is used sporadically. There is no point in loading any code for this device until it is in use and then some of the code and data needs to be locked so it cannot be paged out.</p></td>
</tr>
<tr class="even">
<td><p>Contiguous</p></td>
<td><p>This is non-paged contiguous memory. Some code loaded in the kernel address space must be locked so it will not be paged out. This is a common source of bugs in drivers. The system needs to be able to respond to hardware interrupts without the resulting code path having to go to a paging file.</p>
<p>Driver Locked System Pages refers to a memory descriptor list (MDL). MDL is a system-defined structure that describes a buffer by a set of physical addresses. A driver that performs direct I/O receives a pointer to an MDL from the I/O manager, and reads and writes data through the MDL. Some drivers also use MDLs when they perform direct I/O to satisfy a device I/O control request. When the Microsoft Windows memory manager constructs an MDL for a device read, it locks physical pages to use for the transfer target. However, it is solely up to the memory manager to determine which pages to keep and which (if any) to discard.</p></td>
</tr>
<tr class="odd">
<td><p>EX</p></td>
<td><p>This is the executable non paged pool memory that is allocated in an area of memory set aside for executing code.</p></td>
</tr>
<tr class="even">
<td><p>NX</p></td>
<td><p>A type of non-paged pool has been introduced which is non-executable (NX Pool). Since it is non-executable, it is inherently more secure as compared to executable Non Paged Pool (NP Pool) and provides better protection against any overflow attacks.</p></td>
</tr>
</tbody>
</table>

 

**Typical Influencing Factors**

OEMs can influence this metric by swapping out hardware or software drivers that have lower memory requirements.

**Analysis and Remediation Steps**

The driver vendor has the most influence over this metric by the way the driver is designed. Look for large memory allocations in the results presented in the Windows Assessment Console. In addition the driver vendors can be given WPA traces (stored in the same directory as the assessment results) of this assessment to find areas of heavy memory allocation that are candidates for investigations into reducing memory use.

### <a href="" id="memmetrics-driverpagedcode"></a>Driver Paged Code

**Most applicable to:** Driver developers, OEMs

The driver vendor has the most influence on this metric. OEMs can influence this metric by swapping out hardware and software drivers that have lower memory requirements.

This is memory allocated for the drivers paged code. The more of this there is, the more likely that some of it is paged out to disk, requiring a hard fault to bring it back when it is needed. This can lead to a noticeable impact on user experience. In addition high memory allocations can lead to the operating system page out commonly used code that is also pagable. The more that is paged out, the greater the risk that a hard fault will occur to bring back commonly used code.

**Detailed Sub-metrics**

This is a list of the binaries and the amount of memory allocated in kilo-bytes. You can sort the list by size by right-clicking on the “Size” header and choosing “Sort Ascending”.

**Typical Influencing Factors**

OEMs can influence this metric by swapping out hardware or software drivers that have lower memory requirements.

**Analysis and Remediation Steps**

The driver vendor has the most influence over this metric by the way the driver is designed. Look for large memory allocations in the results presented in the Windows Assessment Console. In addition the driver vendors can be given WPA traces (stored in the same directory as the assessment results) of this assessment to find areas of heavy memory allocations that are candidates for investigations into reducing memory use. OEMs should consider replacing the device or getting updated drivers.

### Driver Non-Paged Code

**Most applicable to:** Driver developers, OEMs

The driver vendor has the most influence on this metric. OEMs can influence this metric by swapping out hardware drivers that have lower memory requirements.

This metric is the amount of memory that is being allocated and cannot be swapped out to the paging file. This consists of memory allocated for code, not for data. This reflects physical memory that is permanently in use and therefore is unavailable for paged memory.

**Detailed Sub-metrics**

This is a list of the binaries and the amount of memory allocated in kilo-bytes. You can sort the list by size by right-clicking on the **Size** header and choosing **Sort Descending**.

**Typical Influencing Factors**

OEMs can influence this metric by swapping out hardware or software drivers that have lower memory requirements.

**Analysis and Remediation Steps**

The driver vendor has the most influence over this metric by the way the driver is designed. Look for large memory allocations in the results presented in the Windows Assessment Console. In addition the driver vendors can be given WPA traces (stored in the same directory as the assessment results) of this assessment to find areas of heavy memory allocations that are candidates for investigations into reducing memory use.

### Process Private Pages

**Most applicable to:** OEMs

OEMs can influence this metric by reducing the number of “run always” applications (Applications in the Run registry key or in the Startup folder). OEMs should look for software they have added on top of the initial Microsoft image.

Memory is either shared or non-shared (i.e. private). It does not matter how the memory was allocated either via an allocation or a memory backed file. For example if you open two Microsoft Word documents some of the memory (code) can be shared between the two instances because the application is the same. But the data in the word documents is different so each instance needs to have private memory allocated for it. The Process Private Pages metric shows how much private memory is being allocated by each binary component listed in the drill down. This metric does not include shared memory.

Shared memory is memory that is allocated and assigned to a process. If the kernel gets a new request for this memory it can quickly respond by simply re-using the memory already allocated. But this must be a block of read only memory to maintain its status as “shared”. Once one or the other process wants to write to the shared memory a new block must be allocated and the kernel uses the new block for the “write” request. Regardless of how much memory is written the kernel must allocate at least one block of memory for the request. So even if we wanted to write one byte to shared memory, the kernel deals in blocks of memory so it would need to allocate a 4KB block.

**Detailed Sub-metrics**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Sub-metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>This is a list of binaries and their contribution to the total memory in use. This memory is active.</p></td>
</tr>
<tr class="even">
<td><p>Standby</p></td>
<td><p>This is a list of binaries and their contribution to the total memory in use. This memory is on the standby list which is memory that is still in physical memory but has been marked as no longer needed. This is memory that will be first to be replaced by new memory paged in by the memory manager or moved back into the active list if needed.</p></td>
</tr>
</tbody>
</table>

 

**Typical Influencing Factors**

OEMs can influence this metric by swapping out software drivers that have lower memory requirements.

**Analysis and Remediation Steps**

Driver and software vendors have the most influence over this metric by the way their code is designed. Look for large memory allocations in the results presented in the Windows Assessment Console. In addition, the software vendors can be given WPA traces (stored in the same directory as the assessment results) of this assessment to find areas of heavy memory allocations that are candidates for investigations into reducing memory use. Careful analyses of allocations, even small ones, help the developer to find allocations that add up.

### Binaries (In Use)

**Most applicable to:** OEMs

OEM’s can influence this number by adding or removing devices from the system. In addition some software and services use kernel mode drivers. Look for software in the startup path or always running software and services. The software itself may not show large memory allocations, but the process will have dependencies that could have large memory requirements.

This is a list of binaries that have had memory allocated for their use. This is another way to view the data revealed in other metrics. This is all the allocations associated with a particular binary.

**Detailed Sub-metrics**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Sub-metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>This is a list of binaries and their contribution to the total memory in use. This memory is in use.</p></td>
</tr>
<tr class="even">
<td><p>Standby</p></td>
<td><p>This is a list of binaries and their contribution to the total memory in use. This memory is on the standby list which is memory that is still in physical memory but has been marked as no longer needed. This is memory that will be first to be replaced by new memory paged in by the memory manager or moved back into the active list if needed.</p></td>
</tr>
</tbody>
</table>

 

**Typical Influencing Factors**

OEMs can influence this metric by swapping out hardware or software drivers that have lower memory requirements. In addition OEMs can reduce the number of devices on the system.

**Analysis and Remediation Steps**

The driver vendor has the most influence over this metric by the way the driver is designed. Look for large memory allocations in the results presented in the Windows Assessment Console. In addition the driver vendors can be given WPA traces (stored in the same directory as the assessment results) of this assessment to find areas of heavy memory allocations that are candidates for investigations into reducing memory use.

### Map Files

**Most applicable to:** OEMs, software vendors

OEMs can influence this number by adding or removing devices from the system. In addition some software and services use kernel mode drivers. Software vendors can influence this metric by finding other ways to implement a feature that does not use memory mapped files.

This is a list of binaries that are using memory mapped I/O. This is all the memory mapped memory associated with a particular binary. It includes both code and data associated (shared and non-shared) with the particular binary. Large memory mapped files can have a negative influence on performance.

**Detailed Sub-metrics**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Sub-metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>This is a list of binaries and their contribution to the total memory in use. This memory is in use.</p></td>
</tr>
<tr class="even">
<td><p>Standby</p></td>
<td><p>This is a list of binaries and their contribution to the total memory in use. This memory is on the standby list which is memory that is still in physical memory but has been marked as no longer needed. This is memory that will be first to be replaced by new memory paged in by the memory manager or moved back into the active list if needed.</p></td>
</tr>
</tbody>
</table>

 

**Typical Influencing Factors**

OEMs can influence this metric by swapping out hardware or software drivers that have lower memory requirements. In addition OEMs can reduce the number of devices on the system. Consider reducing the number of unique processes that are running at a time.

**Analysis and Remediation Steps**

Large allocations of memory mapped to a location on disk cannot participate in any of the optimizations offered by the Memory Manger. The driver vendor has the most influence over this metric by the way the driver is designed. Look for large memory allocations in the results presented in the Windows Assessment Console. In addition the driver vendors can be given WPA traces (stored in the same directory as the assessment results) of this assessment to find areas of heavy memory allocations that are candidates for investigations into reducing memory use.

## <a href="" id="bkmk-memoryissues"></a>Issues


There are no specific issues generated for the Memory Footprint assessment. This assessment provides only metrics to help analysis of memory values because the results that are shown in one system configuration can be so different from another. The best use for this assessment is to identify drivers, processes, or applications that are using too much memory. You can also use this assessment is to compare the memory footprint of two or more computers.

**Note**  
This assessment uses symbols to make sure that its results show driver memory as driver allocations instead of kernel allocations. Without the use of symbols, the assessment analysis may incorrectly identify a memory allocation source. For more information about missing symbols and assessment accuracy, see [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

 

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

### Recommendations for Driver and Software Vendors

-   Use the minimum memory required to do the job.

-   Load just the memory you need, when you need it, and free it as soon as you are done.

-   Know the various ways you can load memory and use the appropriate APIs.

-   Determine if driver code or data needs to stay resident in physical RAM or if it can be allowed to be paged in and out.

-   Understand the paging file, how it works, and what impact it will have on your scenarios.

-   Don’t create a monolithic driver that services multiple devices. Keep the driver small and have it address just the concerns of the device it serves.

### Recommendations for OEMs

-   See the impact of drivers and software you install on top of a clean image before you deploy.

-   Consult your driver and software vendors for the latest versions of their software to see if they can reduce the impact on memory.

-   Consider using a different driver or software vendor that can supply you with like functionality with lower impact on system memory.

## Related topics


[Memory Footprint](memory-footprint.md)

[Windows Assessment Toolkit](index.md)

[Assessments](assessments.md)

[Windows Assessments Console step-by-step guide](windows-assessment-console-step-by-step-guide.md)

[MSDN: Windows Memory Management](http://go.microsoft.com/fwlink/?LinkId=271597)

 

 







