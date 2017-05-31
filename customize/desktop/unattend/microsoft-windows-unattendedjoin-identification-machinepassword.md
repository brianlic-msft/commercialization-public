---
title: MachinePassword
description: MachinePassword
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 24489f22-ceb8-48ab-90d9-9ef92f8a0e29
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MachinePassword


`MachinePassword `is used with [UnsecureJoin](microsoft-windows-unattendedjoin-identification-unsecurejoin.md), which is performed by using a null session with a pre-existing account. This means there is no authentication to the domain controller when configuring the computer account. It is done anonymously. The account must have a well-known password or a specified `MachinePassword`. The well-known password is the first 14 characters of the computer name in lowercase.

This setting is valid only if [UnsecureJoin](microsoft-windows-unattendedjoin-identification-unsecurejoin.md) is set to **true**.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>MachinePassword</em></p></td>
<td><p>Specifies the value of the unique password for the computer. <em>MachinePassword</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [Identification](microsoft-windows-unattendedjoin-identification.md) | **MachinePassword**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows how to specify the value of the unique password for the computer.

``` syntax
<Identification>
   <Credentials>
      <Domain>fabrikam.com</Domain>
      <Password>MyPassword</Password>
      <Username>MyUserName</Username>
   </Credentials>
   <JoinDomain>fabrikam.com</JoinDomain>
   <MachinePassword>ComputerPassword</MachinePassword>
   <UnsecureJoin>true</UnsecureJoin>
</Identification>
```

## Related topics


[Identification](microsoft-windows-unattendedjoin-identification.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20MachinePassword%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





