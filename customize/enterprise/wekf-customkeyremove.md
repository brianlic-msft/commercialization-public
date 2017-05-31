---
title: WEKF\_CustomKey.Remove
description: WEKF\_CustomKey.Remove
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 944d2987-5b2c-4c88-8199-dcec12d626b2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WEKF\_CustomKey.Remove


Removes a custom key combination, causing Keyboard Filter to stop blocking the removed key combination.

## Syntax


``` syntax
[Static] uint32 Remove(
    [In] string CustomKey
);
```

## Parameters


<a href="" id="customkey"></a>*CustomKey*  
\[in\] The custom key combination to remove.

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


**WEKF\_CustomKey.Remove** removes an existing **WEKF\_CustomKey** object. If the object does not exist, **WEKF\_CustomKey.Remove** returns an error with the value 0x8007007B.

Because this method is static, you cannot call it on an object instance, but must instead call it at the class level.

## Example


The following code demonstrates how to remove a custom key from Keyboard Filter so it is no longer blocked by using the Windows Management Instrumentation (WMI) providers for Keyboard Filter.

``` syntax
$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Create a handle to the class instance so we can call the static methods
$classCustomKey = [wmiclass]"\\$COMPUTER\${NAMESPACE}:WEKF_CustomKey"

# Create a function to remove a key combination
function Remove-Custom-Key($KeyId) {

# Call the static Remove() method on the class reference
    $retval = $classCustomKey.Remove($KeyId)

# Check the return value for status
    if ($retval.ReturnValue -eq 0) {

# Custom key combination removed successfully
        "Removed ${KeyID}."
    } elseif ($retval.ReturnValue -eq 2147942523) {

# No object exists with the specified custom key
        "Failed to remove ${KeyID}. No object found."
    } else {

# Unknown error, report error code in hexadecimal
        "Failed to remove ${KeyID}. Unknown Error: " + "{0:x0}" -f $retval.ReturnValue
    }
}


# Example of removing a custom key so that Keyboard Filter stops blocking it
Remove-Custom-Key "Ctrl+Alt+w"

# Example of removing all custom keys that have the Enabled property set to false
$objDisabledCustomKeys = Get-WmiObject -Namespace $NAMESPACE -Class WEKF_CustomKey;

foreach ($objCustomKey in $objDisabledCustomKeys) {
    if (!$objCustomKey.Enabled) {
        Remove-Custom-Key($objCustomKey.Id);
    }
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

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WEKF_CustomKey.Remove%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





