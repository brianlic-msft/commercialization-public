---
title: Build a mobile image using ImgGen.cmd
description: You can use ImgGen.cmd to generate an image for a Windows 10 Mobile device that is based on your own hardware design or if you're using MCSF customization answer files and other assets that were generated using the legacy tools that shipped in Windows Phone 8.1.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 284a2ca2-d973-44a4-9e6c-5caebc088c75
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Build a mobile image using ImgGen.cmd


You can use ImgGen.cmd to generate an image for a Windows 10 Mobile device that is based on your own hardware design or if you're using MCSF customization answer files and other assets that were generated using the legacy tools that shipped in Windows Phone 8.1.

Here's the high-level view of the steps you'll take to build an image using ImgGen.cmd:

1.  Identify the packages to include in the image. For more info, see [Getting packages for the image](#gettingpackages).

2.  Reference the packages by adding them to one or more feature manifest files, and save those files in the root directory for Microsoft packages, for example, %WPDKCONTENTROOT%\\MSPackages. For more info, see [Specifying packages to include in images by using feature manifest files](#specifyingpackagestoinclude).

3.  For each device platform, do the following:

    1.  Create a *device platform package*, and save it in the root directory for Microsoft packages. For more info, see [Set device platform information](set-device-platform-information.md).

    2.  Reference the device platform package in a feature manifest file by using the **OEMDevicePlatformPackages** element.

        You can include several device platforms in a feature manifest file. The OEMInput file will specify which device to use by its DeviceName.

        Image creation will fail unless a valid device platform package is specified for the image.

4.  Create an *OEMInput file* that specifies the device platform, the feature manifest files, and other attributes used to define the image. For more info, see [Creating an OEMInput file to define the image](#adding).

5.  Create an MCSF customization answer file. At minimum, specify the required device platform information and the information required for the mobile operator network. For more info, see [Customization answer file](https://msdn.microsoft.com/library/windows/hardware/dn757452) and [Phone metadata in DeviceTargetingInfo](https://msdn.microsoft.com/library/windows/hardware/dn772214).

    **Note**  If you want to support multivariant settings in the answer file, the same set of conditions are supported in MCSF as in Windows provisioning. See the section *Target, TargetState, Condition and priorities* in [Create a provisioning package with multivariant settings](https://msdn.microsoft.com/library/windows/hardware/dn916108) for a list of supported conditions but be sure to follow the schema for a MCSF customization answer file when you specify your **Targets** in the answer file.

     

6.  Run the ImgGen.cmd to build the image. For more info, see [Using ImgGen.cmd to generate the image](#usingimggen) below.

7.  Sign the image so that it can be flashed to a device. For more info, see [Sign a full flash update (FFU) image](sign-a-full-flash-update--ffu--image.md).

## <a href="" id="gettingpackages"></a>Getting packages for the image


Before building an image, you must first identify all the packages you need for the image. Generally, there are three categories of packages that are used to build an image:

-   **Microsoft packages**. These include all OS and Microsoft-implemented driver packages required for any image, as well as additional platform-specific driver and firmware packages (for example, packages for components specific to a particular device resolution or SoC). These packages are included with the MobileOS and must be installed under %WPDKCONTENTROOT%\\MSPackages. You can use the following command to display the current value of WPDKCONTENTROOT.

    ``` syntax
    ECHO %WPDKCONTENTROOT%
    ```

    Feature manifest files abstract the location and groupings of packages that Microsoft provides. This allows for the specification of a group of related packages by specifying a single feature name. For example, specifying the TESTINFRASTRUCTURE feature includes multiple packages that support test execution. For more info, see [Optional features for building images](optional-features-for-building-images.md).

-   **SoC vendor packages**. These include packages for drivers and firmware components implemented by the SoC vendor. For more info about these packages, refer to documentation provided by the SoC vendor.

    **Note**  
    Several UEFI packages are required from the SoC vendor to create bootable images. These packages vary depending on the layout of the device and the SoC vendor. Most of the packages populate binary partitions on the device. For more info about creating binary partition packages to populate these partitions, see [Specifying components in a package project file](https://msdn.microsoft.com/library/windows/hardware/dn789218). The EFI system partition (ESP) is populated using Microsoft content and OEM content.

     

-   **OEM packages**. These are packages created by OEMs for content such as drivers and applications. For info about creating packages, see [Creating packages](creating-mobile-packages.md).

## <a href="" id="adding"></a>Creating an OEMInput file to define the image


To define the image, you must create an *OEMInput* file. This is an XML file that specifies the following:

-   The type of image to generate. For example, you specify whether the image contains only Microsoft production packages or a mixture of production and test packages in the **ReleaseType** element, and you specify what screen resolution the image will support in the **Resolution** element.

    **Note**  
    OEMs have some control over what Microsoft packages are included in the image by choosing different values for the **ReleaseType** element or by referencing Microsoft-defined features under the **Features** element. For more info, see [Specifying packages to include in images by using feature manifest files](#specifyingpackagestoinclude) later in this topic.

     

-   The OEM packages to include in the image. To specify which OEM packages are included in the image, create a *feature manifest* file and reference this in the OEMInput file. For more info, see [Specifying packages to include in images by using feature manifest files](#specifyingpackagestoinclude) later in this topic.

For a full list of the supported elements in the OEMInput file, see [OEMInput file contents](oeminput-file-contents.md).

OEMs should use sample OEMInput files included with the MobileOS as the starting point for their own images. These sample files provide the starting configuration for a set of standard image types, including retail, production, test, and manufacturing images. OEMs should extend each file with the packages that contain the drivers, applications, and other components needed for their specific device. These sample files are available under %WPDKCONTENTROOT%\\OEMInputSamples. For guidance about how maintain an OEMInput file so that the latest changes to the Microsoft sample files can be integrated into it, see [Configuring the OEMInput file to integrate feature changes from the Microsoft samples](#configuringtheoeminputfile) later in this topic.

OEMs should contact the SoC vendor for the feature manifest files that are used for a specific device and include these in the OEMInput file.

**Note**  
The OEMInput XML file supports explicit paths and environment variables. If you use environment variables in paths to packages and other files, the environment variables will be expanded when the OEMInput XML file is processed by the imaging tool. The sample files included with the MobileOS use the %WPDKCONTENTROOT% environment variable in some of the paths.

 

### Image types

The following table lists the types of images OEMs can build and the OEMInput sample to use as the starting configuration for each image type.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Image type</th>
<th>Description</th>
<th>OEMInput sample</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Retail</p></td>
<td><p>Retail images are the images that are flashed to final retail phones. Retail images must use Microsoft-signed packages that are returned to OEMs after submitting production images to Microsoft by using the OEM submission tool. For more info, see [Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223).</p>
<p>Retail images include the following:</p>
<ul>
<li><p>Production version of core Windows components included in Windows 10 Mobile</p></li>
<li><p>Production Windows 10 Mobile components.</p></li>
</ul></td>
<td><p>RetailOEMInput.xml</p></td>
</tr>
<tr class="even">
<td><p>Production</p></td>
<td><p>Production images are similar to final retail images, but they have test signing enabled to run OEM-signed components as well as production-signed components, and they may contain test-related packages as well as production packages. Production images can be used for engineering work as well as mobile operator trials and other certification processes. Production images are submitted to Microsoft by using the OEM submission tool to be production signed by Microsoft before generating the final retail image. For more info, see [Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223).</p>
<p>Production images include the following:</p>
<ul>
<li><p>Production version of core Windows components included in Windows 10 Mobile.</p></li>
<li><p>Production Windows 10 Mobile components.</p></li>
<li><p>Test signing enabled.</p></li>
</ul></td>
<td><p>ProductionOEMInput.xml</p></td>
</tr>
<tr class="odd">
<td><p>Test</p></td>
<td><p>Test images can be run in offsite test labs to test the functionality of the OS and drivers on a device. Test images include the following:</p>
<ul>
<li><p>Test version of core Windows components included in Windows 10 Mobile.</p></li>
<li><p>Production Windows 10 Mobile components.</p></li>
<li><p>Test signing enabled.</p></li>
<li><p>Test applications, drivers, and other components to use for testing the OS in different conditions.</p></li>
</ul>
<div class="alert">
<strong>Note</strong>  
<p>To generate an image that includes OS tools such as ipconfig.exe, kill.exe, ping.exe, minshutdown.exe, reg.exe, tracelog.exe, sc.exe, and tlist.exe, build a test image.</p>
</div>
<div>
 
</div></td>
<td><p>TestOEMInput.xml</p></td>
</tr>
<tr class="even">
<td><p>Health</p></td>
<td><p>Health images to be run in offsite test labs to test the power and performance capabilities of the device. Health images are similar to production images, with the addition of components for running tests related to power and performance.</p></td>
<td><p>HealthOEMInput.xml</p></td>
</tr>
<tr class="odd">
<td><p>Manufacturing</p></td>
<td><p>Manufacturing images to be used in the manufacturing environment. For more info, see [MMOS image definition](mmos-image-definition.md).</p></td>
<td><p>MfgOEMInput.xml</p></td>
</tr>
<tr class="even">
<td><p>Customer care</p></td>
<td><p>Customer care images include MMOS for retail customer care scenarios. For more info, see [MMOS image definition](mmos-image-definition.md).</p></td>
<td><p>CustomerCareOEMInput.xml</p></td>
</tr>
</tbody>
</table>

 

### OEMInput file example

The following example shows the contents of a sample ProductionOEMInput.xml file.

``` syntax
<?xml version="1.0" encoding="utf-8" ?> 
<OEMInput xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">
<Description>Test FFU generation for {SOC TYPE} with build number XXXXX</Description> 
<SOC>{PROCESSOR_NAME}</SOC> 
<SV>{SV_NAME}</SV> 
<Device>{DEVICE_NAME}</Device> 
<ReleaseType>Test</ReleaseType> 
<BuildType>fre</BuildType> 
<SupportedLanguages>
  <UserInterface>
      <Language>en-US</Language> 
  </UserInterface>
  <Keyboard>
     <Language>en-US</Language> 
  </Keyboard>
  <Speech>
    <Language>en-US</Language> 
  </Speech>
</SupportedLanguages>
<BootUILanguage>en-US</BootUILanguage> 
<BootLocale>en-US</BootLocale> 
<Resolutions>
  <Resolution>480x800</Resolution> 
</Resolutions>
<AdditionalFMs>
  <AdditionalFM>%WPDKCONTENTROOT%\FMFiles\MSOptionalFeatures.xml</AdditionalFM> 
  <!-- Add OEM FM files here -->
</AdditionalFMs>
<Features>
  <Microsoft>
    <Feature>CODEINTEGRITY_TEST</Feature> 
    <Feature>PRODUCTION_CORE</Feature> 
    <Feature>BOOTKEYACTIONS_RETAIL</Feature> 
  </Microsoft>
<!-- Insert OEM\SOC features here
  <OEM>
    <Feature>xxx</Feature>
  </OEM>
-->
</Features>
</OEMInput>
```

### <a href="" id="specifyingpackagestoinclude"></a>Specifying packages to include in images by using feature manifest files

Feature manifest files specify a set of features, packages, and apps that are available when building images. The OEMInput.xml file later selects the desired features from within these feature manifests to be included in the image.

In addition to a core set of Microsoft packages that are added to every image, there are additional packages that are added only for certain types of images. For example, a test image includes a different set of Microsoft packages than a production image.

The set of packages that are included in certain types of images is controlled by using feature manifest files. Feature manifests provide an extensible infrastructure for adding sets of optional packages to different types of image builds. The WDK includes a feature manifest named MSOptionalFeaturesFM.xml, and OEMs can also create their own. Feature manifests are referenced in the **AdditionalFMs** element of the OEMInput XML file. For more info about the contents of a feature manifest, see [Feature manifest file contents](feature-manifest-file-contents.md).

When the OEMInput XML file references a feature manifest, there are several ways that additional optional packages are included in the image:

-   Any packages listed under the **BasePackages** element in the feature manifest file are automatically included in the image.

-   Other packages listed in the feature manifest file under elements such as **ReleasePackages** and **DeviceSpecificPackages** are included if the image definition matches the parameters specified by the elements in the feature manifest file. For example, if the feature manifest file lists a package under the **ReleasePackages** element where the release type is **Test**, the package is included only if the OEMInput file is configured to generate a test image.

-   Any optional features defined in the feature manifest can be referenced in the OEM or Microsoft **Features** elements in the OEMInput file to add additional optional packages. A feature is a string that identifies one or more optional packages that can be included in an image. Usually, a feature identifies a set of packages that are associated with a specific component or feature area. For more info about optional features provided by Microsoft for use in OEMInput files, see Optional features for building images.

-   Depending on who will be working with the image, it may be appropriate to exclude prerelease features using the **ExcludePrereleaseFeatures** element. For more info, see [OEMInput file contents](oeminput-file-contents.md).

### <a href="" id="configuringtheoeminputfile"></a>Configuring the OEMInput file to integrate feature changes from the Microsoft samples

In any MobileOS release, the OEMInput samples provided by Microsoft may change from the previous release. For example, Microsoft-defined features may be added to a sample to incorporate new OS components that are available, or Microsoft-defined features may be removed from a sample if they are no longer supported for a certain image type. To ensure that OEMs are building the correct images for every MobileOS release, Microsoft recommends that OEMs adhere to the following process.

1.  Structure the **AdditionalFMs** and feature-related elements in the OEMInput file as shown in the following example. In each section, include the feature manifests and features specified by the Microsoft sample first, and then include the OEM-specified feature manifests and features. Use comments to clearly separate each set of feature manifests and features, and to clearly explain why each OEM-specific feature is included in the file.

    If the contents of the **AdditionalFMs** and **Features** elements in the OEMInput file deviate from the Microsoft samples, include detailed comments that explain why the changes were made. If any changes are introduced as a temporary workaround for an issue, the temporary workaround should be explained so that engineers using the file in the future can determine whether to keep the change or revert to the Microsoft sample when the OEM integrates a newer BSP or kit.

    ``` syntax
    <!-- From Microsoft sample OEMInput.xml file -->
    <AdditionalFMs>
      <AdditionalFM>%WDKCONTENTROOT%\FMFiles\MSOptionalFeatures.xml</AdditionalFM> 
        <!-- Add OEM FM files here -->
    </AdditionalFMs>

    <Features>
       <Microsoft>
        <!-- Features from Microsoft OEMInput sample -->
        <!-- Additional OEM-selected features defined by Microsoft
             Include detailed comments about why each feature was chosen for this image -->
       </Microsoft>
       <OEM>
        <!-- Additional OEM-selected features defined by the OEM
             Include detailed comments about why each feature was chosen for this image  -->
       </OEM>
    </Features>
    ```

2.  When the OEM integrates a new WDK and MobileOS release, compare the **Features** elements in the OEMInput sample from the latest release against the same elements in the OEMInput file created by the OEM.

3.  Identify any changes to the Microsoft-specified features in the latest sample, and port the changes into the **Features** element in the OEMInput file created by the OEM.

## <a href="" id="usingimggen"></a>Using ImgGen.cmd to generate the image


ImgGen.cmd is a command file that runs the imaging tool (ImageApp.exe) with the appropriate parameters to create an FFU image. ImgGen.cmd also runs a utility application, DeviceNodeCleanup, after every run of ImageApp.exe. Running DeviceNodeCleanup helps ensure that the registry on the development computer remains clean and boot time does not increase. ImgGen.cmd and other related components are located in %WPDKCONTENTROOT%\\Tools\\bin\\i386.

To use ImgGen.cmd to generate an image:

1.  Configure your development computer as follows:

    -   Open a **Developer Command Prompt for VS2013** window (if you have installed Visual Studio 2013) or a **Command Prompt** window (if you have not installed Visual Studio 2013) as an administrator.

    -   Confirm that the TEMP environment variable refers to a directory that is not compressed or encrypted using the Encrypting File System (EFS) functionality. If the directory that the TEMP environment variable refers to does not meet these requirements and you do not want to modify the variable or the directory properties, you can alternatively create a BINARY\_ROOT environment variable and set it to an existing directory that also meets these requirements. If neither of these locations exist, or if they exist but are compressed or encrypted, the image cannot be generated and the ImageApp.exe tool will return an error.

    -   If you are running Windows 8.1, complete the additional steps to set the USN journal registry size to 1 Mb on the build PC.

        1.  Change the USN minimum size registry key by running the following command from an administrator command prompt:

            ``` syntax
            reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem  /v NtfsAllowUsnMinSize1Mb  /t REG_DWORD  /d 1
            ```

        2.  Reboot the PC before you build an image.

2.  In the command prompt window, run ImgGen.cmd by using the following syntax. See the following section for more information about the parameters.

    ``` syntax
    ImgGen.cmd OutputFile OEMInputXML MSPackageRoot OEMCustomizationXML OEMCustomizationVer
    ```

### Command-line syntax for ImgGen.cmd

The following table describes the command line parameters for ImgGen.cmd.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>OutputFile</em></p></td>
<td><p>The name of the FFU file to be created. If you do not include a path, the FFU file will be created in the current directory. If you include a path, the specified path must already exist. FFU files use the ffu file extension.</p></td>
</tr>
<tr class="even">
<td><p><em>OEMInputXML</em></p></td>
<td><p>The name of the OEMInput xml file that defines the image to be created. If this file is not in the current directory, you must include the path to the file.</p></td>
</tr>
<tr class="odd">
<td><p><em>MSPackageRoot</em></p></td>
<td><p>The path to the root directory that contains the Microsoft packages. By default, this directory is %ProgramFiles(x86)%\Windows Kits\10\MSPackages (or the corresponding path under %ProgramFiles% on computers running a 32-bit version of Windows).</p></td>
</tr>
<tr class="even">
<td><p><em>OEMCustomizationXML</em></p></td>
<td><p>The path to the OEM customization XML file. For more info about customization answer files, see <a href="https://msdn.microsoft.com/library/windows/hardware/dn75745">Customization answer file</a>
</tr>
<tr class="odd">
<td><p><em>OEMCustomizationVer</em></p></td>
<td><p>The version number that will be used for the generated OEM customization package.</p></td>
</tr>
</tbody>
</table>

 

### Usage samples

The following sample shows the basic use of ImgGen.cmd.

``` syntax
ImgGen Flash.ffu OEMInput.xml "%WPDKCONTENTROOT%\MSPackages" OEMCustomization.XML 8.1.0.1
```

### Output files

After an image is successfully generated in the folder specified by the *FFU\_file* command-line argument, the imaging tools copy the following files to the folder of the output FFU file:

-   &lt;*FFUName*&gt;.ImageApp.log: This file contains all the logging information about creating the image. Any failures are reported in this file as well as the Console window.

-   &lt;*FFUName*&gt;.UpdateOutput.xml: This file describes each of the packages applied to the image.

-   &lt;*FFUName*&gt;.UpdateHistory.xml: This file contains a list of all the update and imaging events that have occurred on the image.

-   &lt;*FFUName*&gt;.UpdateInput.xml: This file lists all of the packages that are included in the image.

-   &lt;FFUName&gt;.PackageList.xml: This is a list of the package files contained in the image.

-   &lt;FFUName&gt;.cat: This is a code signing catalog that can be used to sign the image. For more info see, [Sign a full flash update (FFU) image](sign-a-full-flash-update--ffu--image.md).

If a customization answer file is provided, this file is generated:

-   &lt;Owner&gt;.&lt;DeviceName&gt;.Customizations.&lt;Partition&gt;.spkg

If any of the customizations include static applications, the following file will be generated.

-   &lt;Owner&gt;.&lt;DeviceName&gt;.CustomizationsApps.spkg

## Generating customization packages without creating an image


To process a customization answer file without creating an image, use **CustomizationGen.cmd**. CustomizationGen.cmd applies all of the customization rules and builds the customization packages. It skips the final step of building the ffu image. The syntax is similar to ImgGen.cmd.

For example, to process an answer file and just build customization packages, use this command.

``` syntax
CustomizationGen.cmd C:\OEMCustomization OEMInput.xml "%WPDKCONTENTROOT%\MSPackages" OEMCustomization.XML 8.0.0.1
```

### Command-line syntax for CustomizationGen.cmd

The following table describes the command line parameters for CustomizationGen.cmd. All of the arguments are required.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>OutputDirectory</em></p></td>
<td><p>The path to the output directory for the OEM customization packages that will be created.</p></td>
</tr>
<tr class="even">
<td><p><em>OEMInputXML</em></p></td>
<td><p>The name of the OEMInput xml file that defines the image to be created. If this file is not in the current directory, you must include the path to the file.</p></td>
</tr>
<tr class="odd">
<td><p><em>MSPackageRoot</em></p></td>
<td><p>The path to the root directory that contains the Microsoft packages. By default, this directory is %ProgramFiles(x86)%\Windows Kits\10\MSPackages (or the corresponding path under %ProgramFiles% on computers running a 32-bit version of Windows).</p></td>
</tr>
<tr class="even">
<td><p><em>OEMCustomizationXML</em></p></td>
<td><p>The path to the OEM customization XML file.</p></td>
</tr>
<tr class="odd">
<td><p><em>OEMCustomizationVer</em></p></td>
<td><p>This is the version number that will be used for the generated OEM customization package.</p></td>
</tr>
</tbody>
</table>

 

## Large scale image generation recommendations


When images are repeatedly generated on a workstation, it is possible that virtual hard disk (VHD) manipulation errors can occur from time to time. If these errors occur, you can rerun the image generation process. All intermediate files should be automatically cleaned up by ImageApp. This section provides guidance for the configuration of PCs that will generate images in a large scale automated image generation environment to minimize the number of errors that may occur.

To generate a large volume of images, consider the following recommendations:

-   Remove or disable the antivirus software on the image generation PC. The presence of antivirus software, and in particular file system filters often used to monitor activity, can have a major impact on the image generation process. At a minimum, virus scanning should be disabled on input and output directories and on all processes involved in the build, though this will typically not disable the file system filter of interest. Some vendors of antivirus software may offer settings to allow scanning activities to be delayed or scheduled to possibly lessen the impact on the image generation process. If additional safeguards are in place to isolate the system from viruses and other software risks, remove or disable the virus software on the image generation PC. Temporarily removing the virus software can help isolate the impact on the image generation process to determine if further investigation is warranted.

-   Windows Server 2012 is used in the Microsoft labs and is recommended. The server should be configured for maximum file I/O performance.

-   The image creation process should not be run on virtual machines (VMs), but on physical machines instead.

-   All other services (such as print or HTTP services) that are unrelated to the file system should be disabled on the server.

-   System activity traces may be able to help identify processes on build machines that are interacting with mounted VHDs. Any interactions that are not initiated by imaging tools should be avoided if possible, potentially by disabling services that take action on disk mount.

-   The output drives on the PC should have write cache buffer flushing disabled. There is some risk in using this setting on a file server, but with image generation, this setting can be acceptable, as the imaging data can be re-created if a power loss occurs. If other data cannot be re-created on the server, use this setting with caution, because data can become corrupted.

## Related topics


[Building and flashing mobile images](building-and-flashing-images.md)

[OEMInput file contents](oeminput-file-contents.md)

[Sign a full flash update (FFU) image](sign-a-full-flash-update--ffu--image.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Build%20a%20mobile%20image%20using%20ImgGen.cmd%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





