---
title: ThemeName
description: ThemeName
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fbdbc52b-6fe4-4e7a-a9af-17d9cf59cf27
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ThemeName


`ThemeName` specifies the name of a theme.

Themes enable users to customize elements of the Windows visual style, including elements such as the desktop, background, and screen saver.

**Note**  NOTE: In Windows 10, if you use this (DesktopBackground/ThemeName) setting, you’ll also need to set (ThemeName/DesktopBackground).

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Theme_name</em></p></td>
<td><p>Specifies the name of the customized Windows theme. <em>Theme_name</em> is a string with a maximum length of 259 characters.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

auditSystem

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [Themes](microsoft-windows-shell-setup-themes.md) | **ThemeName**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to name a customized theme, as well as set the desktop background.

``` syntax
<Themes>
   <ThemeName>Fabrikam Theme</ThemeName>
   <DesktopBackground>%WINDIR%\web\wallpaper\fabrikam.jpg</DesktopBackground>
</Themes>
```

## Related topics


[Themes](microsoft-windows-shell-setup-themes.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ThemeName%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





