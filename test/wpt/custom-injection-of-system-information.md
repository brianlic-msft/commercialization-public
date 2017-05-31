---
title: Custom Injection of System Information
description: Custom Injection of System Information
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 18d70466-eb0c-4a3a-a711-59cda913b477
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Custom Injection of System Information


Kernel Trace Control allows custom injection of system information when multiple trace files are merged into a single output trace file. To include system information, a single flag or combination of flags is set in the [CreateMergedTraceFile](createmergedtracefile.md) function. The following flags define the system information to be added to the merged trace file:

<a href="" id="-define-event-trace-merge-extended-data-none-0x00000000"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_NONE 0x00000000  
No system information should be added to the merged trace file.

<a href="" id="-define-event-trace-merge-extended-data-imageid-0x00000001"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_IMAGEID 0x00000001  
Inject image information such as checksum and timestamp used during symbol lookup.

<a href="" id="-define-event-trace-merge-extended-data-buildinfo-0x00000002"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_BUILDINFO 0x00000002  
Inject operating system build information such as product name and build lab.

<a href="" id="-define-event-trace-merge-extended-data-volume-mapping-0x00000004"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_VOLUME\_MAPPING 0x00000004  
Inject volume mapping between MS-DOS and Windows NT paths. The payload of the event contains two NULL-terminated Unicode strings. The first string contains the Windows NT path and the second string contains the MS-DOS path. The length of the payload is the size, in bytes, of the two strings including the NULL characters.

For example, a Windows NT path “\\Device\\HarddiskVolume1\\” would be translated to the MS-DOS path “C:\\”.

<a href="" id="-define-event-trace-merge-extended-data-winsat-0x00000008"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_WINSAT 0x00000008  
Inject WinSat information.

<a href="" id="-define-event-trace-merge-extended-data-event-metadata-0x00000010"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_EVENT\_METADATA 0x00000010  
Inject trace data header (TDH) metadata for events that are captured on computers other than the computer on which the events are being analyzed. For more information about trace data header information, see [Event Tracing](https://msdn.microsoft.com/library/bb968803.aspx).

<a href="" id="-define-event-metadata-log-type-trace-event-info-0x20"></a>\#define EVENT\_METADATA\_LOG\_TYPE\_TRACE\_EVENT\_INFO 0x20  
Inject trace information that identifies the events logged through EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_EVENT\_METADATA.

<a href="" id="-define-event-metadata-log-type-event-map-info-0x21"></a>\#define EVENT\_METADATA\_LOG\_TYPE\_EVENT\_MAP\_INFO 0x21  
Inject information that defines the metadata for the events logged as a result of setting the EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_EVENT\_METADATA flag. For more information, see [EVENT\_MAP\_INFO Structure](https://msdn.microsoft.com/library/windows/desktop/aa964762.aspx).

<a href="" id="-define-event-trace-merge-extended-data-perftrack-metadata-0x00000020"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_PERFTRACK\_METADATA 0x00000020  
Inject **PerfTrack** events metadata for decoding of **PerfTrack** events on different computers. These events are injected only on Windows 7 and Windows Server 2008.

<a href="" id="-define-event-trace-merge-extended-data-default-0x000fffff"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_DEFAULT 0x000FFFFF  
Inject the data for image, build, volume mapping, WinSat, event metadata, and **PerfTrack** metadata.

<a href="" id="-define-event-trace-merge-extended-data-all-0xfffffff"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_ALL 0xFFFFFFF  
Inject all extended data information to the output trace file.

<a href="" id="-define-event-trace-merge-extended-data-network-interface-0x00000040"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_NETWORK\_INTERFACE 0x00000040  
Inject network interface information.

<a href="" id="-define-event-trace-merge-extended-data-ngen-pdb------------0x00000080"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_NGEN\_PDB 0x00000080  
Create PDBs to enable symbol loading for NGEN binaries that appear in the trace.

<a href="" id="-define-event-trace-merge-extended-data-compress-trace------0x10000000"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_COMPRESS\_TRACE 0x10000000  
Compress the merged trace. Only supported on Windows 8 and higher.

<a href="" id="-define-event-trace-merge-extended-data-inject-only---------0x40000000"></a>\#define EVENT\_TRACE\_MERGE\_EXTENDED\_DATA\_INJECT\_ONLY 0x40000000  
Only inject image identification information, do not copy events from the input trace(s).

## Remarks


**Requirements:**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Kernel Trace Control API Reference](kernel-trace-control-api-reference.md)

[CreateMergedTraceFile](createmergedtracefile.md)

 

 







