---
title: CustomDefaultThemeFile
description: CustomDefaultThemeFile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bdab4b5b-d51b-41ce-9e68-826b26e58cbd
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CustomDefaultThemeFile


`CustomDefaultThemeFile` specifies the path to a customized theme file. These files may include a .bmp file for customized background.

**Note**  
This setting is deprecated.

While you can add themes to a Windows 7 or Windows 8 installation by using a .theme file, .theme files can no longer be used as the default theme.

To define a default theme, use the settings: [BrandIcon](microsoft-windows-shell-setup-themes-brandicon.md), [DesktopBackground](microsoft-windows-shell-setup-themes-desktopbackground.md), [ScreenSaver](microsoft-windows-shell-setup-themes-screensaver.md), [ThemeName](microsoft-windows-shell-setup-themes-themename.md), and [WindowColor](microsoft-windows-shell-setup-themes-windowcolor.md).

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path_to_theme_file</em></p></td>
<td><p>Specifies the path to the customized default theme file. <em>Path_to_theme_file</em> is a string with a maximum length of 259 characters.</p>
<p>Theme files have a file name extension of .theme and are text files containing, among other things, pointers to visual resources such as background.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

**Note**  
The background color or design must not, in any way, obscure the Windows desktop icons, taskbar, **Start** button, or **Start** menu, or otherwise impair the functionality of the user interface. Users must be able to view and to use the Windows desktop for its intended purpose, which is to provide easy access to icons and to folders.

 

## Valid Configuration Passes


specialize

auditSystem

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [Themes](microsoft-windows-shell-setup-themes.md) | **CustomDefaultThemeFile**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set a customized theme.

``` syntax
<Themes>
   <CustomDefaultThemeFile>c:\themefiles\theme1.theme</CustomDefaultThemeFile>
   <DefaultThemesOff>false</DefaultThemesOff>
</Themes>
```

## Related topics


[Themes](microsoft-windows-shell-setup-themes.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20CustomDefaultThemeFile%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





