---
title: Get-AssignedAccess
description: Get-AssignedAccess
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b958ceca-c888-4f71-b089-b915ec2a03b9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Get-AssignedAccess

Retrieves the current configuration for assigned access.

## Syntax

``` syntax
Get-AssignedAccess [<CommonParameters>]
```

## Description

The Get-AssignedAccess cmdlet retrieves the current configuration for assigned access, including the user name, user SID, app friendly name, and app ID.

## Parameters

<a href="" id="-commonparameters-"></a>*&lt;CommonParameters&gt;*  

This command supports the following common parameters that are implemented by Windows PowerShell: Verbose, Debug, ErrorAction, ErrorVariable, OutBuffer, OutVariable, WarningAction, and WarningVariable. For more information, see [about\_CommonParameters](http://go.microsoft.com/fwlink/p/?linkid=294664) on MSDN.

## Remarks

For more information, type "Get-Help Get-AssignedAccess -detailed". For technical information, type "Get-Help Get-AssignedAccess -full".

## Examples

<a href="" id="example-1"></a>

### EXAMPLE 1  

``` syntax
C:\PS>Get-AssignedAccess
```

#### Output

```
Name: MYPC\\UserName
User SID: S-1-5-21-594534509-2542345234-234523453-1004
AppUserModelId: Microsoft.Media.PlayReadyClient\_2.3.1678.0\_x64\_\_8wekyb3d8bbwe
App Name: Microsoft.Media.PlayReadyClient
```

#### Description

This example shows how to retrieve the current configuration for assigned access.

## Requirements

| Windows Edition       | Supported |
|-----------------------|-----------|
| Windows 10 Home       | No        |
| Windows 10 Pro        | Yes       |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

## Related topics


[Clear-AssignedAccess](clear-assignedaccess.md)

[Set-AssignedAccess](set-assignedaccess.md)