---
title: OfflineUserAccounts
description: OfflineUserAccounts specifies local accounts to be created, domain accounts to be added, and the administrator password.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A27B836F-2584-4166-ACCD-618D8211BC14
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OfflineUserAccounts


`OfflineUserAccounts` specifies local accounts to be created, domain accounts to be added, and the administrator password.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[OfflineAdministratorPassword](microsoft-windows-shell-setup-offlineuseraccounts-offlineadministratorpassword.md)</p></td>
<td><p>Specifies the administrator password for the computer and whether it is hidden in the unattended installation answer file.</p></td>
</tr>
<tr class="even">
<td><p>[OfflineDomainAccounts](microsoft-windows-shell-setup-offlineuseraccounts-offlinedomainaccounts.md)</p></td>
<td><p>Specifies the details of domain accounts to be added to local security groups on the computer during installation.</p></td>
</tr>
<tr class="odd">
<td><p>[OfflineLocalAccounts](microsoft-windows-shell-setup-offlineuseraccounts-offlinelocalaccounts.md)</p></td>
<td><p>Specifies the details of local accounts to be created during installation.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **OfflineUserAccounts**

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

Windows Server 2016

For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set `OfflineUserAccounts`.

``` syntax
<OfflineUserAccounts>
     <OfflineAdministratorPassword>
        <Value>[PasswordValue]</Value>
        <PlainText>[true/false]</PlainText>
     </OfflineAdministratorPassword>

     <OfflineLocalAccounts>
         <LocalAccount>
             <Password>                                                
                 <Value>[PasswordValue]</Value>
                 <PlainText>[true/false]</PlainText>
             </Password>
             <Group>[groups]</Group>
             <Name>[user]</Name>
             <DisplayName>[userdisplayname]</DisplayName>
         </LocalAccount>
     </OfflineLocalAccounts>

     <OfflineDomainAccounts>
         <OfflineDomainAccount>
             <SID>[SID1]</SID>
             <Group>[groups]</Group>
         </OfflineDomainAccount>         
         <OfflineDomainAccount>
             <SID>[SID2]</SID>
             <Group>[groups]</Group>
         </OfflineDomainAccount>
    </OfflineDomainAccounts>
</OfflineUserAccounts>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20OfflineUserAccounts%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





