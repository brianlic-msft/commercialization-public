---
title: Device.Network.MobileBroadband
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

# Device.Network.MobileBroadband

 - [Device.Network.MobileBroadband.CDMA](#device.network.mobilebroadband.cdma)
 - [Device.Network.MobileBroadband.FirmwareUpdater](#device.network.mobilebroadband.firmwareupdater)
 - [Device.Network.MobileBroadband.GSM](#device.network.mobilebroadband.gsm)

<a name="device.network.mobilebroadband.cdma"></a>
## Device.Network.MobileBroadband.CDMA

*Mobile broadband*

### Device.Network.MobileBroadband.CDMA.ComplyWithBaseReq

*Mobile broadband devices must comply with the following base requirements.*

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

Mobile Broadband devices must comply with the following base requirements:

-   MUST conform to NDIS 6.30 and Microsoft Mobile Broadband Driver Model Specification requirements in the Windows Driver Kit.

-   MUST comply with power management specifications.

-   MUST meet the performance target for various operation specified for various class of devices in the Mobile Broadband Driver Model Specification.

-   A mobile broadband device driver must implement and conform to the NDIS 6.30 and Microsoft Mobile Broadband Driver Model Specifications. All recommended implementation specified in the Mobile Broadband Driver Model Specifications must be implemented. Note that Microsoft's MB class driver is compliant to the preceding requirements. A mobile broadband device must support the Power Management Policy as outlined in the Network Device Class Power Management Reference Specification, Version 2.0. A device must be functional after various OS Power Management operations. A device must meet the performance targets described in the Mobile Broadband Driver Model Specification.

*Design Notes*

Helpful links: Mobile Broadband Driver Model Specifications <http://msdn.microsoft.com/en-us/library/ff560543.aspx> Network Device Class Power Management Reference Specification <http://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/netpmspc.rtf>

### Device.Network.MobileBroadband.CDMA.FWComplyWithMBSpec

*USB interface based CDMA class of Mobile Broadband device firmware must comply with USB-IF's Mobile Broadband Interface Model Specification.*

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

The USB interface based CDMA class of Mobile Broadband device firmware implementation must comply with the USB-IF's Mobile Broadband Interface Model (MBIM) Specification. No additional IHV drivers are needed for the functionality of the device and the device must work with Microsoft's Mobile Broadband (MB) class driver implementation.

Device firmware must also comply with the MBIM Errata\* in addition to the MBIM 1.0 specification. In specific, the following items in MBIM Errata need to be compliant with:

 - MEFD (MB Extended Functional Descriptor): Devices with Operator specific firmware must report the correct MTU size as required by the Mobile Network Operator for carrier certified devices.

 - \*USB-IF Link that is accessible only to NCM DWG members. This errata will be published once it gets approved.

Additional Details:

Mobile Broadband Interface Model Specification: <http://www.usb.org/developers/devclass_docs/MBIM10.zip>

Mobile Broadband Driver Model Specification: <http://msdn.microsoft.com/library/windows/hardware/ff560543.aspx>

### Device.Network.MobileBroadband.CDMA.IdentityMorphing

*Mobile Broadband Devices must support Identity Morphing.*

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

Mobile Broadband devices based on USB protocol must support Identity Morphing. Implementing this requirement in the device firmware enables the device manufacturers to take advantage of Microsoft's inbox MB Class Driver in Windows 8 and the flexibility of using their own driver for previous generations of Windows operating systems version 7 and below. Links to the relevant specifications are provided in the Additional Information section below. Additional Information: Identity Morphing Specification: See MSDN.

### Device.Network.MobileBroadband.CDMA.Loopback

*Mobile Broadband Devices based on USB protocol must implement loopback functionality for performance and payload conformance testing.*

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

Mobile Broadband devices based on USB protocol must implement a loopback functionality as detailed in the specification in the device firmware. Note that Loopback functionality is only tested for the data packet as it is the one in the performance critical path. Devices must pass the loopback test for performance requirements.

Specifically, devices must be able to support combined throughput of 100 Mbps (50 Mbps uplink / 50 Mbps downlink) or above and up to 5% loss rate. Links to the relevant specifications are provided in the Additional Information section below.

Additional Information:

Loopback implementation guide for device firmware: <http://msdn.microsoft.com/en-us/library/windows/hardware/hh975390.aspx>

MB Miniport Driver Performance Requirements: <http://msdn.microsoft.com/en-us/library/windows/hardware/ff557193.aspx>

### Device.Network.MobileBroadband.CDMA.MultiCarrierFunctionality

*Mobile broadband devices that support multi-carrier feature must support the multi-carrier functionality.*

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

Mobile Broadband devices that support multi-carrier feature must support the multi-carrier functionality and should also do the following:

-   Must meet the multi-carrier performance requirements available in the Mobile Broadband Driver Model Specification.

-   Must stay on the bus when changing home providers.

-   Must successfully pass all applicable logo tests covering all the different cellular class technologies that the device is capable of connecting to.

-   Mobile broadband devices supporting multi-carrier feature must meet the multi-carrier performance requirements specified in the mobile broadband driver model specification. Mobile broadband devices that support multi-carrier feature must not do a bus / device re-enumeration or power reset the device resulting in PnP re-enumeration to the Windows when changing the home providers. If the device is capable of supporting GSM and CDMA cellular class technologies, then the device must execute both GSM as well as CDMA logo tests. For this to be covered correctly, the location of logo test execution must be in the coverage area of at least one GSM and one CDMA cellular class technologies.

### Device.Network.MobileBroadband.CDMA.ReliableCSConnectivity

*Wireless WAN device on systems that support Connected Standby must deliver reliable connectivity in Connected Standby.*

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

The device seamlessly transitions between D0 and D3 warm states while in Connected Standby (CS). The device maintains both L2 & L3 connectivity while in CS. The device wakes up on matching wake patterns only. There are no spurious wakes while in CS. The wake packets are delivered without delay or buffering. RealTimeCommunication apps stay connected in CS over IPv4 and IPv6.

### Device.Network.MobileBroadband.CDMA.SupportUSBSelectiveSuspend

*USB based mobile broadband devices must support Windows implementation of USB selective suspend.*

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

USB based mobile broadband devices must support Windows implementation of USB selective suspend (SS). No alternate USB SS implementation is allowed.

### Device.Network.MobileBroadband.CDMA.SupportWakeOnMB

*Mobile broadband class of devices must support the following wake on mobile broadband capabilities.*

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

Mobile broadband class of devices MUST support the following wake on mobile broadband capabilities.

-   Devices MUST support 32 bitmap wake patterns of 128 byte each.

-   Devices MUST wake the system on register state change.

-   Devices MUST wake the system on media connect.

-   Devices MUST wake the system on media disconnect.

-   GSM and CDMA class of Devices MUST wake the system on receiving an incoming SMS message.

-   Devices that support USSD MUST wake the system on receiving a USSD message.

-   Devices MUST support wake packet indication. NIC should cache the packet causing the wake on hardware and pass it up when the OS is ready for receives.

Mobile class of devices must support wake on mobile broadband. A device should wake the system on above mentioned events. Note that wake on USSD is mandatory only if the device reports that it supports USSD; otherwise, it is optional. See the following MSDN documentation for more information on the SMS and register state wake events.

1. NDIS\_STATUS\_WWAN\_REGISTER\_STATE

2. NDIS\_STATUS\_WWAN\_SMS\_RECEIVE

<a name="device.network.mobilebroadband.firmwareupdater"></a>
## Device.Network.MobileBroadband.FirmwareUpdater

*Mobile broadband*

### Device.Network.MobileBroadband.FirmwareUpdater.FirmwareUpgrade

*USB interface based GSM and CDMA class of mobile broadband devices that comply with Microsoft's firmware update platform must implement Firmware ID Device Service and an UMDF based firmware update driver for the firmware payload update to the device.*

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

USB interface based GSM and CDMA class of mobile broadband devices that comply with Microsoft's firmware update platform must implement Firmware ID Device Service (to be published soon on MSDN) and an UMDF based firmware update driver (guidelines and sample to be published soon on MSDN) for the firmware payload update to the device.

Additional Information

<a name="device.network.mobilebroadband.gsm"></a>
## Device.Network.MobileBroadband.GSM

*Mobile broadband*

### Device.Network.MobileBroadband.GSM.ComplyWithBaseReq

*Mobile broadband devices must comply with the following base requirements.*

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

Mobile Broadband devices must comply with the following base requirements:

-   MUST conform to NDIS 6.30 and Microsoft Mobile Broadband Driver Model Specification requirements in the Windows Driver Kit.

-   MUST comply with power management specifications.

-   MUST meet the performance target for various operation specified for various class of devices in the Mobile Broadband Driver Model Specification.

-   Mobile broadband device driver must implement and conform to the NDIS 6.30 and Microsoft Mobile Broadband Driver Model Specifications. All recommended implementation specified in the Mobile Broadband Driver Model Specifications needs to be implemented. Note that Microsoft's MB class driver is compliant to above requirements. A mobile broadband device must support the Power Management Policy as outlined in the Network Device Class Power Management Reference Specification, Version 2.0. Device must be functional after various OS Power Management operations. Device must meet the performance targets described in the Mobile Broadband Driver Model Specification.

*Design Notes*

Helpful links: Mobile Broadband Driver Model Specifications <http://msdn.microsoft.com/en-us/library/ff560543.aspx> Network Device Class Power Management Reference Specification <http://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/netpmspc.rtf>

### Device.Network.MobileBroadband.GSM.EAPSIM

*GSM class of Mobile Broadband devices that support the extensible authentication protocol method for GSM Subscriber Identity Module (EAP-SIM) must support EAP-SIM defined in RFC 4186.*

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

GSM devices that support EAP-SIM must support EAP-SIM as defined in RFC 4186.

### Device.Network.MobileBroadband.GSM.FWComplyWithMBSpec

*USB interface based GSM class of Mobile Broadband device firmware must comply with USB-IF's Mobile Broadband Interface Model Specification.*

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

USB interface based GSM class of Mobile Broadband device firmware implementation must comply with the USB-IF's Mobile Broadband Interface Model (MBIM) Specification. No additional IHV drivers are needed for the functionality of the device and the device must work with Microsoft's Mobile Broadband (MB) class driver implementation.

Device firmware must also comply with the MBIM Errata\* in addition to the MBIM 1.0 specification. In specific, the following items in MBIM Errata need to be compliant with:

-   MEFD (MB Extended Functional Descriptor): Devices with Operator specific firmware must report the correct MTU size as required by the Mobile Network Operator for carrier certified devices.

\*USB-IF Link that is accessible only to NCM DWG members. This errata will be published once it gets approved.

Additional Details:

Mobile Broadband Interface Model Specification: <http://www.usb.org/developers/devclass_docs/MBIM10.zip>

Mobile Broadband Driver Model Specification: <http://msdn.microsoft.com/library/windows/hardware/ff560543.aspx>

### Device.Network.MobileBroadband.GSM.IdentityMorphing

*Mobile broadband devices MUST support Identity Morphing.*

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

Mobile broadband devices based on USB protocol must support Identity Morphing. Implementing this requirement in the device firmware enables the device manufacturers to take advantage of Microsoft's inbox MB Class Driver in Windows 8 and the flexibility of using their own driver for previous generations of Windows operating systems version 7 and below. Links to the relevant specifications are provided in the Additional Information section below.

Additional Information: Identity Morphing Specification: See MSDN.

### Device.Network.MobileBroadband.GSM.Loopback

*Mobile broadband devices based on USB protocol MUST implement loopback functionality for performance and payload conformance testing.*

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

Mobile broadband devices based on the USB protocol must implement a loopback functionality as detailed in the specification in the device firmware. Note that Loopback functionality is only tested for the data packet as it is the one in the performance critical path. Devices must pass the loopback test for performance requirements. Specifically, devices must be able to support combined throughput of 100 Mbps (50 Mbps uplink / 50 Mbps downlink) or above and up to 5% loss rate.

Links to the relevant specifications are provided in the Additional Information section below.

Additional Information:

Loopback implementation guide for device firmware: <http://msdn.microsoft.com/en-us/library/windows/hardware/hh975390.aspx>

MB Miniport Driver Performance Requirements: <http://msdn.microsoft.com/en-us/library/windows/hardware/ff557193.aspx>

### Device.Network.MobileBroadband.GSM.MultiCarrierFunctionality

*Mobile broadband devices that support multi-carrier feature must support the multi-carrier functionality.*

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

Mobile broadband devices that support multi-carrier feature must support the multi-carrier functionality and should also do the following:

Must meet the multi-carrier performance requirements available in the Mobile Broadband Driver Model Specification.

Must stay on the bus when changing home providers.

Must successfully pass all applicable logo tests covering all the different cellular class technologies that the device is capable of connecting to.

Mobile broadband devices supporting multi-carrier feature must meet the multi-carrier performance requirements specified in the mobile broadband driver model specification. Mobile broadband devices that support multi-carrier feature must not do a bus / device re-enumeration or power reset the device resulting in PnP re-enumeration to the Windows when changing the home providers. If the device is capable of supporting GSM and CDMA cellular class technologies, then the device must execute both GSM as well as CDMA logo tests. For this to be covered correctly, the location of logo test execution must be in the coverage area of at least one GSM and one CDMA cellular class technologies.

 

### Device.Network.MobileBroadband.GSM.MultiplePDPContext

*Multiple PDP context support*

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

With this feature, Windows apps can communicate over different PDP contexts (virtual channels) in mobile networks. Mobile Operators use different PDP contexts to create the differentiated experiences and innovative services. Third party app developers can use this feature to build great quality VOIP and video streaming experiences partnering with mobile operators.

Device firmware capable of multiple PDP contexts need to comply with the [MBIM specification](http://www.usb.org/developers/devclass_docs/MBIM10.zip). Specifically, device firmware should support multiple IP data streams as detailed in section 10.5.12.1 in the MBIM specification. This includes supporting all the control implementation of CIDs and IP data streams for full support of multiple PDP contexts.

Device firmware must support a total of 8 dual bearer (IPv4 & IPv6) PDP contexts for usage by Windows.

This includes 1 for internet connectivity and 7 additional for Operator Apps.

Devices are not required to expose their internal, firmware managed PDP contexts used for SMS and any other administration context to Windows.

Device firmware should be able to leverage host OS request for a PDP context that is already device managed internally in its firmware to be handled gracefully.

Device firmware should continue to abstract SMS PDP contexts and route them through the SMS CIDs regardless of the bearer used underneath.

### Device.Network.MobileBroadband.GSM.ReliableCSConnectivity

*Wireless WAN device on systems that support Connected Standby must deliver reliable connectivity in Connected Standby.*

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

The device seamlessly transitions between D0 and D3 warm states while in Connected Standby (CS). The device maintains both L2 & L3 connectivity while in CS. The device wakes up on matching wake patterns only. There are no spurious wakes while in CS. The wake packets are delivered without delay or buffering. RealTimeCommunication apps stay connected in CS over IPv4 and IPv6.

### Device.Network.MobileBroadband.GSM.SupportFastDormancy

*The GSM class of Mobile Broadband devices must support Fast Dormancy mechanism as defined by 3GPP in release 8. *

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

Mobile broadband devices must implement the fast dormancy mechanism as defined by 3GPP in revision 8.  Fast Dormancy is a battery life savings mechanism for UE (User Equipment) devices that allows the devices to request the network to put them in a low power channel. UE sends a SIGNALLING CONNECTION RELEASE INDICATION (SCRI) message (sent by the UE to the network) with the IE "Signaling Connection Release Indication Cause" present and set to "UE Requested PS Data session end".

### Device.Network.MobileBroadband.GSM.SupportUSBSelectiveSuspend

*USB based Mobile Broadband devices must support Windows implementation of USB selective suspend.*

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

USB based Mobile Broadband devices must support Windows implementation of USB selective suspend (SS). No alternate USB SS implementation is allowed.

### Device.Network.MobileBroadband.GSM.SupportWakeOnMB

*Mobile broadband class of devices must support the following wake on mobile broadband capabilities.* 

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

Mobile broadband class of devices must support the following wake on mobile broadband capabilities.

-   Devices MUST support 32 bitmap wake patterns of 128 byte each.

-   Devices MUST wake the system on register state change.

-   Devices MUST wake the system on media connect.

-   Devices MUST wake the system on media disconnect.

-   GSM and CDMA class of Devices MUST wake the system on receiving an incoming SMS message.

-   Devices that support USSD MUST wake the system on receiving a USSD message.

-   Devices MUST support wake packet indication. NIC should cache the packet causing the wake on hardware and pass it up when the OS is ready for receives.

Mobile broadband class of devices must support wake on mobile broadband. A device should wake the system on above mentioned events. Note that wake on USSD is mandatory only if the device reports that it supports USSD; otherwise, it is optional. See the following MSDN documentation for more information on the SMS and register state wake events.

1.  NDIS\_STATUS\_WWAN\_REGISTER\_STATE

2.  NDIS\_STATUS\_WWAN\_SMS\_RECEIVE

### Device.Network.MobileBroadband.GSM.USSD

*The GSM class of mobile broadband devices that implement Unstructured Supplementary Service Data (USSD) must support USSD based on the Mobile Broadband Driver Model.*

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

Windows Mobile Broadband Driver Model is updated to include the full support of sending and receiving USSD messages. Devices that implement USSD must support USSD based on the Mobile Broadband Driver Model.

### Device.Network.MobileBroadband.LowLevelUiccAccess

*Mobile broadband devices that implement low level UICC access must support the low level UICC APDU exchange interface based on the Mobile Broadband Driver Model.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile ARM64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**
Windows Mobile Broadband Driver Model is updated to include the full support of low level APDU exchange with a UICC for getting the Answer-to-Reset (ATR), opening and closing logical channels, generic APDU exchange, and provisioning the Terminal Capability of the device to the UICC.

### Device.Network.MobileBroadband.MultiModemMultiExecutor

*Mobile broadband devices that implement support for multiple modem and multiple executor configurations must support interface changes based on the Mobile Broadband Driver Model.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile ARM64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Windows Mobile Broadband Driver model is updated to include support for modems that have multiple SIM slots.  Hardware configuration can defer between products.  For example, a modem with dual SIM slots can either be dual-SIM single active (DSSA), dual SIM dual standby (DSDS) or dual SIM dual active (DSDA).  

 - DSSA: one physical interface, one active subscription
 - DSDS: two physical interfaces, one active subscription
 - DSDA: two physical interfaces, two active subscriptions

Executor is the term Windows uses to define the physical interfaces.  A modem that supports multiple SIM slots are expected to enumerate the same number of physical interfaces as the provided executor numbers.  Mobile broadband blass drives must support:

 - Provide hardware capabilities (SIM slots, executors and concurrencies)
 - Able to map different physical interfaces (executors) to different SIM slots in run time
 - Provide SIM status on all SIM slots
 - Provide modem hardware ID that uniquely identifies each modem


### Device.Network.MobileBroadband.SAR

*Mobile broadband devices that implement support for selective absorption rate (SAR) must support the standardized interface changes based on the Mobile Broadband Driver Model.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile ARM64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**
Windows Mobile Broadband Driver model is updated to include support for configuring SAR back off at the device hardware.  Devices that implement SAR can optionally support SAR based on the Mobile Broadband Driver Model.  

If the device supports Mobile Broadband Driver Model SAR, the device firmware needs to support the following at minimum:

 - Able to configure SAR back off profile for all antennas
 - Provide supported SAR back off mode
 - Provide Mobile Broadband and Wi-Fi SAR integration indication
 - Provide Mobile Broadband transmission status
