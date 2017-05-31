---
title: Interface
description: Interface
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a869644a-8437-4230-8ca7-0c63bb7fef09
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Interface


`Interface` contains interface-specific settings for a Domain Name System (DNS) interface.

DNS settings can be divided into two primary groups—global settings and interface settings. Global settings apply to the protocols as a whole and are applied across all network interfaces. Interface settings are specific to a particular network interface.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DisableDynamicUpdate](microsoft-windows-dns-client-interfaces-interface-disabledynamicupdate.md)</p></td>
<td><p>Specifies whether to register the host (A) and pointer (PTR) resource records dynamically.</p></td>
</tr>
<tr class="even">
<td><p>[DNSDomain](microsoft-windows-dns-client-interfaces-interface-dnsdomain.md)</p></td>
<td><p>Specifies the DNS suffix of the network connection across all adapters. If <code>DNSDomain</code> is specified in two places—as a global parameter (x) and as an interface-specific parameter (y)—the two values are concatenated appropriately for each interface (as x, y) and used.</p></td>
</tr>
<tr class="odd">
<td><p>[DNSServerSearchOrder](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder.md)</p></td>
<td><p>Specifies a list of addresses to use when searching for the DNS server on the network.</p></td>
</tr>
<tr class="even">
<td><p>[EnableAdapterDomainNameRegistration](microsoft-windows-dns-client-interfaces-interface-enableadapterdomainnameregistration.md)</p></td>
<td><p>Specifies whether to register the host (A) and pointer (PTR) resource records for this adapter. If it is not specified, only the [DNSDomain](microsoft-windows-dns-client-dnsdomain.md) value specified in the global parameters is used.</p></td>
</tr>
<tr class="odd">
<td><p>[Identifier](microsoft-windows-dns-client-interfaces-interface-identifier.md)</p></td>
<td><p>Specifies the interface identifier.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-DNS-Client](microsoft-windows-dns-client.md) | [Interfaces](microsoft-windows-dns-client-interfaces.md) | **Interface**

## Valid Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-DNS-Client](microsoft-windows-dns-client.md).

## XML Example


The following XML output shows a DNS domain configuration for Fabrikam.

``` syntax
   <DNSDomain>fabrikam.com</DNSDomain>
   <DNSSuffixSearchOrder>
      <DomainName wcm:action="add" wcm:keyValue="1">server1.fabrikam.com</DomainName>
      <DomainName wcm:action="add" wcm:keyValue="2">fabrikam.com</DomainName>
   </DNSSuffixSearchOrder>
   <UseDomainNameDevolution>true</UseDomainNameDevolution>
   <Interfaces>
      <Interface wcm:action="add">
         <Identifier>Local Area Connection</Identifier>
         <DNSDomain>fabrikam.com</DNSDomain>
         <DNSServerSearchOrder>
            <IpAddress wcm:action="add" wcm:keyValue="1">192.168.1.1</IpAddress>
            <IpAddress wcm:action="add" wcm:keyValue="2">192.168.1.2</IpAddress>
         </DNSServerSearchOrder>
         <EnableAdapterDomainNameRegistration>true</EnableAdapterDomainNameRegistration>
         <DisableDynamicUpdate>false</DisableDynamicUpdate>
      </Interface>
      <Interface wcm:action="add">
         <Identifier>Local Area Connection 2</Identifier>
         <DNSDomain>fabrikam.com</DNSDomain>
         <DNSServerSearchOrder>
            <IpAddress wcm:action="add" wcm:keyValue="1">192.168.1.1</IpAddress>
            <IpAddress wcm:action="add" wcm:keyValue="2">2001:4898:28:4:213:20ff:fe16:3e96</IpAddress>
         </DNSServerSearchOrder>
         <EnableAdapterDomainNameRegistration>true</EnableAdapterDomainNameRegistration>
        <DisableDynamicUpdate>false</DisableDynamicUpdate>
      </Interface>
   </Interfaces>
```

## Related topics


[Interfaces](microsoft-windows-dns-client-interfaces.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Interface%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





