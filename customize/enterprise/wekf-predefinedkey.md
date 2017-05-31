---
title: WEKF\_PredefinedKey
description: WEKF\_PredefinedKey
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2fc29e2b-1c76-437f-99b0-db13a3aeb1af
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WEKF\_PredefinedKey


This class blocks or unblocks predefined key combinations, such as Ctrl+Alt+Delete.

## Syntax


``` syntax
class WEKF_PredefinedKey {
    [Static] uint32 Enable (
        [In] string PredefinedKey
    );
    [Static] uint32 Disable (
        [In] string PredefinedKey
    );

    [Key] string Id;
    [Read, Write] boolean Enabled;
};
```

``` syntax
```

## Members


The following tables list any constructors, methods, fields, and properties that belong to this class.

### <a href="" id="mth"></a>Methods

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Methods</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[WEKF_PredefinedKey.Enable](wekf-predefinedkeyenable.md)</p></td>
<td><p>Blocks the specified predefined key.</p></td>
</tr>
<tr class="even">
<td><p>[WEKF_PredefinedKey.Disable](wekf-predefinedkeydisable.md)</p></td>
<td><p>Unblocks the specified predefined key.</p></td>
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
<td><p><strong>Id</strong></p></td>
<td><p>string</p></td>
<td><p>[key]</p></td>
<td><p>The name of the predefined key combination.</p></td>
</tr>
<tr class="even">
<td><p><strong>Enabled</strong></p></td>
<td><p>Boolean</p></td>
<td><p>[read, write]</p></td>
<td><p>Indicates if the key is blocked or unblocked. This property can be one of the following values:</p>
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
<td><p><strong>true</strong></p></td>
<td><p>Indicates that the key is blocked.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Indicates that the key is not blocked.</p></td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
</tbody>
</table>

 

### Remarks

All accounts have read access to the **WEKF\_PRedefinedKey** class, but only administrator accounts can modify the class.

For a list of predefined key combinations for Keyboard Filter, see [Predefined key combinations](predefined-key-combinations.md).

## Example


The following sample Windows PowerShell script blocks the Ctrl+Alt+Delete and the Ctrl+Esc key combinations when the Keyboard Filter service is running.

``` syntax
<#
.Synopsis
    This script shows how to use the built in WMI providers to enable and add 
    Keyboard Filter rules through Windows PowerShell on the local computer.
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
    .Synposis
        Toggle on a Predefined Key Keyboard Filter Rule
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



# Some example uses of the function defined above.

Enable-Predefined-Key "Ctrl+Alt+Delete"
Enable-Predefined-Key "Ctrl+Esc"
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


[Keyboard Filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)

[Keyboard Filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WEKF_PredefinedKey%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





