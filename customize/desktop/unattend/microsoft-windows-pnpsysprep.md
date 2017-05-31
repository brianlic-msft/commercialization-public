---
title: Microsoft-Windows-PnpSysprep
description: Microsoft-Windows-PnpSysprep
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1be14a5d-3fc1-4424-bfd0-fa5664ceb92c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-PnpSysprep


The Microsoft-Windows-PnpSysprep component specifies whether all Plug and Play information persists during the generalize configuration pass and the specialize configuration pass.

Typically, during the **generalize** configuration pass, all device information is removed from the reference computer.

During the **specialize** configuration pass, any Plug and Play devices that are detected on the destination computer are re-initialized. Any Plug and Play devices that are not detected are removed from the computer.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DoNotCleanUpNonPresentDevices](microsoft-windows-pnpsysprep-donotcleanupnonpresentdevices.md)</p></td>
<td><p>Specifies whether Plug and Play information persists on the destination computer during the following specialize configuration pass.</p></td>
</tr>
<tr class="even">
<td><p>[PersistAllDeviceInstalls](microsoft-windows-pnpsysprep-persistalldeviceinstalls.md)</p></td>
<td><p>Specifies whether all Plug and Play information persists on the destination computer during the generalize configuration pass.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-PnpSysprep%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





