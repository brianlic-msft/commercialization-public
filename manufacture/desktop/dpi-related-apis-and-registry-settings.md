---
author: Justinha
Description: 'DPI-related APIs and registry settings'
ms.assetid: 23b0e272-a09e-4081-a129-d330b6878d8e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DPI-related APIs and registry settings'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DPI-related APIs and registry settings


If you need to perform deployment customizations, the following sections explain the registry keys and system parameters that your post-installation scripts might need to access.

**In this topic:**

-   [Primary display native resolution](#native)

-   [Primary display DPI scale factor](#scale)

-   [Scaling mode](#scalingmode)

-   [Scaling override in Windows 8.1 scaling mode](#override)

-   [System-wide scale factor in Windows 8 scaling mode](#system)


## <span id="native"></span><span id="NATIVE"></span>Primary display native resolution


*Table 1 Windows 8.1 Scaling Levels*, while by no means exhaustive, provides information on the Windows 8.1 scaling level for a number of common displays. **Panel DPI** indicates the physical pixel density of the panel, and **Scaling level** indicates the scale factor that will be used for this display.

**Table 1 Windows 8.1 Scaling Levels**

<table>
<colgroup>
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Display size</th>
<th align="left">Display resolution</th>
<th align="left">Horizontal (pixels)</th>
<th align="left">Vertical (pixels)</th>
<th align="left">Panel DPI</th>
<th align="left">Scaling level</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>10.6&quot;</p></td>
<td align="left"><p>FHD</p></td>
<td align="left"><p>1920</p></td>
<td align="left"><p>1080</p></td>
<td align="left"><p>208</p></td>
<td align="left"><p>150%</p></td>
</tr>
<tr class="even">
<td align="left"><p>10.6&quot;</p></td>
<td align="left"><p>HD</p></td>
<td align="left"><p>1366</p></td>
<td align="left"><p>768</p></td>
<td align="left"><p>148</p></td>
<td align="left"><p>100%</p></td>
</tr>
<tr class="odd">
<td align="left"><p>11.6&quot;</p></td>
<td align="left"><p>WUXGA</p></td>
<td align="left"><p>1920</p></td>
<td align="left"><p>1200</p></td>
<td align="left"><p>195</p></td>
<td align="left"><p>150%</p></td>
</tr>
<tr class="even">
<td align="left"><p>11.6&quot;</p></td>
<td align="left"><p>HD</p></td>
<td align="left"><p>1366</p></td>
<td align="left"><p>768</p></td>
<td align="left"><p>135</p></td>
<td align="left"><p>100%</p></td>
</tr>
<tr class="odd">
<td align="left"><p>13.3&quot;</p></td>
<td align="left"><p>WUXGA</p></td>
<td align="left"><p>1920</p></td>
<td align="left"><p>1200</p></td>
<td align="left"><p>170</p></td>
<td align="left"><p>150%</p></td>
</tr>
<tr class="even">
<td align="left"><p>13.3&quot;</p></td>
<td align="left"><p>QHD</p></td>
<td align="left"><p>2560</p></td>
<td align="left"><p>1440</p></td>
<td align="left"><p>221</p></td>
<td align="left"><p>200%</p></td>
</tr>
<tr class="odd">
<td align="left"><p>13.3&quot;</p></td>
<td align="left"><p>HD</p></td>
<td align="left"><p>1366</p></td>
<td align="left"><p>768</p></td>
<td align="left"><p>118</p></td>
<td align="left"><p>100%</p></td>
</tr>
<tr class="even">
<td align="left"><p>15.4&quot;</p></td>
<td align="left"><p>FHD</p></td>
<td align="left"><p>1920</p></td>
<td align="left"><p>1080</p></td>
<td align="left"><p>143</p></td>
<td align="left"><p>125%</p></td>
</tr>
<tr class="odd">
<td align="left"><p>15.6&quot;</p></td>
<td align="left"><p>QHD+</p></td>
<td align="left"><p>3200</p></td>
<td align="left"><p>1800</p></td>
<td align="left"><p>235</p></td>
<td align="left"><p>200%</p></td>
</tr>
<tr class="even">
<td align="left"><p>17&quot;</p></td>
<td align="left"><p>FHD</p></td>
<td align="left"><p>1920</p></td>
<td align="left"><p>1080</p></td>
<td align="left"><p>130</p></td>
<td align="left"><p>125%</p></td>
</tr>
<tr class="odd">
<td align="left"><p>23”</p></td>
<td align="left"><p>QFHD (4K)</p></td>
<td align="left"><p>3840</p></td>
<td align="left"><p>2160</p></td>
<td align="left"><p>192</p></td>
<td align="left"><p>200%</p></td>
</tr>
<tr class="even">
<td align="left"><p>24&quot;</p></td>
<td align="left"><p>QHD</p></td>
<td align="left"><p>2560</p></td>
<td align="left"><p>1440</p></td>
<td align="left"><p>122</p></td>
<td align="left"><p>125%</p></td>
</tr>
</tbody>
</table>

 

To programmatically find this information for any device, you can write a utility program that reports back data. The native primary resolution is retrieved by calling the API [GetDeviceCaps() function](http://go.microsoft.com/fwlink/p/?linkid=331144), using the hdc for the desktop and the HORZRES and VERZRES indices:

``` syntax
// Get desktop dc
desktopDc = GetDC(NULL);
// Get native resolution
horizontalResolution = GetDeviceCaps(desktopDc,HORZRES);
verticalResolution = GetDeviceCaps(desktopDc,VERZRES);
```

For more information about GetDC, see [GetDC() function](http://go.microsoft.com/fwlink/p/?linkid=331145).

## <span id="scale"></span><span id="SCALE"></span>Primary display DPI scale factor


Similarly, you can get the pixel density by using the LOGPIXELSX and LOGPIXELSY indices:

``` syntax
// Get desktop dc
desktopDc = GetDC(NULL);
// Get native resolution
horizontalDPI = GetDeviceCaps(desktopDc,LOGPIXELSX);
verticalDPI = GetDeviceCaps(desktopDc,LOGPIXELSY);
```

These results are returned in a coordinate system in which 96 corresponds to 100%, as shown in *Table 2 DPI Scale Factors*.

**Table 2 DPI Scale Factors**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">DPI</th>
<th align="left">Scale factor</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>96</p></td>
<td align="left"><p>100</p></td>
</tr>
<tr class="even">
<td align="left"><p>120</p></td>
<td align="left"><p>125</p></td>
</tr>
<tr class="odd">
<td align="left"><p>144</p></td>
<td align="left"><p>150</p></td>
</tr>
<tr class="even">
<td align="left"><p>192</p></td>
<td align="left"><p>200</p></td>
</tr>
</tbody>
</table>

 

**Note**  
This API will return different results depending on the DPI awareness mode of your application. Configuring the awareness mode requires adding XML to the application manifest, as detailed below:

| DPI Awareness Mode | Manifest Setting | Returned Value |
| ------------------ | ---------------- | -------------- |
| None               | None             |  96 for all displays, regardless of the scale factor |
| System DPI Aware      | \<dpiAware>True\</dpiAware> | The DPI of the primary display at the time the Windows session was started (when the user first logged in to Windows) |
| Per-Monitor DPI Aware | \<dpiAware>True/PM\</dpiAware> | The DPI of the primary display at the time the Windows session was started (when the user first logged in to Windows). To obtain the DPI of the display that the application is located on, use [GetWindowDpi()](https://msdn.microsoft.com/en-us/library/windows/desktop/mt748624.aspx) or [GetDpiForMonitor()](https://msdn.microsoft.com/en-us/library/windows/desktop/dn280510.aspx) |


For more information about this manifest setting, see [SetProcessDPIAware function](http://go.microsoft.com/fwlink/p/?linkid=331146).

## <span id="scalingmode"></span><span id="SCALINGMODE"></span>Scaling mode


The **Control Panel\\ Appearance and Personalization\\Display** user interface (UI) includes a checkbox: **Let me choose one scaling level for all my displays**, which controls whether the system applies a single scale factor to all displays (as in Windows 8 and earlier versions of Windows), or different scale factors that take into account the pixel density of each display (the Windows 8.1 default). This checkbox configures the **HKCU\\Control Panel\\Desktop\\Win8DpiScaling** registry key in Windows 8.1.

**Table 3 HKCU\\Control Panel\\Desktop\\Win8DpiScaling Values**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Key value</th>
<th align="left">Meaning</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>0</p></td>
<td align="left"><p>Different scale factors for each display: Windows 8.1 default.Content that is moved from one display to another will be the right size, but can be bitmap-scaled.</p></td>
</tr>
<tr class="even">
<td align="left"><p>1</p></td>
<td align="left"><p>Same scale factor is applied to all displays: Windows 8 and earlier Windows versions behavior. Content that is moved from one display to another might be the wrong size.</p></td>
</tr>
</tbody>
</table>

 

## <span id="override"></span><span id="OVERRIDE"></span>Scaling override in Windows 8.1 scaling mode


When the **Let me choose one scaling level for all my displays** checkbox is cleared and the system is running in the Windows 8.1 scaling mode, the user is provided with a slider that lets them override the current scale factors, from Smaller, to Medium, to Larger. This setting is configured in the **HKCU\\Control Panel\\Desktop\\DesktopDPIOverride** registry key.

**Table 4 HKCU\\Control Panel\\Desktop\\DesktopDPIOverride Values**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Key value</th>
<th align="left">Meaning</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>&lt;0</p></td>
<td align="left"><p>Reduce each display scale factor from the default by this value (for example, if the default was 150% scaling, -1 corresponds to 125%, -2 to 100%).</p></td>
</tr>
<tr class="even">
<td align="left"><p>0</p></td>
<td align="left"><p>Use the default value for each display.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>0&gt;</p></td>
<td align="left"><p>Increase each display factor by this value (using the previous example, +1 corresponds to 200% scaling).</p></td>
</tr>
</tbody>
</table>

 

All display scale factors in this mode are constrained to be one of these four values: 100%, 125%, 150%, 200%. In addition, after scaling is applied, applications expect to have at least 720 effective lines of resolution (that is, the physical vertical resolution of the display divided by the scale factor); this can further limit the range of allowed display scale factors. *Table 5 Display Values* shows which values are allowed for different sized displays:

**Table 5 Display Values**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Vertical lines</th>
<th align="left">Supported scale factors</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>&lt;900</p></td>
<td align="left"><p>100%</p></td>
</tr>
<tr class="even">
<td align="left"><p>&gt;= 900 and &lt;1080</p></td>
<td align="left"><p>100%, 125%</p></td>
</tr>
<tr class="odd">
<td align="left"><p>&gt;=1080 and &lt;1440</p></td>
<td align="left"><p>100%, 125%, 150%</p></td>
</tr>
<tr class="even">
<td align="left"><p>&gt;=1440</p></td>
<td align="left"><p>100%, 125%, 150%, 200%</p></td>
</tr>
</tbody>
</table>

 

## <span id="system"></span><span id="SYSTEM"></span>System-wide scale factor in Windows 8 scaling mode


When the **Let me choose one scaling level for all my displays** checkbox is checked, the user can specify a scale factor that applies to all displays, regardless of each display’s pixel density. By using the custom setting, the user can select values other than 100%, 125%, 150%, 200%, although they are limited to the range (100%-500%). This setting is configured in the **HKCU\\ControlPanel\\Desktop\\LogPixels** registry key.

**Table 6 HKCU\\ControlPanel\\Desktop\\LogPixels Values**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Key value</th>
<th align="left">Meaning</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>96</p></td>
<td align="left"><p>100% scaling on every display</p></td>
</tr>
<tr class="even">
<td align="left"><p>120</p></td>
<td align="left"><p>125% scaling on every display</p></td>
</tr>
<tr class="odd">
<td align="left"><p>144</p></td>
<td align="left"><p>150% scaling on every display</p></td>
</tr>
<tr class="even">
<td align="left"><p>192</p></td>
<td align="left"><p>200% scaling on every display</p></td>
</tr>
<tr class="odd">
<td align="left"><p>&lt;other&gt;</p></td>
<td align="left"><p>&lt;other&gt;*100/96 scaling on every display</p></td>
</tr>
</tbody>
</table>

 
## <span id="related_topics"></span>Related topics

[Documentation for developing High DPI applications](https://msdn.microsoft.com/library/windows/desktop/dd464646.aspx)

[High DPI Support for IT Professionals](high-dpi-support-for-it-professionals.md)

 

 






