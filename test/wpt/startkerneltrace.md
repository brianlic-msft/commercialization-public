---
title: StartKernelTrace
description: StartKernelTrace
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b8eab537-85ae-441e-aea9-486626ec0c16
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# StartKernelTrace


This function registers and starts a kernel event tracing session. You can also enable stackwalking for certain kernel events using this function.

``` syntax
ULONG
WINAPI
StartKernelTrace(
__out PTRACEHANDLE TraceHandle,
__inout PEVENT_TRACE_PROPERTIES Properties,
__in ULONG cStackTracingEventIds
);
```

## Parameters


<a href="" id="tracehandle--out-"></a>*TraceHandle* \[out\]  
Stores a handle to an event tracing session. This parameter is set to zero if the handle is not valid. This parameter should not be compared to INVALID\_HANDLE\_VALUE. Do not use this handle if the function fails.

<a href="" id="properties--in--out-"></a>*Properties* \[in, out\]  
Stores a pointer to an [EVENT\_TRACE\_PROPERTIES structure](http://go.microsoft.com/fwlink/p/?linkid=212231&clcid=0x409). EVENT\_TRACE\_PROPERTIES configures certain aspects of session behavior.

The first member of the EVENT\_TRACE\_PROPERTIES structure is a [WNODE\_HEADER structure](http://go.microsoft.com/fwlink/p/?LinkID=212222&clcid=0x409), referred to here as **Wnode**.

The following EVENT\_TRACE\_PROPERTIES.Wnode members must be set in order to configure kernel trace control.

<a href="" id="buffersize"></a>**BufferSize**  
This member contains the total size, in bytes, of memory allocated for the event tracing session properties. The size of memory must include enough space to store the following data:

-   The EVENT\_TRACE\_PROPERTIES structure.

-   The session name string.

-   The log file name string.

<a href="" id="guid"></a>**Guid**  
Each tracing session must have a GUID defined to reference the session.

For an NT kernel logger session, this member must be set to SystemTraceControlGuid. For more information about logging mode constants, see [NT Kernel Logger Constants](http://go.microsoft.com/fwlink/p/?LinkID=212229&clcid=0x409).

<a href="" id="clientcontext"></a>**ClientContext**  
This member sets the clock resolution that is used when the logging time stamp for each event is calculated. The default value for this member is a query performance counter.

You can specify one of the following values:

-   **1:** Query performance counter (QPC). The QPC provides a high-resolution (100-nanosecond) time stamp, but is comparatively more expensive to retrieve. Use this resolution if you have high event rates or if the consumer merges events from different buffers. On older computers, the time stamp may not be accurate because the counter sometimes skips forward due to hardware errors.

-   **2:** System time. The system time provides a low-resolution (10-millisecond) time stamp, but is comparatively less expensive to retrieve. If the volume of events is high, the resolution for system time may not be fine enough to determine the sequence of events. In this case, a set of events will have the same time stamp, but the order in which ETW delivers the events may not be correct.

-   **3:** CPU cycle counter. The CPU counter provides the highest-resolution time stamp and is the least expensive to retrieve. However, the CPU counter is unreliable and should not be used in production. For example, on some computers, the timer changes frequency due to thermal and power changes, in addition to stopping in some states. If your hardware does not support this clock type, ETW uses system time. In Windows Server 2003, Windows XP with SP1, and Windows XP, this value is not supported. It was introduced in Windows Server 2003 with SP1 and Windows XP with SP2.

<a href="" id="flags"></a>**Flags**  
This member must contain WNODE\_FLAG\_TRACED\_GUID to indicate that the structure contains event tracing information and the information is sent to a logger. WNODE\_FLAG\_TRACED\_GUID is defined in Evntrace.h.

The following EVENT\_TRACE\_PROPERTIES members must also be set:

<a href="" id="logfilemode"></a>**LogFileMode**  
Indicates which logging modes are to be used in the kernel event tracing session. You can use this member to specify that events are to be written to a log file, a real-time consumer, or both.

This member can also be used to specify that the session is a private logger session. One or more modes can be specified. For a list of possible modes, see [Logging Mode Constants](https://msdn.microsoft.com/library/windows/desktop/aa364080.aspx).

**Note**  
Do not specify real-time logging unless there are real-time consumers ready to consume the events. If there are no real-time consumers, the events are written to a playback file. The size of the playback file is limited. If the limit is reached, no new events are logged to the log file or the playback file. The logging functions fail with STATUS\_LOG\_FILE\_FULL.

 

<a href="" id="enableflags"></a>**EnableFlags**  
This member is used only for NT kernel logger sessions. It identifies to the kernel logger which events to trace. By using logical **OR**, this member can contain one or more values. In addition to the events specified, the kernel logger also logs hardware configuration events.

The following trace control flags are available in addition to the ones provided by EVENT\_TRACE\_PROPERTIES:

-   [EVENT\_TRACE\_FLAG\_DISPATCHER](https://msdn.microsoft.com/library/dn640677.aspx)

-   [EVENT\_TRACE\_FLAG\_VIRTUAL\_ALLOC](https://msdn.microsoft.com/library/dn631804.aspx)

<a href="" id="logfilenameoffset"></a>**LogFileNameOffset**  
This number represents the offset from the start of the memory allocated to the structure to the start of the null-terminated string that contains the log file name.

The following considerations apply:

-   The file name extension should be .etl.

-   All folders in the path must exist.

-   The path can be relative, absolute, local, or remote.

-   The path must not contain environment variables, because those variables are not expanded.

-   The user who initiates the trace must have write permission on the folder.

-   The log file name is limited to 1024 characters.

-   If you set **LogFileMode** to EVENT\_TRACE\_PRIVATE\_LOGGER\_MODE or EVENT\_TRACE\_FILE\_MODE\_NEWFILE, be sure to allocate enough memory to include the process identifier that is appended to the file name for private logger sessions and the sequential number that is added to log files created using the new file log mode.

-   If you do not want to log events to a log file (for example, you specify EVENT\_TRACE\_REAL\_TIME\_MODE only), set **LogFileNameOffset** to zero. If you specify only real-time logging and also provide an offset with a valid log file name, the log file name is used to create a sequential log file and log events to the log file. The sequential log file is also created if **LogFileMode** is zero and you provide an offset with a valid log file name.

-   If you want to log events to a log file, you must allocate enough memory for this structure to include the log file name and session name following the structure. The log file name must follow the session name in memory.

-   Trace files are created using the default security descriptor, meaning that the log file will have the same ACL as the parent directory. If you want to restrict access to the files, create a parent directory with the appropriate ACLs.

<a href="" id="loggernameoffset"></a>**LoggerNameOffset**  
This member represents the offset from the start of the memory allocated to the structure to the start of the null-terminated string that contains the session name.

The following considerations apply:

-   The session name is limited to 1024 characters.

-   The session name is case-insensitive and must be unique.

-   When allocating memory for this structure, sufficient memory must be reserved to include the session name and log file name following the structure.

-   The session name must come before the log file name in memory. The log file name must be copied into the offset area. This function writes the session name defined by KERNEL\_LOGGER\_NAME.

According to the type of log file chosen, it may be necessary to set the **MaximumFileSize** member.

**Note**  
It is not necessary to set the logger name at the **LoggerNameOffset** because this function always uses the KERNEL\_LOGGER\_NAME value to call StartKernelTrace. This function checks whether the **Wnode.Guid** corresponds to **SystemTraceControlGuid**; if not, it returns ERROR\_INVALID\_PARAMETER. If **Wnode.Guid** corresponds to **KernelRundownGuid**, the logger name should be specified. The **KernelRundownGuid** is the control GUID used to log events such as existing process information, thread information, images loaded per process, and hardware configuration such as CPU, video, disk, network cards, services, power, Plug and Play, and disk IDE channels.

 

## Return Value


ERROR\_SUCCESS indicates success.

Possible error values are described in the following table.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Error Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>ERROR_ALREADY_EXISTS</p></td>
<td><p>Only a single instance of the kernel logger runs on the system. If this function attempts to start after another component has started kernel logging, this error is possibly returned.</p></td>
</tr>
<tr class="even">
<td><p>ERROR_INVALID_FLAGS</p></td>
<td><p>Possibly indicates that there are invalid trace flags in <strong>Properties.EnableFlags</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>ERROR_OUT_OF_MEMORY</p></td>
<td><p>Possibly indicates failure to allocate memory for EVENT_TRACE_PROPERTIES.</p></td>
</tr>
</tbody>
</table>

 

If the function fails for a reason other than those listed, a system error code is returned.

## Remarks


If **StackTracingEventIds** contain events that are not enabled in the **EVENT\_TRACE\_PROPERTIES.EnableFlags** field or could not be decoded by Kernel Trace Control, those flags are ignored, and no error code is returned.

**Requirements:**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Functions](functions-wpa.md)

[Custom Injection of System Information](custom-injection-of-system-information.md)

 

 







