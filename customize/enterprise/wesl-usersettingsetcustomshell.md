---
title: WESL\_UserSetting.SetCustomShell
description: WESL\_UserSetting.SetCustomShell
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 09fa040b-0fa1-4886-bfdd-8614eead0da8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WESL\_UserSetting.SetCustomShell


This method configures Shell Launcher for a specific user or group, based on the security identifier (SID).

## Syntax


``` syntax
[Static] uint32 SetCustomShell (
    [In, Required] string Sid,
    [In, Required] string Shell,
    [In] sint32 CustomReturnCodes[],
    [In] sint32 CustomReturnCodesAction[],
    [In] sint32 DefaultAction
);
```

## Parameters


<a href="" id="sid"></a>*Sid*  
\[in, required\] A string containing the security identifier (SID) of the user or group that Shell Launcher is being configured for.

<a href="" id="shell"></a>*Shell*  
\[in, required\] The application or executable that Shell Launcher starts as the shell.

<a href="" id="customreturncodes"></a>*CustomReturnCodes*  
\[in\] An array of custom return codes that can be returned by the shell application.

<a href="" id="customreturncodesaction"></a>*CustomReturnCodesAction*  
\[in\] An array of custom return code actions that determine the action that Shell Launcher takes when the shell application exits. The custom actions map to the array of *CustomReturnCodes*.

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

 

<a href="" id="defaultaction"></a>DefaultAction  
\[In\] The default action that Shell Launcher takes when the shell application exits.

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


Shell Launcher uses the *CustomReturnCodes* and *CustomReturnCodesAction* arrays to determine the system behavior when the shell application exits, based on the return value of the shell application.

If the return value does not exist in *CustomReturnCodes*, or if the corresponding action defined in *CustomReturnCodesAction* is not a valid value, Shell Launcher uses *DefaultAction* to determine system behavior. If *DefaultAction* is not defined, or is not a valid value, Shell Launcher restarts the shell application.

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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WESL_UserSetting.SetCustomShell%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





