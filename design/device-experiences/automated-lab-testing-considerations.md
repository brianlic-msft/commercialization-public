---
title: Automated lab testing considerations
description: Describes automated lab testing scenarios for system designers to consider when designing the power and battery charging subsystem.
MS-HAID:
- 'cstandby.automated\_lab\_testing\_considerations'
- 'p\_weg\_hardware.automated\_lab\_testing\_considerations'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 22c95a9b-c779-4298-a3b9-68f9281ce6d3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Automated lab testing considerations


We recommend that system designers consider automated lab testing scenarios when they design the power and battery charging subsystem. The most relevant consideration is platform recovery from crash or hang scenarios.

Platforms that are designed for automated lab testing, including platforms that are targeted for co-engineering programs with Microsoft, must implement configurable support for automatically booting the system when power is applied. Such automatic booting conflicts with the user experience goal that the platform remains off until the user physically turns it on; however, it is a requirement to achieve a fully automated test environment.

In Microsoft test labs, platforms are recovered from crash and hang scenarios by remotely removing and applying system power. The platform must be capable of ignoring the presence and charge capability of the internal battery and use only the presence of AC power to determine if the platform should automatically boot. This behavior is for lab-enabled systems only and can be configured by using a UEFI variable that Windows sets.

**Note**  Systems that are designed for users must not power on automatically when power is applied unless they are required to detect the power capability of the Universal Serial Bus (USB) charger.

 

## UEFI DISABLEBATTERY variable definition


The DISABLEBATTERY variable is created under VendorGuid {0x77fa9abd, 0x0359, 0x4d32, {0xbd, 0x60, 0x28, 0xf4, 0xe7, 0x8f, 0x78, 0x4b}}. When the variable is present (that is, when GetVariable() returns EFI\_SUCCESS), the requested platform behavior must be modified from the default battery behavior when the value is set.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>When DISABLEBATTERY is set</th>
<th>When DISABLEBATTERY is not present or not set</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p></p>
<ul>
<li>The platform must not use the presence of the battery to determine if the system should automatically boot or remain powered on.</li>
<li>If AC or external charger power is removed, the system should immediately power off.</li>
<li>If AC or external charger power is applied, the system should immediately power on.</li>
</ul></td>
<td><p></p>
<ul>
<li>The platform should have behave according to the requirements for retail and/or end-user systems.</li>
<li>If AC or external charger power is removed, the system should remain on if sufficient power remains in the system battery.</li>
<li>If AC or external charger power is applied, the system should not automatically boot unless the system is capable of only USB-based charging and thus requires UEFI firmware or host software to determine the input power of the attached charger.</li>
</ul></td>
</tr>
</tbody>
</table>

 

 

 






