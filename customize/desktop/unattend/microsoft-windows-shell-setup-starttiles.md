---
title: StartTiles
description: StartTiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a4ffe824-7fd9-4597-8a9e-b7fe8d8a08be
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# StartTiles


The StartTiles settings specify the position of up to 24 app tiles on the Start screen, and one app badge on the lock screen.

The app tiles that you position on the Start screen can be wide tiles or square tiles. The number of each type of tile is preset and the distribution of each type of tile on the Start screen is determined by template layouts for the Start screen. The number of rows of tiles on a display depends on the scaled height of the tiles, the vertical resolution of the display, and the pixel density.

For example, an 11.6" display at a resolution of 1366 x 768 is scaled at 1.0x. The standard tile height is 160 pixels, including padding, and the fixed height taken for top and bottom margins is 215 pixels. This combination allows for 3 rows of tiles. The number of rows of tiles on a display depends on the scaled height of the tiles, the vertical resolution of the display, and the pixel density. For example, an 11.6" display at a resolution of 1366 x 768 is scaled at 1.0x. The standard tile height is 160 pixels, including padding, and the fixed height taken for top and bottom margins is 215 pixels. This combination allows for 3 rows of tiles.

The maximum number of rows on any display is 6. For large displays, a user can override the maximum.

The following tables show the typical number of rows of tiles on different combinations of display sizes and resolutions.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>10.1</p></td>
<td><p>1366 x 768</p></td>
<td><p>155</p></td>
<td><p>1</p></td>
<td><p>3</p></td>
</tr>
<tr class="odd">
<td><p>10.1</p></td>
<td><p>1600 x 900</p></td>
<td><p>182</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>10.1</p></td>
<td><p>1920 x 1080</p></td>
<td><p>218</p></td>
<td><p>1.4</p></td>
<td><p>3</p></td>
</tr>
<tr class="odd">
<td><p>10.1</p></td>
<td><p>1920 x 1200</p></td>
<td><p>224</p></td>
<td><p>1.4</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>10.1</p></td>
<td><p>2560 x 1440</p></td>
<td><p>291</p></td>
<td><p>1.8</p></td>
<td><p>3</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>11.6</p></td>
<td><p>1366 x 768</p></td>
<td><p>135</p></td>
<td><p>1</p></td>
<td><p>3</p></td>
</tr>
<tr class="odd">
<td><p>11.6</p></td>
<td><p>1600 x 900</p></td>
<td><p>158</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>11.6</p></td>
<td><p>1920 x 1080</p></td>
<td><p>190</p></td>
<td><p>1.4</p></td>
<td><p>3</p></td>
</tr>
<tr class="odd">
<td><p>11.6</p></td>
<td><p>1920 x 1200</p></td>
<td><p>195</p></td>
<td><p>1.4</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>11.6</p></td>
<td><p>2560 x 1440</p></td>
<td><p>253</p></td>
<td><p>1.8</p></td>
<td><p>3</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>12.5</p></td>
<td><p>1366 x 768</p></td>
<td><p>125</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>12.5</p></td>
<td><p>1600 x 900</p></td>
<td><p>147</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>12.5</p></td>
<td><p>1920 x 1080</p></td>
<td><p>176</p></td>
<td><p>1.4</p></td>
<td><p>3</p></td>
</tr>
<tr class="odd">
<td><p>12.5</p></td>
<td><p>1920 x 1200</p></td>
<td><p>181</p></td>
<td><p>1.4</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>12.5</p></td>
<td><p>2560 x 1440</p></td>
<td><p>235</p></td>
<td><p>1.4</p></td>
<td><p>5</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>13.3</p></td>
<td><p>1366 x 768</p></td>
<td><p>117</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>13.3</p></td>
<td><p>1600 x 900</p></td>
<td><p>138</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>13.3</p></td>
<td><p>1920 x 1080</p></td>
<td><p>166</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="odd">
<td><p>13.3</p></td>
<td><p>1920 x 1200</p></td>
<td><p>170</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>13.3</p></td>
<td><p>2560 x 1440</p></td>
<td><p>221</p></td>
<td><p>1.4</p></td>
<td><p>5</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>13.3</p></td>
<td><p>1366 x 768</p></td>
<td><p>117</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>13.3</p></td>
<td><p>1600 x 900</p></td>
<td><p>138</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>13.3</p></td>
<td><p>1920 x 1080</p></td>
<td><p>166</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="odd">
<td><p>13.3</p></td>
<td><p>1920 x 1200</p></td>
<td><p>170</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>13.3</p></td>
<td><p>2560 x 1440</p></td>
<td><p>221</p></td>
<td><p>1.4</p></td>
<td><p>5</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>14</p></td>
<td><p>1366 x 768</p></td>
<td><p>112</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>14</p></td>
<td><p>1600 x 900</p></td>
<td><p>131</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="even">
<td><p>14</p></td>
<td><p>1920 x 1080</p></td>
<td><p>157</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="odd">
<td><p>14</p></td>
<td><p>1920 x 1200</p></td>
<td><p>162</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>14</p></td>
<td><p>2560 x 1440</p></td>
<td><p>210</p></td>
<td><p>1.4</p></td>
<td><p>5</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>15.6</p></td>
<td><p>1366 x 768</p></td>
<td><p>100</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>15.6</p></td>
<td><p>1600 x 900</p></td>
<td><p>118</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="even">
<td><p>15.6</p></td>
<td><p>1920 x 1080</p></td>
<td><p>141</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="odd">
<td><p>15.6</p></td>
<td><p>1920 x 1200</p></td>
<td><p>145</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>15.6</p></td>
<td><p>2560 x 1440</p></td>
<td><p>188</p></td>
<td><p>1.4</p></td>
<td><p>5</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>17</p></td>
<td><p>1366 x 768</p></td>
<td><p>100</p></td>
<td><p>1</p></td>
<td><p>4</p></td>
</tr>
<tr class="odd">
<td><p>17</p></td>
<td><p>1600 x 900</p></td>
<td><p>118</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="even">
<td><p>17</p></td>
<td><p>1920 x 1080</p></td>
<td><p>141</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="odd">
<td><p>17</p></td>
<td><p>1920 x 1200</p></td>
<td><p>145</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>17</p></td>
<td><p>2560 x 1440</p></td>
<td><p>188</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>20</p></td>
<td><p>1600 x 900</p></td>
<td><p>92</p></td>
<td><p>1</p></td>
<td><p>5</p></td>
</tr>
<tr class="odd">
<td><p>20</p></td>
<td><p>1920 x 1080</p></td>
<td><p>110</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>20</p></td>
<td><p>1920 x 1200</p></td>
<td><p>113</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="odd">
<td><p>20</p></td>
<td><p>2560 x 1440</p></td>
<td><p>147</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Size</strong></p></td>
<td><p><strong>Resolution</strong></p></td>
<td><p><strong>DPI</strong></p></td>
<td><p><strong>Scaling plateau</strong></p></td>
<td><p><strong>Rows of tiles on Start</strong></p></td>
</tr>
<tr class="even">
<td><p>23</p></td>
<td><p>1920 x 1080</p></td>
<td><p>96</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="odd">
<td><p>23</p></td>
<td><p>1920 x 1200</p></td>
<td><p>98</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
<tr class="even">
<td><p>23</p></td>
<td><p>2560 x 1440</p></td>
<td><p>128</p></td>
<td><p>1</p></td>
<td><p>6</p></td>
</tr>
</tbody>
</table>

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[LockScreen](microsoft-windows-shell-setup-starttiles-lockscreen.md)</p></td>
<td><p>Specifies an app whose monochrome icon appears on the <strong>Lock</strong> screen.</p></td>
</tr>
<tr class="even">
<td><p>[RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md)</p></td>
<td><p>Specifies sets of apps that appear on the Start screen for different regions.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTiles](microsoft-windows-shell-setup-starttiles-squaretiles.md)</p></td>
<td><p>Specifies the default Windows Store apps to appear as square tiles on the Start screen.</p></td>
</tr>
<tr class="even">
<td><p>[WideTiles](microsoft-windows-shell-setup-starttiles-widetiles.md)</p></td>
<td><p>Specifies the default Windows Store apps to appear as wide tiles on the Start screen.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **StartTiles**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows to how to use the &lt;StartTiles&gt; component and its settings.

