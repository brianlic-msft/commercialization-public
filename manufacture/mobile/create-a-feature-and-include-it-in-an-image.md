---
title: Create a feature and include it in an image
description: This topic shows you how to create a feature and add it to an image.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 85aea68e-0031-4353-9295-38d1c5d3928c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a feature and include it in an image


This topic shows you how to create a feature and add it to an image.

## <a href="" id="process-overview---adding-a-test-app-feature"></a>Process overview – adding a test app feature


To create a feature and add it to an image, you must complete the following steps.

1.  Generate the package that contains the test app.

2.  Create the feature manifest file that references the package.

3.  Add the feature manifest file and the test app feature to the OEMInput.xml file.

4.  Generate the image, sign the image, and flash it to the device.

5.  Verify that the feature works as expected.

![oem\-feature\-creation\-packaging\-scenario](images/oem-feature-creation-packaging-scenario.png)

## <a href="" id="walkthrough---adding-a-test-app-to-a-test-image"></a>Walkthrough – adding a test app to a test image


This section reviews the steps that you need to perform to add a test app to a test image. Before you can start this walkthrough, you must first create a simple test app. After the app is created, you can continue with this walkthrough.

### Generate the test app package

This walkthrough assumes that you have already created a test app named *TestApplication.exe*. Generate a package that contains this app by completing the following steps.

1.  Create a directory called *TestApplication* and copy the TestApplication.exe file that you created in Visual Studio, to that directory.

2.  Create a text file named *TestApplication.pkg.xml* that contains the following package definition XML.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?> 
      <Package xmlns="urn:Microsoft.WindowsPhone/PackageSchema.v8.00" Owner="Contoso" 
    OwnerType="OEM" 
    ReleaseType="Test" 
    Platform="DCD600" 
    Component="TestApps" 
    SubComponent="TestApplication"
    Partition="Data">

     <Macros>
      <Macro Id="testDir" Value="\test" /> 
     </Macros>
     
     <Components>
       <OSComponent>
         <Files>
           <File Source="TestApplication.exe" DestinationDir="$(testDir)" /> 
         </Files>
       </OSComponent>
      </Components>
    </Package>
    ```

    You can update the owner and platform attributes to match the name of your organization name and the name of your device. These attribute changes will modify the name of the generated package.

    The &lt;Macro&gt; element is used to specify the *\\data\\test* destination directory on the device.

3.  Open an administrator command prompt window to build the package.

4.  Display the environment variables by typing **SET** in the command prompt window. Look for *WPDKCONTENTROOT* to confirm that the build environment is properly configured.On a Windows 64-bit PC, the path should look similar to the following.

    ``` syntax
    ...
    WPDKCONTENTROOT=C:\Program Files (x86)\Windows Phone Kits\10
    ```

5.  Generate the package using PkgGen. Provide the version number of 1.0.0.0. The /config parameter points to the location of the pkggen.cfg.xml file.

    ``` syntax
    C:\TestApplication>PkgGen TestApplication.pkg.xml /version:1.0.0.0 /config:" %WPDKCONTENTROOT% \Tools\bin\i386\pkggen.cfg.xml"
    ```

6.  If PkgGen creates the package successfully, it should return output that is similar to the following.

    ``` syntax
    Microsoft (C) pkggen 8.0.12134.0

    info: Using external macro file: 'C:\Program Files (x86)\Windows Phone Kits\10\
    Tools\bin\i386\pkggen.cfg.xml'
    info: Building project file C:\TestApplication\TestApplication.
    pkg.xml
    info: Building package '.\Contoso.TestApps.TestApplication.spkg'
    info: Adding file 'TestApplication.exe' to package '.\Contoso.TestApps.TestApplication.spkg' as '\test\TestApplication.exe'
    info: Done package ".\Contoso.TestApps.TestApplication.spkg"
    info: Packages are generated to . successfully
    ```

For more information about working with packages, see [Creating packages](creating-mobile-packages.md).

### Create the feature manifest file

Create a feature manifest file that will define a TEST\_APP OEM feature by completing the following steps.

1.  Create a feature manifest file named *OEMCustomAppFM.xml* in the following directory:

    ``` syntax
    %WPDKCONTENTROOT%\FMFiles
    ```

2.  Define the TEST\_APP feature by adding the following XML to the *OEMCustomAppFM.xml* file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>  
    <FeatureManifest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">  
    <!--  TEST_APP FM File 4/30/2015   -->
      <Features>  
        <OEM>  
          <PackageFile Path="C:\TestApplication\" Name="Contoso.TestApps.TestApplication.spkg">  
            <FeatureIDs>  
              <FeatureID>TEST_APP</FeatureID>  
            </FeatureIDs>  
          </PackageFile>  
        </OEM>  
      </Features>  
    </FeatureManifest>
    ```

