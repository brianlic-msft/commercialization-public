---
title: DNSSuffixSearchOrder
description: DNSSuffixSearchOrder
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 339c15c3-f81c-4efe-8c8a-b2e7ca672c30
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DNSSuffixSearchOrder


`DNSSuffixSearchOrder` specifies the suffix search order for the name resolution.

For DNS clients, you can configure a DNS domain suffix search list that extends or revises DNS search capabilities. By adding suffixes to the list, you can search for short, unqualified computer names in more than one specified DNS domain. Then, if a DNS query fails, the DNS Client service can use this list to append other name suffix endings to your original name and to repeat DNS queries to the DNS server for these alternate, fully qualified domain names.

When the suffix search list is empty or unspecified, the primary DNS suffix of the computer is appended to short, unqualified names, and a DNS query is used to resolve the resulting fully qualified domain name. If this query fails, the computer can try additional queries for alternate fully qualified domain names by appending any connection-specific DNS suffix that is configured for network connections.

When running unattended setup for a DNS client, you can configure a list of suffixes for the DNS Client to search, and a list of DNS servers to use.

However, the entries are not guaranteed to be applied in any particular order.

To ensure that the correct ordering of DNS servers, use [Key](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder-ipaddress-key.md) in [DNSServerSearchOrder](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder.md) and [Key](microsoft-windows-dns-client-dnssuffixsearchorder-domainname-key.md) in `DNSSuffixSearchOrder` to specify the order in which each DNS server should be searched. For example,

``` syntax
   <DNSServerSearchOrder>
      <IpAddress wcm:action="add" wcm:keyValue="2">2001:4898:28:4:213:20ff:fe16:3e96</IpAddress>
      <IpAddress wcm:action="add" wcm:keyValue="3">172.16.1.12</IpAddress>
      <IpAddress wcm:action="add" wcm:keyValue="1">192.168.1.1</IpAddress>
   </DNSServerSearchOrder>
```

You can also use the [Key](microsoft-windows-dns-client-dnssuffixsearchorder-domainname-key.md) setting under `DNSSuffixSearchOrder` element to ensure that suffixes are searched in a specific order. For example,

``` syntax
   <DNSSuffixSearchOrder>
      <DomainName wcm:action="add" wcm:keyValue="2">fabrikam.com</DomainName>
      <DomainName wcm:action="add" wcm:keyValue="3">server2.fabrikam.com</DomainName>
      <DomainName wcm:action="add" wcm:keyValue="1">server1.fabrikam.com</DomainName>    
      </DNSSuffixSearchOrder>
```

For both of these examples, the value for [Key](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder-ipaddress-key.md) in [DNSServerSearchOrder](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder.md) and [Key](microsoft-windows-dns-client-dnssuffixsearchorder-domainname-key.md) in `DNSSuffixSearchOrder` indicates the order in which the DNS servers are searched. In this example, the server search order list is:

1.  192.168.1.1

2.  2001:4898:28:4:213:20ff:fe16:3e96

3.  172.16.1.12

The suffix search order is:

1.  server1.fabrikam.com

2.  fabrikam.com

3.  server2.fabrikam.com

The value for [Key](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder-ipaddress-key.md) in [DNSServerSearchOrder](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder.md) and [Key](microsoft-windows-dns-client-dnssuffixsearchorder-domainname-key.md) in `DNSSuffixSearchOrder` must be unique, and can be set to any alphanumeric character. If the value is numeric (contains numbers only) these will be applied to order the list of [IpAddress](microsoft-windows-dns-client-interfaces-interface-dnsserversearchorder-ipaddress.md) within DNSServerSearchOrder.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DomainName](microsoft-windows-dns-client-dnssuffixsearchorder-domainname.md)</p></td>
<td><p>Specifies a domain name.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-DNS-Client](microsoft-windows-dns-client.md) | **DNSSuffixSearchOrder**

## Valid Passes


specialize

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-DNS-Client](microsoft-windows-dns-client.md).

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


[Microsoft-Windows-DNS-Client](microsoft-windows-dns-client.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DNSSuffixSearchOrder%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





