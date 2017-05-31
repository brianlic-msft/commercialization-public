---
title: Adding OEM lens apps as options for the default camera
description: OEMs can add lens apps as options for the default camera.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e17fe443-5791-41cb-affd-a06e142986fc
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Adding OEM lens apps as options for the default camera


OEMs can add lens apps as options for the default camera.

OEMs can add lens apps to be shown in the **Pressing the camera button opens** screen within the camera's settings CPL. We recommend that OEMs install only up to five (5) lens apps. The lens apps can be preloaded or installed from the Windows Store. When the lens apps are installed on the phone, the apps become available for the user to set as the default camera.

For more information about writing lens apps, see the Windows SDK documentation.

**Limitations and restrictions:**

-   Partners must not remove or modify any app IDs that Microsoft has configured in the kit. The app IDs added by Microsoft do not count against the number of lens app IDs that partners can add.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="OEMLensApps"  
                         Description="Use to add lens apps to be shown in the Settings > applications > photos+camera >
                                      Pressing the camera button opens screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

       <!-- Preload an OEM lens app -->
       <Applications>
          <!-- For each app, specify the source (.xap/.appx), license, and ProvXML files. -->
          <Application Source=""
                       License=""
                       ProvXML="" />
       </Applications>

       <!-- Replace $(LensAppGuid) with the app ID of the lens app you want to show in the camera CPL -->
       <Settings Path="Photos/LensApps/$(LensAppGuid)">       
          <!-- Set the value to the friendly name of the OEM lens app -->
          <Setting Name="Title" Value="" />  
       </Settings>  

       <!-- You can add up to 5 OEM lens apps to show in the camera CPL
       <Settings Path="Photos/LensApps/$(LensAppGuid)">       
          <Setting Name="Title" Value="" />  
       </Settings> 

       <Settings Path="Photos/LensApps/$(LensAppGuid)">       
          <Setting Name="Title" Value="" />  
       </Settings> 

       <Settings Path="Photos/LensApps/$(LensAppGuid)">       
          <Setting Name="Title" Value="" />  
       </Settings> 

       <Settings Path="Photos/LensApps/$(LensAppGuid)">       
          <Setting Name="Title" Value="" />  
       </Settings> 
       -->

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  If you are preloading a lens app, add an **Applications** parent element and add an **Application** child element to correspond to each lens app that you are preloading. For each **Application**, specify the `Source` (.xap/.appx), `License`, and `ProvXML` files that correspond to the lens app you are preloading.

4.  To specify the OEM lens app to show in the camera CPL:

    1.  Replace *$(LensAppGuid)* with the app ID of the lens app you want to show in the camera CPL.

    2.  Replace *Title* with the friendly name of the lens app. For example, *Contoso Fish Eye Lens*.

    3.  Specify up to 5 lens apps by creating a registry entry for each as shown in the preceding example. For example, to configure two lens apps to show in the camera CPL, you need to add the following registry entries:

        ``` syntax
           <Settings Path="Photos/LensApps/{00000000-0000-0000-0000-000000000000}">       
              <Setting Name="Title" Value="Contoso Fish Eye Lens" />  
           </Settings> 

           <Settings Path="Photos/LensApps/{00000000-0000-0000-1000-000000000000}">       
              <Setting Name="Title" Value="Contoso Sepia Lens" />  
           </Settings> 
        ```

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Install the OEM lens app(s).

3.  Go to the **Settings** &gt; **applications** &gt; **photos+camera** screen and verify that the lens apps that you have specified show up as one of the choices under **Pressing the camera button opens**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Adding%20OEM%20lens%20apps%20as%20options%20for%20the%20default%20camera%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




