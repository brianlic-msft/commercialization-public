---
title: HideWirelessSetupInOOBE
description: HideWirelessSetupInOOBE
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ea9e9257-3335-47af-a224-60964eb79c1c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HideWirelessSetupInOOBE


`HideWirelessSetupInOOBE` specifies whether to hide the **Join Wireless Network** screen that appears during Windows Welcome.

During Windows Welcome, the **Join Wireless Network** screen prompts the end user to connect to a wireless network when all of the following conditions are met:

-   `HideWirelessSetupInOOBE` is not set to **true**.

-   The computer has a wireless network device.

-   The drivers for the wireless network device are available and installed.

-   A wireless network is available and detected.

-   A connection to a wireless network has not already been established in a previous Windows installation on the same computer.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Hides the <strong>Join Wireless Network</strong> screen during Windows Welcome.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Does not hide the <strong>Join Wireless Network</strong> screen during Windows Welcome.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OOBE](microsoft-windows-shell-setup-oobe.md) | **HideWirelessSetupInOOBE**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML example shows how to set Windows Welcome to always hide the **Join Wireless Network** screen.

``` syntax
<OOBE>
  <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>
</OOBE>
```

## Related topics


[NetworkLocation](microsoft-windows-shell-setup-oobe-networklocation.md)

[OOBE](microsoft-windows-shell-setup-oobe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20HideWirelessSetupInOOBE%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





