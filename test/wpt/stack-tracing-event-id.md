---
title: STACK\_TRACING\_EVENT\_ID
description: STACK\_TRACING\_EVENT\_ID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f03d36fd-9f14-4212-9be6-717e42c18f6f
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# STACK\_TRACING\_EVENT\_ID


This structure tells the kernel logger to include the call stack for the named events.

``` syntax
typedef struct _STACK_TRACING_EVENT_ID {
GUID EventGuid; 
UCHAR Type; 
UCHAR Reserved[7]; 
} STACK_TRACING_EVENT_ID, *PSTACK_TRACING_EVENT_ID
```

## Members


<a href="" id="eventguid"></a>**EventGuid**  
The GUID that identifies a specific kernel event configured to generate call stacks. For more information about this member, see [NT Kernel Logger Constants](http://go.microsoft.com/fwlink/p/?LinkID=212227&clcid=0x409). **EventGuids** are listed in Evntrace.h.

<a href="" id="type"></a>**Type**  
One of the EVENT\_TRACE\_TYPE\_\* types from evntrace.h or one of the [Trace Control Event Types](https://msdn.microsoft.com/library/windows/hardware/dn640668.aspx).

<a href="" id="reserved"></a>**Reserved**  
Reserved for future use.

## Remarks


The members of this structure are identical to those of the CLASSIC\_EVENT\_ID structure available in the Windows 7 and Windows Server 2008 SDK:

``` syntax
typedef struct _CLASSIC_EVENT_ID {
GUID EventGuid; 
UCHAR Type; 
UCHAR Reserved[7]; 
} CLASSIC_EVENT_ID, *PCLASSIC_EVENT_ID;
```

**Requirements:**

**Versions:** Available beginning in Windows Vista. This structure is distributed with Windows Performance Analyzer.

**Headers:** Declared in KernelTraceControl.h. Include KernelTraceControl.h.

**Library:** Contained in KernelTraceControl.dll.

## Related topics


[Structures](structures-wpa.md)

 

 







