---
title: WESL\_UserSetting.GetDefaultShell
description: WESL\_UserSetting.GetDefaultShell
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 26dc7e10-6e89-44e0-aec2-322676e8b2d1
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WESL\_UserSetting.GetDefaultShell


This method retrieves the default Shell Launcher configuration.

## Syntax


``` syntax
[Static] uint32 GetDefaultShell (
    [Out, Required] string Shell,
    [Out, Required] sint32 DefaultAction
);
```

## Parameters


<a href="" id="shell"></a>*Shell*  
\[out, required\] The application or executable that Shell Launcher starts as the shell.

<a href="" id="defaultaction"></a>*DefaultAction*  
\[out, required\] The default action Shell Launcher takes when the shell application exits.

The possible actions are defined in the following table:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Restarts the shell application.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Restarts the device.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Shuts down the device.</p></td>
</tr>
</tbody>
</table>

 

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


Shell Launcher uses the default configuration when the security identifier (SID) of the user who is currently signed in does not match any custom defined Shell Launcher configurations.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[WESL\_UserSetting](wesl-usersetting.md)

[Shell Launcher](shell-launcher.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WESL_UserSetting.GetDefaultShell%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





