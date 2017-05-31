---
title: NetworkLocation
description: NetworkLocation
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b77876d1-2112-490e-8b9b-6aca37d8b2d1
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# NetworkLocation


**Important**  
This setting has been deprecated in Windows 10. The information about this deprecated setting is provided for reference only.

 

`NetworkLocation` specifies the location of the network if the computer is connected to a network when a user first logs on.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Home</strong></p></td>
<td><p>Specifies a private home network.</p></td>
</tr>
<tr class="even">
<td><p><strong>Work</strong></p></td>
<td><p>Specifies a private office network.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Other</strong></p></td>
<td><p>Specifies neither a home or work network. Network discovery is disabled by default on this network type.</p></td>
</tr>
</tbody>
</table>

 

There is no default value. If a value is not set, and a network is detected, then the **Computer's Current Location** page opens during the Out of Box Experience (OOBE).

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OOBE](microsoft-windows-shell-setup-oobe.md) | **NetworkLocation**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML example shows how to set the network location to a private office network.

``` syntax
<OOBE>
   <NetworkLocation>Work</NetworkLocation>
</OOBE>
```

## Related topics


[OOBE](microsoft-windows-shell-setup-oobe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20NetworkLocation%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





