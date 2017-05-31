---
Description: 'In this section, we''ll focus on adding the Start layout modification file, preloading an app, and configuring some customization settings using MCSF.For more detailed information about the various customizations you can do, see https://msdn.microsoft.com/library/windows/hardware/dn757433.'
ms.assetid: 507fea31-f113-4cd3-84bf-1ab14898782f
MSHAttr: 'PreferredLib:/library'
title: Configure customization settings
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure customization settings


Customizations are ways that you can modify the Windows device UI, connectivity settings, and user experience to better reflect your brand and to meet the requirements of the network and market in which the device will ship. Customizations can include adding apps, modifying the Start layout, configuring network settings using device management, changing the default values in the Settings screen, or adding new wallpapers.

Windows 10 Mobile supports two customization frameworks: MCSF and Windows provisioning. For more information about each framework, see [Customizations for mobile devices](https://msdn.microsoft.com/library/windows/hardware/mt481438).

In this section, we'll focus on adding the Start layout modification file, preloading an app, and configuring some customization settings using MCSF.

For more detailed information about the various customizations you can do, see [https://msdn.microsoft.com/library/windows/hardware/dn757433](https://msdn.microsoft.com/library/windows/hardware/dn757433).

## <span id="create_an_mcsf_customization_answer_file"></span><span id="CREATE_AN_MCSF_CUSTOMIZATION_ANSWER_FILE"></span>Create an MCSF customization answer file


You can use the MCSF [customization answer file](https://msdn.microsoft.com/library/windows/hardware/dn757452) (CAF) to specify the settings and variants that you want to configure for a custom mobile OS image. Depending on the tools that you're using to build your image, you can use the MCSF CAF as input to ImgGen.cmd or the Windows Imaging and Configuration Designer (ICD) CLI. This answer file is based on the MCSF schema so if you decide to use another schema, such as the Windows provisioning schema, you need to write a different answer file that follows that schema instead.

If you don't have a pre-existing MCSF CAF, follow this walkthrough to learn how to create a basic MCSF CAF with multivariant support. Multivariant is the generic mechanism that lets you create a single image that can work for multiple markets by dynamically configuring the language, branding, apps, and networking settings during runtime based on the supported conditions, such as mobile operator and locale. If you are building a single variant image, you may skip this walkthrough.

**To create the MCSF CAF with multivariant support**

1.  Create an XML file and add the following content.

    ```XML
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name=""  
                         Description="Use to configure settings for custom mobile image."  
                         Owner=""  
                         OwnerType="OEM"> 

      <!-- Use to set up targets and conditions for the variants -->
      <Targets>  
       <Target Id="">  
          <TargetState>  
            <Condition Name="" Value="" />  
            <Condition Name="" Value="" />  
          </TargetState>  
        </Target>  
       <Target Id="">  
          <TargetState>  
            <Condition Name="" Value="" />  
            <Condition Name="" Value="" />  
          </TargetState>  
        </Target> 
      </Targets>  
      
      <!-- Use to specify the customizations for a single variant when used without the Variant element, 
           or customizations that apply to all variants when used with the Variant element -->
      <Static>  
        <!-- Use to preload apps to install for all variants -->
        <Applications>
          <Application Source=""
                       License=""
                       ProvXML="" />
        </Applications>

        <!-- Section where you specify the settings you want to configure -->
        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings>
      </Static>

      <!-- These settings in the Variant groups will only be applied if the associated target&#39;s conditions are met. -->
      <!-- The settings shown here will only be applied for this variant -->
      <Variant Name="">  
        <!-- Only one TargetRef can be used for each variant -->
        <TargetRefs>  
          <TargetRef Id="" />  
        </TargetRefs>  

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 
      </Variant>  

      <!-- The settings shown here will only be applied for this variant -->
      <Variant Name="">  
        <!-- Only one TargetRef can be used for each variant -->
        <TargetRefs>  
          <TargetRef Id="" />  
        </TargetRefs>  

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 
      </Variant> 

    </ImageCustomizations>
    ```

2.  Specify the values for the following attributes, which determines the owner for the customizations:

    -   **Name** - A string that specifies the name of the customization or package. You can specify the name based on the device you're configure, such as "XDeviceCustomizations", or a generic name like "MobileCustomizations".
    -   **Description** - A string to help you identify the customizations defined within the CAF.
    -   **Owner** - A string specifying the owner, such as the OEM name.
    -   **OwnerType** - Set this to "OEM".

3.  Specify the **Targets** to use for the variants. **Targets** describe keying for a variant and must be described or pre-declared before being referenced by the variant. To do this:

    **To set up a Target**

    1.  Name the **Target Id**.

    2.  Specify the **Condition**(s) for the target by providing the **Name** and **Value**.

    For example, if we creating variants for two fictitious mobile operators, The Phone Company and Fabrikam, and we have their MCC and MNC, we can create a target for each operator using the MCC and MNC.

    ```XML
      <!-- Use to set up targets and conditions for the variants -->
      <Targets>  
       <Target Id="Id_PhoneCo">  
          <TargetState>  
            <Condition Name="MCC" Value="410" />  
            <Condition Name="MNC" Value="510" />  
          </TargetState>  
        </Target>  
       <Target Id="Id_Fabrikam">  
          <TargetState>  
            <Condition Name="MCC" Value="310" />  
            <Condition Name="MNC" Value="610" />  
          </TargetState>  
        </Target> 
      </Targets>  
      
    ```

    To learn more about all the supported **Condition Name**s that you can use, see the section *Target, TargetState, Condition, and priorities* in [Create a provisioning package with multivariant settings](https://msdn.microsoft.com/library/windows/hardware/dn916108). Note that in this walkthrough we are not using a provisioning package to declare our multivariant settings; instead, we are adding this directly into the MCSF CAF.

4.  Set up the variant. To do this:

    **To define a Variant**

    1.  Specify the **Variant Name**.

    2.  Specify the **TargetRef Id** for the variant. This should match one of the **Target Id**s you specified in the **Targets** section of the CAF. Note that there should only be one **TargetRef Id** per variant.

    Using our fictitious mobile operators, The Phone Company and Fabrikam, we can define the variants for each of these operators as shown in the following example:

    ```XML
      <!-- The settings shown here will only be applied for The Phone Company -->
      <Variant Name="ThePhoneCompany">  
        <TargetRefs>  
          <TargetRef Id="Id_PhoneCo" />  
        </TargetRefs>  

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 
      </Variant>  

      <!-- The settings shown here will only be applied for Fabrikam -->
      <Variant Name="Fabrikam">  
        <TargetRefs>  
          <TargetRef Id="Id_Fabrikam" />  
        </TargetRefs>  

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 

        <Settings Path="">  
          <Setting Name="" Value="" /> 
        </Settings> 
      </Variant>   
    ```

5.  Name and save the XML file; for example, *C:\\Contoso\\Customizations\\MobileCustomizations.xml*.

    We'll add the static (common or variant-agnostic) and variant-specific customization settings and values in the next walkthroughs.

## <span id="configure_the_start_layout_mcsf"></span><span id="CONFIGURE_THE_START_LAYOUT_MCSF"></span>Configure the Start layout


In this section, we'll use the Start MCSF settings to add the Start layout modification files that you created in [Configure the Start layout](configure-the-start-layout.md). We'll use one of the layout modification files as the common Start layout and we'll use the other layout modification file for one of the fictitious mobile operator variants.

1.  Create and edit the MCSF CAF; for example, *C:\\Contoso\\Customizations\\MobileCustomizations.xml*.

2.  Set *C:\\Contoso\\Customizations\\LayoutModification1.xml* as the common Start layout.

    Within the **Static** section of the CAF, set `LayoutModificationFilePath` to the file path to the layout modification file.

    ```XML
      <Static>  
        <!-- Use to preload apps to install for all variants -->
        <Applications>
          <Application Source=""
                       License=""
                       ProvXML="" />
        </Applications>

        <!-- Section where you specify the settings you want to configure -->
        <Settings Path="StartLayoutModificationFilePath">  
          <Setting Name="LayoutModificationFilePath" Value="C:\Contoso\Customizations\LayoutModification1.xml" />
        </Settings>  
      </Static>
    ```

    By specifying a new default location for the LayoutModification.xml, you are overriding the default Start layout that's in C:\\Data\\ProgramData\\Microsoft\\Start\\Layouts.

3.  Set *C:\\Contoso\\Customizations\\LayoutModification2.xml* as the default Start layout for the fictitious mobile operator, The Phone Company.

    In the **Variant** section named ThePhoneCompany, set `LayoutModificationFilePath` to the file path for the second layout modification file.

    ```XML
      <!-- The settings shown here will only be applied for The Phone Company -->
      <Variant Name="ThePhoneCompany">  
        <TargetRefs>  
          <TargetRef Id="Id_PhoneCo" />  
        </TargetRefs>  

        <Settings Path="StartLayoutModificationFilePath">  
          <Setting Name="LayoutModificationFilePath" Value="C:\Contoso\Customizations\LayoutModification2.xml" />
        </Settings> 
      </Variant>  
    ```

**Note**  `LayoutModificationFilePath` is a FirstVariationOnly setting, which means that it can only be modified during first variation, which is typically when the first valid configuration is found (such as when a SIM is inserted and a marked configuration is found for the SIM). If the configuration changes, such as during a SIM swap, the value for the FirstVariationOnly setting will not be changed again.

 

In this example, when the device boots after flashing a new mobile image and there is no SIM is inserted into the mobile device or a SIM for the fictitious Fabrikam mobile operator (MCC=310, MNC=610) is already in the device, LayoutModification1.xml (Start layout with a folder) will be used. If a SIM for the fictitious The Phone Company (MCC=410, MNC=510) is inserted after this, the Start layout will not change. However, if the device boots after flashing a new mobile image and there is already a SIM for The Phone Company inserted in the device, LayoutModification2.xml (Start layout with no folder) will be used instead.

## <span id="preload_apps"></span><span id="PRELOAD_APPS"></span>Preload apps


Partners can preload apps to be packaged and configured to install on mobile devices during the initial device setup process. In addition to preloading games, lifestyle apps, and other genres of apps, partners can preload system settings apps or partner account setup apps, just to name a few. For more information about preloading apps, see [Preinstallable apps for mobile devices](https://msdn.microsoft.com/library/windows/hardware/dn707972).

**Important**  In Windows 10, if you are working with an app developer or creating your own app to preload on the device, you must now request a preinstallation package for the app. For more information about this part of the process, see [Generate preinstall packages for OEMs](http://go.microsoft.com/fwlink/p/?LinkId=624851). The .zip file that's returned as part of this process should contain the app's source file (such as an .appx, .appxbundle, or .xap), a provisioning file (.provxml), and a license file (.xml). If your preinstall package does not contain all of these files, you can't successfully preload the app.

 

**To preload an app**

1.  Verify that the app preinstall package contains all the files you need to preload an app: source file, provisioning file, and license file.

2.  Add the app to the image. To do this, follow these steps:

    1.  Add an **Applications** section to the CAF.

        ```XML
            <!-- Use to preload apps to install for all variants -->
            <Applications>
              <Application Source=""
                           License=""
                           ProvXML="" />
            </Applications>
        ```

        **Note**  You can add the **Applications** section within the **Static** section of the CAF, which means the app will be installed for all images regardless of the variant, or you can add it within a particular **Variant**, which means it will only be installed for a particular variant. If you are preloading more than one app, one can be common to all variants (or within the **Static** section), while another applies only to a particular variant (or within a **Variant** section). An example of the latter case can be when you have an app that you only need to install for one particular mobile operator, or country/region, and so on.

         

    2.  Set **Source** to the location and name of your app source file; for example, *C:\\Contoso\\Customizations\\Apps\\SampleApp.appx*.

    3.  Set **License** to the location and name of your app's license file; for example, *C:\\Contoso\\Customizations\\Apps\\SampleAppLicense.xml*.

    4.  Set **ProvXML** to the location and name of your app's provisioning file; for example, *C:\\Contoso\\Customizations\\Apps\\mpap\_sampleapp\_001.provxml*.

        The provXML file follows a prescribed naming convention. See [Preinstallable apps for mobile devices](https://msdn.microsoft.com/library/windows/hardware/dn707972) for more information.

3.  Save the CAF when you are done adding all the apps.

In some cases, you may need to preload an app that has dependencies on other packages or components. In this case, you need to make sure that the other packages or components are preinstalled first before your app. If the dependent packages or components are not installed first, your app preload will fail. We won't walk through this scenario here, but you can find this documented in [Preload an app with a dependency](https://msdn.microsoft.com/library/windows/hardware/mt691485).

## <span id="configure_devicetargetinginfo_metadata"></span><span id="CONFIGURE_DEVICETARGETINGINFO_METADATA"></span>Configure the DeviceTargetingInfo metadata for the device


In order to ship a mobile device, at a minimum, you must set the required settings described in [Phone metadata in DeviceTargetingInfo](https://msdn.microsoft.com/library/windows/hardware/dn772214). Examples of required metadata include:

-   OEM and mobile operator information, used for display strings in the UI, device update, connecting to the Windows Store, and so on.
-   Hardware component versions and software versions, used for targeting updates to devices and for user support.
-   The device's model name, the mobile operator's name, and the manufacturer's name, which appear in the **About** screen in **Settings**.

**To configure the DeviceTargetingInfo metadata**

1.  Edit the MCSF CAF; for example, *C:\\Contoso\\Customizations\\MobileCustomizations.xml*.

2.  Within the **Static** section of the CAF, add a `DeviceInfo/Static` settings group.

    ```XML
      <Static>  
        <!-- Other settings groups may already precede the DeviceInfo/Static group -->

        <Settings Path="DeviceInfo/Static">       
          <Setting Name="PhoneManufacturer" Value="" />    
          <Setting Name="PhoneManufacturerDisplayName" Value="" /> 
          <Setting Name="PhoneROMVersion" Value="" /> 
          <Setting Name="PhoneHardwareRevision" Value="" />    
          <Setting Name="PhoneSOCVersion" Value="" /> 
          <Setting Name="PhoneFirmwareRevision" Value="" />   
          <Setting Name="PhoneRadioHardwareRevision" Value="" />    
          <Setting Name="PhoneRadioSoftwareRevision" Value="" /> 
          <Setting Name="PhoneBootLoaderVersion" Value="" />    
          <Setting Name="PhoneROMLanguage" Value="" /> 
          <Setting Name="PhoneHardwareVariant" Value="" /> 
       </Settings> 

      </Static>
    ```

    These settings are image-time only and will be put directly into the registry hive. Note that some settings in the `DeviceInfo/Static` group are optional so you may choose not to specify any values for them or remove them from the CAF. The following table summarizes which settings are required, optional, and which ones come from the silicon vendor.

    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Required setting</th>
    <th align="left">Optional setting</th>
    <th align="left">SoC vendor setting</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>PhoneManufacturer</p>
    <p>PhoneFirmwareRevision</p>
    <p>PhoneROMLanguage</p>
    <p>PhoneHardwareVariant</p></td>
    <td align="left"><p>PhoneManufacturerDisplayName</p>
    <p>PhoneRadioHardwareRevision</p></td>
    <td align="left"><p>PhoneROMVersion</p>
    <p>PhoneHardwareRevision</p>
    <p>PhoneSOCVersion</p>
    <p>PhoneRadioSoftwareRevision</p>
    <p>PhoneBootLoaderVersion</p></td>
    </tr>
    </tbody>
    </table>

     

    **Note**  You will need to contact your Microsoft representative to find out the value that you should use for `PhoneManufacturer`.

     

3.  Within the **Variant** section of the CAF, add a `DeviceInfo/Variant` settings group.

    Using our example, we'll add the settings within the variant section for ThePhoneCompany

    ```XML
       <!-- The settings shown here will only be applied for The Phone Company -->
      <Variant Name="ThePhoneCompany">  
        <TargetRefs>  
          <TargetRef Id="Id_PhoneCo" />  
        </TargetRefs>  

        <!-- Other settings with the Variant section not included here for simplicity --> 

        <Settings Path="DeviceInfo/Variant">
          <Setting Name="PhoneMobileOperatorName" Value="" /> 
          <Setting Name="PhoneManufacturerModelName" Value="" />    
          <Setting Name="PhoneMobileOperatorDisplayName" Value="" /> 
          <Setting Name="PhoneSupportPhoneNumber" Value="" />    
          <Setting Name="PhoneSupportLink" Value="" /> 
          <Setting Name="PhoneOEMSupportLink" Value="" />    
          <Setting Name="PhoneModelName" Value="" /> 
          <Setting Name="RoamingSupportPhoneNumber" Value="" />
       </Settings> 
     
      </Variant>  
    ```

    These settings are first variation only and can be configured at runtime, so potentially may be based on the SIM value. Note that some settings in the `DeviceInfo/Variant` group are optional so you may choose not to specify values for them or remove them from the CAF. The following table summarizes which settings are required, optional, and which ones come from the silicon vendor.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Required setting</th>
    <th align="left">Optional setting</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>PhoneMobileOperatorName</p>
    <p>PhoneManufacturerModelName</p>
    <p>PhoneModelName</p></td>
    <td align="left"><p>PhoneMobileOperatorDisplayName</p>
    <p>PhoneSupportPhoneNumber</p>
    <p>PhoneSupportLink</p>
    <p>PhoneOEMSupportLink</p>
    <p>PhoneRoamingSupportPhoneNumber</p></td>
    </tr>
    </tbody>
    </table>

     

4.  Save the CAF when you are done adding all the values for the required settings or any optional settings you choose to set. Follow the guidance in [Phone metadata in DeviceTargetingInfo](https://msdn.microsoft.com/library/windows/hardware/dn772214) to make sure you set the correct values and their formats.

## <span id="configure_other_customization_settings"></span><span id="CONFIGURE_OTHER_CUSTOMIZATION_SETTINGS"></span>Configure other customization settings


There are a variety of other customization settings that you can configure for Windows mobile devices. For phones in particular, you'll also typically need to provision connectivity settings such as the MMS APN, MMS proxy, IMS services (if supported), and so on. For this walkthrough, we'll assume that you've already configured these settings so we won't cover how to configure these connectivity settings. The MCSF section of the partner documentation provides scenario-based documentation to help you identify the settings you need to configure based on the scenarios or areas you want to enable. For more information about these customizations, see:

-   [Customizations for device management](https://msdn.microsoft.com/library/windows/hardware/dn757439) for info on overriding the default CountryTable.xml, setting the UICC slot for branding configuration, and more.
-   [Customizations for hardware components](https://msdn.microsoft.com/library/windows/hardware/dn757441) for info on customizing the display, storage, touch, and so on.
-   [Customizations for applications and Microsoft components](https://msdn.microsoft.com/library/windows/hardware/dn757434) for info on adding a phone call/SMS filter app, active phone cover settings, and others.
-   [Customizations for boot, initial setup, and shutdown](https://msdn.microsoft.com/library/windows/hardware/dn757435) to learn about configuring the timezone confirmation page and language selection during device setup, and many more.
-   [Customizations for browser](https://msdn.microsoft.com/library/windows/hardware/dn757436) for info on ways you can customize Microsoft Edge.
-   [Customizations for connectivity](https://msdn.microsoft.com/library/windows/hardware/dn757437) to learn more about setting the custom percentages for signal strength bars, preferred data provider list, roaming filter, and so on.
-   [Customizations for desktop experiences](https://msdn.microsoft.com/library/windows/hardware/dn757438) to customize the device icon and default image that appears when the mobile device is connected to the desktop.
-   [Customizations for email](https://msdn.microsoft.com/library/windows/hardware/dn757440) to learn how to change the email app to always have a light background.
-   [Customizations for maps](https://msdn.microsoft.com/library/windows/hardware/dn757442) for info preloading map data in the user store or SD card, maps for phones shipped in China, and more.
-   [Customizations for phone calls](https://msdn.microsoft.com/library/windows/hardware/dn757443) to learn about branding for phone calls, setting up visual voicemail, enabling IMS services and RCS, and many more.
-   [Customizations for photos, music, and videos](https://msdn.microsoft.com/library/windows/hardware/dn757445) for info about audio volume limitation, adding OEM lens apps, and so on.
-   [Customizations for Settings](https://msdn.microsoft.com/library/windows/hardware/dn757448) to learn about all the many customizations you can configure for the settings that appear within the **Settings** app on mobile devices.
-   [Customizations for SMS and MMS](https://msdn.microsoft.com/library/windows/hardware/dn757449) for more info on adding encoding extension tables for SMS, maximum length for messages, intercept deny list, and many more.
-   [Customizations for Start](https://msdn.microsoft.com/library/windows/hardware/dn757450) to change the default behavior of the Windows Store live tile. Note that you may configure the Start layout too, but that's covered in [Start layout for Windows 10 mobile editions](https://msdn.microsoft.com/library/windows/hardware/mt171093) and shown as an example in this walkthrough.

 

 



