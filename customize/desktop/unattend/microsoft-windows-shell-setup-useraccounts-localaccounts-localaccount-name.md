---
title: Name
description: Name
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5173b942-b170-40ac-9fe8-ac520f2d242e
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Name


`Name` specifies the user name for a [LocalAccount](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount.md) to be created during installation.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Name</em></p></td>
<td><p>Specifies the name of a [LocalAccount](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount.md). <em>Name</em> is a string with a maximum length of 256 characters.</p>
<p>Do not use any of the following characters: &quot;/\[]:|&lt;&gt;+=;,?*%@</p>
<p>Do not use the name &quot;NONE&quot;, this is a restricted username.</p>
<p>This string type does not support empty elements. Do not create an empty value for this setting.</p>
<p>Some Unicode characters such as emoji appear as with the placeholder character: ? (question mark) in command prompts, but appear correctly in other locations such as File Explorer.</p>
<p>Users who sign-in with a Microsoft account will frequently see that their underlying profile path does not match their firstname / lastname. When this happens, you will see an account in the form: username_001.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditSystem

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [UserAccounts](microsoft-windows-shell-setup-useraccounts.md) | [LocalAccounts](microsoft-windows-shell-setup-useraccounts-localaccounts.md) | [LocalAccount](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount.md) | **Name**

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


[LocalAccount](microsoft-windows-shell-setup-useraccounts-localaccounts-localaccount.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Name%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





