---
title: Device.Network.LAN
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

# Device.Network.LAN

 - [Device.Network.LAN.10GbOrGreater](#device.network.lan.10gborgreater)
 - [Device.Network.LAN.AzureStack](#device.network.lan.azurestack)
 - [Device.Network.LAN.Base](#device.network.lan.base)
 - [Device.Network.LAN.ChecksumOffload](#device.network.lan.checksumoffload)
 - [Device.Network.LAN.CS](#device.network.lan.cs)
 - [Device.Network.LAN.DCB](#device.network.lan.dcb)
 - [Device.Network.LAN.GRE](#device.network.lan.gre)
 - [Device.Network.LAN.IPsec](#device.network.lan.ipsec)
 - [Device.Network.LAN.KRDMA](#device.network.lan.krdma)
 - [Device.Network.LAN.LargeSendOffload](#device.network.lan.largesendoffload)
 - [Device.Network.LAN.PM](#device.network.lan.pm)
 - [Device.Network.LAN.RSC](#device.network.lan.rsc)
 - [Device.Network.LAN.RSS](#device.network.lan.rss)
 - [Device.Network.LAN.SRIOV](#device.network.lan.sriov)
 - [Device.Network.LAN.SRIOV.VF](#device.network.lan.sriov.vf)
 - [Device.Network.LAN.TCPChimney](#device.network.lan.tcpchimney)
 - [Device.Network.LAN.VMMQ](#device.network.lan.vmmq)
 - [Device.Network.LAN.VMQ](#device.network.lan.vmq)
 - [Device.Network.LAN.VXLAN](#device.network.lan.vxlan)
 - [Device.Network.LAN](#device.network.lan)

<a name="device.network.lan.10gborgreater"></a>
## Device.Network.LAN.10GbOrGreater

10GB or Greater LAN requirements 

### Device.Network.LAN.10GbOrGreater.CloudStress
Ethernet Devices that implement GRE Encapsulated Packet Task Offloads must comply with the specification

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

This requirement applies to all Ethernet devices that are Certified for Server.  This test validates that an Ethernet device can meet the stress requirements of a datacenter cloud. Ethernet devices that meet this requirement must also comply with the specification and support the following features:

All Network Adapters must support the following Device.Network.LAN features.  

- Base (requirements 100MbOrGreater through SupportIEEE8023)
- ChecksumOffload
- LargeSendOffload
- RSS

All drivers for NICs operating at 10Gb or higher that implement any of the new features of WS2016 (i.e., NDKPI 2.0, VMMQ, VxLAN Task Offload, NVGREv2 Task Offload, MTU for HNV, PacketDirect) must also pass the PCS (Private Cloud Simulator) test with the ’Basic 10 GigE NIC’ profile on a 4-node clustered configuration.


<a name="device.network.lan.azurestack"></a>
## Device.Network.LAN.AzureStack

_Defines requirements that must be met if the LAN card (NIC) is supported in a Microsoft Azure Stack based private cloud solution_

### Device.Network.LAN.AzureStack.BasicFunction

_Basic requirements for LAN cards used in Microsoft Azure Stack solutions_ 

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Microsoft Azure Stack requirements for LAN cards (NICs) are captured by the following table.

<table>
    <tr><th>Feature</th><th>Requirement></th></tr>
    <tr><td>Device.Network.LAN.10GbOrGreater</td><td>Device.Network.LAN.10GbOrGreater.CloudStress</td></tr>
    <tr><td>Device.Network.LAN.VXLAN</td><td>Device.Network.LAN.VXLAN.VXLANPacketTaskOffloads</td></tr>
    <tr><td>Device.Network.LAN.VMQ</td><td>Device.Network.LAN.VMQ.VirtualMachineQueues</td></tr>
    <tr><td>Device.Network.LAN.VMMQ</td><td>Device.Network.LAN.VMMQ.VirtualMachineMultipleQueues</td></tr>
    <tr><td rowspan="5">Device.Network.LAN.RSS</td><td>Device.Network.LAN.RSS.RSS</td></tr>
   	<tr><td>Device.Network.LAN.RSS.SetHashFunctionTypeAndValue</td></tr>
	<tr><td>Device.Network.LAN.RSS.SupportIndirectionTablesSizes</td></tr>
	<tr><td>Device.Network.LAN.RSS.SupportToeplitzHashFunction</td></tr>
	<tr><td>Device.Network.LAN.RSS.SupportUpdatesToRSSInfo</td></tr>
    <tr><td>Device.Network.LAN.MTUSize</td><td>Device.Network.LAN.MTUSize</td></tr>
    <tr><td>Device.Network.LAN.LargeSendOffload</td><td>Device.Network.LAN.LargeSendOffload.LargeSendOffload</td></tr>
    <tr><td>Device.Network.LAN.KRDMA</td><td>Device.Network.LAN.KRDMA.KRDMA</td></tr>
    <tr><td>Device.Network.LAN.GRE</td><td>Device.Network.LAN.GRE.GREPacketTaskOffloads</td></tr>
    <tr><td>Device.Network.LAN.DCB</td><td>Device.Network.LAN.DCB.DCB</td></tr>
    <tr><td>Device.Network.LAN.ChecksumOffload</td><td>Device.Network.LAN.ChecksumOffload.ChecksumOffload</td></tr>
    <tr><td rowspan="12">Device.Network.LAN.Base</td><td>Device.Network.LAN.Base.100MbOrGreater</td></tr>
    <tr><td>Device.Network.LAN.Base.32MulticastAddresses</td></tr>
	<tr><td>Device.Network.LAN.Base.AdvProperties</td></tr>
	<tr><td>Device.Network.LAN.Base.AnyBoundary</td></tr>
	<tr><td>Device.Network.LAN.Base.IPv4AndIPv6OffloadParity</td></tr>
	<tr><td>Device.Network.LAN.Base.NDISCalls</td></tr>
	<tr><td>Device.Network.LAN.Base.NDISRequirements</td></tr>
	<tr><td>Device.Network.LAN.Base.PacketFiltering</td></tr>
	<tr><td>Device.Network.LAN.Base.PreserveOSServices</td></tr>
	<tr><td>Device.Network.LAN.Base.PriorityVLAN</td></tr>
	<tr><td>Device.Network.LAN.Base.ShortPacketPadding</td></tr>
	<tr><td>Device.Network.LAN.Base.SupportIEEEE8023</td></tr>
    <tr><td rowspan="6">Device.DevFund.Server.Nano</td><td>Device.DevFund.Server.OperateInServerNano</td></tr>
    <tr><td>Device.DevFund.Server.Nano.Deployment</td></tr>
	<tr><td>Device.DevFund.Server.Nano.Diagnostics</td></tr>
	<tr><td>Device.DevFund.Server.Nano.PatchAndUpdate</td></tr>
	<tr><td>Device.DevFund.Server.Nano.MonitoringAndTelemetry</td></tr>
	<tr><td>Device.DevFund.Server.Nano.FirmwareUpdate</td></tr>
</table>

### Device.Network.LAN.AzureStack.CloudStress

_Network controllers that are used for Microsoft Azure Stack solutions must comply with this specification_ 

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Private cloud solutions comprise of tightly integrated software and hardware components to deliver resiliency with high performance. Issues in any of the components (software, hardware, drivers, firmware, and so forth) can compromise the solution and undermine any promises made regarding the Service Level Agreement (SLA) for the private cloud. 

Many of these issues are surfaced only under a high-stress, private cloud simulation. The Private Cloud Simulator (PCS) enables you to validate your component in a cloud scenario and identify such issues. It simulates a live datacenter/private cloud by creating VM workloads, scheduling administrative operations (load balancing, software/hardware maintenance), and injecting faults (unplanned hardware/software failures) on the private cloud. 

To comply with this specification, the controller must pass the PCS test run with the ‘Network Controller – AzureStack’ profile on a 4-node clustered configuration.

### Device.Network.LAN.AzureStack.FirmwareUpdate

_Network controllers that are used for Microsoft Azure Stack solutions must comply with this specification_ 

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Device driver & firmware update tools must meet Nano Server compatibility requirements as detailed in Device.DevFund.Server.Nano


<a name="device.network.lan.base"></a>
## Device.Network.LAN.Base

*LAN requirements*

### Device.Network.LAN.Base.100MbOrGreater

*Ethernet devices must support 100-Mb or greater link speeds.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices must be able to link at 100 Mb or higher speeds.

### Device.Network.LAN.Base.32MulticastAddresses

*Ethernet devices must support filtering for at least 32 multicast addresses.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

An Ethernet device must support filtering of 32 or more multicast addresses. 

Design Notes: See the Windows Driver Kit, "multicast." See the Windows Driver Kit, "NdisReadNetworkAddress" and "MAC Address."

### Device.Network.LAN.Base.AdvProperties

*Ethernet devices must safeguard advanced properties and provide complete configurability through advanced properties.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices must adhere to the standardized registry keywords for controlling advanced features as documented on MSDN.  Devices must also safeguard both Microsoft standardized and private keywords from malicious values.

### Device.Network.LAN.Base.AnyBoundary

*Ethernet devices must be able to transmit packets from buffers aligned on any boundary.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Buffer alignment refers to whether a buffer begins on an odd-byte, word, double-word, or other boundary. Devices must be able to transmit packets with any of the packets fragments beginning on an odd-byte boundary. For performance reasons, packets must be received into contiguous buffers on a double-word boundary.

### Device.Network.LAN.Base.IPv4AndIPv6OffloadParity

*Ethernet devices that implement offloads must do so consistently for both IPv4 and IPv6.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Network offloads implemented by Ethernet devices need to operate consistently, irrespective of the IP protocol used. Having offload parity allows Windows customers to have a consistent and predictable experience across both IPv4 and IPv6.

### Device.Network.LAN.Base.NDISCalls

*Ethernet devices must make only NDIS library or WDF system calls.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A driver for an Ethernet device must make only NDIS or WDF calls. Any calls to other kernel mode components are not allowed. 

Design Notes: See the Windows Driver Kit, "NDIS" and "WDF."

### Device.Network.LAN.Base.NDISRequirements

*Ethernet devices must conform to the NDIS requirements in the Windows Driver Kit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All Ethernet device drivers must conform to NDIS specified in the Windows Driver Kit. 

Design Notes: See the Windows Driver Kit, "NDIS."

### Device.Network.LAN.Base.PacketFiltering

*Ethernet devices must support packet filtering.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The miniport driver must support all filter types in the Windows Driver Kit. Note: Filtering should be performed in Hardware/Firmware.

### Device.Network.LAN.Base.PreserveOSServices

*Ethernet devices Miniport Driver/Driver Software must not disable OS services.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices Miniport Driver/Driver Software must not disable OS services. Some devices tend to shutoff services such as the Base Filtering Engine (BFE). This leaves the system vulnerable to attack due to lack of security capabilities.

### Device.Network.LAN.Base.PriorityVLAN

*Ethernet devices that implement link speeds of gigabit or greater must implement Priority & VLAN tagging according to the IEEE 802.1q specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement link speeds of gigabit or greater. If the Ethernet device does not implement link speeds of gigabit or greater, then this requirement does not apply. The Ethernet device and driver must support the inserting and removing of priority and VLAN tags.

### Device.Network.LAN.Base.ShortPacketPadding

*Ethernet devices must pad short packets with constant data.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Padding that is added to short Ethernet packets to bring that packet size to the minimum IEEE 802.3, Section 4.2.3.3, packet size must be initialized to either zeros or an 8-bit repeating pattern before the packets are transmitted. The 802.3 Ethernet specification requires packets that are shorter than the minimum packet size to be padded up to the minimum size before the packets are transmitted onto the wire. The 802.3 Ethernet specification does not specify the padding content; however, Microsoft requires the padding to be zeros or another constant value to address security concerns. Some drivers pad the packets with data from previously sent packets; this practice is not acceptable. 

Design Notes: New solutions are recommended to implement a padding of zeros. However, some devices that implement the padding in hardware use 0xffs, which addresses the security concern.

### Device.Network.LAN.Base.SupportIEEEE8023

*Ethernet devices must comply with IEEE 802.3.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All 802.3 Ethernet devices must implement and comply with the IEEE 802.3 specification.

<a name="device.network.lan.checksumoffload"></a>
## Device.Network.LAN.ChecksumOffload

*Network requirements *

### Device.Network.LAN.ChecksumOffload.ChecksumOffload

*Ethernet devices must implement Checksum Offloads.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

 

Send and Receive TCP Checksum Offload for IPv4 and IPv6

Send and Receive IP Checksum Offload for IPv4

Send and Receive UDP Checksum offload for IPv4 and IPv6

Support for TCP Checksum Standardized Keywords is mandatory.

Ethernet devices implement Checksum Offloads must expose the NDIS Enumeration Keywords.

 

<a name="device.network.lan.cs"></a>
## Device.Network.LAN.CS

*A connected standby capable computer (also known as a platform) supports a low power active state, and advertises support of that state to the OS using the appropriate ACPI flag (LOW\_POWER\_S0\_IDLE\_CAPABLE) in FADT. It is also expected to meet all the Windows certification requirements for a connected standby platform. This section specifies the connected standby requirements for Wired LAN (Ethernet).*

### Device.Network.LAN.CS.NetworkWake

*Wired LAN (Ethernet) devices integrated into Connected Standby systems or docks shipped with the system must support network wake patterns.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The specific requirements are listed below:

Wake on LAN Patterns:

Wired LAN devices and their drivers are required support at least thirty-two (32) bitmap patterns of a minimum of 128-byte size. This pattern type refers to flexible bitmap patterns (NDIS\_PM\_WOL\_PACKET.NdisPMWoLPacketBitmapPattern) and not other pattern types.

Wake on Magic Packet:

Wired LAN devices and their drivers must support magic packet wake. Support for this wake packet type is required and is not included in the 32-bitmap pattern requirement.

Wake Packet Indication:

Wired LAN devices and their drivers are required to support Wake Packet Indication for all network wake packets and be capable of caching and indicating the complete network packet causing the wake. Note that this supersedes the Device.Network.LAN.PM.WakePacket requirement for Connected Standby-capable devices.

Design Notes:

See the Power Management specification on MSDN.

### Device.Network.LAN.CS.PresenceOffload

*Wired LAN (Ethernet) devices integrated into Connected Standby systems or docks shipped with the system must support network presence offload.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Support of this feature is required. The specific requirements are listed below:

ARP Protocol Offload:

Wired LAN devices must implement ARP offload as it is defined in the Power Management specification on MSDN. Specifically, the offload must respond to an ARP Request (operation = 1) by responding with an ARP Reply (operation = 2) as defined in RFC 826 (<http://tools.ietf.org/html/rfc826>).

NS Protocol Offload:

Wired LAN devices must implement IPv6 NS offload as it is defined in Power Management specification on MSDN. Specifically, the offload must respond to a Neighbor Solicitation (operation = 135) by responding with an NS Advertisement (operation = 136) as defined in RFC 4861 (<http://tools.ietf.org/html/rfc4861>). We require support for at least 2 ND offload requests. Each request can have 2 target addresses. The value they should advertise in NDIS\_PM\_CAPABILITIES::NumNSOffloadIPv6Addresses is the NUMBER OF REQUESTS, not number of addresses. So, if they support the minimum 2 requests, they should advertise 2. The name of the field is wrong and will be fixed in the next NDIS release.

The miniport must implement the said protocol in accordance to RFCs describing Neighbor Discovery and Neighbor Solicitation Protocol for IPv6.

### Device.Network.LAN.CS.ReliableCSConnectivity

*LAN device on systems that support Connected Standby must deliver reliable connectivity in Connected Standby.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The wired LAN device seamlessly transitions between working power state D0 and low power state D2/D3 while in Connected Standby (CS). The wired LAN device maintains OSI layer 2 link connectivity while in CS. The wired LAN device wakes up on matching wake patterns only. There are no spurious wakes while in CS. Wake packets are delivered without delay or buffering. Lock screen apps stay connected with Control Channel or Push Notification triggers over IPv4 and IPv6 in CS.

The exact D-value in low power state depends on the underlying bus type. For example, network adapters on USB, or SDIO buses use D2 as their low power state, while network adapters on PCI or PCIe buses use the D3 state.

Additional Information

Exceptions - Does not apply to non-AOAC capable devices

### Device.Network.LAN.CS.WakeEvents

*Wired LAN (Ethernet) devices integrated into Connected Standby systems or docks shipped with the system must support various wake triggers.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The specific requirements are listed below: Wake on Media Connect:Wired Ethernet devices must advertise and support wake on media connect as defined in the specification on MSDN. Wake on Media Disconnect: Wired Ethernet devices must advertise and support wake on media disconnect as defined in the specification on MSDN.

Design Notes: See the Power Management specification on MSDN.

### Device.Network.LAN.CS.WakeReasonDetection

*Wired LAN (Ethernet) devices integrated into Connected Standby systems or docks shipped with the system must support wake reason detection.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The specific requirements are listed below: Wake Reason support: Wired Ethernet devices must include Wake Reason support in compliance with the NDIS\_STATUS\_PM\_WAKE\_REASON documentation on MSDN.  When the wake is caused by an incoming network packet, the NIC is required to capture and indicate the entire packet causing the wake to the operating system. 

Design Notes: See the Power Management specification on MSDN.

<a name="device.network.lan.dcb"></a>
## Device.Network.LAN.DCB

*LAN requirements *

###  Device.Network.LAN.DCB.DCB

*Ethernet devices that implement Data Center Bridging (DCB) must comply with the DCB Specification*.

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that support Data Center Bridging (DCB).

Ethernet devices that implement Data Center Bridging (DCB) must comply with the following requirements:

 - MaxNumTrafficClasses must be between 3 and 8 inclusive.
 - MaxNumEtsCapableTrafficClasses must be at least 2.
 - MaxNumPfcEnabeldTrafficClasses must be at least 1.
 - ETS Must be supported.
 - PFC Must be supported.
 - Strict Priority Must be supported.
 - iSCSI CNAs must support classification element for iSCSI traffic (TCP ports 860 and 3260, both src and dest port).
 - FCoE CNAs must support classification element for FCoE traffic (Ethertype of 0x8906).

Design Notes

See the Data Center Bridging Specification at <http://msdn.microsoft.com/en-us/library/windows/hardware/hh451635.aspx>.

<a name="device.network.lan.gre"></a>
## Device.Network.LAN.GRE

*LAN requirements *

### Device.Network.LAN.GRE.GREPacketTaskOffloads

*Ethernet devices that implement GRE Encapsulated Packet Task Offloads must comply with the specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement GRE encapsulated packet task offloads. Ethernet devices that implement GRE encapsulated packet task offloads must comply with the specification and support the following encapsulated offload tasks for all combinations of inner/outer IPv4/IPv6 headers:

 - Send checksum (IPv4, TCP, UDP)
 - Receive checksum (IPv4, TCP, UDP)
 - LSOv2
 - VMQ

<a name="device.network.lan.ipsec"></a>
## Device.Network.LAN.IPsec

*LAN requirements *

### Device.Network.LAN.IPsec.IPsec

*Ethernet devices that implement IPsec task offload must support required modes and protocols.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices that support IPsec task offload must support the following: Version: IPsec Task offload v2  NDIS version: 6.1, 6.20, 6.30.

Ethernet devices that support IPsec task offload for Windows 8 must use NDIS 6.30. Mode:

- IPv4 and IPv6 Transport  

- IPv4 and IPv6 TunnelProtocol: ESPCrypto Algorithm:

- Must implement: AES-GCM (128 or higher)

- May implement additional algorithms as stated in http://technet.microsoft.com/en-us/library/dd125380(v=WS.10).aspxCoexistence: Ethernet devices that support IPsec task offload and any the following offload technologies:

- Large Send Offload- Receive Side Scaling

- CheckSum offload.Must implement them in a coexisting manner, such that the use of IPsec task offload does not preclude the use of the other offload technologies implemented for each IPsec mode.

<a name="device.network.lan.krdma"></a>
## Device.Network.LAN.KRDMA

*LAN requirements*

### Device.Network.LAN.KRDMA.KRDMA

*Devices that implement the NetworkDirect Kernel Mode Interface (NDKPI) (a.k.a., Kernel-mode RDMA, kRDMA) must comply with the Network Direct Kernel Mode Interface (NDKPI) Specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement the Network Direct Kernel Mode Interface (NDKPI) Specification. Devices that implement Network Direct Kernel Mode Interface (NDKPI) (a.k.a., Kernel-mode RDMA) must comply with the Network Direct Kernel Mode Interface (NDKPI) Specification. Version 2.0 has been the current specification since July 2014.  Submissions complying with Version 1.2 of the NDKPI Specification will be accepted until December 31, 2016, but will be unable to work with the hyper-converged scenarios in Windows Server 2016.  Effective January 1, 2017, only NDKPI version 2.0 compliant devices will be accepted.  Submissions for the Microsoft Azure Stack (MAS) AQ LOGO not AQ must support NDKPI Version 2.0.

NDKPI version 2.0 describes three modes of operation:

- Mode 1, a mode that supports native mode operation
- Mode 2, a mode that supports NDKPI on NIC_Switch vPorts 
- Mode 3, a mode that supports NDKPI exposed on a VF driver

Windows 10 Client drivers are only required to support Mode 1.

Windows Server 2016 and MAS drivers must support Modes 1 and 2.

*Design Notes*

See the Network Direct Kernel Mode Interface (NDKPI) Specification (version 2.0).

<a name="device.network.lan.largesendoffload"></a>
## Device.Network.LAN.LargeSendOffload

*Network requirements *

### Device.Network.LAN.LargeSendOffload.LargeSendOffload

*Ethernet devices must implement large send offloads.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices must support the following task offloads:

Large Send Offload version 2 for IPv4 and IPv6.

*Design Notes*

See the Windows Driver Kit, "NDIS."

### Device.Network.LAN.MTUSize

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

Ethernet devices must support Jumbo Frames. MTU values in the User Interface must include the Ethernet header size of 14 Bytes. The “*JumboPacket” standardized keyword in the Windows Registry is currently used for setting the MTU size and should remain as an enumerable value with supported values being 1514, 4088, and 9014.

### Device.Network.LAN.MTUSize.EncapOverhead

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

A new keyword will be added called “*EncapOverhead” with type being numeric, default value of 0, max value of 256, and step increments of size 32. This value will account for overhead in Ethernet frames due to virtual network overlay encapsulation such as VXLAN and NVGRE. MTU size will therefore be determined by the summation of these two keyword values except perhaps in the case where *JumboPacket + *EncapOverhead would exceed some hardware upper bound of the NIC.

Devices implementing GRE or VxLAN offloads must also incorporate this requirement.

<a name="device.network.lan.pm"></a>
## Device.Network.LAN.PM

*LAN requirements*

### Device.Network.LAN.PM.PowMgmtNDIS

*Ethernet devices that implement network presence offloads must conform to the Power Management specification on the NDIS program.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices must implement ARP offload as defined in the Power Management specification on MSDN. Specifically, the offload must respond to an ARP Request (operation = 1) by responding with an ARP Reply (operation = 2) as defined in RFC 826.

Ethernet devices must implement IPv6 NS offload as defined in the Power Management specification on MSDN. Specifically, the offload must respond to a Neighbor Solicitation (operation = 135) by responding with an NS Advertisement (operation = 136) as defined in RFC 4861. Devices must support at least 2 NS offloads, each with up to 2 target IPv6 addresses.

Design Notes

See the Power Management specification on MSDN.

See RFC 826 at <http://go.microsoft.com/fwlink/?LinkId=108718>.

Exceptions - Exceptions to this requirement include: PC Card, CardBus devices and for external USB network devices operating on bus power. Devices with transmission speeds in excess of 1 gigabit. Devices with fiber optic medium.

 

### Device.Network.LAN.PM.WakeOnLANPatterns

*Ethernet devices must implement Wake on LAN patterns according to the specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Implementation must comply with Network Device Class Power Management Reference Specification. Ethernet devices and drivers are required to support at least eight (8) bitmap patterns since Windows uses up to eight patterns. Magic packet wake support is required and is not included in the 8-bitmap pattern requirement.

*Design Notes*

Implementation details are in the Power Management specification on MSDN.

Exception - Exceptions to this requirement include: PC Card, CardBus devices and for external USB network devices operating on bus power. Devices with transmission speeds in excess of 1 gigabit. Devices with fiber optic medium. Note: If the device implements Wake on LAN - it must implement it correctly based on this requirement regardless of whether the device is on the exception list.

 

### Device.Network.LAN.PM.WakePacket

*Ethernet devices that implement Wake Packet Detection must comply with Network Device Class Power Management Reference Specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices that implement Wake Packet Detection must comply with Network Device Class Power Management Reference Specification. Implementation must comply with Network Device Class Power Management Reference Specification discussed in the Windows WDK. The NIC is required to capture at least the first 128 bytes of the packet causing the network wake and generate a status indication to the operating system.

*Design Notes*

See the WDK, Network Device Class Power Management Reference Specification.

<a name="device.network.lan.rsc"></a>
## Device.Network.LAN.RSC

*LAN requirements *

### Device.Network.LAN.RSC.RSC

*Ethernet devices that implement Receive Segment Coalescing (RSC) must comply with the RSC Specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices that implement Receive Segment Coalescing (RSC) must comply with the RSC Specification and require both IPv4 and IPv6 support.

*Design Notes*

NDIS version: 6.30

<a name="device.network.lan.rss"></a>
## Device.Network.LAN.RSS

*LAN requirements*

### Device.Network.LAN.RSS.RSS

*Ethernet devices that implement RSS*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

RSS support is required on server SKUs for all devices except for SR-IOV VF drivers.

RSS support is optional on client SKUs.

Ethernet devices that implement RSS must support:

 - Hash types: IPv4, TCP IPv4, IPv6, and TCP IPv6
 - Multiple processor groups (for miniports of NDIS version 6.20 and above)

Number of queues (depending on link speed):

 - Less than 10 gigabit: 2
 - 10 gigabit or greater: 8
 - SR-IOV VF driver (independent of link speed): 2
 - Indirection table size (depending on link speed):
 - Less than 10 gigabit: 64
 - 10 gigabit or greater: 128
 - SR-IOV VF driver (independent of link speed): 16
 - SR-IOV PF driver (independent of link speed): 64
 - Implement all RSS standardized keywords
 - \*RSS
 - \*NumRSSQueues

Message Signaled Interrupts Extended (MSI-X) as defined in the PCI v3.0 specification. For devices with a link speed of less than 10 gigabit, the device must have 1 MSI-X vector with support for 2 RSS hardware queues. For devices 10 gigabit or greater, the device must have an MSI-X vector for each RSS hardware queue. For example, if the device has a link speed of 10 gigabits and advertises support for 8 RSS hardware queues then it must have at least 8 MSI-X vectors in the hardware.

*Design Notes*

See RSS Standardized Keywords Specification <http://msdn.microsoft.com/library/windows/hardware/ff570864.aspx>.

In addition, the device must allocate as many MSI-X table entries as there are CPUs in the system. See the NDIS documentation section on MSI-X for more details <http://msdn.microsoft.com/library/windows/hardware/ff566491.aspx>.

### Device.Network.LAN.RSS.SetHashFunctionTypeAndValue

*Ethernet devices that implement RSS must set the hash function, hash type, and hash value on each indicated packet.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement RSS. If the Ethernet device does not implement RSS, then this requirement does not apply. If the network device supports RSS, all packets for which the RSS implementation was able to calculate the hash, the RSS implementation must return the full 32-bit hash value, the hash function, and the hash type, for each received packet it indicates. For any packets it received without error for which it was not able to generate the hash function, it must clear the hash type. Macros NET\_BUFFER\_LIST\_SET\_HASH\_TYPE,NET\_BUFFER\_LIST\_SET\_HASH\_FUNCTION, and NET\_BUFFER\_LIST\_SET\_HASH\_VALUE must be used to set the associated values.

*Design Notes*

See the MSDN page for more information: <http://msdn.microsoft.com/en-us/library/windows/hardware/ff570726.aspx>. See the Windows Driver Kit, "Indicating RSS Receive Data."

### Device.Network.LAN.RSS.SupportIndirectionTablesSizes

*Ethernet devices that implement RSS must support specific Indirection Table sizes.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement RSS. If the Ethernet device does not implement RSS, then this requirement does not apply. If the network device supports RSS, the RSS implementation must support indirection table sizes for each power of 2, up to the maximum indirection table size supported.  For example, if 128 is the maximum indirection table size, then the miniport must accept indirection tables of sizes 2, 4, 8, 16, 32, 64, or 128. The lookup into the Indirection Table to find the destination CPU must be accomplished by using only the least significant bits as specified by the last value set in the OID\_GEN\_RECEIVE\_SCALE\_PARAMETERS, NumberOfLsbs variable. An RSS implementation must support the host protocol stack setting NumberOfLsbs to any value between 1 and 7, inclusive.

*Design Notes*

See the Windows Driver Kit, "OID\_GEN\_RECEIVE\_SCALE\_PARAMETERS."

### Device.Network.LAN.RSS.SupportToeplitzHashFunction

*Ethernet devices that implement RSS must support the Toeplitz hash function.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement RSS. If the Ethernet device does not implement RSS, then this requirement does not apply. If the network device supports RSS, the RSS implementation must at least support the Toeplitz hash function for the types of packets for which it advertised as being able to generate the hash (as specified in OID\_GEN\_RECEIVE\_SCALE\_CAPABILITIES). This includes support for the HashSecretKey length of 40 bytes.

*Design Notes*

See Windows Driver Kit, "RSS Hashing Functions." Also, refer to MSDN for more information <http://msdn.microsoft.com/en-us/library/windows/hardware/ff570725.aspx>

### Device.Network.LAN.RSS.SupportUpdatesToRSSInfo

*Ethernet devices that implement RSS must support updates to RSS information at any time.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement RSS. If the Ethernet device does not implement RSS, then this requirement does not apply. At any time a network device supports RSS, it must support setting OID\_GEN\_RECEIVE\_SCALE\_PARAMETERS, including updating the Indirection Table, NumberOfLsbs, SecretKey, and HashInformation (hash function and hash type). The RSS implementation can post packets out of order during the transition from the prior state to the new state and can perform a hardware reset if the HashInformation, SecretKey, or NumberOfLsbs changed. It must not perform a hardware reset if only the Indirection Table contents are changed.

*Design Notes*

See the Windows Driver Kit, "OID\_GEN\_RECEIVE\_SCALE\_PARAMETERS."

<a name="device.network.lan.sriov"></a>
## Device.Network.LAN.SRIOV

*Network requirements *

### Device.Network.LAN.SRIOV.SRIOV

*Ethernet devices that implement Single Root I/O Virtualization (SR-IOV) must support required functionalities.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A driver must use Microsoft software back-channel to PF for VF driver PCIe configuration space requests.

The default initial switch configuration must be in the INF file.

The PF INF must set the UpperRange to "ndis5" and LowerRange to "ethernet".

The INF must not include the \*SriovPreferred keyword.

Coalesced filters must be set in NDIS\_REECIVED\_FILTER\_CAPABILITIES.

SR-IOV NIC must include a Virtual Ethernet Bridge (VEB).

If RSS is supported for VF miniports, the NIC must be able to support an independent RSS hash for each function, physical or virtual.

Both the PF and VF miniport drivers must be able to pass the LAN logo tests.

The default vPort cannot be deleted; non-default vPorts on a VF can be deleted.

If SRIOV is disabled, the NIC and miniport must function as a standard Ethernet NIC.

An SRIOV NIC must also advertise and implement VMQ. Queue pair not allocated to IOV are to be available for VMQ.

On report of media connected, the VF miniport must be ready to accept traffic.

A VF miniport must specify an UpperRange of "ndisvf" and a LowerRange of "iovvf".

*Design Notes*

See the Single Root I/O Virtualization Specification.

<a name="device.network.lan.sriov.vf"></a>
## Device.Network.LAN.SRIOV.VF

*Network requirements *

### Device.Network.LAN.SRIOV.VF.VF

*Ethernet devices that implement Single Root I/O Virtualization (SR-IOV) must support required functionalities.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Requirements for an SRIOV VF adapter

A driver must use Microsoft software back-channel to PF for VF driver PCIe configuration space requests.

If RSS is supported for VF miniports, the NIC must be able to support the same number of RSS as it can on PFs.

All NDIS device must conform to NDIS 6.x specified in the Windows Driver Kit so should the VF devices.

A VF miniport must specify an UpperRange of "ndisvf" and a LowerRange of "iovvf".

If the VF miniport implements Receive Segment Coalescing (RSC), it must comply with the RSC specification and require both IPv4 and IPv6 support.

On report of media connected, the VF miniport must be ready to accept traffic.

*Design Notes*

See the Single Root I/O Virtualization Specification.

<a name="device.network.lan.tcpchimney"></a>
## Device.Network.LAN.TCPChimney

*TCP Chimney requirements *

### Device.Network.LAN.TCPChimney.ComplyWithNDIS

*Ethernet devices that implement TCP Chimney must comply with the latest NDIS miniport driver model.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement TCP Chimney. If the Ethernet device does not implement TCP Chimney, then this requirement does not apply. The TCP Chimney portion of the device must comply with the TCP Chimney specification on Connect.

*Design Notes*

See Windows Driver Kit, "Network Devices and Protocols."

### Device.Network.LAN.TCPChimney.ComplyWithTCPIPProtocol

*Ethernet devices that implement TCP Chimney must comply with the IETF standard RFCs for the TCP/IP protocol family and behave as the Microsoft Windows (host) TCP/IP protocol implementation.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement TCP Chimney. If the Ethernet device does not implement TCP Chimney, then this requirement does not apply. The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT","SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this requirement are to be interpreted as described in RFC 2119. A TCP chimney NIC MUST implement the TCP/IP protocol family such that: 1. The TCP/IP protocol implementation conforms to the IETF standard RFCs and 2. The TCP/IP protocol implementation behaves in the same way as the Microsoft Windows TCP/IP protocol implementation. This requirement specifies which RFCs must be implemented by the TCP chimney NIC and clarifies the expected behavior in cases where an RFC is ambiguous. Table 1 lists the RFCs that a TCP Chimney NIC must implement.

<html>
    <table>
        <thead>
            <tr class="header">
                <th>Descriptive name</th>
                <th>Specification</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>Transmission Control Protocol RFCs</td>
                <td>
                    <p>
                        RFC 793 - Transmission Control Protocol<br />
                        RFC 813 - Window and Acknowledgment Strategy in TCP<br />
                        RFC 1122\* - Requirements for Internet Hosts - Communication Layers - entire section 4.2
                    </p>
                    <p>RFC 1323 - TCP Extensions for High Performance</p>
                    <p>RFC 2923\* -TCP Problems with Path MTU Discovery</p>
                    <p>RFC 2988\* - Computing TCP's RTO</p>
                    <p>RFC 3465\* - Appropriate Byte Counting</p>
                </td>
            </tr>
            <tr class="even">
                <td>TCP congestion control</td>
                <td>
                    <p>RFC 2581\* - TCP Congestion Control</p>
                    <p>RFC 2582\* - New Reno Modification to TCP's Fast Recovery Alg.</p>
                    <p>RFC 3042 - Limited Transmit</p>
                </td>
            </tr>
            <tr class="odd">
                <td>TCP loss recovery</td>
                <td>
                    <p>RFC 2018\* - TCP Selective Acknowledgment Options</p>
                    <p>RFC 3517\* - Conservative Selective Acknowledgment (SACK)-based Loss Recovery Algorithm for TCP</p>
                </td>
            </tr>
            <tr class="even">
                <td>TCP security</td>
                <td>RFC tcpm-tcpsecure-09\* - Improving TCP's Robustness to Blind In-Window Attacks</td>
            </tr>
            <tr class="odd">
                <td>Internet Protocol v4 RFCs\*\*</td>
                <td>RFC 791, RFC 894, RFC 1042, RFC 1191, RFC 1122 - entire section 3.2</td>
            </tr>
            <tr class="even">
                <td>Internet Protocol v6 RFCs\*\*</td>
                <td>RFC 1752, RFC 1981, RFC 2374, RFC 2460, RFC 2461, RFC 2675, RFC 2711, RFC 3122, RFC 3513</td>
            </tr>
            <tr class="odd">
                <td>
                    <p>\* - There are associated clarifications for the RFC, which must be followed. They are outlined below.\*\*</p>
                    <p>- TCP Chimney NICs MUST NOT implement the entire set of IP related RFCs. Instead, the TCP Chimney Driver Kit guidelines for the Internet Protocol RFC implementation must be followed.</p>
                </td>
                <td></td>
            </tr>
        </tbody>
    </table>
</html>

Table 1 - Lists of RFCs that a TCP Chimney NIC must implement RFC Clarifications. The following clarifications must be followed by the TCP/IP implementation in the TCP Chimney NIC. RFC 11221. Section 4.2.3.4 specifies that the Nagle algorithm SHOULD be implemented as a method to avoid the Silly Window Syndrome. The TCP chimney NIC MUST implement the Nagle algorithm and the implementation must follow this pseudo code: a. When sending a segment, the first stage of SWS avoidance MUST be implemented as:

```
Send(){..If (BytesToSend &gt; MSS ||BytesToSend &gt; MaxSndWnd /2 ||BytesToSend &gt;= BytesInCurReq ||ForceOutput){BeginSend();}else{StartSwsTimer();}                ...               

...
```

<html>
    <dl>
        <dt><i>BytesToSend</i></dt>
        <dd>
            <p>The number of available bytes that can be sent as allowed by the current send window.</p>
        <dd>
        <dt><i>MSS</i></dt>
        <dd>
            <p>Maximum Segment</p>
        <dd>
        <dt><i>SizeMaxSndWnd</i></dt>
        <dd>
            <p>The maximum receive window that the TCP peer ever advertised.</p>
        <dd>
        <dt><i>BytesInCurReq</i></dt>
        <dd>
            <p>Bytes left in the current send request.</p>
        <dd>
        <dt><i>ForceOutput</i></dt>
        <dd>
            <p>A variable that determines if the segment MUST be sent, due to SWS timer expiring as an example. The line in red specifies the deviation from the SWS avoidance that MUST be implemented.</p>
        <dd>
    </dl>
</html>
     
**Note**&nbsp;&nbsp;&nbsp;This pseudo code defines the behavior at the time of sending, not at the time when the send request is offloaded by the host TCP/IP stack. The reason why the Microsoft TCPIP stack deviates from the SWS algorithm in the way described above is:

1. CWND can grow in Bytes. More precisely, CWND is not constrained to grow or shrink in multiples of MSS or PUSH boundaries. Because the TCP implementation in Windows implements Appropriate Byte Counting (RFC 3465), this point is strengthened even further.

2. The PUSH boundary is determined by the TCP application posting data to be sent so it is not guaranteed to be aligned with the MSS size.

3. Because of \#1 and \#2 it is very likely for the TCP state machine to reach a point at which one MSS has been placed on the wire and there is a sub-MSS segment which, if sent, will complete the block of data up to the PUSH boundary.

	a. In this case, it is favorable for TCP to send this one sub-MSS segment in order to complete the transmission of the app's buffer up to the PUSH boundary. The reason why it is favorable to do this is because the data will be delivered to the receiving application faster than if the SWS algorithm was followed to the letter. At the same time, the deviation does not re-introduce any of the problems SWS addressed in the first place.

4. As described in section 4.2.2.17 a TCP Chimney NIC MUST use the connection RTT as a trigger to send a zero window probe and then exponentially increase the interval between successive probes. In addition, the probe MUST contain 1 new Byte of data.

5. <!--edit: List item 5 is as it appears in the Word version, but this needs help. -->TCP Chimney NIC MUST support filling at least two reassembly holes. RFC 20181. The TCP Chimney NIC MAY implement RFC 2018. If a TCP Chimney NIC implements RFC 2018, then it MUST also implement RFC 3517.2. A TCP Chimney NIC that DOES NOT implement RFC 2018 MUST properly process pure ACK packets, which contain SACK blocks, as described in section 3 of RFC 793.RFC 25811. The TCP Chimney NIC MUST be able to transition from using the slow-start algorithm to using the congestion avoidance algorithm as specified in Section 3.1. In addition it MUST implement Congestion Window (cwnd) = Slow Start Threshold (ssthresh) instead of Congestion Window &gt; Slow Start Threshold.RFC 25821. The TCP Chimney NIC MUST use the following equation instead of the one described in RFC 2582, section 3 - point 1:SsThresh = max(2\*mss, min(cwnd,window\_advertised\_by\_peer)/2)RFC 29231. The TCP Chimney NIC is NOT required to implement the recommendations outlined in RFC 2923. Instead, the TCP Chimney NIC must upload the TCP connection to allow the host stack to execute the black hole detection state machine. See the Windows Driver Kit for details.RFC 29881. See RFC 1122 section 4.2.3.1 and RFC 2988 for background information. TCP Chimney NIC MUST implement RTO calculation using the following algorithm, which is the same as RFC 2988 with minor exceptions that are qualified below:function CalculateRto (first, byRef srtt, byRef rttvar, m)rttSample = Minimum (m, 30s)if first thenrttvar = m/2srtt = melse' notice that rttvar is calculated first, using the old                 ' value of srttrttvar = (3/4) \* rttvar + (1/4) \* abs(srtt - rttSample)srtt = (7/8)\*srtt + (1/8) \* rttSampleend ifCalculateRto = srtt + 4 \* rttvarCalculateRto = Minimum (CalculateRto, 60s)CalculateRto = Maximum (CalculateRto, 300ms)The two lines in red capture the deviation from the RFC. Specifically, it is expected that the TCP Chimney NIC has an upper bound when calculating the RTT value.RFC 34651. Section 2.1 describes the changes to CWND during congestion avoidance. A TCP Chimney NIC MUST use the following formula to calculate CWND during congestion avoidance:// L is 4CWnd += max((MaxMss \* min(MaxMss \* L, BytesAcked)) /CWnd, 1)Note that if BytesAcked is always 1 the above equation becomes max((MaxMss, MaxMss)/Cwnd, 1)which is equivalent to equation 2 in RFC 2581. 2. Section 2.3 in RFC 3465 discusses the limit, L, chosen for the CWND increase during slow start and congestion avoidance, which controls the aggressiveness of the algorithm. A TCP Chimney NIC MUST use a value of 4 for L in order for it to exhibit the same behavior as the Windows TCP/IP protocol implementation.RFC tcpm-tcpsecure-091.     TCP Chimney NICs MUST follow the security guidelines outlined in sections 3, 4, and 5 of the 'TCP Security' internet draft RFC (http://tools.ietf.org/html/draft-ietf-tcpm-tcpsecure-12). 2.     TCP Chimney NICSs SHOULD follow the Windows specific implementation details described in the WDK.

Design Notes: See the full text of the RFCs at <http://go.microsoft.com/fwlink/?LinkId=36702>.

### Device.Network.LAN.TCPChimney.HandlesOutOfOrderData

*Ethernet devices that implement TCP Chimney must properly handle the Out Of Order data scenarios.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Ethernet devices that implement TCP Chimney must properly handle Out Of Order data scenarios described below: 

1. If anything is placed in the reassembly queue after an inorder FIN, then the reassembly queue MUST be flushed by discarding all of its contents.

2. If a TCP Chimney NIC stores an OOO FIN in the reassembly queue, then it MUST not store OOO data or OOO FIN beyond another OOO FIN in the reassembly queue. If it receives OOO data or OOO FIN segment that would lead to such a conflict, then the TCP Chimney NIC MUST drop that segment and flush the reassembly queue by discarding all of its contents.

### Device.Network.LAN.TCPChimney.ImplementSufficientlyGranularTimers

*Ethernet devices that implement TCP Chimney must implement sufficiently granular timers.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement TCP Chimney. If the Ethernet device does not implement TCP Chimney, then this requirement does not apply. The TCP chimney NIC must have access to timers (implemented on the NIC's hardware) with precise enough granularity and skew such that it can drive the TCP/IP state machine correctly. The timer granularity must be 10 milliseconds or better (lower than 10 ms) and the timer skew must be as good as what general purpose CPU timer provides.

### Device.Network.LAN.TCPChimney.NeighborStateObjTimestampsComplyWithWDK

*Neighbor state object timestamps are implemented according to details in the Windows Driver Kit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A network device that implements TCP Chimney must ensure that TCP Chimney maintains a timestamp for each neighbor state object and perform checks against the timestamp on each incoming and outgoing packet.

*Design Notes*

See the Windows Driver Kit, "OID\_TCP\_OFFLOAD.

### Device.Network.LAN.TCPChimney.Support1024Connections

*Ethernet devices that implement TCP Chimney must support at least 1024 connections and not advertise more offload capacity than what the hardware can support.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement TCP Chimney. If the Ethernet device does not implement TCP Chimney, then this requirement does not apply. Ethernet devices that implement TCP Chimney must support at least 1024 connections and not advertise more offload capacity than what the hardware can support.

### Device.Network.LAN.TCPChimney.Support64bitAddresses

*Ethernet devices that implement TCP Chimney must support 64-bit addresses.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement TCP Chimney. If the Ethernet device does not implement TCP Chimney, then this requirement does not apply. If the device uses PCI, it must support 64-bit addresses; 64-bit data support is not required.


<a name="device.network.lan.vmmq"></a>
## Device.Network.LAN.VMMQ

*Defines requirements for Ethernet devices that implement Virtual Machine Multiple Queues.*

### Device.Network.LAN.VMMQ.VirtualMachineMultipleQueues

*Requirements for Ethernet devices that implement Virtual Machine Multiple Queues*

<table><tr><th>Applies to</th><td><p>Windows Server 2016 x64</p></td></tr></table>

**Description**

The implementation must comply with the Virtual Machine Multiple Queues Reference Specification.


<a name="device.network.lan.vmq"></a>
## Device.Network.LAN.VMQ

*LAN requirements*

### Device.Network.LAN.VMQ.VirtualMachineQueues

*Ethernet devices that implement Virtual Machine Queues must comply with the Programmable Machine Queues Reference specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The implementation must comply with the Programmable Machine Queues Reference Specification.

At least four queues with filters must be supported. Support for at least 16 queues with filters is recommended. The number of queues required will be 16 by December 1, 2009 for 10 Gigabit parts. The number of queues required is inclusive of the default queue.

MSI-X Support (NDIS\_RECEIVE\_FILTER\_MSI\_X\_SUPPORTED) is mandatory: 

| Queues       | MSI-X to Queues Ratio |
|--------------|-----------------------|
| 1 to 16      | 1:1                   |
| 17-64        | 1:2 (Min 16)          |
| 65-unlimited | 1:16 (Min 32)         |

Filtering:

Support for VLAN filtering in HW (NDIS\_RECEIVE\_FILTER\_MAC\_HEADER\_VLAN\_ID\_SUPPORTED) is optional. If implemented, VLANs per VM Queue (NumVlansPerVMQueue) must be &gt;= 1

Support for MAC filtering in HW (NDIS\_RECEIVE\_FILTER\_MAC\_HEADER\_DEST\_ADDR\_SUPPORTED) is mandatory.

Support for NDIS\_RECEIVE\_FILTER\_TEST\_HEADER\_EQUAL\_SUPPORTED is mandatory.

The maximum number of MAC header filters (MaxMacHeaderFilters) must be &gt;= Number of queues

Total MAC addresses (NumTotalMacAddresses) must be &gt;= Number of queues

MAC addresses per VM Queue (NumMacAddressesPerVMQueue) must be &gt;= 1

Per-queue receive indication must be supported (NDIS\_RECEIVE\_QUEUE\_PARAMETERS\_PER\_QUEUE\_RECEIVE\_INDICATION)

Dynamic VMQ support is required for Windows Server 2012 only.

Design Notes

Implementation details are in the ProgrammableMachine Queues specification, on the NDIS Program, Connect site <http://msdn.microsoft.com/en-us/library/windows/hardware/ff571034.aspx>

<a name="device.network.lan.vxlan"></a>
## Device.Network.LAN.VXLAN

### Device.Network.LAN.VXLAN.VXLANPacketTaskOffloads

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement only applies to Ethernet devices that implement VXLAN encapsulated packet task offloads. Ethernet devices that implement VXLAN encapsulated packet task offloads must comply with the specification and support the following encapsulated offload tasks for all combinations of inner/outer IPv4/IPv6 headers:

 - Send checksum (IPv4, TCP, UDP)
 - Receive checksum (IPv4, TCP, UDP)
 - LSOv2
 - VMQ

<a name="device.network.lan"></a>
## Device.Network.LAN

### Device.Network.LAN.CloudStress

*Ethernet Devices that implement GRE Encapsulated Packet Task Offloads must comply with the specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

This requirement applies to all Ethernet devices that are Certified for Server. This test validates that an Ethernet device can meet the stress requirements of a datacenter cloud. Ethernet devices that meet this requirement must also comply with the specification and support the following features:

 - All Network Adapters must support the following Devie.Networking.LAN features and pass the Private Cloud Stress test

 - Base (requirements 100MbOrGreater through SupportIEEE8023)

 - ChecksumOffload

 - LargeSendOffload

 - RSS

 - Network Adapters for small Cloud Ready deployments must support all of the above features and

 - Have speeds of 10G or higher

 - MTUSize

 - NVGRE

 - VXLAN

 - VMQ

Network Adapters for large Cloud Ready deployments must support all of the above features and

 - PacketDirect

 - DCB

 - KRDMA (iWARP or Routable RoCE)

 - SRIOV

Additional Information;

 - 1GigE NICs, if they do NOT support all the required features will NOT be granted Logo for server

 - 1GigE NICs, if they support all the required features will be granted Logo for server

 - 1GigE NICs, even if they support some of the advanced features listed for Cloud Ready NICs, will not be granted Cloud Ready Additional Qualification

 - 0GigE and above NICs, if they do NOT support all the required features, regardless of any additional features they support, will NOT be granted Logo

 - 10GigE and above NICs that support all the required features but do not support all of the small cloud features for 10GigE NICs listed as being required for Cloud Ready, will be granted Logo

 - 10GigE and above NICs that support all the required features as well as all of the features for small cloud NICs, will be granted Cloud Ready Additional Qualification and be supported for smaller cloud deployments

 - 10GigE and above NICs that support all the required features as well as all of the features for large cloud NICs, will be granted Cloud Ready Additional Qualification and be supported for larger cloud deployments
