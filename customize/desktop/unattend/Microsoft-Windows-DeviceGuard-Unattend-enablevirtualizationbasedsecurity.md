---
title: EnableVirtualizationBasedSecurity
description: Use to enable virtualization-based security.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 32C940A8-7BF8-4541-97BB-27F2695DE9B6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EnableVirtualizationBasedSecurity


Use to enable virtualization-based security.

**Important**  You must first use DISM to add the virtualization-based security features before you apply this Unattend setting. For more information, see *Add the virtualization-based security features by using DISM* in [Credential Guard]( http://go.microsoft.com/fwlink/p/?LinkId=623856).

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Disables virtualization-based security.</p>
<p>This is the default OS value.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Enables virtualization-based security.</p></td>
</tr>
</tbody>
</table>

 

If this setting is set to 0 or is not present, the system doesn't read other values and VSM is not enforced. In this case, existing BCD settings are used.

## Parent Hierarchy


[Microsoft-Windows-DeviceGuard-Unattend](microsoft-windows-deviceguard-unattend.md) | **EnableVirtualizationBasedSecurity**

## Valid Configuration Passes


offlineServicing

## Applies To


Windows 10 Enterprise

Windows Server 2016

For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-DeviceGuard-Unattend](microsoft-windows-deviceguard-unattend.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20EnableVirtualizationBasedSecurity%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




