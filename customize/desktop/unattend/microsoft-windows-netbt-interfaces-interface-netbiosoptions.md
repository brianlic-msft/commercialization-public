---
title: NetbiosOptions
description: NetbiosOptions
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: decebe6b-f627-4638-8994-b756bb619ab4
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# NetbiosOptions


`NetbiosOptions` specifies the configurable security settings for the NetBIOS service and determines the mode of operation for NetBIOS over TCP/IP on the parent interface.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>0</strong></p></td>
<td><p>Specifies that the Dynamic Host Configuration Protocol (DHCP) setting is used if available.</p></td>
</tr>
<tr class="even">
<td><p><strong>1</strong></p></td>
<td><p>Specifies that NetBIOS is enabled. This is the default value if DHCP is not available.</p></td>
</tr>
<tr class="odd">
<td><p><strong>2</strong></p></td>
<td><p>Specifies that NetBIOS is disabled.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[microsoft-windows-netbt-](microsoft-windows-netbt.md) | [Interfaces](microsoft-windows-netbt-interfaces.md) | [Interface](microsoft-windows-netbt-interfaces-interface.md) | **NetbiosOptions**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-netbt-](microsoft-windows-netbt.md).

## XML Example


The following XML output shows how to configure microsoft-windows-netbt-.

``` syntax
<Interfaces>
   <Interface wcm:action="add">
      <NameServerList>
         <IpAddress wcm:action="add" wcm:keyValue="IpAddress1">123.45.67.89</IpAddress>
         <IpAddress wcm:action="add" wcm:keyValue="IpAddress2">56.78.90.123</IpAddress>
       </NameServerList>
       <NetbiosOptions>2</NetbiosOptions>
       <Identifier>Local Area Connection</Identifier>
   </Interface>
</Interfaces>
```

## Related topics


[Interface](microsoft-windows-netbt-interfaces-interface.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20NetbiosOptions%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





