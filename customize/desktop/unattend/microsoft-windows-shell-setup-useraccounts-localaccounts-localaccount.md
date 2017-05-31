---
title: LocalAccount
description: LocalAccount
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9da15e6d-5dd2-44fe-a423-3f433f0c7512
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LocalAccount


`LocalAccount` specifies the details of a local account to be created during installation.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Description](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount-description.md)</p></td>
<td><p>Specifies a <code>LocalAccount</code>.</p></td>
</tr>
<tr class="even">
<td><p>[DisplayName](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount-displayname.md)</p></td>
<td><p>Specifies the display name for a <code>LocalAccount</code>.</p></td>
</tr>
<tr class="odd">
<td><p>[Group](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount-group.md)</p></td>
<td><p>Specifies the name of existing local security groups to which a <code>LocalAccount</code> will be added.</p></td>
</tr>
<tr class="even">
<td><p>[Name](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount-name.md)</p></td>
<td><p>Specifies the user name for a <code>LocalAccount</code>.</p></td>
</tr>
<tr class="odd">
<td><p>[Password](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount-password.md)</p></td>
<td><p>Specifies the password for a <code>LocalAccount</code> and whether the password is hidden in the unattended installation answer file.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


auditSystem

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)| [UserAccounts](microsoft-windows-shell-setup-useraccounts.md) | [LocalAccounts](microsoft-windows-shell-setup-useraccounts-localaccounts.md) | **LocalAccount**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set [UserAccounts](microsoft-windows-shell-setup-useraccounts.md).

``` syntax
<UserAccounts>
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


[LocalAccounts](microsoft-windows-shell-setup-useraccounts-localaccounts.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LocalAccount%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





