---
title: Preinstallable apps for mobile devices
description: Learn how to add an app to a mobile image that will be available to customers at first boot.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5d855c2c-2e2d-4fb3-b119-3998b1b6b934
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Preinstallable apps for mobile devices


## <a href="" id="to-add-a-preinstalled-app-to-a-mobile--image"></a>To add a preinstalled app to a mobile image


The process for creating a preinstallable app is similar to that of a standard app. In the Windows 10 Dev Center, a developer submits an app that you want to preinstall on your Windows 10 Mobile image. Once the app is submitted, you can request a preinstallation package, download it, and add it to the image, as described in this topic.

To add a preinstallable app, you will need to perform the following actions:

-   Request a preinstallation package
-   Create a .provxml for the preinstallable app
-   Add the app to the image with Customization answer file
-   Build the image

For more information about customization answer files, see [Customization answer file](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/mobile/mcsf/customization-answer-file). For more information about building with Customization answer files, see [Building a mobile image using ImgGen.cmd](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/building-a-phone-image-using-imggencmd).

## Request a preinstallation package


Developers who have added an app to the Dev Center can request a preinstallation package for it. They can then give the preinstallation package directly to the OEM they are working with. If you are the OEM adding this application to your OS image, you would ask the developer of the application to download the application package and then give you the downloaded zip file. You cannot access their developer account directly. Once you have the preinstall package, you can continue with the rest of the steps. For more information on how a developer generates preinstall packages for an OEM, see [Generate preinstall packages for OEMs](http://go.microsoft.com/fwlink/?LinkId=624851).

## Create a .provxml file for a preinstallable app


Adding a preinstalled app to an Windows 10 Mobile OS image requires a .provxml configuration file that specifies the installation parameters and the Windows 10 Store catalog identifiers. Specifically, it should specify the path to the .appx file, the path to the license file, and the Store catalog IDs. This information is used when the app connects to the Store service to check for updates. To minimize the chance of error, the developer portal provides the appropriate XML for your app. The following is an example of what the .provxml might look like.

```
<?xml version="1.0" encoding="UTF-8" ?>
<wap-provisioningdoc>
   <characteristic type="AppInstall">
      <characteristic type="AppXPackage">          
         <parm name="ProductID" value="{09f2d20a-7076-4970-80ac-1bc24c171d2e}"/>   
         <parm name="AppXPath" value="c:\Programs\CommonFiles\Xaps\SampleApp.appx"/>    
         <parm name="LicensePath" value="c:\Programs\CommonFiles\Xaps\SampleAppLicense.xml"/>    
         <parm name="InstanceID" value="{03e9a435-3000-11db-89ca-0019b92FFFFF}"/> 
         <parm name="OfferID" value="{03e9a435-3000-11db-89ca-0019b92FFFFF}"/>
         <parm name="PayloadID" value="{03e9a435-3000-11db-89ca-0019b92FFFFF}"/>   
         <parm name="UninstallDisabled" value="false"/>
         <parm name="FullyPreInstall" value="false"/>
         <parm name="ForceUpdate" value="false"/>
      </characteristic>    
   </characteristic>
</wap-provisioningdoc>
```

**Note**  provxml files for preinstalled apps must follow a prescribed naming convention. You must use MPAP\_name\_index.provxml, where name and index can be any strings. Typically, name is the name of the update package that contains the preinstalled app, and index is a string that differentiates provxml files that have the same name. Often, index is represented as a number, such as 01.

 

### provxml flags

These are the flags you can use in your provxml.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td>flag</td>
<td>description</td>
</tr>
<tr class="even">
<td>UninstallDisabled</td>
<td>This flag controls whether a preinstalled app can be uninstalled by a user. When set to FALSE(default), a user is able to uninstall the preinstalled app. When set to TRUE, a user is not able to uninstall the app. This flag is only settable via provxml and cannot be overridden through a Store update. Only a device update with an updated provxml file can change this value. Ideally, to maintain the user experience, this flag should only be set to TRUE for apps that are critical to phone functionality.</td>
</tr>
<tr class="odd">
<td>FullyPreinstall</td>
<td>This flag controls whether the app is MDIL bound during first boot/update or whether it is delayed until after those operations complete. Delaying MDIL binding, which is the default behavior for apps that are not pre-pinned to Start, allows the user to get back to their phone as quickly as possible. When binding is deferred till after first boot/update completes the app icon will display greyed out with a status of “installing” and cannot be run until the deferred bind completes. The amount of time it takes to complete all deferred bindings is dependent on the number of deferred preloaded apps and the user’s activity. The following table illustrates the behavior.
<table>
<tbody>
<tr class="odd">
<td>Fully preinstall</td>
<td>behavior</td>
</tr>
<tr class="even">
<td>true</td>
<td>MDIL binding occurs before first boot or update completes.</td>
</tr>
<tr class="odd">
<td>false</td>
<td>If the app is pre-pinned to Start, MDIL binding is performed before first boot or update completes. If the app is not pre-pinned to Start, MDIL binding is deferred until after first boot or update completes</td>
</tr>
</tbody>
</table>
<p> </p>
Generally, this value should be left as the default (FALSE) unless the app must be available to run immediately after first boot or an OS update. Some example situations where this flag should be set to TRUE are the following:
<ul>
<li>OEM extension apps</li>
<li>Phone dialer-installed apps</li>
<li>OEM service agents</li>
<li>Critical system settings apps</li>
</ul></td>
</tr>
<tr class="even">
<td>ForceUpdate</td>
<td>This flag allows an app in an OS update image to attempt to overwrite an existing version of the app already installed on the phone prior to update to Windows 10 Mobile. The default value for this flag is FALSE. Be aware that because the app update is forced, setting this flag to TRUE might result in a downgrade in functionality if the already-installed app was developed for an earlier version of the OS. In general, this flag should only be used when the Windows 10 Mobile version of the app must be on the phone immediately after update, even if it means downgrading the version of the app already installed.</td>
</tr>
</tbody>
</table>

 

## Add the app to the image


Preinstalling apps are added to the OS image using a customization answer file. The process of creating a customization answer file that includes an app requires adding an additional Application element with the appropriate defining attributes. The following code sample illustrates how an app would be added to a customization answer file for preinstalling.

```
    <Applications>
      <Application License="$(CAFE_OUTPUT_DIR)\content\App_MobileTV_7e7cc86e_e1c0_476a_ac88_db3c9ffffabb\MobileTV_License.xml" ProvXML="$(CAFE_OUTPUT_DIR)\content\App_MobileTV_7e7cc86e_e1c0_476a_ac88_db3c9ffffabb\MPAP_MobileTV_01.provxml" Source="$(CAFE_OUTPUT_DIR)\content\App_MobileTV_7e7cc86e_e1c0_476a_ac88_db3c9ffffabb\MobileTV.xap"/>
      <Application License="$(CAFE_OUTPUT_DIR)\content\App_AudioSettings_373cb76e_7f6c_45aa_8633_b00e85c73261\audio_License.xml" ProvXML="$(CAFE_OUTPUT_DIR)\content\App_AudioSettings_373cb76e_7f6c_45aa_8633_b00e85c73261\MPAP_audio_01.provxml" Source="$(CAFE_OUTPUT_DIR)\content\App_AudioSettings_373cb76e_7f6c_45aa_8633_b00e85c73261\audio.appx"/>
                 <Application License="$(CAFE_OUTPUT_DIR)\content\App_MicrosoftHealthApp_0168b504_ca18_46b8_b60a_0f6fdc271c81\MicrosoftHealthApp_License.xml" ProvXML="$(CAFE_OUTPUT_DIR)\content\App_MicrosoftHealthApp_0168b504_ca18_46b8_b60a_0f6fdc271c81\MPAP_MicrosoftHealthApp_01.provxml" Source="$(CAFE_OUTPUT_DIR)\content\App_MicrosoftHealthApp_0168b504_ca18_46b8_b60a_0f6fdc271c81\MicrosoftHealthApp.appxbundle"/>
    </Applications>
```

**Note**  The provxml file must be placed in the "$(runtime.commonfiles)\\Provisioning\\OEM" directory. The license file and app package (.xap or .appx) must be placed in the "$(runtime.commonfiles)\\xaps" directory

 

Now that you have a customization answer file, you can build the image either from the Windows Imaging and Configuration Designer (ICD) command line or the graphical user interface.

## Build the image

Follow the steps in the [Build a customized mobile image using imggen](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/build-a-customized-mobile-image-using-imggen)


 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_preinstall\p_preinstall%5D:%20Preinstallable%20apps%20for%20mobile%20devices%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





