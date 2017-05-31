---
title: Kernel Trace Control API Reference
description: Kernel Trace Control API Reference
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 16ecacd5-25aa-43d7-b842-cb8f92db8eeb
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Kernel Trace Control API Reference


This API enables capturing kernel stack traces, merging multiple trace files for analysis, heap tracing, and including system information in the merged files.

The Kernel Trace Control API became available in Windows Vista.

On Windows 7 and Windows Vista, stackwalking on x64 systems requires that you set the **DisablePagingExecutive** registry value in **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management**. For more information, see [DisablePagingExecutive](http://go.microsoft.com/fwlink/p/?linkid=213095).

**Note**  Systems with Windows 8 and higher do not need this registry change.

 

The following example shows how to query for this registry value.

``` syntax
@REG QUERY "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" -v DisablePagingExecutive
```

The following example shows how to enable stackwalking.

``` syntax
@REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" -v DisablePagingExecutive -d 0x1 -t REG_DWORD -f
@IF NOT %ERRORLEVEL% == 0 echo error: Could not configure system for 64-bit stackwalking. Please run this script from an elevated administrator console.
```

**Note**  
To make these changes effective, you must restart the system.

 

The following example shows how to disable stackwalking.

``` syntax
@REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" -v DisablePagingExecutive -d 0x0 -t REG_DWORD -f
@IF NOT %ERRORLEVEL% == 0 echo error: Could not remove 64-bit stackwalking configuration. Please run this script from an elevated administrator console.
```

**Note**  
To make these changes effective, you must restart the system.

 

## In This Section


[Functions](functions-wpa.md)

[Structures](structures-wpa.md)

[Trace Control Flags](trace-control-flags.md)

[Trace Control Event Types](trace-control-event-types.md)

[Custom Injection of System Information](custom-injection-of-system-information.md)

## Related topics


[Windows Performance Toolkit Technical Reference](windows-performance-toolkit-technical-reference.md)

 

 







