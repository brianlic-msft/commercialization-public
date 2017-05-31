---
title: DomainProfile\_LogDroppedPackets
description: DomainProfile\_LogDroppedPackets
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3627fdca-a7a6-400f-a22e-a4f9e9559e27
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DomainProfile\_LogDroppedPackets


`DomainProfile_LogDroppedPackets` specifies whether dropped packets are logged for Windows Firewall for the domain profile.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that dropped packets are logged.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that dropped packets are not logged. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Networking-MPSSVC-Svc](networking-mpssvc-svc.md) | **DomainProfile\_LogDroppedPackets**

## Valid Configuration Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Networking-MPSSVC-Svc](networking-mpssvc-svc.md).

## XML Example


The following XML output shows how to set the Windows Firewall.

``` syntax
<DisableStatefulFTP>true</DisableStatefulFTP>
<DisableStatefulPPTP>true</DisableStatefulPPTP>
<DomainProfile_DisableNotifications>true</DomainProfile_DisableNotifications>
<DomainProfile_LogDroppedPackets>true</DomainProfile_LogDroppedPackets>
<DomainProfile_LogFile>C:\\MyLogFile.log</DomainProfile_LogFile>
<DomainProfile_LogFileSize>8192</DomainProfile_LogFileSize>
<DomainProfile_LogSuccessfulConnections>true</DomainProfile_LogSuccessfulConnections>
<PrivateProfile_DisableNotifications>true</PrivateProfile_DisableNotifications>
<PrivateProfile_LogDroppedPackets>true</PrivateProfile_LogDroppedPackets>
<PrivateProfile_LogFile>C:\\MyLogFile.log</PrivateProfile_LogFile>
<PrivateProfile_LogFileSize>8192</PrivateProfile_LogFileSize>
<PrivateProfile_LogSuccessfulConnections>true</PrivateProfile_LogSuccessfulConnections>
<PublicProfile_DisableNotifications>true</PublicProfile_DisableNotifications>
<PublicProfile_LogDroppedPackets>true</PublicProfile_LogDroppedPackets>
<PublicProfile_LogFile>C:\\MyLogFile.log</PublicProfile_LogFile>
<PublicProfile_LogFileSize>8192</PublicProfile_LogFileSize>
<PublicProfile_LogSuccessfulConnections>true</PublicProfile_LogSuccessfulConnections>
```

## Related topics


[Networking-MPSSVC-Svc](networking-mpssvc-svc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DomainProfile_LogDroppedPackets%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





