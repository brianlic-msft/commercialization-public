---
title: Overlay for Unified Write Filter (UWF)
description: Overlay for Unified Write Filter (UWF)
MS-HAID:
- 'p\_embedded.overlay\_for\_unified\_write\_filter\_\_uwf\_\_blue'
- 'p\_enterprise\_customizations.overlay\_for\_unified\_write\_filter\_uwf'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: baaf34ad-e859-4f8a-9ae1-5b5675d4b2e7
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Overlay for Unified Write Filter (UWF)


Unified Write Filter (UWF) protects the contents of a volume by redirecting all write operations on that volume to the overlay, which is a virtual representation of the changes to the volume. Conceptually, an overlay is similar to a transparency overlay on an overhead projector. Any change that is made to the transparency overlay affects the projected picture as it is seen by the viewer. However, if the transparency overlay is removed, the underlying picture remains unchanged.

In a UWF protected system, UWF creates a single overlay, which contains information about writes to all protected volumes on a system. The overlay supports up to 16 terabytes of protected volumes.

## Overlay storage


You can configure UWF to store the overlay either entirely in RAM (RAM-based), or to store the overlay in a pre-allocated file on the system volume (disk-based).

All information in the overlay is lost after a device restarts or experiences a power loss, regardless of how the overlay is stored.

The overlay is created the first time the file system mounts a volume. Each time that UWF redirects a write attempt to the overlay, the disk sectors that would be modified are copied to the overlay. Because file systems do not access individual sectors on a volume, but rather clusters of sectors, the entire cluster that would be modified is copied to the overlay.

When the file system erases or deletes files that do not exist on the protected volume, UWF removes unneeded clusters from the overlay and returns the freed resources to the available pool. This primarily affects the overlay size when temporary files are created and then deleted.

### RAM-based overlay

In a RAM-based overlay, all overlay information is kept in system memory. Because RAM-based overlays reduce access to the physical volume, they can reduce wear on write-sensitive media. RAM-based overlays can be used with read-only media.

As applications continue to write to protected volumes, a RAM-based overlay consumes available free RAM until the overlay reaches a specified maximum size or reaches critically low levels of available RAM, which requires that the system be restarted. Because RAM is typically much more expensive than disk space, available RAM usually limits how long your system can operate before needing to be restarted.

**Important**  
When you use a RAM-based overlay, make sure to leave enough available RAM to meet at least the minimum required RAM for the system to run. For example, if your OS requires at least 2 GB of RAM, and your device has 4 GB of RAM, set the maximum size of the overlay to 2 GB or less.

 

### Disk-based overlay

In a disk-based overlay, UWF uses a pre-allocated file created on the system volume to increase the available space for the overlay. The maximum size of the overlay is limited to the size of the disk file. The disk file does not dynamically grow in size, but must be pre-allocated on the volume. Disk-based overlays require a "Maximum Overlay Size" of 1024 MB.

## Overlay thresholds and notifications


Because overlays grow in size and consume available resources as applications continue to write to protected volumes, you may want to have your device notify the user when available resources are critically low. You can configure UWF to write an event to the error log when the size of the overlay reaches or exceeds a configurable value. UWF uses Event Tracing for Windows (ETW) to write the event message.

You can configure a warning threshold level and a critical threshold level for the overlay size in UWF. The warning threshold value must be lower than the critical threshold value. When the size of the overlay exceeds these values, UWF writes an event. If the overlay size is reduced to below the threshold levels, possibly from deleting temporary files, UWF writes an event to indicate that the overlay size has returned to a normal operating size.

**Caution**  
The warning and critical thresholds are triggered when the overlay size increases to meet the threshold values, and are not based on the amount of available resources remaining.

 

For more information, see [UWF\_Overlay.SetWarningThreshold](uwf-overlaysetwarningthreshold.md) and [UWF\_Overlay.SetCriticalThreshold](uwf-overlaysetcriticalthreshold.md).

## Overlay exhaustion


If the size of the overlay is close to or equal to the maximum overlay size, any write attempts will fail, returning an error indicating that there is not enough space to complete the operation. If the overlay on your device reaches this state, your device may become unresponsive and sluggish, and you may need to restart your device.

When Windows shuts down, it attempts to write a number of files to the disk. If the overlay is full, these write attempts fail, causing Windows to attempt to rewrite the files repeatedly until UWF can determine that the device is trying to shut down and resolve the issue. Attempting to shut down by using normal methods when the overlay is full or near to full can result in the device taking a long time, in some cases up to an hour or longer, to shut down.

You can often avoid this issue by using UWF to initiate the shut down or restart. You can do this by using the following methods:

-   Use the shutdown command with [uwfmgr.exe](uwfmgrexe.md).

-   Use the restart command with [uwfmgr.exe](uwfmgrexe.md).

-   Use the [UWF\_Filter.ShutdownSystem](uwf-filtershutdownsystem.md) method in the WMI provider [UWF\_Filter](uwf-filter.md).

-   Use the [UWF\_Filter.RestartSystem](uwf-filterrestartsystem.md) method in the WMI provider [UWF\_Filter](uwf-filter.md).

## Related topics


[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Overlay%20for%20Unified%20Write%20Filter%20%28UWF%29%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





