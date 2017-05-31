---
title: DiskConfiguration
description: DiskConfiguration
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 25509a92-38c8-45e7-9fed-19a5b0ec09cf
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DiskConfiguration


`DiskConfiguration` contains the settings that Windows uses to partition and to configure one or more physical hard disks.

Valid disk partition configurations vary depending on whether you are using a BIOS-based computer or a Unified Extensible Firmware Interface (UEFI)-based computer. For more information, see the [Manage Hard Disks and Partitions](http://go.microsoft.com/fwlink/?LinkId=206671) topic in the Windows Assessment and Deployment Kit (Windows ADK) Technical Reference.

You can configure disk partitions manually in the disk configuration user interface (UI) in Windows Setup, or automatically by using settings in the [Disk](microsoft-windows-setup-diskconfiguration-disk.md) element. If you do not specify a `Disk` element and the [WillShowUI](microsoft-windows-setup-diskconfiguration-willshowui.md) setting is set to **Never**, Windows logs an error, and the installation terminates.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DisableEncryptedDiskProvisioning](microsoft-windows-setup-diskconfiguration-disableencrypteddiskprovisioning.md)</p></td>
<td><p>Specifies whether Windows activates encryption on blank drives that are capable of hardware-based encryption.</p></td>
</tr>
<tr class="even">
<td><p>[Disk](microsoft-windows-setup-diskconfiguration-disk.md)</p></td>
<td><p>Specifies the disk configurations to apply to a disk on the destination computer.</p></td>
</tr>
<tr class="odd">
<td><p>[WillShowUI](microsoft-windows-setup-diskconfiguration-willshowui.md)</p></td>
<td><p>Specifies whether to show the disk configuration UI in Windows Setup.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **DiskConfiguration**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


### Manual Configuration

The following XML output for the `DiskConfiguration` setting shows how to specify that you will configure disk partitions manually through the disk configuration UI in Windows Setup:

``` syntax
<DiskConfiguration>
   <WillShowUI>Always</WillShowUI>
</DiskConfiguration>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DiskConfiguration%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





