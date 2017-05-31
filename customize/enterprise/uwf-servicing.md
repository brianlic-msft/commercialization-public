---
title: UWF\_Servicing
description: UWF\_Servicing
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a6eec8a2-1360-413d-af83-ffc63f47c08c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_Servicing


This class contains properties and methods that enable you to query and control Unified Write Filter (UWF) servicing mode.

## Syntax


``` syntax
class UWF_Servicing {
    [key, read] boolean CurrentSesson;
    [read] boolean ServicingEnabled;

    UInt32 Enable();
    UInt32 Disable();
    UInt32 UpdateWindows(
        [out] UInt32 UpdateStatus
    );
};
```

## Members


The following tables list the methods and properties that belong to this class.

### <a href="" id="mth"></a>Methods

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[UWF_Servicing.Disable](uwf-servicingdisable.md)</p></td>
<td><p>Disables Unified Write Filter (UWF) servicing mode.</p>
<p>The system leaves servicing mode in the next session that follows a restart.</p></td>
</tr>
<tr class="even">
<td><p>[UWF_Servicing.Enable](uwf-servicingenable.md)</p></td>
<td><p>Enables Unified Write Filter (UWF) servicing mode.</p>
<p>The system enters servicing mode in the next session that follows a restart.</p></td>
</tr>
<tr class="odd">
<td><p>[UWF_Servicing.UpdateWindows](uwf-servicingupdatewindows.md)</p></td>
<td><p>Calls Windows Update to download and install critical and security updates for your device running Windows 10 Enterprise.</p></td>
</tr>
</tbody>
</table>

 

### <a href="" id="pro"></a>Properties

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Property</th>
<th>Data type</th>
<th>Qualifiers</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>CurrentSession</strong></p></td>
<td><p>Boolean</p></td>
<td><p>[key, read]</p></td>
<td><p>Indicates when to enable servicing.</p>
<p><strong>True</strong> if servicing is enabled in the current session; <strong>False</strong> if servicing will be enabled in the session that follows a restart.</p></td>
</tr>
<tr class="even">
<td><p><strong>ServiceEnabled</strong></p></td>
<td><p>Boolean</p></td>
<td><p>[read]</p></td>
<td><p>Indicates if the system is in servicing mode in the current session, or will be in servicing mode in the next session that follows a restart.</p>
<p><strong>True</strong> if servicing is enabled; otherwise, <strong>False</strong>.</p></td>
</tr>
</tbody>
</table>

 

### Remarks

This class only has two instances, one for the current session, and another for the next session that follows a restart.

### Example

The following example shows how to enable and disable UWF servicing mode on a device by using the Windows Management Instrumentation (WMI) provider in a PowerShell script.

``` syntax
$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Define common parameters

$CommonParams = @{"namespace"=$NAMESPACE; "computer"=$COMPUTER}

# Enable UWF servicing

$nextSession = Get-WmiObject -class UWF_Servicing @CommonParams | where {
    $_.CurrentSession -eq $false
}

if ($nextSession) {

    $nextSession.Enable() | Out-Null;
    Write-Host "This device is enabled for servicing mode after the next restart."
}

# Disable UWF servicing

$nextSession = Get-WmiObject -class UWF_Servicing @CommonParams | where {
    $_.CurrentSession -eq $false
}

if ($nextSession) {

    $nextSession.Disable() | Out-Null;
    Write-Host "Servicing mode is now disabled for this device."
} 
```

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_Servicing%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





