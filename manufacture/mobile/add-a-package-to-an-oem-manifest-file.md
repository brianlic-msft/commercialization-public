---
Description: 'You can use a feature manifest (FM) file to define specific types of image builds that contain different sets of optional packages.'
ms.assetid: 5355eea8-550f-4ab5-ba1c-a37689a88b95
MSHAttr: 'PreferredLib:/library'
title: Add a package to an OEM manifest file
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add a package to an OEM manifest file


You can use a feature manifest (FM) file to define specific types of image builds that contain different sets of optional packages. To learn more about FM files, see [Feature manifest file contents](https://msdn.microsoft.com/library/windows/hardware/dn756745). For more information about additional logic that you can add to the build system, see [Feature groupings and constraints](https://msdn.microsoft.com/library/windows/hardware/dn756740).

In this walkthrough, we will add the packages you created in [Creating mobile packages](creating-mobile-packages.md), to an FM file to define new OEM features that you can later include to build a mobile OS image.

**To add a package to an FM file**

1.  Create a new FM file or modify an existing FM file to include the two packages that you created and define feature IDs for these packages. For an example of what the FM file looks like, see %WPDKCONTENTROOT%\\FMFiles\\arm\\MSOptionalFeatures.xml in your kit installation folder.

    The following example shows what your FM file may look like.

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <FeatureManifest 
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
      xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
      xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">

      <!-- Other elements that you can configure
      <OEMDevicePlatformPackages>
        <PackageFile Name="Microsoft.Fake.OEMDevicePlatform.spkg" Path="$(mspackageroot)\firmware\Fake\$(cputype)\$(buildtype)" Device="Fake"/>
      </OEMDevicePlatformPackages>

      <BasePackages>
        <PackageFile Path="$(mspackageroot)\drivers\Fake\$(cputype)\$(buildtype)" Name="Microsoft.Fake.AX88772.spkg"/>
      </BasePackages>
      -->

      <Features>  
        <OEM>  
          <PackageFile Path="SourceDirectoryA" Name="MyEchoDriver.spkg">  
            <FeatureIDs>  
              <FeatureID>ECHO_DRIVER</FeatureID>  
            </FeatureIDs>  
          </PackageFile>  
          <PackageFile Path="SourceDirectoryB" Name="Contoso.Customization.Notifications.QuickActions.spkg">  
            <FeatureIDs>  
              <FeatureID>QUICK_ACTIONS</FeatureID>  
            </FeatureIDs>  
          </PackageFile>  
        </OEM>  
      </Features> 

    </FeatureManifest>
    ```

    The **OEMDevicePlatformPackages** element and **BasePackages** element are placeholders and are only there to show you what other options are available to configure in the FM file.

    For more information about creating an FM file and other elements that you may need to fully define your feature, see [Feature manifest file contents](https://msdn.microsoft.com/library/windows/hardware/dn756745). For more information about additional logic that you can add to the build system, see [Feature groupings and constraints](https://msdn.microsoft.com/library/windows/hardware/dn756740).

2.  In the first **PackageFile** element within the **OEM** section, replace *SourceDirectoryA* with the location of the folder that contains the Echo driver package and replace *MyEchoDriver.spkg* with the real name of the .spkg containing the driver.

3.  In the second **PackageFile** element within the **OEM** section, replace *SourceDirectoryB* with the location of the folder that contains the customization setting package and replace *Contoso.Customization.Notifications.QuickActions.spkg* with the real name of the .spkg containing the customization setting.

4.  Save your FM file in the %WPDKCONTENTROOT%\\FMFiles\\arm folder. For this example, let's name the file as ContosoOptionalFeatures.xml.

 

 



