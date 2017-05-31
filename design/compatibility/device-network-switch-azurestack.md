---
title: Device.Network.Switch.AzureStack
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

## Device.Network.Switch.AzureStack

*Requirements for network switches used in Microsoft Azure Stack based private cloud solutions*

<a name="device.network.switch.azurestack.basicfunction"></a>
### Device.Network.Switch.AzureStack.BasicFunction

*Basic requirements for network switches used in Microsoft Azure Stack solutions*

<table><tr><td>Applies to</td><td>Windows Server 2016 x64</td></tr></table>

**Description**

A Microsoft Azure Stack solution for a private cloud must meet requirements for the physical switch infrastructure. This section enumerates the requirements. 

The Microsoft Azure Stack networking environment assumes a Spine/Leaf CLOS networking configuration for resiliency and scale: 

- The leaf switches provide connectivity to the compute and storage servers in the Microsoft Azure Stack solution. 
- The spine switches provide connectivity between other leaf switches and connectivity to a customer’s network border devices.

These spine and leaf switches must provide Layer 3 (L3), IP-level connectivity in the form of routing/forwarding and Border Gateway Protocol (BGP) support.

NOTE: The details of the physical and logical configuration are beyond the scope of this requirements enumeration and will be contained in the “Architecture document for Microsoft Azure Stack”.

In addition to the requirements enumerated below Microsoft Azure Stack will have requirements to validate NIC and physical switches to ensure RDMA is configured and routed correctly.

**Requirements**

Physical switch infrastructure requirements for a private-cloud Microsoft Azure Stack solution are captured in the following table.

<table>
    <tr><th>Feature</th><th>Requirement</th><th>Microsoft Azure Stack certification</th></tr>
    <tr><td rowspan="2">Device.Network.Switch.Manageability</td><td>Device.Network.Switch.Manageability.NetworkSwitchProfile</td><td>If Implemented</td></tr>
	<tr><td>Device.Network.Switch.Manageability.NetworkSwitchProfileView</td><td>If Implemented</td></tr>
</table>

The following tables describe the directional thinking around Microsoft Azure Stack switch requirements.

<table>
    <tr><th colspan="2">SWITCH CHARACTERISTICS</th><th>Microsoft Azure Stack Certification</th></tr>
    <tr><td>OSI layer support</td><td>L2 & L3 switching on all ports</td><td>Required</td></tr>
    <tr><td>Port speed</td><td><p>Access Switch/Compute Nodes: Minimum 10 Gb Ethernet</p><p>Aggregate Switch/Access Switch: Minimum 10 Gb Ethernet</p></td><td>Required</td></tr>
    <tr><td>Traffic throughput</td><td>Line rate for L2 and L3 traffic on all ports</td><td>Required</td></tr>
    <tr><td>Port capabilities</td><td>L2 and L3 switching on all ports</td><td>Required</td></tr>
    <tr><td>Addressing protocols</td>
        <td><p>Must support both IPv4 and IPv6 traffic.</p> 
            <p>IPv6 support for the MUST statements in the following IETF standards is required:</p>
            <ul>
                <li>RFC 2460: "Internet Protocol, Version 6 (IPv6)"</li>
                <li>RFC 2461: "Neighbor Discovery for IP Version 6 (IPv6)"</li>
                <li>RFC 2462: "IPv6 Stateless Address Autoconfiguration"</li>
                <li>RFC 2463: "Internet Control Message Protocol (ICMPv6) for the Internet Protocol, Version 6 (IPv6) Specification."</li></ul>
            <p>Switches must support a minimum of 12,000 IPv6 host routes.</p></td>
            <td>Required</td></tr>
</table>

