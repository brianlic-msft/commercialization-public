---
title: Stack
description: Stack
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 21653c0c-ed2b-45d2-aecb-872eac23d3dd
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Stack


Describes the kernel events on which stacks are to be enabled.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemProvider](systemprovider.md)&gt;

               &lt;[Stacks](stacks.md)&gt;

                    &lt;**Stack**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;[SystemProviderId](systemproviderid.md)&gt;

                                &lt;[Stacks](stacks.md)&gt;

                                     &lt;**Stack**&gt;

                          &lt;[SystemProvider](systemprovider.md)&gt;

                                &lt;[Stacks](stacks.md)&gt;

                                     &lt;**Stack**&gt;

## Syntax


``` syntax
<Stack Value = "AlpcClosePort" | "AlpcConnectFail" | "AlpcConnectRequest" ...>
</Stack>
```

## Attributes and Elements


### Attributes

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Description</th>
<th>Data type</th>
<th>Required</th>
<th>Default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Value</strong></p></td>
<td><p>Indicates the system stack.</p></td>
<td><p>For possible values, see the Remarks section.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

### Child Elements

None.

### Parent Elements

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Stacks](stacks.md)</p></td>
<td><p>Represents a collection of stacks.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


The following table describes possible values for the **Value** attribute.

**AlpcClosePort**

An advanced local procedure call (ALPC) close port message.

**AlpcConnectFail**

An ALPC connect fail message.

**AlpcConnectRequest**

An ALPC connect request.

**AlpcConnectSuccess**

An ALPC connect request succeeded.

**AlpcReceiveMessage**

An ALPC message was received.

**AlpcSendMessage**

An ALPC messages was sent.

**AlpcUnwait**

An ALPC wait request was canceled.

**AlpcWaitForNewMessage**

An ALPC wait for new message request.

**AlpcWaitForReply**

An ALPC wait for reply request.

**CcCanIWriteFail**

**CcFlushCache**

**CcFlushSection**

**CcLazyWriteScan**

**CcReadAhead**

**CcWorkitemComplete**

**CcWorkitemDequeue**

**CcWorkitemEnqueue**

**CcWriteBehind**

**ContiguousMemoryGeneration**

An event for contiguous memory generation.

**CSwitch**

A context switch.

**DiskFlushInit**

Initialization of a disk flush.

**DiskReadInit**

Initialization of a disk read operation.

**DiskWriteInit**

Initialization of a disk write operation.

**ExecutiveResource**

An executive resource operation.

**FileCleanup**

File cleanup.

**FileClose**

Closing of a file.

**FileCreate**

Creation of a file.

**FileDelete**

Deletion of a file.

**FileDirEnum**

Enumeration of a file directory.

**FileDirNotify**

A file I/O event that is logged when a change directory control interrupt request procedure is received with a directory notification minor code.

**FileFlush**

A file flush.

**FileFSCTL**

A file system control operation.

**FileOpEnd**

The end of a file operation.

**FileQueryInformation**

A query for file information.

**FileRead**

A read from a file.

**FileRename**

Renaming of a file.

**FileSetInformation**

A change in file information.

**FileWrite**

A write to a file.

**HardFault**

A hard fault.

**HeapAllocation**

A heap allocation.

**HeapCreate**

Creation of a heap.

**HeapDestroy**

Destruction of a heap.

**HeapFree**

Freeing of a heap.

**HeapRangeCreate**

Creation of a heap range.

**HeapRangeDestroy**

Destruction of a heap range.

**HeapRangeRelease**

Release of a heap range.

**HeapRangeReserve**

A heap range has been reserved.

**HeapReallocation**

Reallocation of a heap.

**ImageLoad**

An image has been loaded.

**ImageUnload**

An image has been unloaded.

**KernelQueueEnqueue**

Something has been added to the kernel queue.

**KernelQueueDequeue**

Something has been removed from the kernel queue.

**KernelSignal**

**KernelSignalInit**

**KernelSync**

**KernelSyncAll**

**KernelWaitSync**

**KernelWaitSyncAll**

**MapFile**

A map file.

**Mark**

**MiniFilterPostOpInit**

**MiniFilterPreOpInit**

**PageAccess**

Access to a page.

**PagefaultAV**

An access violation page fault.

**PagefaultCopyOnWrite**

A copy-on-write page fault.

**PagefaultDemandZero**

A demand-zero page fault.

**PagefaultGuard**

