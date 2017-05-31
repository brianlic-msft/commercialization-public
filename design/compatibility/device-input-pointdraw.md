---
title: Device.Input.PointDraw
Description: 'Specifications that apply to mice, touch pads, and other input devices used to move the pointer.'
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
# Device.Input.PointDraw

 - [Device.Input.PointDraw](#device.input.pointdraw)
-->

<a name="device.input.pointdraw"></a>
## Device.Input.PointDraw

*Applies to mice, touch pads, and other input devices used to move the pointer*

### Device.Input.PointDraw.KernelModeDriversUseWdfKmdf

*Mouse kernel-mode drivers must use the WDF-KMDF.*

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

Third-party mouse kernel-mode drivers must be ported to the WDF KMDF model.
