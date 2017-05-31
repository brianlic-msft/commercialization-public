---
title: WEKF\_Scancode.Remove
description: WEKF\_Scancode.Remove
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 86185501-edc3-4c1d-be0b-5621c64f9540
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WEKF\_Scancode.Remove


This method removes a custom scan code key combination, causing Keyboard Filter to stop blocking the removed combination.

## Syntax


``` syntax
[Static] uint32 Remove(
    [In] string Modifiers,
    [In] uint16 Scancode
);
```

## Parameters


<a href="" id="modifiers"></a>*Modifiers*  
The modifier keys of the combination to remove.

<a href="" id="scancode"></a>*Scancode*  
The scan code of the combination to remove.

## Return Value


Returns an HRESULT value that indicates [WMI non-error constant](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error constant](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


**WEKF\_Scancode.Remove** removes an existing **WEKF\_Scancode** object. If the object does not exist, **WEKF\_Scancode.Remove** returns an error with the value 0x8007007B.

Because this method is static, you cannot call it on an object instance, but must instead call it at the class level.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[WEKF\_Scancode](wekf-scancode.md)

[Keyboard Filter](keyboardfilter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WEKF_Scancode.Remove%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





