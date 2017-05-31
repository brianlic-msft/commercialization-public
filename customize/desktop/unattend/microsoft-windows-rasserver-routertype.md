---
title: RouterType
description: RouterType
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1a5c7538-c559-4825-b697-832e5feb251b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# RouterType


`RouterType` specifies the router type for Remote Access Service (RAS).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>1</strong></p></td>
<td><p>Specifies that RAS is supported. This is the value for dial-up access.</p></td>
</tr>
<tr class="even">
<td><p><strong>2</strong></p></td>
<td><p>Specifies that a local area network (LAN) is supported. This is the value for network address translation (NAT) access.</p></td>
</tr>
<tr class="odd">
<td><p><strong>3</strong></p></td>
<td><p>Specifies that RAS and LAN are both supported.</p></td>
</tr>
<tr class="even">
<td><p><strong>4</strong></p></td>
<td><p>Specifies that a wide area network (WAN) for on-demand dialing is supported. This is the value for demand-dial routing.</p></td>
</tr>
<tr class="odd">
<td><p><strong>5</strong></p></td>
<td><p>Specifies that RAS and WAN are supported.</p></td>
</tr>
<tr class="even">
<td><p><strong>6</strong></p></td>
<td><p>Specifies that LAN and WAN are supported.</p></td>
</tr>
<tr class="odd">
<td><p><strong>7</strong></p></td>
<td><p>Specifies that RAS, LAN, and WAN are all supported. This is the value for virtual private network (VPN) access.</p></td>
</tr>
</tbody>
</table>

 

The default value is **7**.

## Parent Hierarchy


[Microsoft-Windows-RasServer](microsoft-windows-rasserver.md) | **RouterType**

## Valid Passes


specialize

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-RasServer](microsoft-windows-rasserver.md).

## XML Example


The following XML output shows how to enable RAS and set the router type for LAN access.

``` syntax
<ConfigurationFlags>true</ConfigurationFlags> 
<RouterType>2</RouterType>
```

## Related topics


[Microsoft-Windows-RasServer](microsoft-windows-rasserver.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RouterType%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





