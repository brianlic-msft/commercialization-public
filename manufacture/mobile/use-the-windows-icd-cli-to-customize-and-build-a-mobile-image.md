---
Description: 'You can use the Windows Imaging and Configuration Designer (ICD) command-line interface (CLI) to generate a new Windows 10 Mobile image.'
ms.assetid: 941023d3-14d5-415f-817b-a48ac2a4ec87
MSHAttr: 'PreferredLib:/library'
title: Use the Windows ICD CLI to customize and build a mobile image
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use the Windows ICD CLI to customize and build a mobile image


You can use the Windows Imaging and Configuration Designer (ICD) command-line interface (CLI) to generate a new Windows 10 Mobile image.

This imaging method requires a pre-installed OS kit so you must have all the necessary Microsoft OS packages and feature manifest files in your default install path. You also need either a BSP.config.xml file, which contains information about the hardware component packages for your board support package (BSP) or you can use an OEMInput.xml file.

If you're using a BSP.config.xml file, you can:

-   Use the BSP.config.xml file you downloaded as part of the BSP kit, or,

-   Generate your own BSP.config.xml by running the BSP kit configuration tools from the SoC vendor and selecting your component drivers.

## <span id="Create_a_WPAF_with_multivariant_support"></span><span id="create_a_wpaf_with_multivariant_support"></span><span id="CREATE_A_WPAF_WITH_MULTIVARIANT_SUPPORT"></span>Create a WPAF with multivariant support


Multivariant provides a generic mechanism for creating a single image that can work for multiple markets. You can use it to dynamically configure language, branding, and network settings during runtime based on the mobile operator and locale/country.

