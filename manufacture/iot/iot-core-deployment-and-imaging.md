---
author: kpacquer
Description: 'Windows 10 IoT Core (IoT Core) brings the power of Microsoft Windows together with breadth of the Internet of Things. Developers can now build and provision their own custom Windows 10 images for the IoT Core devices in their ecosystem.'
ms.assetid: 800596ab-ce50-4bc0-921a-280ed63a2d75
MSHAttr: 'PreferredLib:/library'
title: IoT Core deployment and imaging
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IoT Core deployment and imaging


Windows 10 IoT Core (IoT Core) brings the power of Microsoft Windows together with breadth of the Internet of Things. Developers can now build and provision their own custom Windows 10 images for the IoT Core devices in their ecosystem.

## <span id="Intended_audience"></span><span id="intended_audience"></span><span id="INTENDED_AUDIENCE"></span>Intended audience


OEMs and ODMs customizing and deploying images for IoT devices.

## <span id="Download_and_install_the_kits_and_packages"></span><span id="download_and_install_the_kits_and_packages"></span><span id="DOWNLOAD_AND_INSTALL_THE_KITS_AND_PACKAGES"></span>Download and install the kits and packages


Before you can create an IoT Core image:

-   Download the [Windows Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/p/?LinkId=526740)
-   Download the [IoT Core OS Packages](https://www.microsoft.com/en-us/download/details.aspx?id=53898).
-   Optional: Download the [Windows 10 IoT Core Pro Update Control File](https://www.microsoft.com/en-us/download/details.aspx?id=53899) 

When these installations are complete, verify that you have directories called *FMFiles*, *MSPackages*, and *OEMInputSamples* in your computer’s C:\\Program Files (x86)\\Windows Kits\\10 directory.

## <span id="Create_an_image"></span><span id="create_an_image"></span><span id="CREATE_AN_IMAGE"></span>Create an image


You have two options for tools to use to create an image for IoT Core.

-   Create an image with IMGGEN
-   Create an image with Windows Imaging and Configuration Designer (ICD).

Later in this topic, you will also learn how to customize packages, which will require that you create an image using one of these tools. Which tool you use is up to you.

### <span id="Option_One__Create_an_image_with_IMGGEN"></span><span id="option_one__create_an_image_with_imggen"></span><span id="OPTION_ONE__CREATE_AN_IMAGE_WITH_IMGGEN"></span>Option One: Create an image with IMGGEN

The Deployment and Imaging Tools Environment, or IMGGEN, is a command-line alternative to the Image Configuration Designer. Image creation can be automated or completed through scripting using IMGGEN.

1.  Open **Deployment and Imaging Tools Environment** application by typing **Deployment and Imaging Tools Environment**in the Search bar.
2.  Set the following environment variables, in the following order:`SET PATH=%KITSROOT%tools\bin\i386;%PATH%  SET AKROOT=%KITSROOT%`
3.  Execute the following commands based on your device environment:
    -   **Intel Minnowboard Max:**

        `imggen.cmd IoTCore.ffu "%KITSROOT%OEMInputSamples\MBM\ProductionOEMInput.xml" "%KITSROOT%MSPackages" x86`

    -   **Raspberry Pi 2 or Qualcomm Dragonboard:**

        `imggen.cmd IoTCore.ffu "%KITSROOT%OEMInputSamples\RPi2\ProductionOEMInput.xml" "%KITSROOT%MSPackages" arm`

### <span id="Option_Two__Create_an_image_with_Windows_ICD"></span><span id="option_two__create_an_image_with_windows_icd"></span><span id="OPTION_TWO__CREATE_AN_IMAGE_WITH_WINDOWS_ICD"></span>Option Two: Create an image with Windows ICD

To create an IoT Core image with Windows ICD, see [Build and deploy a Windows 10 IoT Core (IoT Core) image](https://msdn.microsoft.com/library/windows/hardware/dn916104).

The following sections describe how to customize the image.

## <span id="Create_customized_OEM_configuration_packages"></span><span id="create_customized_oem_configuration_packages"></span><span id="CREATE_CUSTOMIZED_OEM_CONFIGURATION_PACKAGES"></span>Create customized OEM configuration packages


Regardless of the tool you use to create your image, be it IMGGEN or Windows ICD, you may need to customize packages for the devices you deploy for branding or to enable unique scenarios. The applications, certificates, and settings on a device may need to be configured to match your specifications. This requires custom packages.

### <span id="Create_the_packages"></span><span id="create_the_packages"></span><span id="CREATE_THE_PACKAGES"></span>Create the packages

The process for creating a package is the same for IoT Core as it is for Windows 10 Mobile. Refer to [Creating mobile packages](https://msdn.microsoft.com/library/dn756642) for instructions to create your package.

### <span id="Installing_test_certificates"></span><span id="installing_test_certificates"></span><span id="INSTALLING_TEST_CERTIFICATES"></span>Installing test certificates

OEM test certificates provide a trust relationship to package signatures. They need only be installed once. In order to install the test certificates,

1.  Open the deployment and imaging tools environment (IMGGEN) with administrator privileges.
2.  Set environment variables with the following commands:
    -   `set W10_KITROOT=%ProgramFiles(x86)%\Windows Kits\10`
    -   `set WPDKCONTENTROOT=%W10_KITROOT%`
    -   `set W10_TOOL=%W10_KITROOT%\bin\x86;%W10_KITROOT%\Tools\bin\i386`
    -   `set PATH=%PATH%;%W10_TOOL%;`

3.  Install OEM certificates with the following utility command:

    `Installoemcerts.cmd`

4.  Verify that W10\_KITROOT is set to %ProgramFiles%\\Windows Kits\\10.

### <span id="Author_the_feature_manifest_xml"></span><span id="author_the_feature_manifest_xml"></span><span id="AUTHOR_THE_FEATURE_MANIFEST_XML"></span>Author the feature manifest xml

XML files define the content of each step of the package creation and deployment process. Windows ICD and IMGGEN depend on an OEM Input file, located in the %KITSROOT%OEMInputSamples\[device\] directory (for instance C:\\Program Files (x86)\\Windows Kits\\10\\OEMInputSamples\\MBM ). This OEM Input file refers to a platform feature manifest file. This file contains a list of packages to be included in the created image, and references to additional required or optional OEM feature manifest files. For more information, see [OEMInput file contents](https://msdn.microsoft.com/library/windows/hardware/dn756778). The feature manifest file references the packages and cabinet files (CAB) to be included in the image. For more information, see [Feature manifest file contents](https://msdn.microsoft.com/library/windows/hardware/dn756745). For more information about how packages are used in building images, see [Provisioning packages](https://msdn.microsoft.com/library/windows/hardware/mt147447).

Three OEM feature manifest files for IoT Core are provided as samples in the directories below.

-   **Intel Minnowboard Max** C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\x86\\MBMFM.xml
-   **Raspberry Pi 2** C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\arm\\RPi2FM.xml
-   **Qualcomm Dragonboard 410c** C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\arm\\QCDB410CFM.xml

These manifests contain the following sections:

-   Base package
-   System information package
-   Device information package
-   Device platform package
-   Feature based package

You can add base packages and features packages, which go into the base package and feature based package sections, respectively.

Here is an example OEM feature manifest file.

```
<?xml version="1.0" encoding="utf-8"?> 
<FeatureManifest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
   xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">   
   <BasePackages>      
      <PackageFile Path="$(mspackageroot)\Retail\$(cputype)\$(buildtype)" 
         Name="OEMCoreFeature1.cab" 
         FeatureIdentifierPackage="true"/>      
      <PackageFile Path="$(mspackageroot)\Retail\$(cputype)\$(buildtype)" 
         Name="OEMCoreFeature2.cab" />   
   </BasePackages>   
   <Features>     
      <Microsoft />     
         <MSFeatureGroups />     
      <OEM>
         <PackageFile 
            Path="$(mspackageroot)\Retail\$(cputype)\$(buildtype)" 
            Name="OEMOptionalFeature1.cab"  
            FeatureIdentifierPackage="true">         
            <FeatureIDs>           
               <FeatureID>OEM_OPTIONAL_1</FeatureID>         
            </FeatureIDs>       
         </PackageFile>       
         <PackageFile Path="$(mspackageroot)\Retail\$(cputype)\$(buildtype)" 
            Name="OEMOptionalFeature2.cab" 
            FeatureIdentifierPackage="true">         
            <FeatureIDs>           
               <FeatureID>OEM_OPTIONAL_2</FeatureID>         
            </FeatureIDs>       
         </PackageFile>     
      </OEM>     
   <OEMFeatureGroups />   
   </Features> 
</FeatureManifest>
```

Here are examples of packages that you can include in your IoT Core feature manifest file. In each case, the package must be part of an OEMFM.xml file.

-   Adding a file to an image.
    ```
    <?xml version="1.0" encoding="utf-8"?> 
    <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"    
    Owner="OEMName"    
    OwnerType="OEM"        
    ReleaseType="Test"    
    Platform="PlaformName"    
    Component="ComponentName"    
    SubComponent="SubName">    
       <Components>       
          <OSComponent>          
             <Files>             
                <File Source="$(_RELEASEDIR)\test_file1.dll"/>             
                <File Source="$(_RELEASEDIR)\toBeRenamed.dat"               
                      DestinationDir="$(runtime.system32)\test" Name="test.dat"/>          
             </Files>      
          </OSComponent>    
       </Components> 
    </Package>
    ```

-   Adding a registry setting to an image.
    ```
    <?xml version="1.0" encoding="utf-8"?> 
    <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"    
    Owner="OEMName"    
    OwnerType="OEM"        
    ReleaseType="Test"    
    Platform="PlaformName"    
    Component="ComponentName"    
    SubComponent="SubName">    
       <Components>       
          <OSComponent>          
             <RegKeys>             
                <RegKey KeyName="$(hklm.software)\OEMName\test">                
                   <RegValue Name="StringValue" Value="Test string" Type="REG_SZ"/>                
                   <RegValue Name="DWordValue" Value="12AB34CD" Type="REG_DWORD"/>                
                   <RegValue Name="BinaryValue" Value="12,AB,CD,EF" Type="REG_BINARY"/>             
                </RegKey>             
                <RegKey KeyName="$(hklm.software)\OEMName\EmptyKey"/>          
             </RegKeys>       
          </OSComponent>    
       </Components> 
    </Package>
    ```

-   Adding a driver to an image.
    ```
    <?xml version="1.0" encoding="utf-8"?> 
    <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00"    
    Owner="OEMName"    
    OwnerType="OEM"        
    ReleaseType="Production"    
    Platform="PlaformName"    
    Component="ComponentName"    
    SubComponent="SubName">    
       <Components>     
          <Driver       
          InfSource="$(_RELEASEDIR)\Driver1\driver1.inf">       
             <Reference         
             Source="$(_RELEASEDIR)\Driver1\driver1.sys" />       
             <Files>         
                <File Source="$(_RELEASEDIR)\Driver1\driver1.sys" />       
             </Files>     
          </Driver>    
       </Components> 
    </Package> 
    ```

**Generate the packages**

1.  Add a reference to the OEMFM.xml file in the OEM Input XML file named **RetailOEMInput.xml** for retail devices, or **ProductionOEMInput.xml** for production devices.
2.  The package generator tool (pkggen.exe) generates packages and cabinet files (.CAB) for inclusion in the IoT Core image. This tool is installed by default in %WPDKCONTENTROOT%\\Tools\\bin\\.
3.  Open the **Deployment and Imaging Tools Environment** command prompt with administrator privileges.
4.  Issue the appropriate PKGGEN command for each of the packages to be added to the image.
    -   **PKGGEN for a driver:**`PkgGen SampleDriver.pkg.xml /config:"%WPDKCONTENTROOT%\Tools\bin\i386\pkggen.cfg.xml" /version:1.0.0.0 /cpu:x86 /build:fre /variables:"HIVE_ROOT=%WPDKCONTENTROOT%\CoreSystem"`
    -   **PKGGEN for file or registry entry:**`PkgGen [package project file name] /config:"%WPDKCONTENTROOT%\Tools\bin\i386\pkggen.cfg.xml" /version:1.0.0.0 /cpu:x86 /build:fre`

    **Note**  The /version field of a modified package should always be incremented when running package generator

     

5.  Copy all OEM packages to the directory that maps to your device’s architecture. *For example: C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\x86\\fre*

### <span id="Adding_an_OEM_package_during_image_creation"></span><span id="adding_an_oem_package_during_image_creation"></span><span id="ADDING_AN_OEM_PACKAGE_DURING_IMAGE_CREATION"></span>Adding an OEM package during image creation

To add an OEM package to an IoT Core image as part of the image creation process, complete the following steps:

1.  Author the package as described above and add it to the OEM packages directory for the device's architecture (for instance C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\x86\\fre.
2.  Add a feature manifest file (OEMFM.xml) and copy it to the feature manifest file directory (for instance C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\x86\\)
3.  Add references to the OEM feature manifest file and Feature ID in OEMInputFML.xml under both the Production and Retail folders.
4.  Create a new image as described above using either Windows ICD or IMGGEN.

### <span id="Adding_OEM_Packages_to_a_deployed_image_at_runtime"></span><span id="adding_oem_packages_to_a_deployed_image_at_runtime"></span><span id="ADDING_OEM_PACKAGES_TO_A_DEPLOYED_IMAGE_AT_RUNTIME"></span>Adding OEM Packages to a deployed image at runtime

To add an OEM package to an IoT Core image as part of the image creation process, complete the following steps:

1.  Copy the package to the device
2.  Connect to the device via SSH or Powershell
3.  Run these commands

    `ApplyUpdate.exe -stage C:\OEM\Package1.cab`

    `ApplyUpdate.exe -commit`

The device will reboot into the Update OS, complete the installation, and then reboot back to the main OS. Depending on the package size, this step can take up to 10 minutes.

### <span id="Adding_OEM_FM_file_and_optional_features_to_the_OEM_Input_XML"></span><span id="adding_oem_fm_file_and_optional_features_to_the_oem_input_xml"></span><span id="ADDING_OEM_FM_FILE_AND_OPTIONAL_FEATURES_TO_THE_OEM_INPUT_XML"></span>Adding OEM FM file and optional features to the OEM Input XML

There are two sample features manifest files installed as part of IoT Core Kits. You can find them here.

-   C:\\Program Files (x86)\\Windows Kits\\10\\OEMInputSamples\\MBM\\ProductionOEMInput.xml
-   C:\\Program Files (x86)\\Windows Kits\\10\\OEMInputSamples\\MBM\\RetailOEMInput.xml

### <span id="Authoring_OEM_Customization_Packages"></span><span id="authoring_oem_customization_packages"></span><span id="AUTHORING_OEM_CUSTOMIZATION_PACKAGES"></span>Authoring OEM Customization Packages

The OEMCustomization.cmd utility allows customization at device boot time. During each boot sequence, this script file is invoked as a result of a scheduled task. The OEMCustomization.cmd script file is not present in the image by default, and needs to be authored by the OEM. The customizations below are allowed and suggested:

1.  Activate a user with Administrator-level privileges on the device Net user Administrator "\[insert desired Administrator password\]" /active:yes by authoring OEMCustomization.cmd. You'll have to create a password to replace "\[insert desired Administrator password\]" in the code example below.

    ```
    ::OEM CUSTOMIZATION Script File
    ::Enable Administrator Password
    net user Administrator "[insert desired Administrator password]" /active:yes
    ```

2.  Enable OEM application installation.
    ```
    ::Enable Application Installation
    call c:\OEM\AppInstall.bat
    ```

3.  Author the OEMCustomization.pkg.xml to point to the OEMCustomization.cmd script.
    ```
    <?xml version="1.0 encoding="utf-8"?>
    <Package
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:xsd="http://www.w3.org/2001/SMLSchema"
      Owner="OEM"
      Component="OEMApp1"
      OwnerType"OEM"
      ReleaseType="Production"
      xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00">
      <Components>
        <OSComponent>
          <Files>
            <File Source="C:\OEM\OEMCustomization.cmd" />
          </Files>
        </OSComponent>
      </Component>
    </Package>
    ```

4.  Create the CAB File for the package using pkggen.exe.
5.  Enable Bitlocker.

## <span id="OEM_apps"></span><span id="oem_apps"></span><span id="OEM_APPS"></span>OEM apps


To help get you started writing apps for IoT Core, we've uploaded some batch files to GitHub. You'll need to download those files from <https://github.com/ms-iot/content/blob/develop/en-US/Samples/AppInstaller.md>

1.  Copy these files to the C:\\OEM directory on your development compute.
    **Note**  Files from GitHub may not display in a friendly format for notepad and may need to be opened in a development environment like Visual Studio.

     

2.  Copy the APPX and CET files to C:\\OEM.
3.  Edit the AppInstall.bat script file
    -   Set defaultappx = \[your appx’s file name\]
    -   Set certslist = \[your appx’s certificates’ names\] (multiple certificates may be added, separated by a space)

4.  Edit the DeployApp.bat file
    -   Set defaultappx = \[your appx’s file name\]
    -   Set defaultappid = \[your appx’s ID\]
    -   Set depenencylist = \[include this if your appxes have dependencies that are required to be installed prior to your appx. Multiple dependency names are allowed, separated by space.

    **Note**  Note: OEMs must choose an application that runs on the device "out-of-the-box", by default. This application will never be updated. The operating system needs to switch back to the OOBE for this installation to ensure there is no resource conflict during the application’s installation or update

     

5.  Author the application package, called OEMApp.pkg.xml, as in the following example.

    ```
    <?xml version="1.0 encoding="utf-8"?>
    <Package
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:xsd="http://www.w3.org/2001/SMLSchema"
      Owner="Oem"
      Component="OEMApp1"
      OwnerType"OEM"
      ReleaseType="Production"
      xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00">
      <Components>
        <OSComponent>
          <Files>
            <File Source="C:\OEM\AppInstall.bat" DestinationDir="C:\Windows\AppInstall"/>
            <File Source="C:\OEM\DeployAppx.bat" DestinationDir="C:\Windows\AppInstall"/>
            <File Source="C:\OEM\OEMApp1.appx" DestinationDir="C:\Windows\AppInstall"/>
            <File Source="C:\OEM\OEMApp1.cer" DestinationDir="C:\Windows\AppInstall"/>
          </Files>
        </OSComponent>
      </Component>
    </Package>
    ```

6.  Place the created files and related resources in directories of the development device as follows:
    -   **C:\\Windows\\appinstall:**
        -   appx
        -   dependency appx(s)
        -   temp appx (optional)
        -   certificate(s)
        -   AppInstall.bat
        -   DeployApp.bat
    -   **C:\\Winodws\\system32:**
        -   Oemcustomization.cmd

7.  Restart the device. The specified appx will be installed automatically when the device restarts.

### <span id="Image-time_configurations"></span><span id="image-time_configurations"></span><span id="IMAGE-TIME_CONFIGURATIONS"></span>Image-time configurations

The following are examples of configuration settings you may want to include in your OEMImageCustomization.cmd.

-   Headless configuration

    `call reg add HKEY_LOCAL_MACHINE\SYSTEM\currentcontrolset\control\wininit /v Headless /t REG_DWORD /d 1 /f`

-   Crash dump configuration

    `call reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl /v AutoReboot /t REG_DWORD /d 1 /f`

    `call reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl /v CrashDumpEnabled /t REG_DWORD /d 1 /f`

    `call reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl /v DedicatedDumpFile /t REG_SZ /d c:\1.sys /f`

    `call reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl /v DumpFile /t REG_EXPAND_SZ /d c:\1.dmp /f`

    `call reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl /v DumpFileSize /t REG_DWORD /d 600 /f`

### <span id="Run-time_configurations"></span><span id="run-time_configurations"></span><span id="RUN-TIME_CONFIGURATIONS"></span>Run-time configurations

The allowed runtime settings listed below should be included in a provisioning package generated with Windows ICD. These settings must be included in a single provisioning package and the provisioning package should be wrapped into a single OEM package.

-   Certificates
-   Firewall configuration
-   Startup app
-   Edition upgrade
-   Policies update

## <span id="Configuring_IoT_Core_update_settings"></span><span id="configuring_iot_core_update_settings"></span><span id="CONFIGURING_IOT_CORE_UPDATE_SETTINGS"></span>Configuring IoT Core update settings


To configure an image to receive only OS updates, you must configure generic POP packages. Generic POP packages exist in the following locations; replace them with the examples from the list below.

-   **Intel Minnowboard Max**
    -   C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\X86\\fre\\Intel.Generic.DeviceInfo.cab
    -   C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\X86\\fre\\Intel.Generic.DeviceTargetingInfo.cab
    -   Replace with: C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\x86\\MBMFM.xml
-   **Raspberry Pi 2**
    -   C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\ARM\\fre\\ RASPBERRYPI.Generic.DeviceInfo.cab
    -   C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\ARM\\fre\\ RASPBERRYPI.Generic.DeviceTargetingInfo.cab
    -   Replace with: C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\arm\\RPi2FM.xml
-   **Qualcomm Dragonboard 410c**
    -   C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\ARM\\fre \\Qualcomm.Generic.DeviceInfo.cab
    -   C:\\Program Files (x86)\\Windows Kits\\10\\MSPackages\\Retail\\ARM\\fre \\Qualcomm.Generic.DeviceTargetingInfo.cab
    -   Replace with: C:\\Program Files (x86)\\Windows Kits\\10\\FMFiles\\arm\\QCDB410CFM.xml

## <span id="Creating_an_enterprise_IoT_Core_UAP_provisioning_package"></span><span id="creating_an_enterprise_iot_core_uap_provisioning_package"></span><span id="CREATING_AN_ENTERPRISE_IOT_CORE_UAP_PROVISIONING_PACKAGE"></span>Creating an enterprise IoT Core UAP provisioning package


To create an enterprise provisioning package that you can deploy to a IoT Core device, follow these steps.

1.  Download the IoT Core license file to the development device. More information about this step can be found at [IoT Core Commercialization](https://www.windowsforiotdevices.com/).
2.  Create a new provisioning package containing a license file by selecting "New provisioning package" in Windows ICD, as in the following image, and then click **Next.**![Screenshot shows ICD, with "New provisioning package" highlighted.](images/icdappmanager.png)
3.  In the **Enter Project Details** window, enter a **Name**, **Project folder**, and optionally a **Description** of the provisioning package, then click **Next**.
4.  In the **Select Windows Edition** window, select IoT Core, then click **Next**.
5.  In the optional **Import a provisioning package** window, click **Finish.**
6.  In the **Customizations** page, add the [upgradeeditionwithlicense](https://msdn.microsoft.com/library/windows/hardware/mt573160.aspx) customization. this customization provides a license for an edition upgrade of iot core devices. ![Screenshot shows ICD Available customizations, including the Runtime settings: EditionUpgrade: UpgradeEditionWithLicense, with the filename iotuapcommercial.xml entered.](images/upgadeeditionwithlicense.png)
7.  Export the provisioning package by clicking the **Export** dropdown in the main menu, then selecting **Provisioning Package**, adding the required package information and specify options for the package. Click **Next** and then specify where the package will be saved.
8.  Click **Build** to start building the image. The project information is displayed in the build page and the progress bar indicates the build status. If you need to cancel the build, click **Cancel**. This cancels the current build process, closes the wizard, and takes you back to the **Customizations** Page.

    During the image build process, a lot of what's happening during the build process is shown in the build output window. This window shows:

    -   Warnings that might appear while the image is building.
    -   Verbose build messages to indicate the phases within the image build process.
    -   Error messages such as when the input files have schema errors or when the image fails to build.

    If your build fails, an error message will be displayed. You can review the build log to identify the issue by clicking View in Notepad.

    If your build is successful, the name of the image and its location will be displayed.

9.  Create an OEM package, and wrap the newly created provisioning package in the OEM package, as in the following example:
    ```
    <?xml version="1.0" encoding="utf-8"?>
    <Package
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:xsd:"http:///www.w3.org/2001/XMLSchema"
       Owner="OEM"
       Component="Enterprise"
       SubComponent="ProvisioningPackage"
       OwnerType="OEM"
       ReleaseType="Production"
       xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00">
       <Components>
          <OSComponent>
             <Files>
                <File Source="C:\ICD\EnterpriseSKU\EnterpriseProvisioningPkg.ppkg" DestinationDir="C:\OEM" />
             </Files>
          </OSComponent>
       </Components>
    </Package>
    ```

10. The last step is to build a new IoT Core image with IMGGEN or Windows ICD and add the provisioning package as described in [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107).

## <span id="related_topics"></span>Related topics


[Download Windows 10 IoT Core](https://developer.microsoft.com/windows/iot/downloads)

 

 



