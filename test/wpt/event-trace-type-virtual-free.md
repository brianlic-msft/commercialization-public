---
title: EVENT\_TRACE\_TYPE\_VIRTUAL\_FREE
description: EVENT\_TRACE\_TYPE\_VIRTUAL\_FREE
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1c547a82-5e5e-4c0e-b3b5-5830f5a52bab
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EVENT\_TRACE\_TYPE\_VIRTUAL\_FREE


This flag enables stack tracing for virtual memory free events.

``` syntax
#define EVENT_TRACE_TYPE_VIRTUAL_FREE 0x63
```

## Remarks


This event type is similar to the event types used in the **EVENT\_TRACE\_PROPERTIES.EnableFlags** member but is particular to the Kernel Trace Control API.

**Requirements:**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Trace Control Event Types](trace-control-event-types.md)

 

 







