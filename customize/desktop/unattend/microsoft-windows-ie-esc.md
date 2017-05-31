---
title: Microsoft-Windows-IE-ESC
description: Microsoft-Windows-IE-ESC
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 76a4d013-7847-47ae-9b5a-e2cf435acd49
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-IE-ESC


The Microsoft-Windows-IE-ESC component specifies details about Internet Explorer Enhanced Security Configuration (ESC). When Internet Explorer ESC is enabled, it reduces the exposure of your server to potential security attacks from Web pages that do not belong to the Local Intranet zone or the Trusted Sites zone.

You can specify:

-   For whom ESC is enabled: administrators only; all users, both administrators and all users; or neither.

-   Local intranet sites and Internet sites whose content can be trusted by administrators and users for whom ESC is enabled. For more information, see [LocalIntranetSites](microsoft-windows-ie-internetexplorer-localintranetsites.md) and [TrustedSites](microsoft-windows-ie-internetexplorer-trustedsites.md).

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[IEHardenAdmin](microsoft-windows-ie-esc-iehardenadmin.md)</p></td>
<td><p>Specifies whether ESC is enabled for all administrators on the computer.</p></td>
</tr>
<tr class="even">
<td><p>[IEHardenUser](microsoft-windows-ie-esc-iehardenuser.md)</p></td>
<td><p>Specifies whether ESC is enabled for all users on the computer.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[LocalIntranetSites](microsoft-windows-ie-internetexplorer-localintranetsites.md)

[TrustedSites](microsoft-windows-ie-internetexplorer-trustedsites.md)

[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-IE-ESC%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





