---
title: WindowColor
description: WindowColor
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 46f3fb90-ca6d-4ded-a54c-76fe2c95f43f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WindowColor


`WindowColor` specifies the accent color used throughout Windows in places like start tiles, calendar fly-out, and Common Controls.

## Values


In the next major update to Windows 10, there are no predefined colors. All of the named colors: `Color 1` through `Color 15` are deprecated and have effect if set. Due to the large number of surface that are impacted by the color choice, avoid using colors that are too dark or too bright when setting `WindowColor`. 
There are two options for setting `WindowColor` in unattend.xml.
1. Set `WindowColor` to `Automatic`. Use this value to select a color that’s harmonious with the color palette of the desktop wallpaper. `Automatic` sets `WindowColor` to a color that is harmonious with the color palette of the desktop wallpaper will be chosen.
The default color is a shade of blue (0xff0078d7).
2. Use a custom hexidecimal color value. When using custom hexidecimal color values, the accent color is defined by the ARGB color scheme, where the value is 0x[Opacity][Red][Green][Blue], for example 0xffcc5029. 
Colors that are set with a luminance less than .25 or greater than .75 are not allowed. Colors set to these values will be filtered to be within the .27-.75 range of luminosity. 
The opacity (also known as alpha) value is ignored and has no bearing on the color. 00 is completely transparent, and FF is fully opaque. 
To learn more about ARGB values, see the [Color.ToArgb Method ()](https://msdn.microsoft.com/en-us/library/system.drawing.color.toargb(v=vs.110).aspx).




## Valid Configuration Passes


specialize

auditSystem

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [Themes](microsoft-windows-shell-setup-themes.md) | **WindowColor**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Examples


The following XML output shows how to set the default `WindowColor` to match the color palette of the desktop wallpaper.

``` syntax
            <Themes>
                <ThemeName>Test</ThemeName>
                <WindowColor>Automatic</WindowColor>
                <DesktopBackground>C:\Windows\Web\Screen\img104.jpg</DesktopBackground>
            </Themes>
```

## Related topics


[Themes](microsoft-windows-shell-setup-themes.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20WindowColor%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





