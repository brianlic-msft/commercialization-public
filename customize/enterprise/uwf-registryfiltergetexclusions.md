---
title: UWF\_RegistryFilter.GetExclusions
description: UWF\_RegistryFilter.GetExclusions
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6e2e8c67-bbb6-4296-93b7-1e95c851ae1b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_RegistryFilter.GetExclusions


Retrieves all registry key exclusions from a device that is protected by Unified Write Filter (UWF).

## Syntax


``` syntax
UInt32 GetExclusions(
    [out, EmbeddedInstance("UWF_ExcludedRegistryKey")] string ExcludedKeys[]
);
```

## Parameters


<a href="" id="excludedkeys"></a>*ExcludedKeys*  
\[out\] An array of [UWF\_ExcludedRegistryKey](uwf-excludedregistrykey.md) objects that represent the registry keys excluded from UWF filtering.

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


If this method does not find any registry keys in the registry key exclusion list, it sets the *ExcludedKeys* parameter to null.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[UWF\_RegistryFilter](uwf-registryfilter.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_RegistryFilter.GetExclusions%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





