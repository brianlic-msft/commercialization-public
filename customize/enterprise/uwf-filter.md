---
title: UWF\_Filter
description: UWF\_Filter
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: efcf470f-29c8-40d3-87b8-db0fdbb57bfe
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_Filter


Enables or disables Unified Write Filter (UWF), resets configuration settings for UWF, and shuts down or restarts your device.

## Syntax


``` syntax
class UWF_Filter{
    [key]  string Id;
    [read] boolean CurrentEnabled;
    [read] boolean NextEnabled;
    UInt32 Enable();
    UInt32 Disable();
    UInt32 ResetSettings();
    UInt32 ShutdownSystem();
    UInt32 RestartSystem();
};
```

## Members


The following tables list any methods and properties that belong to this class.

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
<td><p>[UWF_Filter.Enable](uwf-filterenable.md)</p></td>
<td><p>Enables UWF on the next restart.</p></td>
</tr>
<tr class="even">
<td><p>[UWF_Filter.Disable](uwf-filterdisable.md)</p></td>
<td><p>Disables UWF on the next restart.</p></td>
</tr>
<tr class="odd">
<td><p>[UWF_Filter.ResetSettings](uwf-filterresetsettings.md)</p></td>
<td><p>Restores UWF settings to the original state that was captured at install time.</p></td>
</tr>
<tr class="even">
<td><p>[UWF_Filter.ShutdownSystem](uwf-filtershutdownsystem.md)</p></td>
<td><p>Safely shuts down a system protected by UWF, even if the overlay is full.</p></td>
</tr>
<tr class="odd">
<td><p>[UWF_Filter.RestartSystem](uwf-filterrestartsystem.md)</p></td>
<td><p>Safely restarts a system protected by UWF, even if the overlay is full.</p></td>
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
<td><p>A unique ID. This is always set to <strong>UWF_Filter</strong>.</p></td>
</tr>
<tr class="even">
<td><p><strong>CurrentEnabled</strong></p></td>
<td><p>Boolean</p></td>
<td><p>[read]</p></td>
<td><p>Indicates if UWF is enabled for the current session.</p></td>
</tr>
<tr class="odd">
<td><p><strong>NextEnabled</strong></p></td>
<td><p>Boolean</p></td>
<td><p>[read]</p></td>
<td><p>Indicates if UWF is enabled after the next restart.</p></td>
</tr>
</tbody>
</table>

 

### Remarks

You must use an administrator account to make any changes to the configuration settings for UWF. Users with any kind of account can read the current configuration settings.

## Example


The following example demonstrates how to enable or disable UWF by using the WMI provider in a PowerShell script.

The PowerShell script creates three functions to help enable or disable UWF. It then demonstrates how to use each function.

The first function, `Disable-UWF`, retrieves a WMI object for **UWF\_Filter**, and calls the **Disable()** method to disable UWF after the next device restart.

The second function, `Enable-UWF`, retrieves a WMI object for **UWF\_Filter**, and calls the **Enable()** method to enable UWF after the next device restart.

The third function, `Display-UWFState`, examines the properties of the **UWF\_Filter** object, and prints out the current settings for **UWF\_Filter**.

``` syntax
$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Create a function to disable the Unified Write Filter driver after the next restart.
function Disable-UWF() {

# Retrieve the UWF_Filter settings.
    $objUWFInstance = Get-WMIObject -namespace $NAMESPACE -class UWF_Filter;

    if(!$objUWFInstance) {
        "Unable to retrieve Unified Write Filter settings."
        return;
    }
                    
# Call the method to disable UWF after the next restart.  This sets the NextEnabled property to false.

    $retval = $objUWFInstance.Disable();

# Check the return value to verify that the disable is successful
    if ($retval.ReturnValue -eq 0) {
        "Unified Write Filter will be disabled after the next system restart."
    } else {
        "Unknown Error: " + "{0:x0}" -f $retval.ReturnValue
    }
}

# Create a function to enable the Unified Write Filter driver after the next restart.
function Enable-UWF() {

# Retrieve the UWF_Filter settings.
    $objUWFInstance = Get-WMIObject -namespace $NAMESPACE -class UWF_Filter;

    if(!$objUWFInstance) {
        "Unable to retrieve Unified Write Filter settings."
    return;
    }
                    
# Call the method to enable UWF after the next restart.  This sets the NextEnabled property to false.

    $retval = $objUWFInstance.Enable();
        
# Check the return value to verify that the enable is successful
    if ($retval.ReturnValue -eq 0) {
        "Unified Write Filter will be enabled after the next system restart."
    } else {
        "Unknown Error: " + "{0:x0}" -f $retval.ReturnValue
    }
}

# Create a function to display the current settings of the Unified Write Filter driver.
function Display-UWFState() {
    
# Retrieve the UWF_Filter object
    $objUWFInstance = Get-WmiObject -Namespace $NAMESPACE -Class UWF_Filter;

    if(!$objUWFInstance) {
        "Unable to retrieve Unified Write Filter settings."
        return;
    }
    
# Check the CurrentEnabled property to see if UWF is enabled in the current session.
    if($objUWFInstance.CurrentEnabled) {
        $CurrentStatus = "enabled";
    } else {
        $CurrentStatus = "disabled";
    }

# Check the NextEnabled property to see if UWF is enabled or disabled after the next system restart.
    if($objUWFInstance.NextEnabled) {
        $NextStatus = "enabled";
    } else {
        $NextStatus = "disabled";
    }

   
}

# Some examples of how to call the functions

Display-UWFState

"Enabling Unified Write Filter"
Enable-UWF

Display-UWFState

"Disabling Unified Write Filter"
Disable-UWF

Display-UWFState
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


[Unified Write Filter WMI provider reference](uwf-wmi-provider-reference.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_Filter%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





