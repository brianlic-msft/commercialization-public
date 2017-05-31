---
title: sysServices
description: sysServices
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 77b6f60e-fb08-4c5c-9164-0b19fbf78632
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# sysServices


`sysServices` specifies any combination of up to five Simple Network Management Protocol (SNMP) services.

The integer value is derived from the following binary values:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Service</th>
<th>Binary Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Physical</p></td>
<td><p>0x01</p></td>
</tr>
<tr class="even">
<td><p>DataLink and Subnet</p></td>
<td><p>0x02</p></td>
</tr>
<tr class="odd">
<td><p>Internet</p></td>
<td><p>0x04</p></td>
</tr>
<tr class="even">
<td><p>End-to-end</p></td>
<td><p>0x08</p></td>
</tr>
<tr class="odd">
<td><p>Application</p></td>
<td><p>0x40</p></td>
</tr>
</tbody>
</table>

 

For example, a combination of **Physical** and **Application** has a value of 0x41 (65).

You can use this setting in core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012, by enabling **SNMP-SC** in the Windows Foundation package.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>SysServices</em></p></td>
<td><p>Specifies any combination of up to five SNMP services. <em>SysServices</em> is an integer. The default value is <strong>76</strong>.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


generalize

specialize

## Parent Hierarchy


[Microsoft-Windows-SNMP-Agent-Service](microsoft-windows-snmp-agent-service.md) | [RFC1156Agent](microsoft-windows-snmp-agent-service-rfc1156agent.md) | **sysServices**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-SNMP-Agent-Service](microsoft-windows-snmp-agent-service.md).

## XML Example


The following XML sample output shows how to set SNMP.

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
      <Traps>207.46.197.32</Traps>
   </TrapConfigurationItems>
</TrapConfiguration>
<ValidCommunities>
   <ValidCommunity wcm:action="add" wcm:keyValue="Community1">2</ValidCommunity>
   <ValidCommunity wcm:action="add" wcm:keyValue="Community2">4</ValidCommunity>
</ValidCommunities>
```

## Related topics


[RFC1156Agent](microsoft-windows-snmp-agent-service-rfc1156agent.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20sysServices%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





