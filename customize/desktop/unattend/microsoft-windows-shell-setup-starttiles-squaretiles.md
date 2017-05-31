---
title: SquareTiles
description: SquareTiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3e01c0f5-3dc4-4504-86aa-5455c971cb18
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SquareTiles


`SquareTiles` defines the default Windows Store apps to appear as square tiles on the **Start** screen. The two available `SquareTiles` types are:

-   `SquareOrDesktopTile`. You can include up to 6 of these on your **Start** screen, formatted as `SquareOrDesktopTile` through `DesktopOrSquareTile6`.

-   `SquareTile`. You can include up to 12 of these on your **Start** screen, formatted as `SquareTile1` through `SquareTile12`.

To use either of these tile types with your Windows Store apps, you must include the `AppId`. The `AppId` is the `AppUserModelID` found in the application's AUMIDs.txt file, which is located in the app package downloaded from the OEM channel partner portal of the Windows Store. You can also include a `FirstRunTask` setting to specify the background task that should be active, or live, by default for the tile.

If you skip a setting, Windows appears rearrange the flow of your app tiles around the position of that setting on the **Start** screen. The flow rearrangement is based on columns and is designed to eliminate gaps. This position may vary based on the screen size, resolution, and DPI. For more information about these settings, see the associated [StartTiles](microsoft-windows-shell-setup-starttiles.md) settings topics.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[SquareOrDesktopTile1](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile1.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareOrDesktopTile1.</p></td>
</tr>
<tr class="even">
<td><p>[SquareOrDesktopTile2](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile2.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareOrDesktopTile2.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareOrDesktopTile3](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile3.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareOrDesktopTile3.</p></td>
</tr>
<tr class="even">
<td><p>[SquareOrDesktopTile4](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile4.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareOrDesktopTile4.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareOrDesktopTile5](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile5.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareOrDesktopTile5.</p></td>
</tr>
<tr class="even">
<td><p>[SquareOrDesktopTile6](microsoft-windows-shell-setup-starttiles-squaretiles-squareordesktoptile6.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareOrDesktopTile6.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTile1](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile1.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile1.</p></td>
</tr>
<tr class="even">
<td><p>[SquareTile2](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile2.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile2.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTile3](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile3.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile3.</p></td>
</tr>
<tr class="even">
<td><p>[SquareTile4](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile4.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile4.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTile5](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile5.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile5.</p></td>
</tr>
<tr class="even">
<td><p>[SquareTile6](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile6.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile6.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTile7](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile7.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile7.</p></td>
</tr>
<tr class="even">
<td><p>[SquareTile8](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile8.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile8.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTile9](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile9.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile9.</p></td>
</tr>
<tr class="even">
<td><p>[SquareTile10](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile10.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile10.</p></td>
</tr>
<tr class="odd">
<td><p>[SquareTile11](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile11.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile11.</p></td>
</tr>
<tr class="even">
<td><p>[SquareTile12](microsoft-windows-shell-setup-starttiles-squaretiles-squaretile12.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position SquareTile12.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [StartTiles](microsoft-windows-shell-setup-starttiles.md) | **SquareTiles**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to use the `<SquareTiles>` component and its settings.

``` syntax
<SquareTiles>
          <SquareOrDesktopTile1>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile1.lnk</AppIdOrPath>
               <FirstRunTask>backgroundtask.js</FirstRunTask>
          </SquareOrDesktopTile1>
          <SquareOrDesktopTile2>
               <AppIdOrPath>67890ChannelFabrikam.channel-JKL_mnop1234789!App</AppIdOrPath>
               <FirstRunTask>Fabrikam.FirstRunTask</FirstRunTask>
          </SquareOrDesktopTile2>
          <SquareOrDesktopTile3>
               <AppIdOrPath>C:\programdata\microsoft\windows\start menu\programs\desktoptile3.lnk</AppIdOrPath>
          </SquareOrDesktopTile3>
          <SquareTile1>
               <AppId>12345ChannelFabrikam.channel-ABC_defghij6789!App</AppId>
               <FirstRunTask>backgroundtask.js</FirstRunTask>
          </SquareTile1>
          <SquareTile2>
               <AppId>34567ChannelFabrikam.channel-DEF_012ghijk345!App</AppId>
               <FirstRunTask>Fabrikam.FirstRunTask</FirstRunTask>
          </SquareTile2>
          <SquareTile3>
               <AppId>56789ChannelFabrikam.channel-GHI_67890jklmno!App</AppId>
          </SquareTile3>
     </SquareTiles> 
```

## Related topics


[StartTiles](microsoft-windows-shell-setup-starttiles.md)

[WideTiles](microsoft-windows-shell-setup-starttiles-widetiles.md)

[SquareTiles](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SquareTiles%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





