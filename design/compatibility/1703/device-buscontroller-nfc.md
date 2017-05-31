---
title: Device.BusController.NFC
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

# Device.BusController.NFC

 - [Device.BusController.NFC](#device.buscontroller.nfc)
 - [Device.BusController.NFC.NearFieldProximity](#device.buscontroller.nfc.nearfieldproximity)
 - [Device.BusController.NFC.RadioManagement](#device.buscontroller.nfc.radiomanagement)
 - [Device.BusController.NFC.SecureElement.HCE](#device.buscontroller.nfc.secureelement.hce)
 - [Device.BusController.NFC.SmartCard](#device.buscontroller.nfc.smartcard)
 - [Device.BusController.NFC.SecureElement.UICC](#device.buscontroller.nfc.secureelement.uicc)
 - [Device.BusController.NFC.SecureElement.EmbeddedSE](#device.buscontroller.nfc.secureelement.embeddedse)

<a name="device.buscontroller.nfc"></a>
## Device.BusController.NFC

It is strongly recommended that IHV’s create NFC client drivers that interface with the [Microsoft NFC Class Extension (CX)](https://msdn.microsoft.com/en-us/library/windows/hardware/dn905534.aspx). This interfacing will be mandatory starting in June 2017.

<a name="device.buscontroller.nfc.nearfieldproximity"></a>
## Device.BusController.NFC.NearFieldProximity

Any technology that implements the GUID\_DEVINTERFACE\_NFP device driver interface specified in the NFP Device Driver Requirements is defined as an NFP provider and must meet all the Near Field Proximity DDI implementation requirements laid out within [the specification](https://msdn.microsoft.com/en-us/library/windows/hardware/jj866064.aspx).

### Device.BusController.NFC.NearFieldProximity.Attribute

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must support maximum message size no smaller than 10 KB and transmission rate no smaller than 16KB per second.

### Device.BusController.NFC.NearFieldProximity.Event

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must enable clients to receive DeviceArrived and DeviceDeparted events upon arrival or departure of a proximate device.

### Device.BusController.NFC.NearFieldProximity.NDEF

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must support the NDEF protocol as defined by the NFC Forum in the NDEF specification v1.0.

### Device.BusController.NFC.NearFieldProximity.PeerToPeer

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must support transmitting and receiving data via the NFC Forum defined Logical Link Control Protocol (LLCP) v1.1 and Simple NDEF Exchange Protocol (SNEP) v1.0.

### Device.BusController.NFC.NearFieldProximity.Publish

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must support publishing and transmitting messages.

### Device.BusController.NFC.NearFieldProximity.Reliability

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must reliably read and write tags.

### Device.BusController.NFC.NearFieldProximity.Subscribe

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must be able to receive and deliver messages to subscribed clients.

### Device.BusController.NFC.NearFieldProximity.TagOperation

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFP provider must be able to read, write, and format tags as well as set tags to read only.

<a name="device.buscontroller.nfc.radiomanagement"></a>
## Device.BusController.NFC.RadioManagement

The Radio Management DDI allows callers to the NFC device driver to set the power state of the proximity radio of the NFC device. An NFC device driver must implement the DDIs defined in the [Radio Management DDI document.](https://msdn.microsoft.com/en-us/library/windows/hardware/dn905577.aspx)

### Device.BusController.NFC.RadioManagement.Base

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The NFC device driver must be able to set the power states of the proximity and secure element radios of the NFC device.

<a name="device.buscontroller.nfc.secureelement.hce"></a>
## Device.BusController.NFC.SecureElement.HCE

**Terms: If-Implemented**

The Secure Element DDI allows callers to the NFC device driver to enumerate, communicate with, and configure the secure elements accessible from the device. 

Any technology that implements the GUID\_DEVINTERFACE\_NFCSE device driver interface specified in the Secure Element DDI document is defined as an NFC Secure Element provider and must meet all the Secure Element DDI implementation requirements laid out within [the specification](https://msdn.microsoft.com/en-us/library/windows/hardware/dn905485.aspx). 

The Secure Element DDI allows for Host Card Emulation (HCE) based secure elements. With HCE, data is routed directly to applications running on the host CPU.

### Device.BusController.NFC.SecureElement.HCE.Base

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description **

An NFC Secure Element provider that supports HCE based card emulation must be able to configure the listen mode routing table, report NFCC capabilities and route data to HCE-based applications.

### Device.BusController.NFC.SecureElement.HCE.Event

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description **

An NFC Secure Element provider that supports HCE based card emulation must support client subscriptions for events and must be able to raise events to indicate occurrences for HCE being activated and deactivated.

### Device.BusController.NFC.SecureElement.HCE.Reliability

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description **

An NFC Secure Element provider that supports HCE based card emulation must be able to reliably route data to the host or other secure element appropriately based on the current listen mode routing table configuration***. ***

<a name="device.buscontroller.nfc.smartcard"></a>
## Device.BusController.NFC.SmartCard

The Smart Card DDI allows callers to the NFC device driver to perform low-level smart card operations on NFC contactless smart cards. This includes listening on card arrival/departure notifications, reading metadata of the smart card like ATR, UID and Historical Bytes information, performing read/write operations on the specific NFC card using APDUs as well as the support for translating APDUs to low-level primitive commands for some non-ISO14443-4 compliant cards.

Any technology that implements the GUID\_DEVINTERFACE\_SMARTCARD\_READER device driver interface specified in the Smart Card DDI document is defined as a Smart Card Reader provider and must meet all the Smart Card DDI implementation requirements laid out within [the specification.](https://msdn.microsoft.com/en-us/library/windows/hardware/dn905602.aspx)

### Device.BusController.NFC.SmartCard.Attribute

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The Smart Card Reader provider must be able to get and set smart card attributes.

### Device.BusController.NFC.SmartCard.DataExchange

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The Smart Card Reader provider must be able to communicate according to PC/SC standards with supported contactless smart cards. It must include support for PC/SC transparent mode. Supported contactless smart cards include: MIFARE Classic (optional), MIFARE Ultralight, Topaz, Jewel, ISO14443-A/B, Felica, ISO15693.

### Device.BusController.NFC.SmartCard.State

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The Smart Card Reader provider must be able to get and set the contactless smart card’s state.

<a name="device.buscontroller.nfc.secureelement.uicc"></a>
## Device.BusController.NFC.SecureElement.UICC

**Terms: If-Implemented**

The Secure Element DDI allows callers to the NFC device driver to enumerate, communicate with, and configure the secure elements accessible from the device.

Any technology that implements the GUID\_DEVINTERFACE\_NFCSE device driver interface specified in the Secure Element DDI document is defined as an NFC Secure Element provider and must meet all the Secure Element DDI implementation requirements laid out within [the specification](https://msdn.microsoft.com/en-us/library/windows/hardware/dn905485.aspx).

### Device.BusController.NFC.SecureElement.UICC.Emulation

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports UICC based card emulation must be able to communicate with and configure the UICC and must grant exclusive access to the client to manage card emulation mode.

### Device.BusController.NFC.SecureElement.UICC.Enumeration

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports UICC based card emulation must be able to enumerate all secure elements that are accessible from the device.

### Device.BusController.NFC.SecureElement.UICC.Event

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports UICC based card emulation must support client subscriptions for events and must be able to raise events to indicate occurrences such as transactions with an external reader.

### Device.BusController.NFC.SecureElement.UICC.Reliability

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports UICC based card emulation must be able to reliably turn card emulation mode on / off.

<a name="device.buscontroller.nfc.secureelement.embeddedse"></a>
## Device.BusController.NFC.SecureElement.EmbeddedSE

**Terms: If-Implemented**

The Secure Element DDI allows callers to the NFC device driver to enumerate, communicate with, and configure the secure elements accessible from the device.  

Any technology that implements the GUID_DEVINTERFACE_NFCSE device driver interface specified in the Secure Element DDI document is defined as an NFC Secure Element provider and must meet all the Secure Element DDI implementation requirements laid out within [the specification](https://aka.ms/nfcseddi).


### Device.BusController.NFC.SecureElement.EmbeddedSE.Emulation

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports embedded SE-based card emulation must be able to communicate with and configure the embedded SE and must grant exclusive access to the client to manage card emulation mode. 

### Device.BusController.NFC.SecureElement.EmbeddedSE.Enumeration

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports embedded SE based card emulation must be able to enumerate all secure elements that are accessible from the device.

### Device.BusController.NFC.SecureElement.EmbeddedSE.Event

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports embedded SE-based card emulation must support client subscriptions for events and must be able to raise events to indicate occurrences such as transactions with an external reader.

### Device.BusController.NFC.SecureElement.EmbeddedSE.Reliability

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An NFC Secure Element provider that supports embedded-SE based card emulation must be able to reliably turn card emulation mode on / off.