<table>
    <tr><th colspan="2">ROUTING AND SWITCHING</th><th>Microsoft Azure Stack Certification</th></tr>
    <tr><td>L3 protocols</td>
        <td><p>ECMP</p>
            <p>BGP (IETF RFC 4271)-based ECMP: Currently, BGP is used to provide fault tolerance between Access Switches and Aggregation Switches.</p>
            <p>Implementations should support the MUST statements in the following IETF standards:</p>
            <ul>
                <li>RFC 2545: "BGP-4 Multiprotocol extensions for IPv6 Inter-Domain Routing"</li>
                <li>RFC 4760: "Multiprotocol Extensions for BGP-4"</li>
                <li>RFC 4893: "BGP Support for Four-octet AS Number Space"</li>
                <li>RFC 4456: "BGP Route Reflection: An Alternative to Full Mesh Internal BGP (IBGP)"</li>
                <li>RFC 4724: "Graceful Restart Mechanism for BGP"</li></ul></td>
            <td>Required</td></tr>
    <tr><td>L2 protocols</td><td>LLDP</td><td>Required</td></tr>
    <tr><td>Overlay protocols</td><td>VLAN – Isolation of various types of traffic.</td><td>Required</td></tr>
	<tr><td></td><td>802.1q Trunk</td><td>Required</td></tr>
    <tr><td>Traffic Filtering</td><td>Need a minimum number of ACL’s or VRF support</td><td>Required</td></tr>
</table>

<table>
    <tr><th colspan="2">LINK CONTROL</th><th>Microsoft Azure Stack Certification</th></tr>
    <tr><td>Quality of service</td>
        <td><p>Enhanced Traffic Selection (802.1Qaz)</p>
            <p>Priority Based Flow Control (802.1p/Q and 802.1Qbb)</p></td>
        <td>Required</td></tr>
</table>

<table>
    <tr><th colspan="2">AVAILABILITY AND REDUNDANCY</th><th>Microsoft Azure Stack Certification</th></tr>
    <tr><td>Switch availability</td><td>Multi-Chassis Link Aggregation in conjunction with NIC teaming</td><td>Required</td></tr>
	<tr><td></td><td>VRRP [Assuming that switches will be stackable or that the router is highly available]</td><td>Required</td></tr>
</table>

<table>
    <tr><th colspan="2">MANAGEMENT</th><th>Microsoft Azure Stack Certification</th></tr>
    <tr><td>Startup/Boot</td><td>Startup, boot-up and operations proceed without the intervention of a network switch administrator.</td><td>Required</td></tr>
    <tr><td>Monitoring</td><td>SNMP v1or SNMP v2</td><td>Required</td></tr>
    <tr><td>SNMP MIBs</td><td>MIB-II (RFC 1213), LLDP, Interface MIB (RFC 2863), IF-MIB, IP-MIB, IP-FORWARD-MIB, Q-BRIDGE-MIB, BRIDGE-MIB, LLDB-MIB, Entity-MIB, IEEE8023-LAG-MIB</td><td>Required</td></tr>
    <tr><td>Flow monitoring</td><td><p>Port mirroring</p><p>IPFIX</p></td><td>If Implemented</td></tr>
    <tr><td>Events/Logging</td><td>Syslog (for events and change detection)</td><td>If Implemented</td></tr>
	<tr><td></td><td>Traps (Device must support multiple-trap destinations.)</td><td>Required</td></tr>
</table>

<table>
    <tr><th colspan="2">ACCESS</th><th>Microsoft Azure Stack Certification</th></tr>
    <tr><td>Users</td><td><p>Multi-user support, with credential encryption through either ACL-based or role-based (RBAC) access controls</p><p>Audit of user activities</p></td><td>Required</td></tr>
    <tr><td>Device access</td><td>SSHv2</td><td>Required</td></tr>
    <tr><td>Certificate Usage</td><td>Revocable or CA</td><td>Required</td></tr>
    <tr><td>Authentication</td><td>RADIUS</td><td>Required</td></tr>
    <tr><td>Remote Access</td><td>Switch Virtual Interface</td><td>Required</td></tr>
</table>

The switch should also support IEEE 802.1X Authentication standard.

**Third party Hyper-V Switch Extensions**

Third party extensible switches for Hyper-V that support capturing, filtering, or forwarding of network traffic are not supported in Microsoft Azure Stack solutions.  
