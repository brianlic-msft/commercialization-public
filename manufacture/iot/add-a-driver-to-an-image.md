---
author: kpacquer
Description: 'We''ll show you one of two ways to add a driver to the image.'
title: 'Lab 1e: Add a driver to an image'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 1e: Add a driver to an image

In this lab, we'll add the sample driver: [Hello, Blinky!](https://developer.microsoft.com/windows/iot/samples/driverlab), package it up, and deploy it to the to a Windows 10 IoT Core device.

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites

* Create a product folder (ProductB) that's set up to boot to the default (Bertha) app, as shown in [Lab 1a: Create a basic image](create-a-basic-image.md) or [Lab 1c: Add a file and a registry setting to an image](add-a-registry-setting-to-an-image.md).

## <span id="Check_for_similar_drivers"></span>Check for similar drivers

Before adding drivers, you may want to review your pre-built Board Support Package (BSP) to make sure there's not already a similar driver. 

For example, review the list of drivers in the file: \\IoT-ADK-AddonKit\\Source-arm\\BSP\\Rpi2\\Packages\\RPi2FM.xml.

- If there's not an existing driver, you can usually just add one.

- If there is a driver, but it doesn't meet your needs, you'll need to replace the driver by creating a new BSP. We'll cover that in [Lab 2](create-a-new-bsp.md).

## <span id="Create_your_test_files"></span><span id="create_your_test_files"></span><span id="CREATE_YOUR_TEST_FILES"></span>Create your test files

