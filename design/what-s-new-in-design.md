---
title: What's new in Design
description: This topic provides information about what's new in Windows 10, version 1703 minimum hardware requirements, form factors, device experiences, and hardware components across all Windows 10 devices.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: F882BFCB-996D-4A75-B858-D68201DB0C14
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# What's new in Design


This topic provides information about what's new in Windows 10, version 1703 minimum hardware requirements, form factors, device experiences, and hardware components across all Windows 10 devices.

## Minimum hardware requirements


The following tables describes the changes for minimum hardware requirements in Windows 10, version 1703. The changes are organized by component area, the Windows edition that's impacted by the change, and the type of change.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Component area</th>
<th>Windows edition impacted</th>
<th>Location of change</th>
<th>Windows 10, version 1703 update</th>
<th>Change type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Form factor</td>
<td>Server</td>
<td>Section 1.1.3 Table 2: Device types for Windows 10 and Server 2016 </td>
<td>Listed example server form factors</td>
<td>Clarification</td>
</tr>
<tr class="even">
<td>Processors</td>
<td>Server</td>
<td>Section 1.1.3 Table 2: Device types for Windows 10 and Server 2016</td>
<td>Removed SoC from Supported processor types column</td>
<td>Clarification</td>
</tr>
<tr class="odd">
<td>Bluetooth</td>
<td>Server</td>
<td>Section 1.2 Table 3: Minimum hardware requirements summary</td>
<td>Changed Bluetooth from Optional to Not Supported on Windows Server 2016</td>
<td>Requirement adjustment</td>
</tr>
<tr class="even">
<td>Processors</td>
<td>Mobile</td>
<td>Section 2.1 Table 4: SoCs with integrated modems supported in devices that run Windows 10 Mobile</td>
<td>Updated SoCs to marketing names</td>
<td>Clarification</td>
</tr>
<tr class="odd">
<td>Processors</td>
<td>Mobile</td>
<td>Section 2.1 Table 5: Wi-Fi only SoCs supported in devices that run Windows 10 Mobile Enterprise</td>
<td>Updated SoCs to marketing names</td>
<td>Clarification</td>
</tr>
<tr class="even">
<td>Processors</td>
<td>Mobile</td>
<td>Section 2.1 Table 6: SoCs supported in Windows Phones that can be updated to Windows 10 Mobile</td>
<td>Updated SoCs to marketing names</td>
<td>Clarification</td>
</tr>
<tr class="odd">
<td>Display</td>
<td>Mobile</td>
<td>Section 2.4.1 Table 9: Windows 10 Mobile supported display</td>
<td>Added support for XGA and WSVGA display resolutions. Adjusted WXGA to support up to 9" in size</td>
<td>Requirement adjustment</td>
</tr>
<tr class="even">
<td>Display</td>
<td>Desktop</td>
<td>Section 3.4.1</td>
<td>Adjusted support to 7-inces or larger</td>
<td>Requirement adjustment</td>
</tr>
<tr class="odd">
<td>Memory</td>
<td>IoT Core</td>
<td>Section 5.2 Table 14: RAM requirements for devices that run IoT Core</td>
<td>Clarified RAM requirement for 64bit processors</td>
<td>Clarification</td>
</tr>
<tr class="even">
<td>Memory</td>
<td>IoT Core</td>
<td>Section 5.2</td>
<td>Clarified minimum RAM required for update functionality</td>
<td>Clarification</td>
</tr>
<tr class="odd">
<td>Storage</td>
<td>IoT Core</td>
<td>Section 5.3</td>
<td>Clarified minimum free remaining storage for update</td>
<td>Clarification</td>
</tr>
<tr class="even">
<td>Security</td>
<td>IoT Core</td>
<td>Section 5.4</td>
<td>Clarifying TPM 2.0 will be required in future releases</td>
<td>Clarification</td>
</tr>
<tr class="odd">
<td>Display</td>
<td>IoT Core</td>
<td>Section 5.5</td>
<td>Added section to indicate GPU is optional and minimum DirectX version if GPU is included</td>
<td>Clarification</td>
</tr>
<tr class="even">
<td>NFC</td>
<td>Desktop, Mobile, IoT Core, Server</td>
<td>Section 6.3.6</td>
<td>Removed requirement of embedded secure element not to be supported</td>
<td></td>
</tr>
<tr class="odd">
<td>Accessibility</td>
<td>Desktop, Mobile, IoT Core, Server</td>
<td>Section 6.9</td>
<td>Clarified accessibility requirements</td>
<td>Clarification</td>
</tr>
</tbody>
</table>

 

## Form factors


There are no changes to the supported form factors in Windows 10, version 1607.

## Device experiences


The changes will be described in a future documentation release.

## Hardware component guidelines


The following tables describes the changes for hardware component guidelines in Windows 10, version 1607.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Bluetooth</p></td>
<td><p>Added the following Bluetooth profiles:</p>
<ul>
<li><p>Pre-pair Bluetooth devices during manufacturing, which allows for a seamless out-of-box experience that allows Bluetooth devices to just work.</p></li>
<li><p>Background Bluetooth process consent was added to maintain a user's privacy while developers find new ways to use Bluetooth.</p></li>
</ul>
<p>Added the following APIs/Profiles:</p>
<ul>
<li><p>Non-paired support for connections over RFCOMM, which allows apps to communicate with Windows over RFCOMM without having to pair the device.</p></li>
<li><p>Map apps can now use Cortana's voice for navigation.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

Other changes will be described in a future documentation release.

 

 






