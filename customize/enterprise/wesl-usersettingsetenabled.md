---
title: WESL\_UserSetting.SetEnabled
description: WESL\_UserSetting.SetEnabled
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8dc373fe-37f9-45ca-bb0a-38f0e54feef1
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WESL\_UserSetting.SetEnabled


This method enables or disables Shell Launcher.

## Syntax


``` syntax
[Static] uint32 SetEnabled(
    [In, Required] boolean Enabled
);
```

## Parameters


<a href="" id="enabled"></a>*Enabled*  
\[in, required\] A Boolean value that indicates whether to enable or disable Shell Launcher.

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


This method enables or disables Shell Launcher by modifying the **Shell** value in the registry key **HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon**. If Unified Write Filter (UWF) is enabled, you may need to disable UWF or commit this registry key by using [UWF\_RegistryFilter.CommitRegistry](uwf-registryfiltercommitregistry.md) in order to enable or disable Shell Launcher.

Enabling or disabling Shell Launcher does not take effect until a user signs in.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[WESL\_UserSetting](wesl-usersetting.md)

[Shell Launcher](shell-launcher.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WESL_UserSetting.SetEnabled%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





