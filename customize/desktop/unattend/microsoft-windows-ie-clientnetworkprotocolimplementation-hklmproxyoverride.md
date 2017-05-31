---
title: HKLMProxyOverride
description: HKLMProxyOverride
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4771aacf-07bb-438a-8f3a-2ce9c600b4d7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HKLMProxyOverride


`HKLMProxyOverride` specifies a list of host names or IP addresses that bypasses the proxy server for all users on the computer.

**Note**  
`HKLMProxyOverride` is effective only if the Group Policy for Microsoft Internet Explorer: "Make proxy settings per-machine (rather than per-user)" is set to **Enabled**. This Group Policy is accessible through the registry key: `HKLMSoftware\Policies\Microsoft\Windows\CurrentVersion\InternetSettings`. When this setting is active, it appears as `ProxySettingsPerUser`, as the type: **REG DWORD** with the default value set to **0**.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>list_of_hostnames</em> or <em>IP_addresses</em></p></td>
<td><p>Specifies one or more host names or IP addresses that bypass the proxy server. You can add multiple entries by using semicolons as the separator. Both <em>IP_addresses</em> and <em>list_of_hostnames</em> are strings.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

**Note**  
If you require more than one address, list multiple addresses separated by semicolons. Include the string `<local>` to bypass the proxy server for all intranet addresses.

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md) | **HKLMProxyOverride**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md).

## XML Example


The following XML output shows how to specify a list of host names or IP addresses that bypass the proxy server for all users on the computer.

``` syntax
<HKLMProxyEnable>true</HKLMProxyEnable>
<HKLMProxyOverride>www.fabrikam.com;*.contoso.com; 207.46.197.32</HKLMProxyOverride>
<HKLMProxyServer>207.46.197.32</HKLMProxyServer>
```

## Related topics


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20HKLMProxyOverride%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





