---
author: kpacquer
Description: 'Convert our test image to a retail build.'
MS-HAID: 'p\_iot\_core.build\_retail\_image'
MSHAttr: 'PreferredLib:/library'
title: 'Lab 1f: Build a retail image'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 1f: Build a retail image

We'll take our customizations, put them together, and test them in a retail build. 

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites

-   [Lab 1a: Create a basic image](create-a-basic-image.md)
-   [Lab 1b: Add an app to your image](deploy-your-app-with-a-standard-board.md)
-   [Lab 1c: Add a file and a registry setting to an image](add-a-registry-setting-to-an-image.md)
-   [Lab 1d: Add networking and other provisioning package settings to an image](add-a-provisioning-package-to-an-image.md)
-   [Lab 1e: Add a driver to an image](add-a-driver-to-an-image.md)

## <span id="Add_your_app_to_the_retail_configuration_file"></span><span id="add_your_app_to_the_retail_configuration_file"></span><span id="ADD_YOUR_APP_TO_THE_RETAIL_CONFIGURATION_FILE"></span>Add your app to the retail configuration file

1.  Open your product's retail configuration file: **C:\\IoT-ADK-AddonKit\\Source-&lt;arch&gt;\\Products\\ProductA\\RetailOEMInput.xml**..

2.  Add your feature manifest, OEMFM.xml, into the list of AdditionalFMs. At the same time, add the feature manifest: OEMCommonFM.xml, which contains the OEM\_CustomCmd package that configures your app on the first boot:

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

3.  Add the FeatureIDs for the your app package, the  and the OEM\_CustomCmd package.

    ``` syntax
    <OEM> 
       <!-- Include BSP Features -->
       <Feature>RPi2_DRIVERS</Feature> 
       <Feature>RPi3_DRIVERS</Feature>
       <!-- Include OEM features -->
       <Feature>OEM_CustomCmd</Feature> 
       <Feature>OEM_ProvAuto</Feature>
       <Feature>OEM_MyUWPApp</Feature>
       <Feature>OEM_FilesAndRegKeys</Feature>
       <Feature>OEM_DriverHelloBlinky</Feature> 
    </OEM>
    ```
    
    OEM_CustomCmd is required to trigger the app installation.
    
    OEM_ProvAuto is required to pull in the provisioning package.
	
	OEM_FilesAndRegKeys, OEM_MyUWPApp, and OEM_DriverHelloBlinky were sample packages added in previous labs.

## <span id="Copy_in_provisioning_packages"></span>Copy in the provisioning package from ProductB into ProductA.

1.  In File Explorer, create a new folder, C:\\IoT-ADK-AddonKit\\Products\\ProductA\\prov.

2.  Copy the customizations.xml files into this folder.
    

### <span id="Build_and_create_the_image"></span><span id="build_and_create_the_image"></span><span id="BUILD_AND_CREATE_THE_IMAGE"></span>Build and create the image

**Build the image**

1.  [Get a code-signing certificate](https://msdn.microsoft.com/library/windows/hardware/hh801887.aspx).

2.	Configure the cross-signing certificate to be used for retail signing. Edit setsignature.cmd file to set SIGNTOOL_OEM_SIGN:

    ``` syntax
	set SIGNTOOL_OEM_SIGN=/s my /i "Issuer" /n "Subject" /ac "CrossCertRoot" /fd SHA256
	```
	
	-  Issuer        : Issuer of the Certificate ( see Certificate -> Details -> Issuer )
	
	-  Subject       : Subject in the certificate ( see Certificate -> Details -> Subject)
	
	-  CrossCertRoot : Microsoft-supplied Cross Certificate Root. See Cross-Certificate List in [Cross-Certificates for Kernel Mode Code Signing](https://msdn.microsoft.com/windows/hardware/drivers/install/cross-certificates-for-kernel-mode-code-signing#cross-certificate-list).
	
	
2.	From the IoT Core Shell, enable retail signing.

    ``` syntax
	retailsign On
	```
	
3.	Rebuild all the packages so that they are retail signed.

    ``` syntax
	buildpkg all
	```

4.  From the IoT Core Shell, create the image:

    ``` syntax
    buildimage ProductA Retail
    ```

    This creates the product binaries at C:\\IoT-ADK-AddonKit\\Build\\&lt;arch&gt;\\ProductA\\Retail\\Flash.FFU.

5.  Start **Windows IoT Core Dashboard** &gt; **Setup a new device** &gt; **Custom**, and browse to your image. Put the Micro SD card in the device, select it, accept the license terms, and click **Install**. This replaces the previous image with our new image.

6.  Put the card into the IoT device and start it up.

    After a short while, the device should start automatically, and you should see your app.

**Check to see if everything is working**

With retail builds, you won't be able to log into the device using the SSH clients or by using the web interface. However, any files and reg keys that your app relies on should still work.

## <span id="Next_steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next steps

- [Lab 2: Creating your own board support package](create-a-new-bsp.md)