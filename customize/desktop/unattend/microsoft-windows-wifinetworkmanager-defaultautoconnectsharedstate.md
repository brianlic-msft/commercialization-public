---
title: DefaultAutoConnectSharedState
description: If enabled, the OOBE Wi-Fi Sense checkbox to share networks with contacts will be checked.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C1D49D34-AD37-47C7-A358-C08ED5217EF8
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DefaultAutoConnectSharedState

**This setting has been deprecated in Windows 10, version 1607**. The information about this deprecated setting is provided for reference only. The Wi-Fi Sense credential sharing feature has been removed.

**Important**  
All Wi-Fi sense default settings must be on (or set to 1) unless Microsoft executive approval has been granted for specific mobile operator requests, or for countries listed as exempt.

 

## Values


Set the value of `DefaultAutoConnectSharedState` to one of the following values:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>1</p></td>
<td><p>Sets the checkbox for <strong>Allow me to exchange Wi-Fi network access with my contacts</strong> during device OOBE.</p>
<p>This is the default OS value.</p></td>
</tr>
<tr class="even">
<td><p>0</p></td>
<td><p>Clears the checkbox for <strong>Allow me to exchange Wi-Fi network access with my contacts</strong> during device OOBE.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-WiFiNetworkManager](microsoft-windows-wifinetworkmanager.md) | **DefaultAutoConnectSharedState**

## Valid Configuration Passes


offlineServicing

specialize

oobeSystem

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-WiFiNetworkManager](microsoft-windows-wifinetworkmanager.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DefaultAutoConnectSharedState%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




