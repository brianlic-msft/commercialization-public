---
title: Device.Network.DevFund
Description: 'Network requirements.'
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
# Device.Network.DevFund

 - [Device.Network.DevFund](#device.network.devfund)
-->

<a name="device.network.devfund"></a>
## Device.Network.DevFund

*Network requirements *

### Device.Network.DevFund.NdisVersion

*NDIS devices must conform to the NDIS 6.x requirements in the Windows Driver Kit.*

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

All NDIS device must conform to NDIS 6.x specified in the Windows Driver Kit.

*Design Notes*

See the Windows Driver Kit, "NDIS."

### Device.Network.DevFund.NPOS

*Network Devices must support No Pause On Suspend (NPOS).*

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

NDIS miniport drivers must support No Pause On Suspend (NPOS) on client SKUs (feature support on server SKUs is optional).

*Design Notes*

See the No Pause On Suspend Specification.

### Device.Network.DevFund.SelectiveSuspend

*NDIS devices must meet Selective Suspend requirements.*

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

NDIS devices must meet Selective Suspend requirements.

