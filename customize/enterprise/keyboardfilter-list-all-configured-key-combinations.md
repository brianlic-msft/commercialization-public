---
title: List all configured key combinations
description: List all configured key combinations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b5ffa47e-87ea-4df4-9291-f37f6b23683b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# List all configured key combinations


The following sample Windows PowerShell script uses the Windows Management Instrumentation (WMI) providers for Keyboard Filter to displays all key combination configurations for Keyboard Filter.

## List-rules.ps1


``` syntax
#
# Copyright (C) Microsoft. All rights reserved.
#

<#
.Synopsis
    Enumerate all active keyboard filter rules on the system.
.Description
    For each instance of WEKF_PredefinedKey, WEKF_CustomKey, and WEKF_Scancode,
    get the Enabled property.  If Enabled, then output a short description
    of the rule.
.Parameter ComputerName
    Optional parameter to specify the remote machine that this script should
    manage.  If not specified, the script will execute all WMI operations
    locally.
#>
param (
    [String] $ComputerName
)

$CommonParams = @{"namespace"="root\standardcimv2\embedded"}
$CommonParams += $PSBoundParameters

write-host Enabled Predefined Keys -foregroundcolor cyan
Get-WMIObject -class WEKF_PredefinedKey @CommonParams |
    foreach {
        if ($_.Enabled) {
            write-host $_.Id
        }
    }

write-host Enabled Custom Keys -foregroundcolor cyan
Get-WMIObject -class WEKF_CustomKey @CommonParams |
    foreach {
        if ($_.Enabled) {
            write-host $_.Id
        }
    }

write-host Enabled Scancodes -foregroundcolor cyan
Get-WMIObject -class WEKF_Scancode @CommonParams |
    foreach {
        if ($_.Enabled) {
            "{0}+{1:X4}" -f $_.Modifiers, $_.Scancode
        }
    }
```

## Related topics


[Windows PowerShell script samples for keyboard filter](keyboardfilter-powershell-script-samples.md)

[Keyboard filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)

[Keyboard filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20List%20all%20configured%20key%20combinations%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





