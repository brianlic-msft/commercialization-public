---
title: Clear-AssignedAccess
description: Clear-AssignedAccess
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 068c6c5e-5810-4906-b80f-dce7c1c27410
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Clear-AssignedAccess

Removes the user account from assigned access.

## Syntax

``` syntax
Clear-AssignedAccess [<CommonParameters>]
```
## Description

The Clear-AssignedAccess cmdlet removes the user account from assigned access and returns the user to default settings. If the user is signed in, you must sign off to apply the changes.

## Parameters

<a href="" id="-commonparameters-"></a>*&lt;CommonParameters&gt;*  

This command supports the following common parameters that are implemented by Windows PowerShell: Verbose, Debug, ErrorAction, ErrorVariable, OutBuffer, OutVariable, WarningAction, and WarningVariable. For more information, see [about\_CommonParameters](http://go.microsoft.com/fwlink/p/?linkid=294664) on MSDN.

## Remarks

For more information, type "Get-Help Clear-AssignedAccess -detailed". For technical information, type "Get-Help Clear-AssignedAccess -full".

## Examples

<a href="" id="example-1"></a>
### EXAMPLE 1  

``` syntax
Clear-AssignedAccess
```

#### Description

This example shows how to remove the user account from assigned access and return the user to default settings.

## Requirements

| Windows Edition       | Supported |
|-----------------------|-----------|
| Windows 10 Home       | No        |
| Windows 10 Pro        | Yes       |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

## Related topics

[Get-AssignedAccess](get-assignedaccess.md)

[Set-AssignedAccess](set-assignedaccess.md)