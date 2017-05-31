---
title: ColorDepth
description: ColorDepth
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: eb7a0319-84cf-451e-88c6-62227533232c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ColorDepth


`ColorDepth` specifies the bits-per-pixel color depth to apply to the video adapter.

The `ColorDepth` setting is used to configure only Windows PE, and is not applied to the Windows installation. To change the display settings for the Windows installation, see [Display](microsoft-windows-shell-setup-display.md) in the [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) component.

**Note**  
We recommend that you use the default settings. If you select a value for this setting that is not supported by Windows PE, your video adapter, or the display monitor, then Windows PE might show only a blank screen and will not display an error.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>color_depth_bits_per_pixel</em></p></td>
<td><p>Specifies the bits-per-pixel color depth to apply to the video adapter.</p>
<p>For example, to specify a color depth of 32 bits, set <code>ColorDepth</code> to <strong>32</strong>.</p>
<p>The value for <code>ColorDepth</code> must be supported by the video adapter and the display monitor.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [Display](microsoft-windows-setup-display.md) | **ColorDepth**

## Applies To


**Note**  
This setting only affects the Windows Setup process on BIOS-based computers. UEFI-based computers are not affected by these settings.

 

For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output sets the display resolution to 640x480, with 16-bit color depth and a refresh rate of 60 hertz.

``` syntax
<Display>
   <HorizontalResolution>640</HorizontalResolution>
   <VerticalResolution>480</VerticalResolution>
   <ColorDepth>16</ColorDepth>
   <RefreshRate>60</RefreshRate>
</Display>
```

## Related topics


[Display](microsoft-windows-setup-display.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ColorDepth%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





