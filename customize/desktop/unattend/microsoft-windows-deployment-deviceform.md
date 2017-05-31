---
title: DeviceForm
description: Use DeviceForm to specify the device form factor running Windows 10.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0C9C56E4-0FCC-403F-AD29-A4919133D671
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DeviceForm


Use `DeviceForm` to specify the device form factor running Windows 10.

To support the following features or components, set the value from the table below. For example, if you want to create an image for Retail demo mode, the DeviceForm value should be set to 14 or “Kiosk”. Likewise, if you are creating an image for a vending machine, DeviceForm should be set to 1C, or “Vending”.

## Values


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Device form</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Unknown</p></td>
<td><p>Use this value if your device does not fit into any of the other device form factors.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Phone</p></td>
<td><p>A typical smartphone combines cellular connectivity, a touch screen, rechargeable power source, and other components into a single chassis.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Tablet</p></td>
<td><p>A device with an integrated screen that's less than 18&quot;. It combines a touch screen, rechargeable power source, and other components into a single chassis with an optional attachable keyboard.</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Desktop</p></td>
<td><p>A desktop PC form factor traditional comes in an upright tower or small desktop chassis and does not have an integrated screen.</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>Notebook</p></td>
<td><p>A notebook is a portable clamshell device with an attached keyboard that cannot be removed.</p></td>
</tr>
<tr class="even">
<td><p>5</p></td>
<td><p>Convertible</p></td>
<td><p>A convertible device is an evolution of the traditional notebook where the keyboard can be swiveled, rotated or flipped, but not completely removed. It is a blend between a traditional notebook and tablet, also called a 2-in-1.</p></td>
</tr>
<tr class="odd">
<td><p>6</p></td>
<td><p>Detachable</p></td>
<td><p>A detachable device is an evolution of the traditional notebook where the keyboard can be completely removed. It is a blend between a traditional notebook and tablet, also called a 2-in-1.</p></td>
</tr>
<tr class="even">
<td><p>7</p></td>
<td><p>All-in-One</p></td>
<td><p>An All-in-One device is an evolution of the traditional desktop with an attached display.</p></td>
</tr>
<tr class="odd">
<td><p>8</p></td>
<td><p>Stick PC</p></td>
<td><p>A device that turns your TV into a Windows computer. Plug the stick into the HDMI slot on the TV and connect a USB or Bluetooth keyboard or mouse.</p></td>
</tr>
<tr class="even">
<td><p>9</p></td>
<td><p>Puck</p></td>
<td><p>A small-size PC that users can use to plug in a monitor and keyboard.</p></td>
</tr>
<tr class="odd">
<td><p>A</p></td>
<td><p>Surface Hub</p></td>
<td><p>Microsoft Surface Hub</p></td>
</tr>
<tr class="even">
<td><p>B</p></td>
<td><p>Head-mounted display</p></td>
<td><p>A holographic computer that is completely untethered - no wires, phones, or connection to a PC needed.</p></td>
</tr>
<tr class="odd">
<td><p>C</p></td>
<td><p>Industry handheld</p></td>
<td><p>A device screen less than 7” diagonal designed for industrial solutions. May or may not have a cellular stack.</p></td>
</tr>
<tr class="even">
<td><p>D</p></td>
<td><p>Industry tablet</p></td>
<td><p>A device with an integrated screen greater than 7” diagonal and no attached keyboard designed for industrial solutions as opposed to consumer personal computer. May or may not have a cellular stack.</p></td>
</tr>
<tr class="odd">
<td><p>E</p></td>
<td><p>Banking</p></td>
<td><p>A machine at a bank branch or another location that enables customers to perform basic banking activities including withdrawing money and checking one's bank balance.</p></td>
</tr>
<tr class="even">
<td><p>F</p></td>
<td><p>Building automation</p></td>
<td><p>A controller for industrial environments that can include the scheduling and automatic operation of certain systems such as conferencing, heating and air conditioning, and lighting.</p></td>
</tr>
<tr class="odd">
<td><p>10</p></td>
<td><p>Digital signage</p></td>
<td><p>A computer or playback device that's connected to a large digital screen and displays video or multimedia content for informational or advertising purposes.</p></td>
</tr>
<tr class="even">
<td><p>11</p></td>
<td><p>Gaming</p></td>
<td><p>A device that's used for playing a game. It can be mechanical, electronic, or electromechanical equipment.</p></td>
</tr>
<tr class="odd">
<td><p>12</p></td>
<td><p>Home automation</p></td>
<td><p>A controller that can include the scheduling and automatic operation of certain systems including heating and air conditioning, security, and lighting.</p></td>
</tr>
<tr class="even">
<td><p>13</p></td>
<td><p>Industrial automation</p></td>
<td><p>Computers that are used to automate manufacturing systems such as controlling an assembly line where each station is occupied by industrial robots.</p></td>
</tr>
<tr class="odd">
<td><p>14</p></td>
<td><p>Kiosk</p></td>
<td><p>An unattended structure that can include a keyboard and touch screen and provides a user interface to display interactive information and allow users to get more information.</p></td>
</tr>
<tr class="even">
<td><p>15</p></td>
<td><p>Maker board</p></td>
<td><p>A low-cost and compact development board that's used for prototyping any number IoT-related things.</p></td>
</tr>
<tr class="odd">
<td><p>16</p></td>
<td><p>Medical</p></td>
<td><p>Devices built specifically to provide medical staff with information about the health and well-being of a patient.</p></td>
</tr>
<tr class="even">
<td><p>17</p></td>
<td><p>Networking</p></td>
<td><p>A device or software that determines where messages, packets, and other signals will go next.</p></td>
</tr>
<tr class="odd">
<td><p>18</p></td>
<td><p>Point of Service</p></td>
<td><p>An electronic cash register or self-service checkout.</p></td>
</tr>
<tr class="even">
<td><p>19</p></td>
<td><p>Printing</p></td>
<td><p>A printer, copy machine, or a combination of both.</p></td>
</tr>
<tr class="odd">
<td><p>1A</p></td>
<td><p>Thin client</p></td>
<td><p>A device that connects to a server to perform computing tasks as opposed to running apps locally.</p></td>
</tr>
<tr class="even">
<td><p>1B</p></td>
<td><p>Toy</p></td>
<td><p>A device used solely for enjoyment or entertainment.</p></td>
</tr>
<tr class="odd">
<td><p>1C</p></td>
<td><p>Vending</p></td>
<td><p>A machine that dispenses items in exchange for payment in the form of coin, currency, or credit/debit card.</p></td>
</tr>
<tr class="even">
<td><p>1D</p></td>
<td><p>Industry other</p></td>
<td><p>A device that doesn't fit into any of the previous categories.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


generalize

specialize

auditSystem

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | **DeviceForm**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## Related topics


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DeviceForm%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





