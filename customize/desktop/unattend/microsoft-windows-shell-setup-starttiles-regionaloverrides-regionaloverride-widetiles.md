---
title: WideTiles
description: WideTiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 138569d1-2d0b-4259-af72-e862d153c4a9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WideTiles


`WideTiles` defines the default Windows Store apps to appear as wide tiles on the **Start** screen.

To use this setting you must include the `AppId`. The `AppId` is the `AppUserModelID` found in the application's AUMIDs.txt file, which is located in the app package downloaded from the OEM channel partner portal of the Windows Store. You can also include the `FirstRunTask` setting to set a background task to run for each app tile on the **Start** screen that you want to be active, or live, by default.

If you skip a setting, Windows will rearrange the flow of your app tiles around the position of that setting on the **Start** screen. The flow rearrangement is based on columns and is designed to eliminate gaps. This position may vary based on the screen size, resolution, and DPI. For more information about these settings, see the associated [StartTiles](microsoft-windows-shell-setup-starttiles.md) settings topics.

If the region of the current user account is among those in the Start Tile regional layouts, you can use this setting. For more information, see [RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[WideTile1](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-widetiles-widetile1.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position WideTile1.</p></td>
</tr>
<tr class="even">
<td><p>[WideTile2](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-widetiles-widetile2.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position WideTile2.</p></td>
</tr>
<tr class="odd">
<td><p>[WideTile3](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-widetiles-widetile3.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position WideTile3.</p></td>
</tr>
<tr class="even">
<td><p>[WideTile4](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-widetiles-widetile4.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position WideTile4.</p></td>
</tr>
<tr class="odd">
<td><p>[WideTile5](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-widetiles-widetile5.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position WideTile5.</p></td>
</tr>
<tr class="even">
<td><p>[WideTile6](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-widetiles-widetile6.md)</p></td>
<td><p>Specifies the application that appears on the <strong>Start</strong> menu, in position WideTile6.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [StartTiles](microsoft-windows-shell-setup-starttiles.md) | **WideTiles**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to use the `<WideTiles>` component and its settings.

``` syntax
     <WideTiles>
          <WideTile1>
               <AppId>12345ChannelFabrikam.channel-ABC_defghij6789!App</AppId>
               <FirstRunTask>backgroundtask.js</FirstRunTask>
          </WideTile1>
          <WideTile2>
               <AppId>34567ChannelFabrikam.channel-DEF_012ghijk345!App</AppId>
               <FirstRunTask>Fabrikam.FirstRunTask</FirstRunTask>
          </WideTile2>
          <WideTile3>
               <AppId>56789ChannelFabrikam.channel-GHI_67890jklmno!App</AppId>
          </WideTile3>
     </WideTiles>
```

## Related topics


[StartTiles](microsoft-windows-shell-setup-starttiles.md)

[SquareTiles](microsoft-windows-shell-setup-starttiles-squaretiles.md)

StartTiles
[RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20WideTiles%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





