---
title: TCGSecurityActivationDisabled
description: TCGSecurityActivationDisabled
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f9ace2c5-cfc4-451b-b635-a8a9bc6594fb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TCGSecurityActivationDisabled


`TCGSecurityActivationDisabled` specifies whether Windows automatically configures encrypted drives (eDrives), also known as encrypted hard disk drives (eHDDs).

`TCGSecurityActivationDisabled` sets the Group Policy administrative template setting: **Do not automatically encrypt files moved to encrypted folders**. This Group Policy setting is used after Windows is installed and started up. The setting specifies, for unprovisioned eDrives, whether security should be activated on the eDrive during provisioning. Use the [DisableEncryptedDiskProvisioning](microsoft-windows-setup-diskconfiguration-disableencrypteddiskprovisioning.md) unattend setting for configuring the operating system installation for the target HDD.

**Note**  
The eDrive must be configured in the unattend file by using the settings in microsoft-windows-setup-\\DiskConfiguration\\Disk. If the drives are configured manually, then the eDrive configuration policy may not be properly configured.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>1</strong></p></td>
<td><p>Specifies that Windows does not automatically encrypt eDrives.</p></td>
</tr>
<tr class="even">
<td><p><strong>0</strong></p></td>
<td><p>Specifies that Windows automatically encrypts eDrives. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-EnhancedStorage-Adm](microsoft-windows-enhancedstorage-adm.md) | **TCGSecurityActivationDisabled**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-EnhancedStorage-Adm](microsoft-windows-enhancedstorage-adm.md).

## XML Example


The following XML output shows how to configure Windows so that Windows does not automatically encrypt eDrives.

``` syntax
<TCGSecurityActivationDisabled>1</TCGSecurityActivationDisabled>
```

## Related topics


[Encrypted Drives (eDrive) Reference](http://go.microsoft.com/fwlink/?LinkId=217371)

[Microsoft-Windows-EnhancedStorage-Adm](microsoft-windows-enhancedstorage-adm.md)

[DisableEncryptedDiskProvisioning](microsoft-windows-setup-diskconfiguration-disableencrypteddiskprovisioning.md)

[DiskConfiguration](microsoft-windows-setup-diskconfiguration.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TCGSecurityActivationDisabled%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





