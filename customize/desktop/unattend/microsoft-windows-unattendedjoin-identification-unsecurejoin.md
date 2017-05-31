---
title: UnsecureJoin
description: UnsecureJoin
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c0d4b51c-3e13-4ba8-aa43-a2392bc33c66
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UnsecureJoin


`UnsecureJoin` specifies whether to add the computer to the domain without requiring a unique password. `UnsecureJoin` is performed, by using a null session with a pre-existing account. This means there is no authentication to the domain controller when configuring the machine account; it is done anonymously. The account must have a well-known password or a specified value for [MachinePassword](microsoft-windows-unattendedjoin-identification-machinepassword.md). The well-known password is the first 14 characters of the computer name in lower case. For more information, see MachinePassword. If the well-known password is used, then the password is changed to a strong password by Netlogon after the join completes.

**Note**  
If `UnsecureJoin` is enabled, do not create settings for [Domain](microsoft-windows-unattendedjoin-identification-credentials-domain.md), [Username](microsoft-windows-unattendedjoin-identification-credentials-username.md), or [Password](microsoft-windows-unattendedjoin-identification-credentials-password.md).

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Adds the computer to the domain without requiring that [Domain](microsoft-windows-unattendedjoin-identification-credentials-domain.md), [Username](microsoft-windows-unattendedjoin-identification-credentials-username.md), and [Password](microsoft-windows-unattendedjoin-identification-credentials-password.md) are specified in the Credentials section for authentication to the domain during the domain join process.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Requires that a valid [Domain](microsoft-windows-unattendedjoin-identification-credentials-domain.md), [Username](microsoft-windows-unattendedjoin-identification-credentials-username.md), and [Password](microsoft-windows-unattendedjoin-identification-credentials-password.md) are specified in the [Credentials](microsoft-windows-unattendedjoin-identification-credentials.md) section for authentication to the domain during the domain join process. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
[Domain](microsoft-windows-unattendedjoin-identification-credentials-domain.md), [Username](microsoft-windows-unattendedjoin-identification-credentials-username.md), and [Password](microsoft-windows-unattendedjoin-identification-credentials-password.md) must not be specified in the Credentials section if `UnsecureJoin` is set to true.

 

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [Identification](microsoft-windows-unattendedjoin-identification.md) | **UnsecureJoin**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows the computer added to the domain without the requirement of a unique password.

``` syntax
<UnsecureJoin>true</UnsecureJoin>
```

## Related topics


[Identification](microsoft-windows-unattendedjoin-identification.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UnsecureJoin%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





