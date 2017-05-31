---
author: kpacquer
Description: 'We''ll create a provisioning package that contains some sample Wi-Fi settings.'
ms.assetid: d9a50f87-e8c0-48da-89e7-0cdd542ce053
MSHAttr: 'PreferredLib:/library'
title: 'Lab 1d: Add networking and other provisioning package settings to an image'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 1d: Add networking and other provisioning package settings to an image

We'll create a provisioning package that contains some sample Wi-Fi settings. You can use Windows Configuration Designer to create provisioning packages that add apps, drivers, features, or modify many common settings, such as IT device management and policy settings.

Note, to test Wi-Fi, your board will need Wi-Fi support. You can use a Wi-Fi adapter/dongle, or use a board like the Raspberry Pi 3 that has Wi-Fi built-in.

For this lab, we'll use the ProductB, that includes the default app (Bertha), which shows network status.


## Prerequisites

* See [Get the tools needed to customize Windows IoT Core](set-up-your-pc-to-customize-iot-core.md) to get your technician PC ready.

* Use ProductB that you created in [Lab 1c: Add a file and a registry setting to an image](add-a-registry-setting-to-an-image.md).

## Create your provisioning package in Windows Configuration Designer

1.  Start **Windows Imaging and Configuration Designer**.

2.  Click **File &gt; New project**.

3.  For this example, use the name "**ProductBProv**" for the product name, accept the defaults, and click **Next**.

4.  Select **Provisioning package &gt; Windows 10 IoT Core**.

5.  At the **Import a provisioning package (optional)** page, click **Finish**.

6.  Add a sample setting:

    1.  Expand **Runtime settings &gt; Connectivity Profiles &gt; WLAN &gt; WLANSetting &gt; SSID**.

    2.  Type in the name of a Wi-Fi network name, for example, ContosoWiFi, and click **Add**.

    3.  Expand the **SSID > WLANXmlSettings > SecurityType** and choose a setting such as **Open**.

    4.  Expand the **SSID > WLANXmlSettings > AutoConnect** and choose a setting such as **TRUE**.

    5.  Optional: to add more than one WLAN network, go back to WLANSetting, and repeat the process.

