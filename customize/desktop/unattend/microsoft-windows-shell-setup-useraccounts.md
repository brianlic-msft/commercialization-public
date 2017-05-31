---
title: UserAccounts
description: UserAccounts
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f1896510-b6e9-40f1-aa98-a29e38712d27
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UserAccounts


`UserAccounts` specifies local accounts to be created, domain accounts to be added, and the administrator password.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[AdministratorPassword](microsoft-windows-shell-setup-useraccounts-administratorpassword.md)</p></td>
<td><p>Specifies the administrator password for the computer and whether it is hidden in the unattended installation answer file.</p></td>
</tr>
<tr class="even">
<td><p>[DomainAccounts](microsoft-windows-shell-setup-useraccounts-domainaccounts.md)</p></td>
<td><p>Specifies the details of domain accounts to be added to local security groups on the computer during installation.</p></td>
</tr>
<tr class="odd">
<td><p>[LocalAccounts](microsoft-windows-shell-setup-useraccounts-localaccounts.md)</p></td>
<td><p>Specifies the details of local accounts to be created during installation.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


auditSystem

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **UserAccounts**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set `UserAccounts`.

``` syntax
<UserAccounts>
   <AdministratorPassword>
      <Value>cAB3AEEAZABtAGkAbgBpAHMAdAByAGEAdABvAHIAUABhAHMAcwB3AG8AcgBkAA==</Value>
      <PlainText>false</PlainText>
   </AdministratorPassword>
   <DomainAccounts>
      <DomainAccountList wcm:action="add">
         <DomainAccount wcm:action="add">
            <Name>account1</Name>
            <Group>Fabrikam\Group1</Group>
         </DomainAccount>
         <DomainAccount wcm:action="add">
            <Name>account2</Name>
            <Group>Fabrikam\Group2</Group>
         </DomainAccount wcm:action="add">
         <Domain>domain1</Domain>
      </DomainAccountList>
      <DomainAccountList wcm:action="add">
         <DomainAccount wcm:action="add">
            <Name>account3</Name>
            <Group>Fabrikam\Group2</Group>
         </DomainAccount wcm:action="add">
         <Domain>domain2</Domain>
     </DomainAccountList>
   </DomainAccounts>
   <LocalAccounts>
      <LocalAccount wcm:action="add">
         <Password>
            <Value>cAB3AFAAYQBzAHMAdwBvAHIAZAA</Value>
            <PlainText>false</PlainText>
         </Password>
         <Description>Test account</Description>
         <DisplayName>Admin/Power User Account</DisplayName>
         <Group>Administrators;Power Users</Group>
         <Name>Test1</Name>
      </LocalAccount>
      <LocalAccount wcm:action="add">
         <Password>
            <Value>cABhAHMAcwB3AG8AcgBkAFAAYQBzAHMAdwBvAHIAZAA=</Value>
            <PlainText>false</PlainText>
         </Password>
         <Description>For testing</Description>
         <DisplayName>Admin Account</DisplayName>
         <Group>Administrators</Group>
         <Name>Test2</Name>
      </LocalAccount>
   </LocalAccounts>
</UserAccounts>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UserAccounts%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





