---
title: MachineObjectOU
description: MachineObjectOU
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0820e49f-3ae2-4175-8ea2-1fb0a8fca5a6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MachineObjectOU


`MachineObjectOU` is an optional setting. It specifies the Lightweight Directory Access Protocol (LDAP) X 500-distinguished name of the organizational unit (OU) in which the computer account is created. This account is in Active Directory on a domain controller in the domain to which the computer is being joined.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>MachineObjectOU</em></p></td>
<td><p>Specifies the full LDAP path name of the OU to which the computer belongs. For example,</p>
<p><code>OU=MyOu,DC=MyDom,DC=MyCompany,DC=com</code></p>
<p><em>MachineObjectOU</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [Identification](microsoft-windows-unattendedjoin-identification.md) | **MachineObjectOU**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows how to set the OU.

``` syntax
<MachineObjectOU>OU=MyOu,OU=MyParentOu,DC=MyDomain,DC=MyCompany,DC=com</MachineObjectOU>
```

## Related topics


[Identification](microsoft-windows-unattendedjoin-identification.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20MachineObjectOU%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





