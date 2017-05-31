---
title: LocalIntranetSites
description: LocalIntranetSites
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: def29dae-ec93-4fa1-bf54-e47caa53fa6a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LocalIntranetSites


`LocalIntranetSites` specifies the URL for local intranet sites whose content can be trusted by administrators and users for whom Internet Explorer Enhanced Security Configuration (ESC) is enabled.

When Internet Explorer ESC is enabled, it reduces the exposure of your server to potential security attacks from Web pages that do not belong to the local intranet zone.

For more information, see [Microsoft-Windows-IE-ESC](microsoft-windows-ie-esc.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path_to_url</em></p></td>
<td><p>Specifies the path to the URL of each local intranet site. You can add multiple sites by using semicolons as the separator. <em>Path_to_url</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | **LocalIntranetSites**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output specifies the URLs of local intranet sites with trusted content.

``` syntax
<LocalIntranetSites>http://internal;http://internal2</LocalIntranetSites>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

[TrustedSites](microsoft-windows-ie-internetexplorer-trustedsites.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LocalIntranetSites%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





