---
title: UWPAppsUseLightTheme
description: UWPAppsUseLightTheme
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B4EC2C24-6C05-446D-8440-5E376B78918B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWPAppsUseLightTheme


`UWPAppsUseLightTheme` specifies whether the dark mode is applied.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the classic Windows color mode is used. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the dark color mode is used.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

auditSystem

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [Themes](microsoft-windows-shell-setup-themes.md) | **UWPAppsUseLightTheme**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set a customized theme.

``` syntax
In Windows 10, build 1607, a setting has been added for light/dark mode toggle. 
    <settings pass=”oobeSystem”> 
        <Themes> 
            <ThemeName>MyOLEDTheme</ThemeName> 
            <DefaultThemesOff>false</DefaultThemesOff> 
            <DesktopBackground>c:\windows\OLEDFriendlyImage.jpg </DesktopBackground> 
            <WindowColor>Lime</WindowColor> 
            <UWPAppsUseLightTheme>false</UWPAppsUseLightTheme> 
        </Themes> 
    </settings> 
```

## Related topics


[Themes](microsoft-windows-shell-setup-themes.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UWPAppsUseLightTheme%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





