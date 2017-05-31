---
title: Microsoft-Windows-SNMP-Agent-Service
description: Microsoft-Windows-SNMP-Agent-Service
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a0c7d7e4-9d13-4889-b411-95c1910bab54
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-SNMP-Agent-Service


The Microsoft-Windows-SNMP-Agent-Service component enables the computer to process Simple Network Management Protocol (SNMP) requests. The service receives the SNMP requests from the network, decodes them, and then dispatches them to the appropriate SNMP Extension agent.

The service is also responsible for sending traps on behalf of SNMP Extension agents, and forwarding trap messages to the appropriate configured management systems.

If the service is stopped, then the computer cannot process SNMP requests. If this service is disabled, then any services that explicitly depend on it fail to start.

You can use this setting in core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012, by enabling **SNMP-SC** in the Windows Foundation package.

For more information, see [Simple Network Management Protocol](http://go.microsoft.com/fwlink/?LinkId=139843).

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Term</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[EnableAuthenticationTraps](microsoft-windows-snmp-agent-service-enableauthenticationtraps.md)</p></td>
<td><p>Specifies whether to send an authentication trap when an unauthorized community or host requests information.</p></td>
</tr>
<tr class="even">
<td><p>[PermittedManagers](microsoft-windows-snmp-agent-service-permittedmanagers.md)</p></td>
<td><p>Specifies whether the computer accepts SNMP requests from any host or from only a set of hosts. If no permitted managers are specified, then the SNMP service accepts packets from any host.</p></td>
</tr>
<tr class="odd">
<td><p>[RFC1156Agent](microsoft-windows-snmp-agent-service-rfc1156agent.md)</p></td>
<td><p>Specifies details about the computer.</p></td>
</tr>
<tr class="even">
<td><p>[TrapConfiguration](microsoft-windows-snmp-agent-service-trapconfiguration.md)</p></td>
<td><p>Specifies details about the trap configurations used by the computer.</p></td>
</tr>
<tr class="odd">
<td><p>[ValidCommunities](microsoft-windows-snmp-agent-service-validcommunities.md)</p></td>
<td><p>Specifies the community names from which the computer running the SNMP service can handle requests for a management application, such as GET, SET, GETNEXT, and GETBULK.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-SNMP-Agent-Service%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





