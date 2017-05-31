---
title: Distinguishing Docks to the Windows OS using the MS OS Descriptor
description: Provides guidance on using OS Descriptor to distinguish docks
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

When a laptop or a convertible is attached to a USB dock it is essential that the operating system can identify the attached hardware device as “Dock” so that it can deliver the correct user experience. Example: Continuum hinting when a convertible is docked. 
To qualify as a dock, it is essential that the hardware device allows projection to external displays along with support for additional peripherals such as mouse, keyboard, storage etc.  Thus, a USB hub alone or a port replicator does not quality as a dock. 
MS OS Descriptor is only recommended for docks with USB only or USB and Video over standard or proprietary connectors.  (E.g. Surface dock, USB Type C dock).
To indicate that a device is dock to the Windows OS the Extended Properties OS Descriptor can be used. The Extended properties descriptor will create a bitmasked registry key, MSOSDockProperties, which indicates different dock properties, these properties are listed in table 1.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr>
<th>Offset</th>
<th>Property name</th>
<th>Description</th>
<tr class="odd">
<td>0</td>
<td>IsDock</td>
<td>This value is set to 1 to indicate that the device is the dock</td>
</tr>
<tr class="even">
<td>1</td>
<td>DockHasIntegratedScreen</td>
<td>This value is set to 1 to indicate that the dock has a built-in screen</td>
</tr>
<tr class="odd">
<td>2</td>
<td>DockHasIntegratedKeyboard</td>
<td>This value is set to 1 to indicate that the dock has a built-in keyboard</td>
</tr>
<tr class="even">
<td>3</td>
<td>DockHasIntegratedMouse</td>
<td>This value is set to 1 to indicate that the dock has a built-in mouse</td>
</tr>
<tr class="odd">
<td>4-31</td>
<td>Reserved</td>
<td>These values are reserved and should be set to zero</td>
</tr>
</table>
All docks should have the “IsDock” property set properly, and the additional custom properties as needed. The “DockHasIntegratedScreen/Keyboard/Mouse” property should only be used if such a device is physically built into the dock (not if the dock supports this type of connection.) 

#Dock Example
This example demonstrates how an Extended Properties OS Descriptor is used to indicate a device is a dock with a built in mouse, keyboard and monitor to the OS. In this example, by using the returned extended properties descriptors, the MSOSDockProperties DWORD is created under the following registry keys:
HKLM\SYSTEM\CurrentControlSet\Enum\USB\<DeviceVID&PID> \<DeviceInstance>\Device Parameters
DWORD: MSOSDockProperties = 1

#Header Example
This section illustrates the layout of the header section, which includes the length of the entire descriptor, the number of function sections, and the version number.

<table>
<colgroup>
<col />
<col />
<col />
<col />
<col />
<col />
</colgroup>
<tbody>
<tr>
<th>Offset</th>
<th>Field</th>
<th>Size (bytes)</th>
<th>Type</th>
<th>Value</th>
<th>Description</th>
<tr class="odd">
<td>0</td>
<td>dwLength</td>
<td>4</td>
<td>DWORD</td>
<td>0x042</td>
<td>The length of this custom property section is 66 bytes.</td>
</tr>
<tr class="even">
<td>4</td>
<td>bcdVersion</td>
<td>2</td>
<td>BCD</td>
<td>0x0100</td>
<td>Version 1.0</td>
</tr>
<tr class="odd">
<td>6</td>
<td>wIndex</td>
<td>2</td>
<td>WORD</td>
<td>0x0005</td>
<td>Extended property OS descriptor</td>
</tr>
<tr class="even">
<td>8</td>
<td>wCount</td>
<td>2</td>
<td>WORD</td>
<td>0s0001</td>
<td>custom property</td>
</tr>
</table>

#Custom property example
<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr>
<th>Offset</th>
<th>Field</th>
<th>Size (bytes)</th>
<th>Value</th>
<th>Description</th>
<tr class="odd">
<td>0</td>
<td>dwSize</td>
<td>4</td>
<td>0x00000038</td>
<td>Length of this custom property section is 56 bytes.</td>
</tr>
<tr class="even">
<td>4</td>
<td>dwPropertyDataType</td>
<td>42</td>
<td>0x00000004 </td>
<td>Property value stores a little-endian 32-bit integer.</td>
</tr>
<tr class="odd">
<td>10</td>
<td>wPropertyNameLength</td>
<td>38</td>
<td>WORD</td>
<td>0x00000026</td>
<td>Extended property OS descriptor</td>
</tr>
<tr class="even">
<td>8</td>
<td>wCount</td>
<td>2</td>
<td>WORD</td>
<td>0s0001</td>
<td>custom property</td>
</tr>
</table>