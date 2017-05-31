---
title: Remove key combination configurations
description: Remove key combination configurations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 14f61d51-834b-4d15-8024-6728f0c8bc9c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Remove key combination configurations


The following sample Windows PowerShell script uses the Windows Management Instrumentation (WMI) providers for Keyboard Filter to create two functions to remove custom-defined key combination configurations from Keyboard Filter. It demonstrates several ways to use each function.

The first function, **Remove-Custom-Key**, removes custom key combination configurations.

The second function, **Remove-Scancode**, removes custom scan code configurations.

You cannot remove the predefined key combination configurations for Keyboard Filter, but you can disable them.

## Remove-rules.ps1


``` syntax
#
# Copyright (C) Microsoft. All rights reserved.
#

<#
.Synopsis
    This script shows how to use the build in WMI providers to remove keyboard filter rules.  Rules of type WEKF_PredefinedKey cannot be removed.
.Parameter ComputerName
    Optional parameter to specify the remote computer that this script should
    manage.  If not specified, the script will execute all WMI operations
    locally.
#>

param(
    [string] $ComputerName
)

$CommonParams = @{"namespace"="root\standardcimv2\embedded"}
$CommonParams += $PSBoundParameters

function Remove-Custom-Key($Id) {
    <#
    .Synopsis
        Remove an instance of WEKF_CustomKey
    .Description
        Enumerate all instances of WEKF_CustomKey.  When an instance has an
        Id that matches $Id, delete it.
    .Example
        Remove-Custom-Key "Ctrl+V"

        This removes the instance of WEKF_CustomKey with a key Id of "Ctrl+V"
#>

    $customInstance = Get-WMIObject -class WEKF_CustomKey @CommonParams |
        where {$_.Id -eq $Id}

    if ($customInstance) {
        $customInstance.Delete();
        "Removed Custom Filter $Id.";
    } else {
        "Custom Filter $Id does not exist.";
    }
}

function Remove-Scancode($Modifiers, [int]$Code) {
    <#
    .Synopsis
        Remove and instance of WEKF_Scancode
    .Description
        Enumerate all instances of WEKF_Scancode.  When an instance has a
        matching modifiers and code, delete it.
    .Example
        Remove-Scancode "Ctrl" 37

        This removes the instance of WEKF_Scancode with Modifiers="Ctrl" and
        Scancode=37.
#>

    $scancodeInstance = Get-WMIObject -class WEKF_Scancode @CommonParams |
        where {($_.Modifiers -eq $Modifiers) -and ($_.Scancode -eq $Code)}

    if ($scancodeInstance) {
        $scancodeInstance.Delete();
        "Removed Scancode $Modifiers+$Code.";
    } else {
        "Scancode $Modifiers+$Code does not exist.";
    }
}

# Some example uses of the functions defined above.
Remove-Custom-Key "Ctrl+V"
Remove-Custom-Key "Numpad0"
Remove-Custom-Key "Shift+Numpad1"
Remove-Custom-Key "%"
Remove-Scancode "Ctrl" 37
```

## Related topics


[Windows PowerShell script samples for keyboard filter](keyboardfilter-powershell-script-samples.md)

[Keyboard filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)

[Keyboard filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Remove%20key%20combination%20configurations%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





