---
title: Common In-Depth Analysis Issues
description: Common In-Depth Analysis Issues
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 00b00834-8c8e-4f46-bf5e-40c15903f026
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Common In-Depth Analysis Issues


Assessments set predefined analysis thresholds for the completion of an activity that it's measuring. Assessments identify and report issues when activity durations exceed these thresholds. Some assessments in the Windows Assessment Toolkit perform advanced issue analysis. You can view these issues in the Windows Assessment Console and the Windows Assessment Services - Client (Windows ASC), and further analyze them in Windows Performance Analyzer (WPA).

**Note**  
Issues that are generated from the assessments come from several sources. This topic only describes some common advanced analysis issues.

 

In the Windows Assessment Console and the Windows ASC, issues that are reported by assessments appear in 2 locations: in the left column of the **Results View** page and in the details pane on the right. On the **Results View** page, issues, warnings and errors appear in the run information table and in the assessment results table. You can group these issues by right-clicking **Issues** and then selecting criteria to group by. In the details pane, issues are sorted by severity. You can filter them by using keywords and metadata. For more information, see [Group, Filter, and Search Issues](group-filter-and-search-issues.md).

When you open WPA using the link in the Results View, you can see a list of issues that the assessment has identified in the WPA **Issues** window. When you choose one of these issues, details and a recommended solution appear in the WPA **Details** window. For more information about WPA, see [Windows Performance Analyzer](http://go.microsoft.com/fwlink/?LinkId=214551).

In this topic:

-   [Issue Format](#formatissue)

-   [Managed code](#managedcode)

-   [Processor use](#excessprocessor)

-   [Storage use](#excessstorage)

-   [Processing Delays](#processingdelays)

-   [Storage I/O Delays](#storageiodekays)

-   [Registry Flushes](#registryhiveflushes)

-   [Time Accounting](#timeaccounting)

-   [Missing Symbols](#missingsymbols)

-   [DPCs and ISRs](#dpcisr)

-   [Summary Issues](#summaryissues)

-   [Assessment logging](#logging)

## <a href="" id="formatissue"></a>Issue Format


Most of the issues that appear in the details pane in the Windows Assessment Console and the Windows ASC have a common structure that can include:

-   **Title**

    The title contains essential information about an issue, like metrics that quantify the issue and the name of the activity that was affected. Title information can also include the phase that the assessment was in when it detected the issue.

-   **Recommendation**

    Whenever possible, the details pane provides steps to resolve a detected problem. And it sometimes offers guidance to assist further investigation of the issue. This information can include methodologies or best practices to help you optimize performance or in other ways overcome the problem that the assessment identified.

-   **More information**

    In some cases, the details pane provides additional information as a link to a website that can provide information about the steps that you can take to resolve the issue.

-   **Further analysis**

    For advanced analysis issues, the details pane provides a WPA in-depth analysis link so that you can open WPA and further investigate the source of the issue.

    When WPA opens, additional details might be available depending on the type of issue that the assessment identified, such as:

    -   Process image details include file and version information about the process that generated the identified issue, including:

        -   File name

        -   File path

        -   File description

        -   File version

        -   Manufacturer

    -   Summary of disk activity by file, including:

        -   Size and counts of disk reads and writes

        -   Counts of disk flushes

    -   Summary of CPU activity by process/threads, including:

        -   Impact, in terms of CPU time, of each thread of the process

        -   Call stacks that show where the performance impact occurred and for how long

    -   Summary of delays that are caused by CPU or disk activity by process or threads, including:

        -   Threads or processes that were delayed, including the duration of the delay

        -   Impact of each thread of the process, including the duration of the delay

        -   Call stacks for each thread that causes the delay or is affected by it

            **Note**  
            The information that the call stacks provide is a statistical representation of an activity. Its accuracy depends on the samples that the assessment collected.

             

## <a href="" id="managedcode"></a>Managed Code


Managed code refers to code that's running under the Microsoft .NET Common Language Runtime (CLR). The CLR manages the execution of applications that are based on the Microsoft .NET Framework. CLR processes start during Windows boot and can cause additional resource consumption, which can extend boot time. Files that the .NET Framework reads during CLR initialization can add megabytes of storage reads that can delay the boot process and the appearance of the **Start** screen.

**Issue example**

*&lt;X&gt;*.exe is a managed-code startup process.

**Recommendation**

For issues in the category of managed code, if a .NET Framework-based application or service is critical to Windows boot, we recommend that you avoid the use of managed code. If you can't avoid the use of managed code, we recommend delaying the start of the .NET Framework-based application or service to avoid contending with resources that are needed for other essential applications or services at Windows boot.

Using managed code involves some performance overhead, and the per-call overhead can become very noticeable. In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to determine the source of the overhead, and then reduce the delays by following any of these steps:

-   Avoid using nonessential managed code in the boot path.

-   Use the Task Scheduler to start applications later.

-   Start applications only on demand or when triggered. For more information, see [\[MSDN\] Developing Efficient Background Process for Windows](http://go.microsoft.com/fwlink/?LinkId=233633).

## <a href="" id="excessprocessor"></a>Processor Use


High CPU use by applications and services can contribute to a poor user experience, like UI unresponsiveness and video and sound glitches. When a process thread that's running at normal or high priority exceeds a threshold value for use of processor resources, the assessment flags the process as an issue and calculates the delay. When a single process uses too much CPU, other processes can be delayed because they must compete for system resources. Generated issues are color coded as red or yellow in terms of their impact on the CPU.

**Issue example**

Process *&lt;X&gt;* uses the CPU for 5.3 seconds during Fast startup resume post on/off.

**Recommendation**

In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to determine which function of the process needs further investigation. Excessive processor use can occur in more than one thread at a time. For each thread that's involved, view the function call stacks in WPA.

**Note**  
The information that the call stacks provide is a statistical representation of an activity. Its accuracy depends on the samples that the assessment collected.

 

## <a href="" id="excessstorage"></a>Storage Use


A process can perform storage reads, writes, or flushes at run time. Because a hard drive is a single shared resource, excessive or unnecessary use of storage might cause significant performance issues that the assessment identifies.

**Issue examples**

Process *&lt;X&gt;*.exe reads 23 megabytes (MB) from storage during Fast startup resume post on/off.

Process *&lt;X&gt;*.exe flushes 12 times to storage during Fast startup resume post on/off.

**Recommendation**

In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to review a summary list of the top file I/Os. Use this list to find files that cause excessive reads or writes. For disk flushes, locate the call stacks that point to the source.

-   For excessive disk reads or writes, we recommend that you reduce the amount of data that the process handles or defer reading or writing to a later time.

-   For I/Os that can't be reduced or deferred, we recommend that you use I/O sizes of 64 kilobytes (KB) to 128 KB to avoid small disruptive streams that can significantly interfere with other outstanding I/O activity.

-   Disk flushes affect I/O activity by other processes. You should perform disk flushes only when they're necessary.

## <a href="" id="processingdelays"></a>Processing Delays


When a thread uses CPU or disk resources, it increases the duration of the activity. Contention over the processor often manifests as thread starvation and/or preemption. The analysis section of this issue consists of all threads affected by the process, which were first preempted or starved, and later readied after the process completed.

A thread waits for work to complete. Once the work is finished, the DPC readies this waiting thread.

The thread ID of the waiting thread and its cumulative wait time appear in the issue details. Expand the issue details to view the wait stack of this thread.

In complex activities, it is commonplace for a thread to wait on another thread that waits on another thread, that waits for work to finish. A DPC, running thread, the scheduler, or another mechanism readies the most recent waiting thread. This most recent waiting thread runs once again and readies the thread waiting for it. The process repeats with each waiting thread until the earliest waiting thread is readied and runs again.

The issue details describe this sequence of control transfers in chronological order. For example:

Thread 712 of process csrss.exe (600) waits for 374 milliseconds

Thread 2724 of process explorer.exe (1836) waits for 374 milliseconds

Thread 4748 of process explorer.exe (1836) sleeps for 373 milliseconds

Timer DPC readies thread 4748

Thread 4748 readies waiting thread 2724

Thread 2724 readies waiting thread 712

During an activity, the same sequence of control transfers may repeat many times. The wait times are cumulative.

Choose a sentence that describes a waiting thread to view a stack that includes the waiting function. Choose a sentence that describes a thread readying another thread to view a stack that shows the readying function.

The waiting stack of the innermost thread, thread 4748 in the example above, usually provides a good idea about the source of the delay. The stack frames preceding the waiting function along with the file information that follows the stack may provide further insight about the issue.

The types of processing delays include:

-   **CPU use**

    When a thread runs—regardless of its priority during the activity that you're analyzing—it consumes CPU time, contributes to the total time of the activity, and can delay completion.

    **Issue example**

    CPU use by process *&lt;X&gt;* delays the activity, Fast startup resume explorer initialization, for 125 milliseconds.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to analyze call stacks for the thread that causes the delay.

-   **Starvation**

    Thread starvation that occurs while a process is running can cause a delay in the completion of an activity. A thread is starved when it's ready to run but other threads prevent it from running immediately.

    **Issue example**

    Process *&lt;X&gt;* is starved. The starvation causes a delay to the activity Fast startup resume explorer initialization of 50 milliseconds.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to see which thread was starved and which thread or threads prevented the starved thread from running. Determine the cause of starvation of the thread by looking at the issue details and observing the function call stacks.

-   **Preemption**

    A running thread is preempted when another thread that has a higher priority runs instead. The higher-priority thread causes a delay in the completion of the other thread's activity.

    **Issue example**

    Process *&lt;X&gt;* is preempted. The preemption causes a delay to the activity Fast startup resume explorer initialization of 150 milliseconds.

    **Recommendation**

    For more information about thread scheduling, see [Thread Scheduling](http://go.microsoft.com/fwlink/?LinkId=242231).

-   **Sleep**

    Threads sleep when they call one of the available Windows sleep functions, like **SleepEx**. This introduces a delay in the completion of the thread activity.

    **Issue example**

    Process *&lt;X&gt;* delays the activity Fast startup suspend device BAR by sleeping for 4.0 seconds.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link. You can determine the cause of unexpected thread sleep can from the function call stacks and the file information.

## <a href="" id="storageiodekays"></a>Storage I/O Delays


When a thread uses storage resources, it can increase the duration of the activity. When multiple threads contend for the use of storage, the resulting random disk seeks make delays more significant.

The types of storage delays include:

-   **Storage reads and writes**

    The following issue contains the sum of all delays that reads (or writes) cause during an activity.

    **Issue example**

    Activity Fast-startup resume explorer initialization incurs a 1.2 second delay due to 2.3MB of reads from storage.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to see threads sorted by highest delay first and a recommendation to improve the performance during this activity.

-   **Storage flushes**

    The following issue shows the sum of all flushes that contributed to delays in the activity.

    **Issue example**

    Activity Fast-startup resume explorer initialization incurs a 300 millisecond delay due to 4 flushes to storage.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to see the call stacks for each thread that causes flushes to disk, and to identify the relevant code that contributed to the activity delay.

## <a href="" id="registryhiveflushes"></a>Registry Flushes


Registry flushes occur when processes explicitly use the **RegFlushKey** function after they complete a registry modification. Assessments have determined that registry flushes can be an important contributor to user-perceived performance problems.

You don't have to use the **RegFlushKey** function for every change to the registry. This function is best used only when you must apply a registry change to disk immediately.

There are 2 types of registry flush issues:

-   Processes that are identified for flushing the registry one or more times. These issues are categorized as high priority.

    **Issue example**

    One or more processes flush a registry hive during Fast startup resume post on/off.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to examine each thread of the process or processes that caused this behavior. WPA provides the relevant function call stacks where the activity occurred.

-   Processes that are flushing the registry during an activity and causing a delay in the completion of the activity.

    **Issue example**

    Process *&lt;X&gt;* delays the activity Fast startup suspend call subscriber profiles by flushing a registry hive for 405 milliseconds.

    **Recommendation**

    In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to analyze the function call stacks for each thread of the processes.

## <a href="" id="timeaccounting"></a>Time Accounting


Assessments typically report multiple issues per activity. Time accounting issues show the combined time that multiple issues account for, as well as any portion of the activity not accounted for by the issues. If an activity consists of many short duration issues, and they are below the analysis threshold, they are not reported as individual issues. This design helps to highlight the most impactful issues so you can focus your investigation on them.

**Activity duration threshold**

This threshold is the time that the entire activity is expected to take. Time Accounting issues report on the measured duration of the activity, as well as the activity duration threshold set by the assessment.

**Minimum Analysis threshold**

Issues are reported if and only if the impact they describe is greater than the analysis threshold.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Type 1:</strong></p>
<p>The activity duration exceeds the activity duration threshold. The activity also has issues that exceed the analysis threshold.</p></td>
<td><p><strong>Issue example</strong></p>
<p>Summary: Fast startup shutdown process Example.exe takes 6.5 seconds, and exceeds the threshold of 2 seconds. The assessment identified other issues that impact this activity. These other issues fully account for this activity's time.</p></td>
</tr>
<tr class="even">
<td><p><strong>Type 2:</strong></p>
<p>The activity duration exceeds the activity duration threshold. The activity also has a mixed set of issues—some that are greater than the analysis threshold and others that are less than the analysis threshold.</p></td>
<td><p><strong>Issue example</strong></p>
<p>Summary: Fast startup shutdown process Example.exe takes 6.5 seconds, and exceeds the threshold of 2.0 seconds. The assessment identified other issues that impact this activity. These other issues account for 5.9 seconds of this activity's time. The remaining 500 milliseconds consist of issues that do not exceed the minimum analysis threshold of 150 milliseconds.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Type 3:</strong></p>
<p>The activity duration exceeds the activity duration threshold. All the issues that impact this activity are less than the analysis threshold and are therefore not displayed.</p></td>
<td><p><strong>Issue example</strong></p>
<p>Summary: Fast startup shutdown process Example.exe takes 6.5 seconds, and exceeds the threshold of 2.0 seconds. The assessment identified other issues that impact this activity. These other issues that impact this activity do not exceed the minimum analysis threshold of 200 milliseconds so they are omitted.</p></td>
</tr>
<tr class="even">
<td><p><strong>Type 4:</strong></p>
<p>The activity duration exceeds the period when assessment logging was active. However, the delays were found in the activity when logging was active. These delays were caused by CPU or Disk contention.</p></td>
<td><p><strong>Issue example</strong></p>
<p>Summary: The duration of Fast startup resume post on/off is unknown because this activity completes after assessment logging ends. 4 seconds of this activity, while assessment logging is active, are due to CPU contention.</p></td>
</tr>
</tbody>
</table>

 

**Recommendation**

In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to view this Issue in Windows Performance Analyzer. Investigate the details of this activity’s behavior to understand the root cause of the delays, when reported. Follow these steps to view the related issues:

1.  Use the filter options to view all of the issues related to the activity cited in the Issue Title.

2.  When viewing the full list of issues, choose plus (+) and select **Activity** from the filter options list.

3.  In the **Issue Activity** filter box, type the name of the activity. From the list of named activities, choose the specific activity. You will obtain a filtered list of Issues related to this Time Accounting Summary issue.

For more information about how to discover related issues, see [Group, Filter, and Search Issues](group-filter-and-search-issues.md).

## <a href="" id="missingsymbols"></a>Missing Symbols


Some assessments require access to symbols. In some cases, the information in the assessment results can be incorrect or incomplete, if a symbol server isn't available. In many cases, Internet connectivity and access to the Microsoft public symbol server satisfy this dependency. In other cases, you can set up a private symbol server or install the symbols on the local computer.

The types of symbols used include:

-   **Critical symbols:** If these symbols are not available the assessment cannot complete full analysis of the data it collected. In this case, the issue text will contain specific module names for the modules that do not have symbols configured and available during assessment analysis.

-   **Symbols for 3rd party components:** If these symbols are not available, the assessment will complete successfully but its results may be incorrect or incomplete. The issue details generated may contain incomplete or incorrect information when viewed in the Windows Performance Analyzer. For example, when looking at the Issue Details section, the call stacks displayed may have missing function names for a particular component.

-   **Kernel symbols:** The Memory Footprint assessment uses Kernel symbols for its analysis. If it does not find these symbols configured, it will create an issue in the results that mentions the absence of symbols after the assessment completes.

**Recommendation**

Critical symbols missing: Ensure that the machine has access to the Microsoft public symbol server. This issue can be resolved by pointing to the right symbols location, or by installing the symbols on a local drive.

Symbols of non-Microsoft components missing: These missing symbols could be for your own components, or for those owned by a different partner. Collaborate with your partners to obtain these third-party symbols for the component that is missing symbols, and configure the correct symbols path on the computer before re-running the assessment.

**Note**  
For more information about setting the correct symbols path, see [Troubleshooting Windows Assessment Services](http://go.microsoft.com/fwlink/?LinkId=246155).

 

Sharing components’ symbols across partners in the ecosystem ensures better collaboration through a reliable and efficient bug triage and analysis process. We recommend that partners define these collaborative relationships, which will ensure that you have the resources you need to find the root cause of the issues reported on your system component.

## <a href="" id="dpcisr"></a>DPCs and ISRs


Long-running Deferred Procedure Calls (DPCs) and Interrupt Service Routines (ISRs) can introduce delays that extend the duration of an activity, and this latency could be perceived by users as a performance issue.

DPC (and ISR) issues usually require deeper analysis by engineers familiar with the work related to the DPC (or ISR). The in-depth analysis for this issue varies by the type of DPC causing the delay or resource use.

**DPCs that delay an activity**

A thread waits for work to complete. Once the work is finished, the DPC readies this waiting thread.

The thread ID of the waiting thread and its cumulative wait time appear in the issue details. Expand the issue details to view the wait stack of this thread.

In complex activities, it is commonplace for a thread to wait on another thread that waits on another thread, that waits for work to finish. A DPC, running thread, the scheduler, or another mechanism readies the most recent waiting thread. This most recent waiting thread runs once again and readies the thread waiting for it. The process repeats with each waiting thread until the earliest waiting thread is readied and runs again.

The issue details describe this sequence of control transfers in chronological order. For example:

Thread 712 of process csrss.exe (600) waits for 374 milliseconds

Thread 2724 of process explorer.exe (1836) waits for 374 milliseconds

Thread 4748 of process explorer.exe (1836) sleeps for 373 milliseconds

Timer DPC readies thread 4748

Thread 4748 readies waiting thread 2724

Thread 2724 readies waiting thread 712

During an activity, the same sequence of control transfers may repeat many times. The wait times are cumulative.

Choose a sentence that describes a waiting thread to view a stack that includes the waiting function. Choose a sentence that describes a thread readying another thread to view a stack that shows the readying function.

The waiting stack of the innermost thread, thread 4748 in the example above, usually provides a good idea about the source of the delay. The stack frames preceding the waiting function along with the file information that follows the stack may provide further insight about the issue.

DPC-related delays can be classified into these three types, as seen in these examples.

**Issue examples**

Network DPCs: Network use delays the activity Fast startup overall resume by 4.0 seconds

Timer DPCs: Activity Fast startup shutdown process Example.exe is delayed by 5.3 seconds

Activity Fast startup suspend device BAR incurs a 2.6 second delay due to a waiting thread. DPC Example.sys readies this waiting thread.

**DPCs or ISRs that occur during an activity**

This type of issue highlights lengthy ISRs or DPCs that are likely to impact the performance of the scenario. The issues do not tie this ISR/DPC activity to delay duration.

The Issue Details list each thread preempted by the ISR/DPC. The list is roughly in descending preemption time order. Expand a thread in the list to view a stack that approximates the thread activity that the ISR/DPC preempts.

**Issue example**

DPC exceeds the threshold of 1.0 milliseconds 5 times during Media engine lifetime. The 5 instances of this DPC run for a combined total of 3.7 seconds

**Note**  
The information provided in the call stacks is a statistical representation of the activity in question (sampled once every millisecond), and its accuracy is dependent on the samples collected by the assessment.

 

## <a href="" id="summaryissues"></a>Summary Issues


Summary issues contain an overview of the issues identified by the assessment that demonstrate a particular performance behavior, and help visualize the broader impact of these on the system. Here are the different types of Summary Issues that could feature in assessment results.

**Activity disk footprint summary**

The disk footprint is the combined contribution of all processes that issue storage I/O in the form of storage reads, writes and flushes during an activity. This summary provides additional insight into the disk footprint, beyond the storage use issues already reported in the assessment results.

The issue’s details in WPA contain file image information, and recommendations to improve the performance of the scenario. The analysis also contains the list of processes contributing to the disk footprint, in decreasing order of impact.

**Issue examples**

Summary: Fast startup overall resume issues 275MB of reads and writes, and flushes 82 times to storage

**Note**  
When issues are grouped by **Category** on the **Results View** page, this summary issue appears above its related issues under the **Storage Use** group.

 

**Processor use summary**

The processor use summary issue aggregates similar issues already identified by the assessment along with less impactful issues during the activity. This summary provides a broader perspective of all related processor use issues.

The summary issue provides details per process in descending order of impact. For each process, the issue shows a function call stack that combines activity from all threads in the process, and CPU and file image information. The individual issues, when present, contain more detailed function call stacks for each applicable thread.

**Issue examples**

Summary: Processes use 26.9 seconds of CPU time during Fast startup overall resume

**Note**  
When issues are grouped by **Category** on the **Results View** page, this summary issue appears above its related issues under the **Processor Use** group.

 

**Processor and disk contention summary**

This issue summarizes delays to the activity due to contention for processor and disk resources. Contending activity interferes with tasks that are critical to the completion of the scenario. The issue details list the different sub-activities involved, in descending order of the amount of contention.

Other information such as function call stacks and file information per thread is available within each of the individual issues reported by the assessment.

**Issue examples**

Summary: Fast startup overall suspend takes 29.5 seconds. Of this time, 300 milliseconds are due to CPU contention.

When issues are grouped by **Category** on the **Results View** page, this summary issue appears above its related issues under the **Processor delays** group.

**Recommendation**

Summary issues can help focus your investigation on the most impactful issues. Reading the summary issues by themselves often provides insight into the broader impact of these issues put together.

To get the full benefits of summary issues, you can group the list of issues in the Windows Assessment Console by using one of these two criteria.

-   **Category**. This is the default and recommended view for Summary Issues, where they are grouped together with identical/comparable issues of a particular type.

-   **Test case**. In this view, the Summary Issue is grouped together with the subset of issues that apply to a particular activity or test case.

**Warning**  
The information provided in the call stacks is a statistical representation of the activity in question (sampled once every millisecond), and its accuracy is dependent on the samples collected by the assessment.

 

## <a href="" id="logging"></a>Assessment Logging


Assessments rely on Event Tracing for Windows (ETW) logging to collect data for analysis. This logging uses system resources. This issue category accounts for the storage activity that occurs while the assessment is running.

**Issue example**

Assessment logs 39 MB to storage during Fast startup resume post on/off.

**Recommendation**

In the **Further analysis** area of the issue, choose the WPA in-depth analysis link to find information about storage writes to log files.

## Related topics


[Windows Assessment Console](windows-assessment-console.md)

[Assessments](assessments.md)

 

 







