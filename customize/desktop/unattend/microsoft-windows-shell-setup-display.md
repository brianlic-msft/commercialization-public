---
title: Display
description: Display
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7060a68c-cd05-4fee-a0cc-92538e1a1d6d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Display


`Display` specifies the display settings for the display device.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[ColorDepth](microsoft-windows-shell-setup-display-colordepth.md)</p></td>
<td><p>Specifies a valid color depth for the display device in bits per pixel.</p></td>
</tr>
<tr class="odd">
<td><p>[HorizontalResolution](microsoft-windows-shell-setup-display-horizontalresolution.md)</p></td>
<td><p>Specifies a valid horizontal resolution for the display device.</p></td>
</tr>
<tr class="even">
<td><p>[RefreshRate](microsoft-windows-shell-setup-display-refreshrate.md)</p></td>
<td><p>Specifies a valid refresh rate for the display device.</p></td>
</tr>
<tr class="odd">
<td><p>[VerticalResolution](microsoft-windows-shell-setup-display-verticalresolution.md)</p></td>
<td><p>Specifies a valid vertical resolution for the display device.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
If the specified settings cannot be set on the display device, Windows attempts to match the requested mode as closely as possible.

 

## Valid Passes


auditSystem

auditUser

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **Display**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output sets the display resolution to 1024x768, with 32-bit color depth, and a refresh rate of 72 hertz.

``` syntax
<Display>
   <ColorDepth>32</ColorDepth>
   <HorizontalResolution>1024</HorizontalResolution>
   <RefreshRate>72</RefreshRate>
   <VerticalResolution>768</VerticalResolution>
</Display>
```

The following XML output sets the display resolution to 1024x768, with 32-bit color depth, a refresh rate of 72 hertz, and displays text and graphics items at a medium size.

``` syntax
<Display>
   <ColorDepth>32</ColorDepth>
   <DPI>120</DPI>
   <HorizontalResolution>1024</HorizontalResolution>
   <RefreshRate>72</RefreshRate>
   <VerticalResolution>768</VerticalResolution>
</Display>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Display%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





