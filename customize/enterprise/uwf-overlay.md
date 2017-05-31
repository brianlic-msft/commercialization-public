---
title: UWF\_Overlay
description: UWF\_Overlay
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3f58bd9d-73e8-4684-baa1-690b739dc226
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_Overlay


Contains the current size of the Unified Write Filter (UWF) overlay and manages the critical and warning thresholds for the overlay size.

## Syntax


``` syntax
class UWF_Overlay {
    [key]  string Id;
    [read] UInt32 OverlayConsumption;
    [read] UInt32 AvailableSpace;
    [read] UInt32 CriticalOverlayThreshold;
    [read] UInt32 WarningOverlayThreshold;

    UInt32 GetOverlayFiles(
        [in] string Volume,
        [out, EmbeddedInstance("UWF_OverlayFile")] string OverlayFiles[]
    );
    UInt32 SetWarningThreshold(
        UInt32 size
    );
    UInt32 SetCriticalThreshold(
        UInt32 size
    );
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
<td><p>[UWF_Overlay.GetOverlayFiles](uwf-overlaygetoverlayfiles.md)</p></td>
<td><p>Returns a list of files of a volume that were cached in the UWF overlay.</p></td>
</tr>
<tr class="even">
<td><p>[UWF_Overlay.SetWarningThreshold](uwf-overlaysetwarningthreshold.md)</p></td>
<td><p>Sets the warning threshold for monitoring the size of the UWF overlay.</p></td>
</tr>
<tr class="odd">
<td><p>[UWF_Overlay.SetCriticalThreshold](uwf-overlaysetcriticalthreshold.md)</p></td>
<td><p>Sets the critical warning threshold for monitoring the size of the UWF overlay.</p></td>
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
<td><p>A unique ID. This is always set to <strong>UWF_Overlay</strong>.</p></td>
</tr>
<tr class="even">
<td><p><strong>OverlayConsumption</strong></p></td>
<td><p>UInt32</p></td>
<td><p>[read]</p></td>
<td><p>The current size, in megabytes, of the UWF overlay.</p></td>
</tr>
<tr class="odd">
<td><p><strong>AvailableSpace</strong></p></td>
<td><p>UInt32</p></td>
<td><p>[read]</p></td>
<td><p>The amount of free space, in megabytes, available to the UWF overlay.</p></td>
</tr>
<tr class="even">
<td><p><strong>CriticalOverlayThreshold</strong></p></td>
<td><p>UInt32</p></td>
<td><p>[read]</p></td>
<td><p>The critical threshold size, in megabytes. UWF sends a critical threshold notification event when the UWF overlay size reaches or exceeds this value.</p></td>
</tr>
<tr class="odd">
<td><p><strong>WarningOverlayThreshold</strong></p></td>
<td><p>UInt32</p></td>
<td><p>[read]</p></td>
<td><p>The warning threshold size, in megabytes. UWF sends a warning threshold notification event when the UWF overlay size reaches or exceeds this value.</p></td>
</tr>
</tbody>
</table>

 

### Examples

The following example demonstrates how to use the UWF overlay by using the WMI provider in a PowerShell script.

``` syntax
$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Function to set the Unified Write Filter overlay warning threshold

function Set-OverlayWarningThreshold($ThresholdSize) {

# Retrieve the overlay WMI object
    
    $OverlayInstance = Get-WMIObject -namespace $NAMESPACE -class UWF_Overlay;

    if(!$OverlayInstance) {
        "Unable to get handle to an instance of the UWF_Overlay class"
        return;
    }
    
# Call the instance method to set the warning threshold value
                    
    $retval = $OverlayInstance.SetWarningThreshold($ThresholdSize);
                                            
# Check the return value to verify that setting the warning threshold is successful
    
    if ($retval.ReturnValue -eq 0) {
        "Overlay warning threshold has been set to " + $ThresholdSize + " MB"
    } else {
        "Unknown Error: " + "{0:x0}" -f $retval.ReturnValue
    }
}

# Function to set the Unified Write Filter overlay critical threshold

function Set-OverlayCriticalThreshold($ThresholdSize) {

# Retrieve the overlay WMI object
    
    $OverlayInstance = Get-WMIObject -namespace $NAMESPACE -class UWF_Overlay;

    if(!$OverlayInstance) {
        "Unable to get handle to an instance of the UWF_Overlay class"
        return;
    }
    
# Call the instance method to set the warning threshold value
                    
    $retval = $OverlayInstance.SetCriticalThreshold($ThresholdSize);
                                            
# Check the return value to verify that setting the critical threshold is successful
    
    if ($retval.ReturnValue -eq 0) {
        "Overlay critical threshold has been set to " + $ThresholdSize + " MB"
    } else {
        "Unknown Error: " + "{0:x0}" -f $retval.ReturnValue
    }
}

# Function to print the current overlay information

function Get-OverlayInformation() {

# Retrieve the Overlay WMI object
    
    $OverlayInstance = Get-WMIObject -namespace $NAMESPACE -class UWF_Overlay;

    if(!$OverlayInstance) {
        "Unable to get handle to an instance of the UWF_Overlay class"
        return;
    }
    
# Display the current values of the overlay properties

    "`nOverlay Consumption: " + $OverlayInstance.OverlayConsumption
    "Available Space: " + $OverlayInstance.AvailableSpace
    "Critical Overlay Threshold: " + $OverlayInstance.CriticalOverlayThreshold
    "Warning Overlay Threshold: " + $OverlayInstance.WarningOverlayThreshold
}

# Examples of using these functions

"`nSetting the warning threshold to 768 MB."
Set-OverlayWarningThreshold( 768 )

"`nSetting the critical threshold to 896 MB."
Set-OverlayCriticalThreshold( 896 )

"`nDisplaying the current state of the overlay."
Get-OverlayInformation
```

### Remarks

Only one **UFW\_Overlay** instance exists for a system protected with UWF.

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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_Overlay%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