7.  Optional: add other apps, drivers, and settings through the UI. To learn more, see [Configure customizations using Windows ICD](https://msdn.microsoft.com/library/windows/hardware/dn916109).

8.  Export the provisioning package. For example, click **Export &gt; Provisioning Package &gt; Next &gt; (Uncheck the Encrypt Package box) &gt; Next &gt;  Build**. (To learn more, see [Export a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916110). )

    <blockquote><p><strong>Important:</strong><br> When you make any changes to a provisioning package, Windows Configuration Designer increments the version number in the provisioning file (customizations.xml). The version number is not major.minor, it is a number with a decimal point. For example, 1.19 is a lower version than 1.2. </p></blockquote>

9.  At the **All done!** page, click the link to the **Output location**.

**Copy customizations.xml into your product's _prov_ folder**

1.  Copy customizations.xml to C:\\IoT-ADK-AddonKit\\Source-_<arch_>\\Products\\ProductB\\prov\.
        	
2.  Optional: update customizations.xml with any desired changes. Make sure you increment the version number if you make changes. See [Windows provisioning answer file](https://msdn.microsoft.com/library/windows/hardware/dn916153) for more info.

**Add the auto-provisioning scripts to the feature manifest and product configuration file**

1.  Review the package definition file: Provisioning.Auto.pkg.xml: C:\\IoT-ADK-AddonKit\\Common\\Packages\\Provisioning.Auto\\Provisioning.Auto.pkg.xml. 

    Make sure the file source resolves correctly. ($PROD)Prov.ppkg resolves to C:\\IoT-ADK-AddonKit\\Source-_<arch_>\\Products\\ProductB\\prov\\ProductBProv.ppkg, this should match your provisioning package's file name.

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
      <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"
        Owner="$(OEMNAME)"
        OwnerType="OEM"
        ReleaseType="Production"
        Platform="$(BSPARCH)"
        Component="Provisioning"
        SubComponent="Auto">
        <Components>
           <OSComponent>
           <Files>
            <!--
            Source : Provisioning is product specific, so copied from the Product directory
            Destination : Auto provisioning folder which is C:\Windows\Provisioning\Packages
            -->
            <File Source="$(PRJDIR)\Products\$(PROD)\prov\$(PROD)Prov.ppkg"
                    DestinationDir="$(runtime.windows)\Provisioning\Packages" Name="ProvAuto.ppkg"/>
            </Files>
           </OSComponent>
        </Components>
    </Package>
    ```

2.  Make sure that the package definition file **%OEM\_NAME%.Provisioning.Auto.cab"** and the feature ID: **OEM\_ProvAuto** are referenced in the common feature manifest, C:\\IoT-ADK-AddonKit\\Common\\Packages\\OEMCommonFM.xml:

    ``` syntax
    <PackageFile Path="%PKGBLD_DIR%" Name="%OEM_NAME%.Provisioning.Auto.cab">
      <FeatureIDs>
        <FeatureID>OEM_ProvAuto</FeatureID>
        <FeatureID>OEMCommon_ALL</FeatureID>
      </FeatureIDs>
    </PackageFile>    
    ...
    <OEMFeatureGroups>
    <!-- Feature Constraints below -->
    <!-- This ensures that only one of the Provisioning package is included -->
      <FeatureGroup Constraint="ZeroOrOne">
        <FeatureIDs>
          <FeatureID>OEM_ProvAuto</FeatureID>
          <FeatureID>OEM_ProvManual</FeatureID>        
        </FeatureIDs>
    ```

3.  Update the test configuration file C:\\IoT-ADK-AddonKit\\Source-_<arch_>\\Products\\ProductB\\TestOEMInput.xml:

    1.  Make sure the common feature manifest: OEMCommonFM.xml is included. (Remove comment marks if necessary.)

        ``` syntax
        <AdditionalFMs>
         <!-- Including BSP feature manifest -->
         <AdditionalFM>%BLD_DIR%\MergedFMs\RPi2FM.xml</AdditionalFM>
         <!-- Including OEM feature manifest -->
         <AdditionalFM>%BLD_DIR%\MergedFMs\OEMCommonFM.xml</AdditionalFM>
         <AdditionalFM>%BLD_DIR%\MergedFMs\OEMFM.xml</AdditionalFM>
         <!-- Including the test features -->
         <AdditionalFM>%AKROOT%\FMFiles\arm\IoTUAPNonProductionPartnerShareFM.xml</AdditionalFM>
        </AdditionalFMs>
        ```

    2.  Make sure the Feature: OEM_ProvAuto is included.

        ``` syntax
        <OEM>
          <!-- Include BSP Features -->
          <Feature>RPI2_DRIVERS</Feature>
          <Feature>RPI3_DRIVERS</Feature>
          <!-- Include OEM features-->
          <Feature>OEM_CustomCmd</Feature>
          <Feature>OEM_ProvAuto</Feature>
          <Feature>OEM_FilesAndRegKeys</Feature>
        </OEM>
        ```

## Build and test the image

Build and flash the image using the same procedures from [Lab 1a: Create a basic image](create-a-basic-image.md). Short version:

1.  From the IoT Core Shell, build the image (`buildimage ProductB Test`).

2.  Install the image: Start **Windows IoT Core Dashboard** > Click the **Setup a new device** tab >  select **Device Type: Custom** >

3.  From **Flash the pre-downloaded file (Flash.ffu) to the SD card**: click **Browse**, browse to your FFU file (C:\\IoT-ADK-AddonKit\\Build\\&lt;arch&gt;\\ProductB\\Test\\Flash.ffu), then click **Next**.

4.  Enter device name and password. 

    **Note: We recommend using a different device name for each device to help prevent network conflicts.**

5.  Put the Micro SD card in the device, select it, accept the license terms, and click *Install**. 

6.  Put the card into the IoT device and start it up.

Note: Ignore the settings for "Wi-Fi Network Connection" in these menus, these settings are not used. 

After a short while, you should see the [IoT test (Bertha) app](https://developer.microsoft.com/windows/iot/samples/iotdefaultapp) which shows basic info about the image.

**Test to see if your provisioning settings were applied**

1.  Unplug any network cables from your IoT device.

2.  Select the defaults. At the **Let's get connected** screen, select **Skip this step**.

3.  If your wireless network is in range, this screen should show the network successfully connected, and show an IP address for the network.

## Test network connections and upload apps

You can connect to your device's portal page to troubleshoot network connections, upload apps, or see more details about your device.

1.  Connect both your technician PC and the device to the same network. 

    For example, to connect over a wired network, plug in a ethernet cable.  To connect over wireless, make sure both your technician computer and IoT Core device are connected to the same wireless network.    

2.  On your technician PC, open Internet Explorer, and type in the device's IP address with an http:// prefix and :8080 suffix. 

    ``` syntax
    http://10.123.45.67:8080
    ```

3.  When prompted, enter your device's default username and password. (Default is: Administrator \ p@ssw0rd)

    This opens the [Windows Device Portal](https://developer.microsoft.com/windows/iot/win10/tools/deviceportal). From here, you can upload app packages, see what apps are installed, and switch between them.

4.  Click **Networking** > **Profiles**.  You should see the Wi-Fi profile you created. 
    
	If the device is able to automatically connect to the WiFi network, then under **Available Networks**, you should see a checkmark next to the network you configured.

    If your network requires steps such as accepting license terms, the device may not auto-connect.

## Troubleshooting

**Check your Wi-Fi broadcast frequency (2.4GHz vs 5GHz)**. Some Wi-Fi adapters, such as the built-in Wi-Fi adapter on the Raspberry Pi 3, only support 2.4GHz Wi-Fi networks. While this is the most common Wi-Fi broadcast frequency, many Wi-Fi networks broadcast at frequencies of 5GHz. Either change the broadcast frequency or use a different adapter.

**Confirm that the provisioning package settings work on your network**. Use a laptop PC to test:

1.	Disconnect the laptop from the network: Click on the network icon in the system tray, select the wireless network, and click **Disconnect**. 

2.	Confirm that the network is no longer connected.

3.	Install the provisioning package by double-clicking ProductAProv.ppkg. The wireless network should connect automatically.

**Check to see if the profile has been added to the device**

1.  Connect using an ethernet connection to the device.

2.  Connect using an SSH client, such as [PuTTY](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe).

3.  When connected, check to see what profiles have been installed:

    ```syntax
    netsh wlan show profiles
    ``` 

    The network should appear in the list of User profiles.

**Use a different device name for each device.** This can help prevent network conflicts. Set this name while creating media for the device.

## Next steps

[Lab 1e: Add a driver to an image](add-a-driver-to-an-image.md) 