``` syntax
<StartTiles>
     <LockScreen>    
          <Badge>
               <AppId>BadgeAppId</AppId>
          </Badge>
     </LockScreen>
     <WideTiles>
          <WideTile1>
               <AppId>AppIdwide1</AppId>
               <FirstRunTask>BackgroundTaskwide1</FirstRunTask>
          </WideTile1>
          <WideTile2>
               <AppId>AppIdwide2</AppId>
               <FirstRunTask>BackgroundTaskwide2</FirstRunTask>
          </WideTile2>
          <WideTile3>
               <AppId>AppIdwide3</AppId>
               <FirstRunTask>BackgroundTaskwide3</FirstRunTask>
          </WideTile3>
          <WideTile4>
               <AppId>AppIdwide4</AppId>
               <FirstRunTask>BackgroundTaskwide4</FirstRunTask>
          </WideTile4>
          <WideTile5>
               <AppId>AppIdwide5</AppId>
               <FirstRunTask>BackgroundTaskwide5</FirstRunTask>
          </WideTile5>
          <WideTile6>
               <AppId>AppIdwide6</AppId>
               <FirstRunTask>BackgroundTaskwide6</FirstRunTask>
          </WideTile6>
     </WideTiles>
     <SquareTiles>
          <SquareTile1>
               <AppId>AppIdSquare1</AppId>
               <FirstRunTask>BackgroundTaskSquare1</FirstRunTask>
          </SquareTile1>
          <SquareTile2>
               <AppId>AppIdSquare2</AppId>
               <FirstRunTask>backgroundTaskSquare2</FirstRunTask>
          </SquareTile2>
          <SquareTile3>
               <AppId>AppIdSquare3</AppId>
               <FirstRunTask>backgroundTaskSquare3</FirstRunTask>
          </SquareTile3>
          <SquareTile4>
               <AppId>AppIdSquare4</AppId>
               <FirstRunTask>backgroundTaskSquare4</FirstRunTask>
          </SquareTile4>
          <SquareTile5>
               <AppId>AppIdSquare5</AppId>
               <FirstRunTask>backgroundTaskSquare5</FirstRunTask>
          </SquareTile5>
          <SquareTile6>
               <AppId>AppIdSquare6</AppId>
               <FirstRunTask>backgroundTaskSquare6</FirstRunTask>
          </SquareTile6>
          <SquareTile7>
               <AppId>AppIdSquare7</AppId>
               <FirstRunTask>backgroundTaskSquare7</FirstRunTask>
          </SquareTile7>
          <SquareTile8>
               <AppId>AppIdSquare8</AppId>
               <FirstRunTask>backgroundTaskSquare8</FirstRunTask>
          </SquareTile8>
          <SquareTile9>
               <AppId>AppIdSquare9</AppId>
               <FirstRunTask>backgroundTaskSquare9</FirstRunTask>
          </SquareTile9>
          <SquareTile10>
               <AppId>AppIdSquare10</AppId>
               <FirstRunTask>backgroundTaskSquare10</FirstRunTask>
          </SquareTile10>
          <SquareTile11>
               <AppId>AppIdSquare11</AppId>
               <FirstRunTask>backgroundTaskSquare11</FirstRunTask>
          </SquareTile11>
          <SquareTile12>
               <AppId>AppIdSquare12</AppId>
               <FirstRunTask>backgroundTaskSquare12</FirstRunTask>
          </SquareTile12>
          <SquareOrDesktopTile1>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile1.lnk</AppIdOrPath>
          </SquareOrDesktopTile1>
          <SquareOrDesktopTile2>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile2.lnk</AppIdOrPath>
          </SquareOrDesktopTile2>
          <SquareOrDesktopTile3>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile3.lnk</AppIdOrPath>
          </SquareOrDesktopTile3>
          <SquareOrDesktopTile4>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile4.lnk</AppIdOrPath>
          </SquareOrDesktopTile4>
          <SquareOrDesktopTile5>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile5.lnk</AppIdOrPath>
          </SquareOrDesktopTile5>
          <SquareOrDesktopTile6>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile6.lnk</AppIdOrPath>
          </SquareOrDesktopTile6>
     </SquareTiles>
</StartTiles>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20StartTiles%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





