---
title: Device.Connectivity.WSD
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

<!--
# Device.Connectivity.WSD

 - [Device.Connectivity.WSD](#device.connectivity.wsd)
-->

<a name="device.connectivity.wsd"></a>
## Device.Connectivity.WSD

### Device.Connectivity.WSD.DPWS

*Devices which use or interact with the Web Services on Devices API (WSDAPI) comply with Device Profiles for Web Services (DPWS) specification*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Devices which plan to use or interact with Microsoft Windows' implementation of DPWS, the Web Services on Devices API (WSDAPI), must implement the DPWS specification themselves. (WSDAPI)

*Design Notes*

DPWS Specification available at

<http://go.microsoft.com/fwlink/?LinkId=109231>

### Device.Connectivity.WSD.DPWSExtensibility

*Devices Profile for Web Services Devices must accept messages that contain extensibility sections, and process the messages as appropriate.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Devices Profile for Web Services (DPWS) devices must accept messages where the XML has been extended. If the device understands the content in the extensible section, it may process it.

*Design Notes*

DPWS Specification available at

<http://go.microsoft.com/fwlink/?LinkId=109231>

### Device.Connectivity.WSD.MetadataExchange

*Devices Profile for Web Services (DPWS) Devices support metadata exchange*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

DPWS Devices which interact with the Web Services on Devices API (WSDAPI) must support metadata exchange as defined in the metadata exchange specification.

*Design Notes*

Metadata Exchange specification can be obtained at <http://go.microsoft.com/fwlink/?LinkId=109248>

### Device.Connectivity.WSD.MetadataValid

*Devices which interact with the Web Services on Devices (WSDAPI) produce metadata that conforms to the Devices Profile for Web Services*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Devices which interact with WSDAPI must populate the Metadata as defined in the Device Profile for Web Services Specification of February 2006.

*Design Notes*

The Device Profile for Web Services Specification of February 2006 is available at <http://go.microsoft.com/fwlink/?LinkId=109231>

### Device.Connectivity.WSD.Schema

*A network-enabled device that implements Devices Profile for Web Services (DPWS) must adhere to the protocol and schema.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A network-enabled device that implements Devices Profile for Web Services (DPWS) must adhere to the Devices Profile for Web Services as described by the schema.

The device must also reference the namespace URI as described in The Devices Profile for Web Service specification.

A device the implements DPWS must adhere to the Web Services Description Language (WSDL) associated with the logo device class. The WSDL defines services as collections of network endpoints, or ports. WSDL specification provides an XML format for documents for this purpose. Devices must implement the WSDL version 1.1.

*Design Notes*

See the Web Services Description Language (WSDL) Version 1.1 at <http://www.w3.org/TR/2001/NOTE-wsdl-20010315>

See the Devices Profile for Web Services schema at <http://schemas.xmlsoap.org/ws/2006/02/devprof/devicesprofile.xsd.>

See the Devices Profile for Web Service specification at <http://specs.xmlsoap.org/ws/2006/02/devprof/devicesprofile.pdf.>

Additional information can be found in the Windows Rally Development Kit at <http://go.microsoft.com/fwlink/?LinkId=109368.>

### Device.Connectivity.WSD.WSDiscovery

*Devices Profile for Web Services (DPWS) Devices interacting with the Web Services on Devices API (WSDAPI) implement WS-Discovery*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

DPWS Devices must implement WS-Discovery to work with WSDAPI.

*Design Notes*

WS-Discovery specification can be obtained at <http://go.microsoft.com/fwlink/?LinkId=109247>

