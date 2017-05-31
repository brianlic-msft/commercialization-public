---
title: WEKF\_CustomKey.Add
description: WEKF\_CustomKey.Add
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 59040e1b-1706-476b-9d7c-2279b20c47b4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WEKF\_CustomKey.Add


Creates a new custom key combination and enables Keyboard Filter to block the new key combination.

## Syntax


``` syntax
[Static] uint32 Add(
    [In] string CustomKey
);
```

## Parameters


<a href="" id="customkey"></a>*CustomKey*  
\[in\] The custom key combination to add. For a list of valid key names, see [Keyboard Filter key names](keyboardfilter-key-names.md).

## Return Value


Returns an HRESULT value that indicates a [WMI Non-Error Constant](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI Error Constant](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


**WEKF\_CustomKey.Add** creates a new **WEKF\_CustomKey** object and sets the **Enabled** property of the new object to **true**, and the **Id** property to *CustomKey*.

If a **WEKF\_CustomKey** object already exists with the **Id** property equal to *CustomKey*, then **WEKF\_CustomKey.Add** returns an error code and does not create a new object or modify any properties of the existing object. If the existing **WEKF\_CustomKey** object has the **Enabled** property set to **false**, Keyboard Filter does not block the custom key combination.

## Example


The following code demonstrates how to add or enable a custom key that Keyboard Filter will block by using the Windows Management Instrumentation (WMI) providers for Keyboard Filter.

``` syntax
$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Create a handle to the class instance so we can call the static methods
$classCustomKey = [wmiclass]"\\$COMPUTER\${NAMESPACE}:WEKF_CustomKey"

# Create a function to add or enable a key combination for Keyboard Filter to block
function Enable-Custom-Key($KeyId) {

# Check to see if the custom key object already exists
    $objCustomKey = Get-WMIObject -namespace $NAMESPACE -class WEKF_CustomKey |
            where {$_.Id -eq "$KeyId"};

    if ($objCustomKey) {

# The custom key already exists, so just enable it
        $objCustomKey.Enabled = 1;
        $objCustomKey.Put() | Out-Null;
        "Enabled ${KeyId}.";

    } else {

# Create a new custom key object by calling the static Add method
        $retval = $classCustomKey.Add($KeyId);

# Check the return value to verify that the Add is successful
        if ($retval.ReturnValue -eq 0) {
            "Added ${KeyID}."
        } else {
            "Unknown Error: " + "{0:x0}" -f $retval.ReturnValue
        }
    }
}

# Enable Keyboard Filter to block several custom keys

Enable-Custom-Key "Ctrl+v"
Enable-Custom-Key "Ctrl+v"
Enable-Custom-Key "Shift+4"
Enable-Custom-Key "Ctrl+Alt+w"

# List all the currently existing custom keys

$objCustomKeyList = get-WMIObject -namespace $NAMESPACE -class WEKF_CustomKey
foreach ($objCustomKeyItem in $objCustomKeyList) {
    "Custom key: " + $objCustomKeyItem.Id
    "   enabled: " + $objCustomKeyItem.Enabled
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


[WEKF\_CustomKey](wekf-customkey.md)

[Keyboard Filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WEKF_CustomKey.Add%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





