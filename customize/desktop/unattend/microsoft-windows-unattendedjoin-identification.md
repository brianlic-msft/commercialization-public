---
title: Identification
description: Identification
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8de86456-1cd7-4c63-a03d-b03191be8874
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Identification


`Identification` specifies credentials to join a domain, the name of the domain to join, the workgroup to assign to the computer, and other options.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Credentials](microsoft-windows-unattendedjoin-identification-credentials.md)</p></td>
<td><p>Specifies [Domain](microsoft-windows-unattendedjoin-identification-credentials-domain.md), [Username](microsoft-windows-unattendedjoin-identification-credentials-username.md), and [Password](microsoft-windows-unattendedjoin-identification-credentials-password.md) used to join a domain for an unattended installation.</p></td>
</tr>
<tr class="even">
<td><p>[DebugJoin](microsoft-windows-unattendedjoin-identification-debugjoin.md)</p></td>
<td><p>Specifies whether to run a debug routine after any unattended domain-join attempts have failed. The routine breaks into the kernel debugger.</p></td>
</tr>
<tr class="odd">
<td><p>[DebugJoinOnlyOnThisError](microsoft-windows-unattendedjoin-identification-debugjoinonlyonthiserror.md)</p></td>
<td><p>Specifies a debugging routine to start in [DebugJoin](microsoft-windows-unattendedjoin-identification-debugjoin.md) only after encountering an error specified in the setting.</p></td>
</tr>
<tr class="even">
<td><p>[JoinDomain](microsoft-windows-unattendedjoin-identification-joindomain.md)</p></td>
<td><p>Specifies the name of the domain to join. If this value is set, [JoinWorkgroup](microsoft-windows-unattendedjoin-identification-joinworkgroup.md) is ignored.</p></td>
</tr>
<tr class="odd">
<td><p>[JoinWorkgroup](microsoft-windows-unattendedjoin-identification-joinworkgroup.md)</p></td>
<td><p>Specifies the name of the workgroup to assign to a computer. If this value is set, [JoinDomain](microsoft-windows-unattendedjoin-identification-joindomain.md) cannot be set.</p></td>
</tr>
<tr class="even">
<td><p>[MachineObjectOU](microsoft-windows-unattendedjoin-identification-machineobjectou.md)</p></td>
<td><p>Specifies the Lightweight Directory Access Protocol (LDAP) X.500-distinguished name of the organizational unit (OU) in which the computer account is created. This account is in Active Directory on a domain controller in the domain to which the computer is being joined.</p></td>
</tr>
<tr class="odd">
<td><p>[MachinePassword](microsoft-windows-unattendedjoin-identification-machinepassword.md)</p></td>
<td><p>Specifies the unique password for the computer. Typically, this setting is not required unless the computer account has been previously created in the domain.</p></td>
</tr>
<tr class="even">
<td><p>[Provisioning](microsoft-windows-unattendedjoin-identification-provisioning.md)</p></td>
<td><p>Specifies the account information used to join a domain during Windows Setup.</p></td>
</tr>
<tr class="odd">
<td><p>[TimeoutPeriodInMinutes](microsoft-windows-unattendedjoin-identification-timeoutperiodinminutes.md)</p></td>
<td><p>Specifies the number of minutes that Windows will wait before timing out when Windows tries to join a domain. This change increases the default timeout from 7 to 15 minutes.</p></td>
</tr>
<tr class="even">
<td><p>[UnsecureJoin](microsoft-windows-unattendedjoin-identification-unsecurejoin.md)</p></td>
<td><p>Specifies adding the computer to the domain without requiring a unique password.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | **Identification**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows how to set the identification settings.

``` syntax
<Identification>
   <Credentials>
      <Domain>fabrikam.com</Domain>
      <Password>MyPassword</Password>
      <Username>MyUserName</Username>
   </Credentials>
   <JoinDomain>fabrikam.com</JoinDomain>
   <MachinePassword>ComputerPassword</MachinePassword>
</Identification>
```

## Related topics


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Identification%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





