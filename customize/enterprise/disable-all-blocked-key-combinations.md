---
title: Disable all blocked key combinations
description: Disable all blocked key combinations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 60327cc7-ef5b-4f26-8437-83b32711b6d8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disable all blocked key combinations


The following sample Windows PowerShell script uses the WMI providers to disable all blocked key combinations for Keyboard Filter by using the Windows Management Instrumentation (WMI) providers for Keyboard Filter. The key combination configurations are not removed, but Keyboard Filter stops blocking any keys.

## Disable-all-rules.ps1


``` syntax
#
# Copyright (C) Microsoft. All rights reserved.
#

<#
.Synopsis
    This Windows PowerShell script shows how to enumerate all existing keyboard filter
    rules and how to disable them by setting the Enabled property directly.
.Description
    For each instance of WEKF_PredefinedKey, WEKF_CustomKey, and WEKF_Scancode,
    set the Enabled property to false/0 to disable the filter rule, thus
    allowing all key sequences through the filter.
.Parameter ComputerName
    Optional parameter to specify the remote computer that this script should
    manage.  If not specified, the script will execute all WMI operations
    locally.
#>

param(
    [String]$ComputerName
)
   
$CommonParams = @{"namespace"="root\standardcimv2\embedded"}
$CommonParams += $PSBoundParameters

Get-WMIObject -class WEKF_PredefinedKey @CommonParams |
    foreach {
        if ($_.Enabled) {
            $_.Enabled = 0;
            $_.Put() | Out-Null;
            Write-Host Disabled $_.Id
        }
    }

Get-WMIObject -class WEKF_CustomKey @CommonParams |
    foreach {
        if ($_.Enabled) {
            $_.Enabled = 0;
            $_.Put() | Out-Null;
            Write-Host Disabled $_.Id
        }
    }

Get-WMIObject -class WEKF_Scancode @CommonParams |
    foreach {
        if ($_.Enabled) {
            $_.Enabled = 0;
            $_.Put() | Out-Null;
            "Disabled {0}+{1:X4}" -f $_.Modifiers,$_.Scancode
        }
    }
```

## Related topics


[Windows PowerShell script samples for keyboard filter](keyboardfilter-powershell-script-samples.md)

[Keyboard filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)

[Keyboard filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Disable%20all%20blocked%20key%20combinations%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





