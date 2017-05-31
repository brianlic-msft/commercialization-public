---
title: EVENT\_TRACE\_FLAG\_VIRTUAL\_ALLOC
description: EVENT\_TRACE\_FLAG\_VIRTUAL\_ALLOC
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 01bbdf2d-20e2-4588-a90b-4c962e69cbc1
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EVENT\_TRACE\_FLAG\_VIRTUAL\_ALLOC


This flag enables capture of virtual allocations and free events.

``` syntax
#define EVENT_TRACE_FLAG_VIRTUAL_ALLOC 0x00004000
```

## Remarks


A single kernel trace control flag enables or disables logging of a kernel event type. For more information about kernel flags and corresponding kernel events, see [EVENT\_TRACE\_PROPERTIES Structure](http://go.microsoft.com/fwlink/p/?linkid=212231&clcid=0x409).

**Requirements:**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Trace Control Flags](trace-control-flags.md)

 

 