-  Complete the exercises in [Installing The Sample Driver](https://developer.microsoft.com/en-us/windows/iot/samples/driverlab1) to build the Hello, Blinky app. You'll create three files: ACPITABL.dat, gpiokmdfdemo.inf, and gpiokmdfdemo.sys, which you'll use to install the driver.

   You can also use your own IoT Core driver, so long as it doesn't conflict with the existing Board Support Package (BSP).

-  Copy each of the files: gpiokmdfdemo.sys, gpiokmdfdemo.inf, and ACPITABL.dat into a test folder, for example, C:\gpiokmdfdemo\.

## <span id="Build_a_package_for_your_driver"></span><span id="build_a_package_for_your_driver"></span><span id="BUILD_A_PACKAGE_FOR_YOUR_DRIVER"></span>Build a package for your driver

1.  Run **C:\\IoT-ADK-AddonKit\\IoTCoreShell** as an administrator.

2.  Create the driver package using the .inf file as the base:

    ``` syntax
    newdrvpkg C:\gpiokmdfdemo\gpiokmdfdemo.inf Drivers.HelloBlinky
    ```

    The new folder at **C:\\IoT-ADK-AddonKit\\Source-&lt;arch&gt;\\Packages\\Drivers.HelloBlinky\\**.

3. Copy the file: ACPITABL.dat to the new folder, **C:\\IoT-ADK-AddonKit\\Source-_<arch_>\\Packages\\Drivers.HelloBlinky\\**.

**Verify that the sample files are in the package**

1.  Update the driver's package definition file, **C:\\IoT-ADK-AddonKit\\Source-&lt;arch&gt;\\Packages\\Drivers.HelloBlinky\\Drivers.HelloBlinky.pkg.xml**.

    The default package definition file includes sample XML that you can modify to add your own driver files.

    If necessary, update the value of File Source to point to your .SYS file, and the ACPITABL.dat file. (You don't need to add the .INF file.)  Add the DestinationDir of "$(runtime.drivers)".
    
    ``` syntax
    <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00" 
         Owner="$(OEMNAME)" OwnerType="OEM" ReleaseType="Production" 
         Platform="arm" Component="Drivers" SubComponent="HelloBlinky"> 
      <Components> 
        <Driver InfSource="gpiokmdfdemo.inf"> 
          <Reference Source="gpiokmdfdemo.sys" /> 
          <Files> 
            <File Source="gpiokmdfdemo.sys"  
                  DestinationDir="$(runtime.drivers)"  
                  Name="gpiokmdfdemo.sys" /> 
            <File Source="ACPITABL.dat"  
                  DestinationDir="$(runtime.system32)"  
                  Name="ACPITABL.dat" /> 
          </Files> 
        </Driver> 
      </Components> 
    </Package> 
    ```

2.  From the IoT Core Shell, build the package.

    ``` syntax
    createpkg Drivers.HelloBlinky
    ```

    The package is built, appearing as **C:\\IoT-ADK-AddonKit\\Build\\&lt;arch&gt;\\pkgs\\&lt;your OEM name&gt;.Drivers.HelloBlinky.cab**.

    
## <span id="Update_your_feature_manifest"></span><span id="update_your_feature_manifest"></span><span id="UPDATE_YOUR_FEATURE_MANIFEST"></span>Update your feature manifest


**Add your driver package to the feature manifest**

1.  Open the architecture-specific feature manifest file, **C:\\IoT-ADK-AddonKit\\Source-_<arch_>\\Packages\\OEMFM.xml**

2.  Create a new PackageFile section in the XML, with your package file listed, and give it a new FeatureID, such as "OEM\_DriverHelloBlinky".

    ``` syntax      
          <PackageFile Path="%PKGBLD_DIR%" Name="%OEM_NAME%.Drivers.HelloBlinky.cab">
            <FeatureIDs>
              <FeatureID>OEM_DriverHelloBlinky</FeatureID>
            </FeatureIDs>
          </PackageFile>
    ```
3. Run `buildfm bsp rpi2` to generate updated files in the MergedFMs folder. This has to be done every time any time an FM file is modified.

    You'll now be able to add your driver to your product by adding a reference to this feature manifest.


## <span id="Update_the_project_s_configuration_files"></span><span id="update_the_project_s_configuration_files"></span><span id="UPDATE_THE_PROJECT_S_CONFIGURATION_FILES"></span>Update the project's configuration files

1.  Open your product's test configuration file: **C:\\IoT-ADK-AddonKit\\Source-_<arch_>\\Products\\ProductA\\TestOEMInput.xml**.

2.  Make sure your feature manifest, Rpi2FM.xml, is in the list of AdditionalFMs. Add it if it isn't there already there:

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


3.  Add the FeatureID for your driver:

    ``` syntax
    <OEM>
      <!-- Include BSP Features -->
      <Feature>RPI2_DRIVERS</Feature>
      <Feature>RPI3_DRIVERS</Feature>
      <!-- Include OEM features-->
      <Feature>OEM_CustomCmd</Feature>
      <Feature>OEM_ProvAuto</Feature>
      <Feature>OEM_FilesAndRegKeys</Feature>
      <Feature>OEM_DriverHelloBlinky</Feature> 
    </OEM>
    ```

## <span id="Build_and_test_the_image"></span><span id="build_and_test_the_image"></span><span id="BUILD_AND_TEST_THE_IMAGE"></span>Build and test the image

Build and flash the image using the same procedures from [Lab 1a: Create a basic image](create-a-basic-image.md). Short version:

1.  From the IoT Core Shell, build the image (`buildimage ProductB Test`).
2.  Install the image: Start **Windows IoT Core Dashboard** > Click the **Setup a new device** tab >  select **Device Type: Custom** >
3.  From **Flash the pre-downloaded file (Flash.ffu) to the SD card**: click **Browse**, browse to your FFU file (C:\\IoT-ADK-AddonKit\\Build\\&lt;arch&gt;\\ProductB\\Test\\Flash.ffu), then click **Next**.
4.  Enter device name and password. Put the Micro SD card in the device, select it, accept the license terms, and click *Install**. 
5.  Put the card into the IoT device and start it up.

**Check to see if your driver works**

1.  Use the procedures in the [Hello, Blinky! lab](https://developer.microsoft.com/windows/iot/samples/driverlab3) to test your driver.

## <span id="Next_steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next steps

[Lab 1f: Build a retail image](build-retail-image.md)