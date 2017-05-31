---
title: LogonCount
description: LogonCount
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: da3e5987-4834-4bca-a543-8987724eae88
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LogonCount


`LogonCount` specifies the number of times that you can log on to the computer by using `AutoLogon`. This value decrements each time you log on to the computer. You must restart the computer to reset the value of `LogonCount`. `LogonCount` must be specified if [AutoLogon](microsoft-windows-shell-setup-autologon.md) is used.

After the specified number of automated logon actions has occurred, you must manually log onto the computer.

If the built-in administrator account is used, the account is still active. For more information about the built-in administrator account, see the [How to Enable and Disable the Built-in Administrator Account](http://go.microsoft.com/fwlink/?LinkId=206616) topic in the Windows Assessment and Deployment Kit (Windows ADK) Technical Reference.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Logon_count</em></p></td>
<td><p>Specifies the number of times you can log on to the computer by using <code>AutoLogon</code>. <em>Logon_count</em> is an integer.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditSystem

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [AutoLogon](microsoft-windows-shell-setup-autologon.md) | **LogonCount**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md). This setting is not configured in a Nano Server image.

## XML Example


The following XML output shows how to set `AutoLogon` so that you can log onto the computer twice using the built-in administrator account.

``` syntax
<AutoLogon>
   <Password>
      <Value>MyPassword</Value>
      <PlainText>true</PlainText>
   </Password>
   <Enabled>true</Enabled>
   <LogonCount>2</LogonCount>
   <Username>Administrator</Username>
</AutoLogon>
```

## Related topics


[AutoLogon](microsoft-windows-shell-setup-autologon.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LogonCount%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