A fault on a guard page.

**PagefaultHard**

A hard page fault.

**PagefaultTransition**

A transition page fault.

**PagefileBackedImageMapping**

**PagefileMappedSectionCreate**

Creation of a mapped section of a page file.

**PagefileMappedSectionDelete**

Deletion of a mapped section of a page file.

**PageRangeAccess**

Access to a page range.

**PageRangeRelease**

Release of a page range.

**PageRelease**

Release of a page.

**PoolAllocation**

A memory pool allocation.

**PoolAllocationSession**

Session pool allocation.

**PoolFree**

Freeing of a memory pool allocation.

**PoolFreeSession**

Freeing of a session pool.

**PowerDeviceNotify**

A power device notification.

**PowerDeviceNotifyComplete**

The end of a power device notification.

**PowerIdleStateChange**

A change in idle state.

**PowerPerfStateChange**

A power state change, including the old and new processor frequency and which processors it applies to.

**PowerPostSleep**

The device has emerged from a sleep state.

**PowerPreSleep**

The device is entering a sleep state.

**PowerSessionCallout**

The kernel is about to perform a power transition.

**PowerSessionCalloutReturn**

The **PowerSessionCallout** has completed, and logs status or errors.

**PowerSetDevicesState**

Setting of device power state.

**PowerSetDevicesStateReturn**

The **PowerSetDevicesState** has completed, and logs status or errors.

**PowerSetPowerAction**

Setting of a power action.

**PowerSetPowerActionReturn**

Indicates the status after a power action.

**PowerThermalConstraint**

An event that changes the thermal constraint or cap for a device.

**ProcessCreate**

A process has been created.

**ProcessDelete**

A process has been deleted.

**SampledProfile**

Indicates a sampled profile.

**SampledProfileSetInterval**

Setting of the sampling interval for a profile.

**ReadyThread**

A ready thread event.

**RegistryCloseKey**

Closing of a registry key.

**RegistryCreateKey**

Creation of a registry key.

**RegistryDeleteKey**

Deletion of a registry key.

**RegistryDeleteValue**

Deletion of a registry value.

**RegistryEnumerateKey**

Enumeration of a registry key.

**RegistryEnumerateValueKey**

Enumeration of a registry key value.

**RegistryFlush**

A registry flush.

**RegistryKcbCreate**

Creation of a registry Key Control Block.

**RegistryKcbDelete**

Deletion of a registry Key Control Block.

**RegistryOpenKey**

Opening of a registry key.

**RegistryQueryKey**

A query of a registry key.

**RegistryQueryMultipleValue**

A query of multiple registry values.

**RegistryQuerySecurity**

A query of registry security settings.

**RegistryQueryValue**

A query of a registry value.

**RegistrySetInformation**

Setting of registry information.

**RegistrySetSecurity**

Setting registry security.

**RegistrySetValue**

Setting of a registry value.

**RegistryVirtualize**

Virtualization of the registry.

**SplitIO**

Indicates I/O that was split into separate packets.

**SystemCallEnter**

The beginning of a system call.

**SystemCallExit**

The end of a system call.

**ThreadCreate**

Creation of a thread.

**ThreadDCEnd**

The end of a thread device context.

**ThreadDCStart**

The start of a thread device context.

**ThreadDelete**

Deletion of a thread.

**ThreadPoolCallbackCancel**

Canceling a threadpool callback.

**ThreadPoolCallbackDequeue**

Removing a threadpool callback from the queue.

**ThreadPoolCallbackEnqueue**

Placing a threadpool callback in the queue.

**ThreadPoolCallbackStart**

Beginning of a threadpool callback.

**ThreadPoolCallbackStop**

End of a threadpool callback.

**ThreadPoolClose**

Closing of a thread pool.

**ThreadPoolCreate**

Creation of a thread pool.

**ThreadPoolSetMaxThreads**

Setting the maximum number of threads in a thread pool.

**ThreadPoolSetMinThreads**

Setting the minimum number of threads in a thread pool.

**ThreadSetBasePriority**

Setting of the base priority of a thread.

**ThreadSetPriority**

Setting priority of a thread.

**TimerPeriodic**

A periodic timer event.

**TimerOnShot**

A one-shot timer event.

**UnMapFile**

Unmapping of a file.

**VirtualAllocation**

A virtual allocation of memory.

**VirtualFree**

A virtual freeing of memory.

 

## Related topics


[Elements](elements.md)

 

 







