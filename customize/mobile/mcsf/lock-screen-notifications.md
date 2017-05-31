---
title: Lock screen notifications
description: OEMs can preload apps that support lock screen notifications.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 09fe0edd-60cf-4bb1-a0d0-b0393574fa69
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lock screen notifications


OEMs can preload apps that support lock screen notifications. Notifications alert the user to new content or updates in that app. They can take the form of a number (to indicate the number of changes) or a text preview.

OEMs can also preset one notification in the fifth slot on the lock screen. This notification displays an icon for a single app plus the number of notifications for that app.

**Limitations and restrictions:**

-   The default count notification mappings must not be changed.

-   The default text notification mapping must not be changed.

-   Notification icons provided by the app and displayed on the lock screen must be monochromatic, with a white foreground color and a transparent background color.

-   After first boot, apps can only be assigned as a lock screen notification by the user; apps must not automatically use a notification slot.

-   Users can delete apps that support notifications, and they can also select alternate notification mappings.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
For more information about building an app that supports notifications on the lock screen, see the Windows developer documentation.

**To preload and specify the app that supports lock screen notifications:**

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="LockScreenNotifications"  
                         Description="Use to preload an app that supports lock screen notifications and set the app to use the 5th slot on the lock screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Applications>
          <Application Source=""
                       License=""
                       ProvXML="" />
        </Applications>

        <Settings Path="LockScreen">  
          <Setting Name="LockNotificationAppID" Value="" /> 
          <Setting Name="LockNotificationAppTile" Value="default" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Preload the app that supports lock screen notifications by specifying these settings:

    -   Set `Source` to the path and name of the app's .xap file.

    -   Set `License` to the path and name of the app's license file.

    -   Set `ProvXML` to the path and name of the app's PROVXML file.

4.  Set the `LockNotificationAppID` setting `Value` to correspond to your app' s app ID or GUID.

5.  Replace the `LockNotificationAppTile` setting `Value` to match the **TokenID** value that was in your app manifest file. If you do not have a **TokenID** specified, set the `Value` to *default*.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash an image that contains this customization to a device.

2.  Go to **Settings** &gt; **Lock screen**.

3.  Scroll down and verify that your lock screen notification app now shows as the default app in fifth slot under **Choose apps to show quick status**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Lock%20screen%20notifications%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




