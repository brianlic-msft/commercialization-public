---
title: FirstRunTask
description: FirstRunTask
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 64c0161f-7faa-4702-8965-bfcf5dfe1b76
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FirstRunTask


The `FirstRunTask` setting specifies the background task that is active, or live, by default for a tile when a user signs in to Windows for the first time.

The background task must register the user with Windows Notification Service at first sign-in, and must send notifications to the app’s live tile.

If the region of the current user account is among those in the Start Tile regional layouts, you can use this setting. For more information, see [RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md).

## Values


To make a tile live, do one of the following:

-   If your background task is in JavaScript, specify the .js file that implements the IBackgroundTask interface.

-   If your background task is in XAML or C++, specify the class ID for the application.

## Valid Configuration Passes


specialize

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [StartTiles](microsoft-windows-shell-setup-starttiles.md) | [RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md) | [RegionalOverride](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride.md) | [SquareTiles](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles.md) | [SquareOrDesktopTile4](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles-squareordesktoptile4.md) | **FirstRunTask**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to use the `<SquareTiles>` component.

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

[RegionalOverrides](microsoft-windows-shell-setup-starttiles-regionaloverrides.md)

[SquareTiles](microsoft-windows-shell-setup-starttiles-regionaloverrides-regionaloverride-squaretiles.md)

[SquareTiles](microsoft-windows-shell-setup-starttiles-squaretiles.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FirstRunTask%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





