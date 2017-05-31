---
title: stackwalk
description: stackwalk
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 00864c2f-0a49-4d6f-a65d-a792245f2875
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# stackwalk


Displays stack-walking options. Stack-walking flags can be specified either directly on the command line or in a file.

``` syntax
xperf -on base -stackwalk ThreadCreate+ProcessCreate
```

- Or -

``` syntax
xperf -on base -stackwalk ThreadCreate -stackwalk ProcessCreate
```

- Or -

``` syntax
xperf -on base -stackwalk @stack.txt
```

- Or -

``` syntax
xperf -on base -stackwalk 0x0501
```

## Remarks


Custom stack walking flags can be specified in format: 0x*mmnn*, where *mm* is event group and *nn* is event type.

The file can contain empty lines or comments that are prefixed by an exclamation mark (!).

The following list shows the recognized stack-walking flags:

-   AlpcClosePort

-   AlpcConnectFail

-   AlpcConnectRequest

-   AlpcConnectSuccess

-   AlpcReceiveMessage

-   AlpcSendMessage

-   AlpcUnwait

-   AlpcWaitForNewMessage

-   AlpcWaitForReply

-   CcCanIWriteFail

-   CcFlushCache

-   CcFlushSection

-   CcLazyWriteScan

-   CcReadAhead

-   CcWorkitemComplete

-   CcWorkitemDequeue

-   CcWorkitemEnqueue

-   CcWriteBehind

-   ContiguousMemoryGeneration

-   CritSecCollision

-   CSwitch

-   DiskFlushInit

-   DiskReadInit

-   DiskWriteInit

-   ExecutiveResource

-   FileCleanup

-   FileClose

-   FileCreate

-   FileDelete

-   FileDirEnum

-   FileDirNotify

-   FileFlush

-   FileFSCTL

-   FileOpEnd

-   FileQueryInformation

-   FileRead

-   FileRename

-   FileSetInformation

-   FileWrite

-   HardFault

-   HeapAlloc

-   HeapCreate

-   HeapDestroy

-   HeapFree

-   HeapRangeCreate

-   HeapRangeDestroy

-   HeapRangeRelease

-   HeapRangeReserve

-   HeapRealloc

-   ImageLoad

-   ImageUnload

-   KernelQueueDequeue

-   KernelQueueEnqueue

-   KernelSignal

-   KernelSignalInit

-   KernelSync

-   KernelSyncAll

-   KernelWaitSync

-   KernelWaitSyncAll

-   MapFile

-   Mark

-   MiniFilterPostOpInit

-   MiniFilterPreOpInit

-   PagefaultAV

-   PagefaultCopyOnWrite

-   PagefaultDemandZero

-   PagefaultGuard

-   PagefaultHard

-   PagefaultTransition

-   PagefileBackedImageMapping

-   PageRangeAccess

-   PageRangeRelease

-   PoolAlloc

-   PoolAllocSession

-   PoolFree

-   PoolFreeSession

-   PowerDeviceNotify

-   PowerDeviceNotifyComplete

-   PowerIdleStateChange

-   PowerPerfStateChange

-   PowerPostSleep

-   PowerPreSleep

-   PowerSessionCallout

-   PowerSessionCalloutReturn

-   PowerSetDevicesState

-   PowerSetDevicesStateReturn

-   PowerSetPowerAction

-   PowerSetPowerActionReturn

-   PowerThermalConstraint

-   ProcessCreate

-   ProcessDelete

-   Profile

-   ProfileSetInterval

-   ReadyThread

-   RegCloseKey

-   RegCreateKey

-   RegDeleteKey

-   RegDeleteValue

-   RegEnumerateKey

-   RegEnumerateValueKey

-   RegFlush

-   RegKcbCreate

-   RegKcbDelete

-   RegOpenKey

-   RegQueryKey

-   RegQueryMultipleValue

-   RegQueryValue

-   RegSetInformation

-   RegSetValue

-   RegVirtualize

-   SplitIO

-   SyscallEnter

-   SyscallExit

-   ThreadCreate

-   ThreadDelete

-   ThreadPoolCallbackCancel

-   ThreadPoolCallbackDequeue

-   ThreadPoolCallbackEnqueue

-   ThreadPoolCallbackStart

-   ThreadPoolCallbackStop

-   ThreadPoolClose

-   ThreadPoolCreate

-   ThreadPoolSetMaxThreads

-   ThreadPoolSetMinThreads

-   ThreadSetBasePriority

-   ThreadSetPriority

-   TimerSetOneShot

-   TimerSetPeriodic

-   UnMapFile

-   VirtualAlloc

-   VirtualFree

## Example


The stack-walking flag file can contain any number of stack-walking flags per line, separated by spaces, plus signs (+), or on new lines, as shown in the following example.

``` syntax
ThreadCreate ProcessCreate
DiskReadInit+DiskWriteInit+DiskFlushInit
CSwitch
```

## Related topics


[Xperf Options](xperf-options.md)

 

 







