---
title: DisableEncryptedDiskProvisioning
description: DisableEncryptedDiskProvisioning
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 368c6dc6-6308-4354-9ca4-b9c2db89a74b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DisableEncryptedDiskProvisioning


`DisableEncryptedDiskProvisioning` specifies whether Windows activates encryption on blank drives that are capable of hardware-based encryption during installation.

By default, Windows activates drives that are capable of hardware-based encryption by using a fixed access control list (ACL) that is based on the Opal Security Subsystem Class (Opal SSC) specification.

**Note**  
Use the [TCGSecurityActivationDisabled](microsoft-windows-enhancedstorage-admtcgsecurityactivationdisabled.md) unattend setting to enable the Group Policy setting, **Do not automatically encrypt files moved to encrypted folders**, after Windows is installed and started up. The setting specifies, for unprovisioned eDrives, whether security should be activated on the eDrive during provisioning.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that Windows does not activate encryption on blank drives, even if those drives are capable of hardware-based encryption.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that Windows activates encryption on blank drives that are capable of hardware-based encryption. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | **DisableEncryptedDiskProvisioning**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output for the `DisableEncryptedDiskProvisioning` setting shows how to specify that Windows does not activate encryption on blank drives, even if those drives are capable of hardware-based encryption.

``` syntax
<DisableEncryptedDiskProvisioning>true</DisableEncryptedDiskProvisioning>
```

## Related topics


[DiskConfiguration](microsoft-windows-setup-diskconfiguration.md)

[TCGSecurityActivationDisabled](microsoft-windows-enhancedstorage-admtcgsecurityactivationdisabled.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DisableEncryptedDiskProvisioning%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





