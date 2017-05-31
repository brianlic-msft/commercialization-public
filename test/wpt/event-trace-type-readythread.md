---
title: EVENT\_TRACE\_TYPE\_READYTHREAD
description: EVENT\_TRACE\_TYPE\_READYTHREAD
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a34bf78c-2d42-485e-a64c-e87256ba08c7
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EVENT\_TRACE\_TYPE\_READYTHREAD


This flag enables stack tracing for ReadyThread events.

``` syntax
#define EVENT_TRACE_TYPE_READYTHREAD 0x32
```

## Remarks


This event type is similar to the event types used in the **EVENT\_TRACE\_PROPERTIES.EnableFlags** member but is particular to the Kernel Trace Control API.

**Requirements:**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Trace Control Event Types](trace-control-event-types.md)

 

 







