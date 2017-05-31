---
title: Microsoft-Windows-PnpCustomizationsNonWinPE
description: Microsoft-Windows-PnpCustomizationsNonWinPE
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b85f64a4-3e3f-4472-abf3-7d1cecb37a89
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-PnpCustomizationsNonWinPE


The Microsoft-Windows-PnpCustomizationsNonWinPE component is used to add one or more out-of-box drivers to a Windows installation. Drivers located in the path specified by [DriverPaths](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths.md) are copied to the driver store of the Windows installation during the auditSystem configuration pass. When the system runs Plug and Play, these out-of-box drivers are available to install hardware on the computer.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DriverPaths](microsoft-windows-pnpcustomizationsnonwinpe-driverpaths.md)</p></td>
<td><p>Specifies one or more driver paths that contain out-of-box drivers. Drivers in this path are copied to the Windows image during the <strong>auditSystem</strong> configuration pass.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

[microsoft-windows-pnpcustomizationswinpe-](microsoft-windows-pnpcustomizationswinpe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-PnpCustomizationsNonWinPE%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





