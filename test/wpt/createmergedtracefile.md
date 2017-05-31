---
title: CreateMergedTraceFile
description: CreateMergedTraceFile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d641530d-2be1-4266-962b-97863cff2e57
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CreateMergedTraceFile


This function merges multiple trace files into a single output file.

``` syntax
ULONG
WINAPI
CreateMergedTraceFile(
__in LPCWSTR wszMergedFileName,
__in LPCWSTR wszTraceFileNames[],
__in ULONG cTraceFileNames,
__in DWORD dwExtendedDataFlags
);
```

## Parameters


<a href="" id="wszmergedfilename--in-"></a>*wszMergedFileName* \[in\]  
Specifies the name of the output trace file.

<a href="" id="wsztracefilenames--in-"></a>*wszTraceFileNames* \[in\]  
Pointer to an array of trace files to be merged.

<a href="" id="ctracefilenames--in-"></a>*cTraceFileNames* \[in\]  
Count of the elements in the *wszTraceFileNames* array.

<a href="" id="dwextendeddataflags--in-"></a>*dwExtendedDataFlags* \[in\]  
These flags specify the system information to be injected into the merged trace file. For more information about valid flags, see [Custom Injection of System Information](custom-injection-of-system-information.md).

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
<td><p>ERROR_INSUFFICIENT_BUFFER</p></td>
<td><p>Possibly indicates that the merged trace does not contain a complete set of events from each file.</p></td>
</tr>
<tr class="even">
<td><p>ERROR_REVISION_MISMATCH</p></td>
<td><p>Possibly indicates that the trace files being merged contain events with different versions that could not be merged.</p></td>
</tr>
</tbody>
</table>

 

If neither of these error values is returned, a system error code is returned.

## Remarks


You can merge two or more trace files from simultaneous sessions that were captured on the same computer into a single trace file. You can also merge trace files from other tracing sessions if those files have the same boot times. Optionally, the merge operation adds metadata concerning the traces.

This function can inject extended data into a single trace file. In this case the *wszMergedFileName* array contains only a single element, which is the name of the trace file.

**Note**  
An unmerged kernel trace cannot decode symbols correctly.

 

The API is implemented in Unicode only.

**Requirements**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Functions](functions-wpa.md)

[Custom Injection of System Information](custom-injection-of-system-information.md)

 

 