Unlike the Windows ICD UI, you can use the Windows ICD CLI to to create an image that has multivariant support. In order to do this, you must first edit a Windows Provisioning answer file (WPAF), customizations.xml, and add the **Targets** and **Variant** sections to the file. [Create a provisioning package with multivariant settings](https://msdn.microsoft.com/library/windows/hardware/dn916108) provides a more information about multivariant support in Windows 10 and a list of the conditions that Windows supports along with their priorities. It also provides a step-by-step example on what you need to do.

In this section, we'll modify the customizations.xml file that was created from [Use the Windows ICD UI to customize and build a mobile image](use-the-windows-icd-ui-to-customize-and-build-a-mobile-image.md) and include **Targets** and **Variant** sections to support multivariant. If you are building a single variant image, you may skip this section.

1.  Locate the provisioning package file, customizations.xml. If you didn't change the default project location, you can find the package in *&lt;drive:&gt;*\\Users\\*&lt;user\_name&gt;*\\Documents\\Windows Imaging and Configuration Designer (WICD)\\*&lt;project\_name&gt;*.

2.  Use an XML or text editor to open the customizations.xml file.

    The following example shows the contents of the customizations.xml file created in [Use the Windows ICD UI to customize and build a mobile image](use-the-windows-icd-ui-to-customize-and-build-a-mobile-image.md).

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <WindowsCustomizations>
      <PackageConfig xmlns="urn:schemas-Microsoft-com:Windows-ICD-Package-Config.v1.0">
        <ID>{239b9121-9f26-42db-8ae2-0d62989caa66}</ID>
        <Name>Contoso_ppkg</Name>
        <Version>1.0</Version>
        <OwnerType>OEM</OwnerType>
        <Rank>0</Rank>
      </PackageConfig>
      <Settings xmlns="urn:schemas-microsoft-com:windows-provisioning">
        <Customizations>
          <Common>
            <Policies>
              <DeviceLock>
                <MaxInactivityTimeDeviceLock>15</MaxInactivityTimeDeviceLock>
                <ScreenTimeoutWhileLocked>15</ScreenTimeoutWhileLocked>
              </DeviceLock>
            </Policies>
            <Start>
              <StartLayout>C:\Contoso\Customizations\LayoutModification1.xml</StartLayout>
            </Start>
          </Common>
        </Customizations>
      </Settings>
    </WindowsCustomizations> 
      
    ```

3.  Edit the customizations.xml file and create a **Targets** section to describe the conditions that will handle your multivariant settings.

    The following example shows the customizations.xml, which has been modified to include the conditions **MCC** and **MNC**. For parity, the example uses the same fictitious IDs and conditions that were used in *Create an MCSF customization answer file* section in [Configure customization settings](configure-customization-settings.md).

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <WindowsCustomizations>
      <PackageConfig xmlns="urn:schemas-Microsoft-com:Windows-ICD-Package-Config.v1.0">
        <ID>{239b9121-9f26-42db-8ae2-0d62989caa66}</ID>
        <Name>Contoso_ppkg</Name>
        <Version>1.0</Version>
        <OwnerType>OEM</OwnerType>
        <Rank>0</Rank>
      </PackageConfig>
      <Settings xmlns="urn:schemas-microsoft-com:windows-provisioning">
        <Customizations>
          <Common>
            <Policies>
              <DeviceLock>
                <MaxInactivityTimeDeviceLock>15</MaxInactivityTimeDeviceLock>
                <ScreenTimeoutWhileLocked>15</ScreenTimeoutWhileLocked>
              </DeviceLock>
            </Policies>
            <Start>
              <StartLayout>C:\Contoso\Customizations\LayoutModification1.xml</StartLayout>
            </Start>
          </Common>
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
        </Customizations>
      </Settings>
    </WindowsCustomizations> 
      
    ```

4.  In the customizations.xml file, create two **Variant** sections:

    1.  Specify a **Name** for each variant.

    2.  Add a child **TargetRefs** element.

    3.  Within the **TargetRefs** element, add a **TargetRef** element.

    The following example shows what the customizations.xml looks like after adding two variants, ThePhoneCompany and Fabrikam, and then using the two **Target Id**s we defined in the previous step to use as the **TargetRef Id** for each variant.

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <WindowsCustomizations>
      <PackageConfig xmlns="urn:schemas-Microsoft-com:Windows-ICD-Package-Config.v1.0">
        <ID>{239b9121-9f26-42db-8ae2-0d62989caa66}</ID>
        <Name>Contoso_ppkg</Name>
        <Version>1.0</Version>
        <OwnerType>OEM</OwnerType>
        <Rank>0</Rank>
      </PackageConfig>
      <Settings xmlns="urn:schemas-microsoft-com:windows-provisioning">
        <Customizations>
          <Common>
            <Policies>
              <DeviceLock>
                <MaxInactivityTimeDeviceLock>15</MaxInactivityTimeDeviceLock>
                <ScreenTimeoutWhileLocked>15</ScreenTimeoutWhileLocked>
              </DeviceLock>
            </Policies>
            <Start>
              <StartLayout>C:\Contoso\Customizations\LayoutModification1.xml</StartLayout>
            </Start>
          </Common>
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
          <Variant Name="ThePhoneCompany"> 
            <TargetRefs> 
              <TargetRef Id="Id_PhoneCo" /> 
            </TargetRefs> 
          </Variant> 
          <Variant Name="Fabrikam"> 
            <TargetRefs> 
              <TargetRef Id="Id_Fabrikam" /> 
            </TargetRefs> 
          </Variant> 
        </Customizations>
      </Settings>
    </WindowsCustomizations> 
      
    ```

5.  Move compliant settings from the **Common** section to the **Variant** section.

    **Note**  Settings that reside in the **Common** section are applied unconditionally on every triggering event.

     

    In the following example, we used the `DeviceLock/MaxInactivity` policy under ThePhoneCompany variant while the `DeviceLock/ScreenTimeoutWhileLocked` policy was moved under the Fabrikam variant.

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <WindowsCustomizations>
      <PackageConfig xmlns="urn:schemas-Microsoft-com:Windows-ICD-Package-Config.v1.0">
        <ID>{239b9121-9f26-42db-8ae2-0d62989caa66}</ID>
        <Name>Contoso_ppkg</Name>
        <Version>1.0</Version>
        <OwnerType>OEM</OwnerType>
        <Rank>0</Rank>
      </PackageConfig>
      <Settings xmlns="urn:schemas-microsoft-com:windows-provisioning">
        <Customizations>
          <Common>
            <Start>
              <StartLayout>C:\Contoso\Customizations\LayoutModification1.xml</StartLayout>
            </Start>
          </Common>
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
          <Variant Name="ThePhoneCompany"> 
            <TargetRefs> 
              <TargetRef Id="Id_PhoneCo" /> 
            </TargetRefs> 
            <Policies>
              <DeviceLock>
                <MaxInactivityTimeDeviceLock>15</MaxInactivityTimeDeviceLock>
              </DeviceLock>
            </Policies>
          </Variant> 
          <Variant Name="Fabrikam"> 
            <TargetRefs> 
              <TargetRef Id="Id_Fabrikam" /> 
            </TargetRefs> 
            <Policies>
              <DeviceLock>
                <ScreenTimeoutWhileLocked>15</ScreenTimeoutWhileLocked>
              </DeviceLock>
            </Policies>
          </Variant> 
        </Customizations>
      </Settings>
    </WindowsCustomizations> 
      
    ```

6.  Save the updated customizations.xml file and note the path to this updated file. You will need the path as one of the values when you get ready to build the image.

7.  Use the Windows ICD command-line interface (CLI) to create a provisioning package using the updated customizations.xml. For more information about how to build a provisioning package and a description of the command switches and parameters, see **To build a provisioning package** in [Use the Windows ICD command-line interface](https://msdn.microsoft.com/library/windows/hardware/dn916115).

    For example:

    ``` syntax
    icd.exe /Build-ProvisioningPackage /CustomizationXML:"C:\CustomProject\customizations.xml" /PackagePath:"C:\CustomProject\output.ppkg" /StoreFile:C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Imaging and Configuration Designer\x86\Microsoft-Common-Provisioning.dat"
    ```

    In this example, the **StoreFile** corresponds to the location of the settings store that will be used to create the package for the required Windows edition.

    **Note**  The provisioning package created during this step will contain the multivariant settings. You can use this package either as a standalone package that you can apply to a Windows device, use it as the base when starting another project, or use it as one of one of the inputs (**/ProvisioningPackage**) when building either a Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) image or Windows 10 Mobile image.

     

## <span id="build_a_mobile_image_using_the_windows_icd_cli"></span><span id="BUILD_A_MOBILE_IMAGE_USING_THE_WINDOWS_ICD_CLI"></span>Build a mobile image using the Windows ICD CLI


This walkthrough shows how to use the Windows ICD CLI to build a mobile image. For more information about the Windows ICD CLI, including usage examples and parameter descriptions, see [Use the Windows ICD command-line interface](https://msdn.microsoft.com/library/windows/hardware/dn916115).

1.  Open a command-line window with administrator rights.

2.  From the command-line, navigate to the Windows ICD install directory:

    -   On an x64 computer, go to: C:\\Program Files (x86)\\Windows Kits\\10\\Assessment and Deployment Kit\\Imaging and Configuration Designer\\x86

    -   On an x86 computer, go to: C:\\Program Files\\Windows Kits\\10\\Assessment and Deployment Kit\\Imaging and Configuration Designer\\x86

3.  Using the updated customizations.xml (with multivariant settings) and the MCSF CAF created in [Configure customization settings](configure-customization-settings.md), use the Windows ICD CLI to build a mobile image.

    To do this with the example files and using a bsp.config.xml, see the following command:

    **icd.exe /Build-ImageFromPackages /ImagePath:"***C:\\Contoso\\Customizations\\TestFlash2.ffu***" /BSPConfigFile:"***C:\\ContosoXDevice.bsp.config.xml***" /ImageType:***Test* **/CustomizationXML:"***C:\\Contoso\\Customizations\\customizations.xml***" /OEMCustomizationVer:***1.0.0.0* **/MCSFCustomizationXML:"***C:\\Contoso\\Customizations\\MobileCustomizations.xml***"**

    Here are a few things to keep in mind:

    -   Replace all the placeholder values for each parameter with the values that match your assets and directory locations
    -   Specify /ImageType because we are using /BSPConfigFile
    -   Use /CustomizationXML to point to the customizations.xml
    -   Windows ICD requires /OEMCustomizationVer if ProvisioningPackage is defined
    -   Make sure the format for the /OEMCustomizationVer version number is in *&lt;Major&gt;.&lt;Minor&gt;.&lt;SubVersion&gt;.&lt;SubMinorVersion&gt;*, such as 1.0.0.0

    To do this with the example files and using an OEMInput.xml file, see the following command:

    **icd.exe /Build-ImageFromPackages /ImagePath:"***C:\\Contoso\\Customizations\\TestFlash2.ffu***" /OEMInputXML:"***C:\\ContosoTestOEMInput.xml***" /CustomizationXML:"***C:\\Contoso\\Customizations\\customizations.xml***" /OEMCustomizationVer:***1.0.0.0* **/MCSFCustomizationXML:"***C:\\Contoso\\Customizations\\MobileCustomizations.xml***"**

Once the image (FFU) is built, you can flash it to your mobile device by using ffutool.exe or the **Deploy** option in the Windows ICD UI. See the following section for more information.

## <span id="Flash_an_image_to_a_mobile_device"></span><span id="flash_an_image_to_a_mobile_device"></span><span id="FLASH_AN_IMAGE_TO_A_MOBILE_DEVICE"></span>Flash an image to a mobile device


There are two ways that you can use to flash an image to a mobile device:

-   Using ffutool.exe, or,
-   Using the built-in flashing functionality in Windows ICD

This section shows how to do both. Choose one of these methods to flash your image to your mobile device.

Follow these steps if you are flashing the image to the device using Windows ICD.

**To flash an image using Windows ICD**

1.  Boot the device into image or FFU download mode. To force your phone into image or FFU download mode manually, press and release the power button to reboot the phone and then immediately press and hold the volume up button. Note that this option is available only after an initial FFU has been flashed to the phone.

    If this doesn't work, check and follow the device flashing instructions provided by the SoC vendor.

2.  Using a USB cable, connect your phone to the host computer.

3.  Launch Windows ICD.

4.  Click **Deploy** from the main menu and choose **To USB connected device** to deploy the FFU image to the device.

5.  In the **Select an FFU image** window, click **Browse...** to launch File Explorer and select the FFU that you want to flash to your target device, and then click **Next**.

6.  Choose the target device or drive from the list. If your device or drive is not listed, click **Refresh**.

7.  Click **Next**.

8.  In the **Deploy to device** window, choose **Flash** to start flashing the image.

9.  Click **Finish** to close the **Deployment** page.

Follow these steps if you are flashing the image to the device using ffutool.exe.

**To flash an image using ffutool.exe**

1.  Boot the device into FFU flashing mode while it is connected to the host computer.

    If you didn't include the LABIMAGE optional feature when generating your test image, you can force the device into FFU flashing mode manually by pressing and releasing the power button to boot the device and then immediate pressing and holding the volume up button. However, note that this option is only available if an FFU has been initially flashed to the device.

2.  Open a command prompt with administrator rights.

3.  Run ffutool.exe from the command line to flash the image.

    **ffutool -flash TestFlash.ffu**

No matter which method you used to flash the image to the device, it will take a few minutes for the image to be fully flashed. Once flashing is done, go through device setup and verify that your customizations appear as part of the image.

 

 



