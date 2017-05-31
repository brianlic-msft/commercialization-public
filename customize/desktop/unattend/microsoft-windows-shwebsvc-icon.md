---
title: Icon
description: Icon
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: af7616ea-9f09-4d4d-a0e5-d439df2bb02d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Icon


`Icon` specifies the path to and the file name of the icon file for the online printing company website to display in the Online Print Wizard. Whenever it is possible, provide the absolute path to the icon that is stored on the user's hard disk. This will ensure that the Photo Gallery in the desktop can display the icon the first time that Photo Gallery in the desktop is used.

If the absolute path cannot be provided, provide the URL to the icon file hosted on the Web. In this case, the first time Photo Gallery in the desktop is launched, the default Online Print Wizard icon will be used until the icon is downloaded.

If the provider is a Microsoft partner, and the icon is hosted on the Microsoft website, then this setting can be just the file name of the icon.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Icon</em></p></td>
<td><p>Specifies the path and the file name of the icon for the online printing company to display in the Online Print Wizard. <em>Icon</em> is a string. The .ico file must be present on the installed Windows operating system.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-shwebsvc](microsoft-windows-shwebsvc.md) | **Icon**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-shwebsvc](microsoft-windows-shwebsvc.md).

## XML Example


The following XML output shows how to set Lucerne Publishing for online printing.

``` syntax
<Description>Get photos printed by Lucerne and delivered to your home.</Description>
<DisplayName>Lucerne Publishing</DisplayName>
<href>lucernepublishing.com</href>
<Icon>c:\Lucerne\lucernepub.ico</Icon>
<ID>lucernepub</ID>
```

## Related topics


[Microsoft-Windows-shwebsvc](microsoft-windows-shwebsvc.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Icon%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





