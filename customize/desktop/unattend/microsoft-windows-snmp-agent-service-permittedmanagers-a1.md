---
title: A1
description: A1
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2e02554a-f2cd-47b7-b62a-8fa9a97e290c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# A1


`A1` specifies whether the computer accepts Simple Network Management Protocol (SNMP) requests from any host.

If a host is specified in `A1`, the computer accepts SNMP requests only from that host. You can specify either the host computer name or the IP address for the host. It is recommended that `Host` be used as the host computer name.

You can use this setting in core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012, by enabling **SNMP-SC** in the Windows Foundation package.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>A1</em></p></td>
<td><p>Specifies the host from which the computer accepts SNMP packets. <em>A1</em> is a string.</p>
<p>The default value is <strong>localhost</strong>, which specifies that the computer accepts SNMP requests from any host.</p>
<div class="alert">
<strong>Note</strong>  
<p>The <code>A1</code> setting accepts either <strong>localhost</strong> or a single host. Adding multiple hosts is not supported.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Passes


generalize

specialize

## Parent Hierarchy


[Microsoft-Windows-SNMP-Agent-Service](microsoft-windows-snmp-agent-service.md) | [PermittedManagers](microsoft-windows-snmp-agent-service-permittedmanagers.md) | **A1**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-SNMP-Agent-Service](microsoft-windows-snmp-agent-service.md).

## XML Example


The following XML output shows how to set SNMP.

``` syntax
<PermittedManagers>
   <A1>networkhost</A1>
</PermittedManagers>
<RFC1156Agent>
   <sysContact>MyContact</sysContact>
   <sysLocation>MyLocation</sysLocation>
   <sysServices>65</sysServices>
</RFC1156Agent>
<TrapConfiguration>
   <TrapConfigurationItems wcm:action="add">
      <Community_Name>Private</Community_Name>
      <Traps>ComputerName</Traps>
   </TrapConfigurationItems>
   <TrapConfigurationItems wcm:action="add">
      <Community_Name>Public</Community_Name>
      <Traps>123.45.67.89</Traps>
   </TrapConfigurationItems>
</TrapConfiguration>
<ValidCommunities>
   <ValidCommunity wcm:action="add" wcm:keyValue="Community1">2</ValidCommunity>
   <ValidCommunity wcm:action="add" wcm:keyValue="Community2">4</ValidCommunity>
</ValidCommunities>
```

## Related topics


[PermittedManagers](microsoft-windows-snmp-agent-service-permittedmanagers.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20A1%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





