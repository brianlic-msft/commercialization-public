---
title: Credentials
description: Credentials
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b2a48f43-e841-4b17-ae68-17da016c30b6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Credentials


`Credentials` specifies the domain, the user name, and the password used to join a domain during Windows Setup.

**Note**  
Use either [Provisioning](microsoft-windows-unattendedjoin-identification-provisioning.md) or Credentials to join an account to the domain. The settings in Provisioning will be used to join the account to the domain, if values are entered for both the Provisioning and Credentials settings.

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Domain](microsoft-windows-unattendedjoin-identification-credentials-domain.md)</p></td>
<td><p>Specifies the domain of the account used when joining a domain.</p></td>
</tr>
<tr class="even">
<td><p>[Password](microsoft-windows-unattendedjoin-identification-credentials-password.md)</p></td>
<td><p>Specifies the password of the user account used for authentication when joining a domain.</p></td>
</tr>
<tr class="odd">
<td><p>[Username](microsoft-windows-unattendedjoin-identification-credentials-username.md)</p></td>
<td><p>Specifies the user account used for authentication when joining a domain.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [Identification](microsoft-windows-unattendedjoin-identification.md) | **Credentials**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

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


[Identification](microsoft-windows-unattendedjoin-identification.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Credentials%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





