---
title: Set-AssignedAccess
description: Set-AssignedAccess
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a76d45b1-3a25-41b2-92b8-29a7f3db2562
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Set-AssignedAccess

Configures a user to only launch one application.

## Syntax

``` syntax
Set-AssignedAccess -AppUserModelId <string> -UserName <string> [<CommonParameters>]
Set-AssignedAccess -AppName <string> -UserName <string> [<CommonParameters>]
Set-AssignedAccess -AppUserModelId <string> -UserSID <string> [<CommonParameters>]
Set-AssignedAccess -AppName <string> -UserSID <string> [<CommonParameters>]
```

## Description

The Set-AssignedAccess cmdlet configures assigned access so that a specific user can use only one app. The user cannot exit the app or access system settings. If the user is signed in, you must sign off to apply the changes. To sign out of assigned access, press CTRL+ALT+DELETE.

## Parameters

<a href="" id="-appname--string-"></a>*-AppName &lt;string&gt;*  

Specifies the name of the installed Windows app to use for assigned access. Wildcard characters are accepted.

You can use *AppName* for any app that is returned in the Name field by *Get-AppxPackage*.

For example, in the following example of the return value of Get-AppxPackage for Windows Calculator, the Name field value is "Microsoft.WindowsCalculator".

**Note**  Querying on the -AppName parameter isn't as robust as querying on the –AppUserModelId. Whenever possible, use the –AppUserModelId.

```
Name              : Microsoft.WindowsCalculator
Publisher         : CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US
Architecture      : X64
ResourceId        :
Version           : 10.1604.51020.0
PackageFullName   : Microsoft.WindowsCalculator_10.1604.51020.0_x64__8wekyb3d8bbwe
InstallLocation   : C:\Program Files\WindowsApps\Microsoft.WindowsCalculator_10.1604.51020.0_x64__8wekyb3d8bbwe
IsFramework       : False
PackageFamilyName : Microsoft.WindowsCalculator_8wekyb3d8bbwe
PublisherId       : 8wekyb3d8bbwe
IsResourcePackage : False
IsBundle          : False
IsDevelopmentMode : False
Dependencies      : {Microsoft.VCLibs.140.00_14.0.23816.0_x64__8wekyb3d8bbwe, Microsoft.WindowsCalculator_10.1604.51020.0_neutral_split.scale-100_8wekyb3d8bbwe,
                    Microsoft.WindowsCalculator_10.1604.51020.0_neutral_split.scale-125_8wekyb3d8bbwe, Microsoft.WindowsCalculator_10.1604.51020.0_neutral_split.scale-150_8wekyb3d8bbwe...}
```

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Required?</p></td>
<td><p>true</p></td>
</tr>
<tr class="even">
<td><p>Accept Wildcard Characters?</p></td>
<td><p>true</p></td>
</tr>
</tbody>
</table>
 
<a href="" id="-appusermodelid--string-"></a>*-AppUserModelId &lt;string&gt;*  

Specifies the Application User Model ID (AppUserModelID) for the installed Windows app to use for assigned access.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Required?</p></td>
<td><p>true</p></td>
</tr>
<tr class="even">
<td><p>Accept Wildcard Characters?</p></td>
<td><p>false</p></td>
</tr>
</tbody>
</table>

<a href="" id="-username--string-"></a>*-UserName &lt;string&gt;*  

Specifies the user account name to use for assigned access.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Required?</p></td>
<td><p>true</p></td>
</tr>
<tr class="even">
<td><p>Accept Wildcard Characters?</p></td>
<td><p>false</p></td>
</tr>
</tbody>
</table>

<a href="" id="-usersid--string-"></a>*-UserSID &lt;string&gt;*  

Specifies the security identifier (SID) for the account to use for assigned access.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Required?</p></td>
<td><p>true</p></td>
</tr>
<tr class="even">
<td><p>Accept Wildcard Characters?</p></td>
<td><p>false</p></td>
</tr>
</tbody>
</table>

<a href="" id="-commonparameters-"></a>*&lt;CommonParameters&gt;*  

This command supports the following common parameters that are implemented by Windows PowerShell: *Verbose*, *Debug*, *ErrorAction*, *ErrorVariable*, *OutBuffer*, *OutVariable*, *WarningAction*, and *WarningVariable*. For more information, see [about\_CommonParameters](http://go.microsoft.com/fwlink/p/?linkid=294664) on MSDN.

## Remarks

To get a list of all the applications installed for a user account, use the Get-AppxPackage cmdlet as follows: (Get-AppxPackage -User username ). For more information, type "Get-Help Set-AssignedAccess -detailed". For technical information, type "Get-Help Set-AssignedAccess -full".

## Examples

<a href="" id="example-1"></a>
### EXAMPLE 1  

``` syntax
Set-AssignedAccess -UserSID S-1-5-21-523423449-2432423479-234123443-1004 -AppName CustomApp
```

#### Description

This example shows how to configure assigned access by using the user SID and the app name.

<a href="" id="example-2"></a>
### EXAMPLE 2  

``` syntax
Set-AssignedAccess -UserName UserName -AppUserModelId microsoft.windows.photos_8wekyb3d8bbwe!app
```

#### Description

This example shows how to configure assigned access by using the user name and AppUserModelID.

## Requirements

| Windows Edition       | Supported |
|-----------------------|-----------|
| Windows 10 Home       | No        |
| Windows 10 Pro        | Yes       |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

## Related topics

[Clear-AssignedAccess](clear-assignedaccess.md)

[Get-AssignedAccess](get-assignedaccess.md)