For more info about feature manifests, see [Feature manifest file contents](feature-manifest-file-contents.md).

### Add the feature to the OEMInput file

Add the TEST\_APP OEM feature to the OEMInput.xml file by completing the following steps.

1.  This walkthrough assumes that you have an existing, functional test OEMInput file that enables TShell. For more information about creating test images, see [Building and flashing images](building-and-flashing-images.md). For more information about specifying optional features, see [Optional features for building images](optional-features-for-building-images.md).

2.  Edit the OEMinput.xml file to include the *OEMCustomAppFM.xml* feature manifest file that you created in the previous step. The XML will be similar to the following.

    ``` syntax
    ...
    <AdditionalFMs>
        ...
        <AdditionalFM>%WPDKCONTENTROOT%\FMFiles\OEMCustomAppFM.xml</AdditionalFM>
      </AdditionalFMs>
    ```

3.  Later in the &lt;Features&gt; section of the OEMInput.xml file add the new TEST\_APP feature to the list of existing features.

    ``` syntax
    <Features>
      <Microsoft>
       ...
      </Microsoft>
      <OEM>
        ...
        <Feature>TEST_APP</Feature>
      </OEM>
    </Features>
    ```

### Generate, sign, and flash the image

Complete the following steps to generate, sign, and flash the image.

1.  Generate the image using ImgGen and the OEMInput.xml file that you customized in the previous step.

    ``` syntax
    C:\>ImgGen Flash.ffu OEMInput.xml "%WPDKCONTENTROOT%\10\MSPackages"
    ```

2.  Before you can sign images, you must first install the test OEM certificates on the PC by following the steps in [Set up the signing environment](https://msdn.microsoft.com/library/windows/hardware/dn789236).

3.  Sign the generated catalog using the /pk option.

    ``` syntax
    C:\> Set SIGN_OEM=1
    C:\> Sign.cmd /pk TestSigned.cat
    ```

4.  Sign the FFU with the signed catalog file using ImageSigner.

    ``` syntax
    C:\> ImageSigner Sign Flash.FFU Flash.Cat
    ```

5.  Flash the image to the phone using FFUTool.

    ``` syntax
    C:\> FFUTool –Flash Flash.ffu
    ```

For more information about generating and flashing images, see [Building and flashing images](building-and-flashing-images.md).

### Verify that the TestApplication executes as expected

Verify that the TestApplication executes as expected by completing the following steps.

1.  Configure a TShell connection to test the image.

2.  Establish a connection to the device using the **Open-device** TShell command. Provide the MAC address of the device.

    ``` syntax
    PS C:\> Open-device 001122334455
    ```

3.  Confirm that the TestApplication is on the device by using the TShell **Dir-Device** command. The short form of the command, DirD, is shown.

    ``` syntax
    PS C:\> DirD \TestApplication.exe /s
    ```

4.  Execute the application by entering the **Exec-Device** cmdlet in the TShell window. The **Exec-Device** cmdlet starts a process on the connected device. By default, the **Exec-Device** cmdlet waits for the process to exit before returning. Use the -Async switch to return immediately. Use the –displayoutput parameter to echo the output.

    ``` syntax
    PS C:\> ExecD -displayoutput -filename \Data\Test\TestApplication.exe
    ```

5.  Output similar to the following should be displayed.

    ``` syntax
    Output    : Testing console output
    Error     :
    Exit Code : 0
    ```

## Related topics


[Creating packages](creating-mobile-packages.md)

[Building and flashing images](building-and-flashing-images.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Create%20a%20feature%20and%20include%20it%20in%20an%20image%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





