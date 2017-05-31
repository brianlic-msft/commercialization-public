---
title: Add blocked key combinations
description: Add blocked key combinations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f51892fc-0262-4b25-b117-6e131b86fb68
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add blocked key combinations


The following sample Windows PowerShell script uses the Windows Management Instrumentation (WMI) providers for Keyboard Filter to create three functions to configure Keyboard Filter so that Keyboard Filter blocks key combinations. It demonstrates several ways to use each function.

The first function, `Enable-Predefine-Key`, blocks key combinations that are predefined for Keyboard Filter.

The second function, `Enable-Custom-Key`, blocks custom key combinations by using the English key names.

The third function, `Enable-Scancode`, blocks custom key combinations by using the keyboard scan code for the key.

## Enable-rules.ps1


``` syntax
#
# Copyright (C) Microsoft. All rights reserved.
#

<#
.Synopsis
    This script shows how to use the built in WMI providers to enable and add 
    keyboard filter rules through Windows PowerShell on the local computer.
.Parameter ComputerName
    Optional parameter to specify a remote machine that this script should
    manage.  If not specified, the script will execute all WMI operations
    locally.
#>
param (
    [String] $ComputerName
)

$CommonParams = @{"namespace"="root\standardcimv2\embedded"}
$CommonParams += $PSBoundParameters

function Enable-Predefined-Key($Id) {
    <#
    .Synopsis
        Toggle on a Predefined Key keyboard filter Rule
    .Description
        Use Get-WMIObject to enumerate all WEKF_PredefinedKey instances,
        filter against key value "Id", and set that instance's "Enabled"
        property to 1/true.
    .Example
        Enable-Predefined-Key "Ctrl+Alt+Delete"
        
        Enable CAD filtering
#>

    $predefined = Get-WMIObject -class WEKF_PredefinedKey @CommonParams |
        where {
            $_.Id -eq "$Id"
        };

    if ($predefined) {
        $predefined.Enabled = 1;
        $predefined.Put() | Out-Null;
        Write-Host Enabled $Id
    } else {
        Write-Error $Id is not a valid predefined key
    }
}


function Enable-Custom-Key($Id) {
    <#
    .Synopsis
        Toggle on a Custom Key keyboard filter Rule
    .Description
        Use Get-WMIObject to enumerate all WEKF_CustomKey instances,
        filter against key value "Id", and set that instance's "Enabled"
        property to 1/true.

        In the case that the Custom instance does not exist, add a new
        instance of WEKF_CustomKey using Set-WMIInstance.
    .Example
        Enable-Custom-Key "Ctrl+V"
        
        Enable filtering of the Ctrl + V sequence.
#>

    $custom = Get-WMIObject -class WEKF_CustomKey @CommonParams |
        where {
            $_.Id -eq "$Id"
        };

    if ($custom) {
# Rule exists.  Just enable it.
        $custom.Enabled = 1;
        $custom.Put() | Out-Null;
        "Enabled Custom Filter $Id.";

    } else {
        Set-WMIInstance `
            -class WEKF_CustomKey `
            -argument @{Id="$Id"} `
            @CommonParams | Out-Null
        
        "Added Custom Filter $Id.";
    }
}


function Enable-Scancode($Modifiers, [int]$Code) {
    <#
    .Synopsis
        Toggle on a Scancode keyboard filter Rule
    .Description
        Use Get-WMIObject to enumerate all WEKF_Scancode instances,
        filter against key values of "Modifiers" and "Scancode", and set
        that instance's "Enabled" property to 1/true.

        In the case that the Scancode instance does not exist, add a new
        instance of WEKF_Scancode using Set-WMIInstance.
    .Example
        Enable-Scancode "Ctrl" 37
        
        Enable filtering of the Ctrl + keyboard scancode 37 (base-10)
        sequence.
#>

    $scancode =
        Get-WMIObject -class WEKF_Scancode @CommonParams |
            where {
                ($_.Modifiers -eq $Modifiers) -and ($_.Scancode -eq $Code)
            }

    if($scancode) {
        $scancode.Enabled = 1
        $scancode.Put() | Out-Null
        "Enabled Custom Scancode {0}+{1:X4}" -f $Modifiers, $Code
    } else {
        Set-WMIInstance `
            -class WEKF_Scancode `
            -argument @{Modifiers="$Modifiers"; Scancode=$Code} `
            @CommonParams | Out-Null
 
        "Added Custom Scancode {0}+{1:X4}" -f $Modifiers, $Code
    }
}

# Some example uses of the functions defined above.
Enable-Predefined-Key "Ctrl+Alt+Delete"
Enable-Predefined-Key "Ctrl+Esc"
Enable-Custom-Key "Ctrl+V"
Enable-Custom-Key "Numpad0"
Enable-Custom-Key "Shift+Numpad1"
Enable-Custom-Key "%"
Enable-Scancode "Ctrl" 37
```

## Related topics


[Windows PowerShell script samples for keyboard filter](keyboardfilter-powershell-script-samples.md)

[Keyboard filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)

[Keyboard filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Add%20blocked%20key%20combinations%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





