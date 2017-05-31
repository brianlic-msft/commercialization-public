---
title: Graphics
description: Graphics
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 342F222D-15CC-4503-9C82-032F9C2EEC17
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Graphics


## What's new in Windows 10 for Graphics


This topic covers new guidelines for Graphics in Windows 10.

### Windows 10 support for Ultra High Definition (UHD)

Windows supports 4K UHD and 8K UHD, but UHD is more than just higher resolution. These factors affect how people perceive images, in order of importance:

-   Dynamic range, which is the difference between the darkest black and the whitest white, and the steps in between. UHD dynamic range allows users to see details in both the bright and dark portions of an image.
-   Color gamut, which is the range of colors that can be faithfully recreated. UHD has a greatly expanded color gamut and bit depth.
-   Frame rate, which is the number of frames per second. A higher frame rate (50/60fps) makes motion smoother, especially for sporting events.
-   Resolution, which is the number of pixels. 4K resolution (2160p) has 4 times as many pixels as 1080p.

Where it makes sense, display panel manufacturers are recommended to invest in brighter panels, wider color gamuts, higher bit depths, and higher resolutions.

### UHD investments in Windows 10

-   HEVC decoder with hardware offload
-   HEVC encoder with hardware offload
-   Hardware DRM for PlayReady
-   Support for wider color gamut
-   Support for greater precision (color accuracy)

### High Efficiency Video Coding (HEVC)

HEVC (also known as H.265) is a joint MPEG/ITU standard. It is non-proprietary and the successor to Advanced Video Coding (AVC, also known as H.264). Because it has significantly better compression, HEVC can consume up to 30-50% less bandwidth and storage than AVC. It allows the transmission of high quality video across connections that have low bandwidth.

### Content protection

Full 1080p, including 4K UHD, demands higher bar than existing software-based Digital Rights Management (DRM). Windows 10 supports hardware-based content protection. Hardware-based DRM is required to access premium content.

The infrastructure used for hardware-based content protection for Windows 10 is PlayReady 3.0, which provides these benefits:

-   Hardware root of trust
-   Device binding and all keys in hardware
-   Compressed and uncompressed content not exposed to attack
-   Output protections managed by hardware

### Aspect ratios

-   Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) supports any aspect ratio, as in Windows 8.1
-   Windows 10 Mobile will support any aspect ratio by Oct 2015
-   Certain aspect ratios were targeted during design:

    -   Phones: 16:9; Small tablets 16:10
    -   2-in-1’s 3:2; Laptops/Desktops/TVs 16:9
    -   Windows itself will reflow to support an arbitrary aspect ratio
    -   "Square" aspect ratios (&lt;4:3) may have limited scale factor support due to the 4:3 aspect ratio of the minimum effective resolution (800x600 for desktop, 480x800 for mobile)

## Minimum requirements for Graphics

<table>
<thead valign="bottom">
<tr>
<th>Windows edition</th>
<th colspan="2">Requirements</th>
</tr>
</thead>
<tbody valign="top">
<tr>
<td rowspan="2">
Windows 10 for desktop editions for PCs and 2-in-1's
</td>
<td>
Resolution, bit depth, and size
</td>
<td>
<p>
Supports a minimum display resolution of SVGA (800 x 600) with a depth of 32 bits on each output simultaneously, and a minimum diagonal display size of 8-inches or larger. Tablets, 2-in-1's, and laptops that run Windows 10 Desktop edition must include a display that meets the requirements listed in Minimum Hardware Requirements. A display is optional for desktop PCs that run Windows Desktop edition.
</p>
<p>
Devices that support UHDTV 4K must have 8-inch screens or larger.
</p>
<p>
Devices that support UHDTV 8K must have 27-inch screens or larger.
</p>
</td>
</tr>
<tr>
<td>
Graphics
</td>
<td>
Devices must include a GPU that supports DirectX 9 or later.
</td>
</tr>
<tr>
<td rowspan="2">
Windows Server 2016
</td>
<td>
Resolution, bit depth, and size
</td>
<td>
Supports a minimum display resolution of XGA (1024 x 768) with a depth of 32 bits on each output simultaneously.
</td>
</tr>
<tr>
<td>
Graphics
</td>
<td>
A GPU is optional. If a GPU is included, it must support DirectX 9 or later.
</td>
</tr>
<tr>
<td rowspan="4">
Windows 10 Mobile
</td>
<td>
Resolution, bit depth, and size
</td>
<td>
<p>
Supports a minimum resolution of WVGA (800 x 480), a minimum of 32 bits of color per pixel, a minimum diagonal display size of 4 inches (4.5 inches is recommended) and a maximum diagonal display size of less than 8-inches. The hardware display panel must support a minimum of 16 bits per pixel (5 red, 6 green, 5 blue). The display driver must support a minimum of 32 bits of color per pixel, and must be able to scan out to the display panel when the panel bit depth is less than 32 bits per pixel.
</p>
<p>
Devices that support QHD must have 4-inch screens or larger.
</p>
<p>
Devices that support UHDTV 4K must have 6-inch screens or larger.
</p>
</td>
</tr>
<tr>
<td>
Pixel aspect ratio
</td>
<td>
Display pixels in devices must be square—that is, have an aspect ratio of 1:1.
</td>
</tr>
<tr>
<td>
Refresh rate for display panel hardware
</td>
<td>
The display panel hardware in devices must support an update and refresh rate of 59.97 ±0.03 Hz. The range for smart panels (panels that support self-refresh) is extended to 59.97 ±3.0 Hz at room temperature (25˚C). Update rate is defined as the rate at which new frames can be sent to the display hardware. The refresh rate is defined as the number of times in a second that display hardware draws the data. This specification applies for all display configurations and all supported overlay modes (primary + secondary).
</td>
</tr>
<tr>
<td>
Display brightness levels
</td>
<td>
All displays in devices must support a minimum of 16 levels of brightness.
</td>
</tr>
</tbody>
</table>