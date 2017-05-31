---
title: Configuring OEM lens apps to launch above the lock screen
description: OEM can configure lens apps to launch above the lock screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 80c52bdf-dce2-4f93-b11a-f0f3a5422ead
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configuring OEM lens apps to launch above the lock screen


OEM can configure lens apps to launch above the lock screen.

For lens apps that OEMs have configured to be user selectable default camera app, OEMs can add functionality to launch these lens apps above the lock screen when the user presses the camera button.

Microsoft recommends that OEMs configure only up to five (5) lens apps capable of running above the lock screen. The lens apps can be preloaded by OEMs or installed by users from the Windows Store.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
The steps for configuring an OEM lens app to run above the lock screen are very similar to [Adding OEM lens apps as options for the default camera](adding-oem-lens-apps-as-options-for-the-default-camera.md), but with the additional step of designating it as a lens app that can run above the lock screen.

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="OEMLensAboveLock"  
                         Description="Use to configure an OEM lens app to launch above the lock screen when the user presses the camera button."  
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

          <!-- Set this to the version of the OEM lens app version that you want to launch above the lock screen -->
          <Setting Name="MinVersionAboveLock" Value="" />  
       </Settings>  

       <!-- You can add up to 5 OEM lens apps to show in the camera CPL. For other OEM lens apps that you want to enable to run 
            above the lock screen, you must set the MinVersionAboveLock setting for each of these. -->
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  If you are preloading a lens app, add an **Applications** parent element and add an **Application** child element to correspond to each lens app that you are preloading. For each **Application**, specify the `Source` (.xap/.appx), `License`, and `ProvXML` files that correspond to the lens app you are preloading.

4.  **To specify the OEM lens app to show in the camera CPL:**

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

5.  **To designate an OEM lens app to run above the lock screen:**

    1.  Add the `MinVersionAboveLock` setting within the settings group for the OEM lens app.

    2.  Set the value of `MinVersionAboveLock` to a string that is equal to the version of the first published OEM lens app version that fully complies with the guidelines and requirements outlined in the previous section. If the lens app has an equal or higher version to the value that you set for `MinVersionAboveLock`, the lens app will launch above the lock screen when the camera button is pressed on a PIN-locked screen. Otherwise, the PIN unlock screen shows when the camera button is pressed, and if the user enters the correct password, the lens app will launch.

        OEMs may set the value for `MinVerAboveLock` to a sufficiently large version string so that you may release the phone first and later publish an updated lens app to the Windows Phone Store that fully complies with the requirements and guidelines for OEM lens apps that launch above the lock screen.

        In the following example, the Contoso Sepia Lens app has been designated as the OEM lens app to run above the lock screen.

        ``` syntax
           <Settings Path="Photos/LensApps/{00000000-0000-0000-0000-000000000000}">       
              <Setting Name="Title" Value="Contoso Fish Eye Lens" />  
           </Settings> 

           <Settings Path="Photos/LensApps/{00000000-0000-0000-1000-000000000000}">       
              <Setting Name="Title" Value="Contoso Sepia Lens" />  
              <Setting Name="MinVersionAboveLock" Value="1.0.0.0" />  
           </Settings>
        ```

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build that contains this customization to a phone.

2.  Install the OEM lens app(s).

3.  Go to the **Settings** &gt; **applications** &gt; **photos+camera** screen and verify that the lens apps that you have specified show up as one of the choices under **Pressing the camera button opens**.

    Choose a lens app that you have configured to run above the lock screen and set it as the default camera.

4.  Go to **Settings** &gt; **lock screen**, turn **Password** on, then set a password or PIN.

5.  Lock the phone.

6.  Press and hold the camera button while the phone is locked. Verify that the lens app that you chose in Step 3 is launched.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configuring%20OEM%20lens%20apps%20to%20launch%20above%20the%20lock%20screen%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




