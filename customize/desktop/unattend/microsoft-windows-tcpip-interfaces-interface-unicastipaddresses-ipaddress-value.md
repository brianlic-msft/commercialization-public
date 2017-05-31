---
title: Value
description: Value
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ec2f6d75-998c-4b09-83c6-457a681fea3d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Value


`Value` specifies the value of the [IpAddress](microsoft-windows-tcpip-interfaces-interface-unicastipaddresses-ipaddress.md).

It can also optionally specify a routing prefix length, which is often expressed as a subnet mask. The *routing prefix length* refers to the number of leading bits in the IP address. A *subnet mask* is a bit mask covering the number of bits used in the prefix.

If the routing prefix length is not defined, the default routing prefix length will be used, based on the class of the IP address.

**Default routing prefix lengths and subnet masks for IPv4 addresses**

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Class</th>
<th>Start</th>
<th>End</th>
<th>Default routing prefix length</th>
<th>Default subnet mask in dotted decimal</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>A</p></td>
<td><p>0.0.0.0</p></td>
<td><p>127.255.255.255</p></td>
<td><p>8</p></td>
<td><p>255.0.0.0</p></td>
</tr>
<tr class="even">
<td><p>B</p></td>
<td><p>128.0.0.0</p></td>
<td><p>191.255.255.255</p></td>
<td><p>16</p></td>
<td><p>255.255.0.0</p></td>
</tr>
<tr class="odd">
<td><p>C</p></td>
<td><p>192.0.0.0</p></td>
<td><p>223.255.255.255</p></td>
<td><p>24</p></td>
<td><p>255.255.255.0</p></td>
</tr>
<tr class="even">
<td><p>D</p></td>
<td><p>224.0.0.0</p></td>
<td><p>239.255.255.255</p></td>
<td><p>Multicasting</p></td>
<td><p>Multicasting</p></td>
</tr>
<tr class="odd">
<td><p>E</p></td>
<td><p>240.0.0.0</p></td>
<td><p>255.255.255.254</p></td>
<td><p>Reserved</p></td>
<td><p>Reserved</p></td>
</tr>
</tbody>
</table>

 

**Note**  
This element does not appear in the **Properties** pane of Windows System Image Manager (Windows SIM) until you add [IpAddress](microsoft-windows-tcpip-interfaces-interface-unicastipaddresses-ipaddress.md) to the unattended installation answer file.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Value</em></p></td>
<td><p>Specifies the value of the IP Address, and routing prefix length. <em>Value</em> is a string.</p>
<p>To use the default routing prefix length, use the format: <em>&lt;IP_Address&gt;</em>. <em>&lt;IP_Address&gt;</em> can be any valid IPv4 or IPv6 address.</p>
<p>To define a routing prefix length, use the format: <em>&lt;IP_Address&gt;/&lt;Routing_Prefix_Length&gt;</em>. For IPv4 addresses, <em>&lt;Routing_Prefix_Length&gt;</em> can be any value between 0 and 32. For IPv6 addresses, <em>&lt;Routing_Prefix_Length&gt;</em> can be any value between 0 and 64.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

windowsPE

## Parent Hierarchy


[Microsoft-Windows-TCPIP](microsoft-windows-tcpip.md) | [Interfaces](microsoft-windows-tcpip-interfaces.md) | [Interface](microsoft-windows-tcpip-interfaces-interface.md) | [UnicastIpAddresses](microsoft-windows-tcpip-interfaces-interface-unicastipaddresses.md) | [IpAddress](microsoft-windows-tcpip-interfaces-interface-unicastipaddresses-ipaddress.md) | **Value**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-TCPIP](microsoft-windows-tcpip.md).

## XML Example


The following XML output shows how to configure two static IP addresses. In this example:

-   The IPv4 address is set to 192.168.1.0, with a routing prefix length of 25. This defines the subnet mask as 255.255.255.128.

-   The IPv6 address is set to ffff:1::3, with a routing prefix length of 48. This defines the subnet mask as ffff:ffff:ffff:0000:0000:0000:0000:0000.

``` syntax
      <UnicastIpAddresses>
         <IpAddress wcm:action="add" wcm:keyValue="1">192.168.0.1/25</IpAddress> 
         <IpAddress wcm:action="add" wcm:keyValue="2">ffff:1::3/48</IpAddress> 
      </UnicastIpAddresses>
```

The following XML output shows how to configure a single IP address. In this example, the IP address is set to 10.168.1.0. This is an IPv4 Class A address. Windows uses the default subnet mask of 255.0.0.0.

``` syntax
      <UnicastIpAddresses>
         <IpAddress wcm:action="add" wcm:keyValue="1">10.168.1.0</IpAddress> 
      </UnicastIpAddresses>
```

The following XML output shows how to configure a single TCP/IP address. In this example, the IP address is set to 160.168.1.0. This is an IPv4 Class B address. Windows uses the default subnet mask of 255.255.0.0.

``` syntax
      <UnicastIpAddresses>
         <IpAddress wcm:action="add" wcm:keyValue="1">160.168.1.0</IpAddress> 
      </UnicastIpAddresses>
```

## Related topics


[IpAddress](microsoft-windows-tcpip-interfaces-interface-unicastipaddresses-ipaddress.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Value%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





