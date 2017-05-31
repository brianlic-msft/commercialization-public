---
title: Microsoft-Windows-DNS-Client
description: Microsoft-Windows-DNS-Client
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2b227e7a-3738-42b3-af78-b3a98f7d8412
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-DNS-Client


The Microsoft-Windows-DNS-Client component contains settings for configuring the Domain Name System (DNS), a system for naming computers and network services that organizes them into a hierarchy of domains. DNS naming is used on TCP/IP networks, such as the Internet, to locate computers and services by using user-friendly names.

The DNS Client service is used to resolve DNS domain names, by querying locally cached information obtained from a previous query or by querying a remote DNS server.

Some settings are global, and others are interface-specific. Global settings apply to all network adapters on the computer. Interface-specific settings apply only to a single interface and may overlap with global settings.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DNSDomain](microsoft-windows-dns-client-dnsdomain.md)</p></td>
<td><p>Specifies the primary DNS suffix of the network connection across all adapters. If <code>DNSDomain</code> is specified in two places as a global parameter (x) and as an interface-specific parameter (y), the two values are concatenated appropriately for each interface (as x, y) and used.</p></td>
</tr>
<tr class="even">
<td><p>[DNSSuffixSearchOrder](microsoft-windows-dns-client-dnssuffixsearchorder.md)</p></td>
<td><p>Specifies the suffix search order for DNS servers. This is a global setting.</p></td>
</tr>
<tr class="odd">
<td><p>[Interfaces](microsoft-windows-dns-client-interfaces.md)</p></td>
<td><p>Specifies an interface collection.</p></td>
</tr>
<tr class="even">
<td><p>[UseDomainNameDevolution](microsoft-windows-dns-client-usedomainnamedevolution.md)</p></td>
<td><p>Specifies whether to use domain-name devolution when the DNS-caching resolver resolves an unqualified query.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-DNS-Client%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





