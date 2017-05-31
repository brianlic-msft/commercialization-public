---
author: Justinha
Description: 'DISM App Package (.appx or .appxbundle) Servicing Command-Line Options'
ms.assetid: 3a2de7c0-d132-41ec-9603-a54e958fee2c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM App Package (.appx or .appxbundle) Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM App Package (.appx or .appxbundle) Servicing Command-Line Options


You can use app package-servicing commands to add, remove, and list provisioned app packages (.appx or .appxbundle) in a Windows image. An .appxbundle, new for Windows 10, is a collection of app and resource packages used together to enrich the app experience, while minimizing the disk footprint on a given PC. For detailed documentation about .appxbundle packages and the Store pipeline, see [App packaging](http://go.microsoft.com/fwlink/p/?LinkId=698643). Only a subset of the packages within an .appxbundle might be added to the image when a bundle is provisioned using DISM. For more information, see [Understanding How DISM Adds .appxbundle Resource Packages to an Image](#bkmk_understanding).

Provisioned app packages are added to a Windows image and are then installed for every new or existing user profile the next time the user logs on. For more information, including requirements for app package provisioning, see [Sideload Apps with DISM](sideload-apps-with-dism-s14.md).

You can also use PowerShell to add, remove, and list app packages (.appx or .appxbundle) per image or per user in a Windows installation. For more information, see [Deployment Imaging Servicing Management (DISM) Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=239926) and [App Installation Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=247300).

The base syntax for servicing a Windows image using DISM is:

**DISM.exe** {**/Image:**&lt;*path\_to\_image\_directory*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

The following app package (.appx or .appxbundle) servicing options are available for an offline image.

**DISM.exe /Image:**&lt;*path\_to\_image\_directory*&gt; \[**/Get-ProvisionedAppxPackages** | **/Add-ProvisionedAppxPackage** | **/Remove-ProvisionedAppxPackage** | **/Set-ProvisionedAppxDataFile**\]

The following app package (.appx or .appxbundle) servicing options are available for a running operating system.

**DISM.exe /Online** \[**/Get-ProvisionedAppxPackages** | **/Add-ProvisionedAppxPackage** | **/Remove-ProvisionedAppxPackage** | **/Set-ProvisionedAppxDataFile**\]

## <span id="App_package_servicing_options"></span><span id="app_package_servicing_options"></span><span id="APP_PACKAGE_SERVICING_OPTIONS"></span>App package servicing options


This section describes how you can use each app servicing option. These options are not case sensitive.

### <span id="_Get-Help___"></span><span id="_get-help___"></span><span id="_GET-HELP___"></span>/Get-Help /?

When used immediately after an app package servicing command-line option, information about the option and the arguments is displayed. Additional topics might become available when an image is specified.

Examples:

**Dism /image:C:\\test\\offline /Add- ProvisionedAppxPackages /?**

**Dism /online /Get-ProvisionedAppxPackages /?**

### <span id="_Get-ProvisionedAppxPackages"></span><span id="_get-provisionedappxpackages"></span><span id="_GET-PROVISIONEDAPPXPACKAGES"></span>/Get-ProvisionedAppxPackages

Displays information about app packages (.appx or .appxbundle), in an image, that are set to install for each new user.

**Dism /Image:C:\\test\\offline /Get-ProvisionedAppxPackages**

### <span id="Add-ProvisionedAppxPackage"></span>/Add-ProvisionedAppxPackage

**/Add-ProvisionedAppxPackage { /FolderPath:&lt; App\_folder\_path&gt; \[/SkipLicense\] \[/CustomDataPath:&lt; custom\_file\_path&gt;\] | /PackagePath:&lt; main\_package\_path&gt; \[/DependencyPackagePath:&lt; dependency\_package\_path&gt;\] {\[/LicenseFile:&lt; license\_file\_path&gt;\]|\[/SkipLicense\]} \[/CustomDataPath:&lt; custom\_file\_path&gt;\] }**

Adds one or more app packages to the image.

The app will be added to the Windows image and registered for each existing or new user profile the next time the user logs in. If the app is added to an online image, the app will not be registered for the current user until the next time the user logs in.

Use **/FolderPath** to specify a folder of unpacked app files containing a main package, any dependency packages, and the license file. This is only supported for an unpacked app package.

Use **/PackagePath** to specify an app package (.appx or .appxbundle). You can use **/PackagePath** when provisioning a line-of-business app online.

**Important**  
Use the **/PackagePath** parameter to provision .appxbundle packages.

**/PackagePath** is not supported from a host PC that is running Windows Preinstallation Environment (WinPE) 4.0, Windows Server 2008 R2, or an earlier version of Windows.

 

If the package has dependencies that are architecture-specific, you must install all of the applicable architectures for the dependency on the target image. For example, on an x64 target image, include a path to both the x86 and x64 dependency packages or include them both in the folder of unpacked app files.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Computer Architecture</th>
<th align="left">Dependencies to install:</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>x64</p></td>
<td align="left"><p>x64 and x86</p></td>
</tr>
<tr class="even">
<td align="left"><p>x86</p></td>
<td align="left"><p>x86</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ARM</p></td>
<td align="left"><p>Windows RT (ARM) only</p></td>
</tr>
</tbody>
</table>

 

Use **/CustomDataPath** to specify an optional custom data file for an app. You can specify any file name. The file will be renamed to Custom.dat when it is added to the image.

Use **/LicensePath** with the **/PackagePath** option to specify the location of the .xml file containing your application license.

Only use **/SkipLicense** with apps that do not require a license on a sideloading-enabled computer. Using **/SkipLicense** in other scenarios can compromise an image.

Examples:

**Dism /Image:C:\\test\\offline /Add-ProvisionedAppxPackage /FolderPath:c:\\Test\\Apps\\MyUnpackedApp /CustomDataPath:c:\\Test\\Apps\\CustomData.xml**

**Dism /Online /Add-ProvisionedAppxPackage /PackagePath:C:\\Test\\Apps\\MyPackedApp\\MainPackage.appx /DependencyPackagePath:C:\\Test\\Apps\\MyPackedApp\\Framework-x86.appx /DependencyPackagePath:C:\\Test\\Apps\\MyPackedApp\\Framework-x64.appx /LicensePath:C:\\Test\\Apps\\MyLicense.xml**

**Dism /Online /Add-ProvisionedAppxPackage /FolderPath:C:\\Test\\Apps\\MyUnpackedApp /SkipLicense**

**Dism /Image:C:\\test\\offline /Add-ProvisionedAppxPackage /PackagePath:C:\\Test\\Apps\\MyPackedApp\\MainPackage.appxbundle /SkipLicense**

### <span id="Remove-ProvisionedAppxPackage"></span>/Remove-ProvisionedAppxPackage

**/Remove-ProvisionedAppxPackage /PackageName:&lt; PackageName&gt;**

Removes provisioning for app packages (.appx or .appxbundle) from the image. App packages will not be registered to new user accounts that are created.

**Important**  
This option will only remove the provisioning for a package if it is registered to any user profile. Use the [Remove-AppxPackage](http://go.microsoft.com/fwlink/?LinkId=215772) cmdlet in PowerShell to remove the app for each user that it is already registered to in order to fully remove the app from the image.

If the app has not been registered to any user profile, the /Remove-ProvisionedAppxPackage option will remove the package completely.

 

To remove app packages from a Windows Server 2012 image that has the Desktop Experience installed, you must remove the app packages before you remove the Desktop Experience. The Desktop Experience is a requirement of the **/Remove-ProvisionedAppxPackage** option for Server Core installations of Windows Server 2012.

Examples:

**Dism /Image:C:\\test\\offline /Remove-ProvisionedAppxPackage /PackageName:microsoft.devx.appx.app1\_1.0.0.0\_neutral\_ac4zc6fex2zjp**

### <span id="_Set-ProvisionedAppxDataFile___CustomDataPath___custom_file_path____PackageName___PackageName_"></span><span id="_set-provisionedappxdatafile___customdatapath___custom_file_path____packagename___packagename_"></span><span id="_SET-PROVISIONEDAPPXDATAFILE___CUSTOMDATAPATH___CUSTOM_FILE_PATH____PACKAGENAME___PACKAGENAME_"></span>/Set-ProvisionedAppxDataFile \[/CustomDataPath:&lt; custom\_file\_path&gt;\] /PackageName:&lt; PackageName&gt;

Adds a custom data file into the specified app package (.appx or .appxbundle).

The specified app (.appx or .appxbundle) package must already be added to the image prior to when you add the custom data file with this option. You can also add a custom data file when you use the **/Add-ProvisionedAppxPackage** option.

Use **/CustomDataPath** to specify an optional custom data file for an app. You can specify any file name. The file will be renamed to Custom.dat when it is added to the image. If a Custom.dat file already exists, it will be overwritten.

Use **/PackageName** to specify an app package (.appx or .appxbundle).

Examples:

**DISM.exe /Image:C:\\test\\offline /Set-ProvisionedAppxDataFile /CustomDataPath:c:\\Test\\Apps\\Custom.dat /PackageName:microsoft.appx.app1\_1.0.0.0\_neutral\_ac4zc6fex2zjp**

## <span id="BKMK_understanding"></span><span id="bkmk_understanding"></span><span id="BKMK_UNDERSTANDING"></span>Understanding How DISM Adds .appxbundle Resource Packages to an Image


When an .appxbundle is added to the image, not all resource packages within the bundle are applicable. For example, if an app is being added to a Windows image with a Spanish (Spain) default language, French (France) resources should not be included. To determine what resources are added to the image, the package applicability is determined using:

-   **Language Resource Packs**: If an operating system language is not present, the corresponding app language resource pack is not added. For example, you might have an image that is a Windows 10 with English (US) as the default language, and a Spanish (Spain) language pack included. English (US) and Spanish (Spain) app resource packs will be added to the image. If a French (France) resource pack (or any other language) is available in the app bundle, it will not be added.

-   **Scale and DirectX (DXFL) Resource Packs**: Scale and DirectX (DXFL) resource packs depend upon the hardware configuration of the Windows device. Because the type of target hardware can’t be known at the time the DISM commands are run, all scale and DXFL resource packages are added to the image at provisioning time. For more information about developing an app with scaling resources, see [Guidelines for scaling to pixel density (Windows Store apps)](http://go.microsoft.com/fwlink/?LinkId=320890).

For an image containing multiple language packs, app resource packages will be added to the image for each language. Once the first user has signed in to the PC with the deployed image and the user has chosen a language during OOBE, the inapplicable resource packages, (language resource packs, scale resource packs and DXFL resource packages) that do not match the user profile settings are removed.

For example, an app might support English (US), French (France), and Spanish (Spain) languages. If the app is added to an image with English (US) and Spanish (Spain) language packs present, only English (US) and Spanish (Spain) resource packs will be added these to the image. Then, if a user signs in for the first time and, during OOBE, selects English (US) as their operating system language, the Spanish (Spain) resource packages will be removed after sign in completes.

**Important**  
If you add or remove a language pack from an image, you change the applicability context which may result in leaving an incorrect or incomplete set of resource packages in the image. When a language pack is added or removed, you must, once again, add all .appxbundle packages (including any dependency packages and Windows Store license file) to the image. This will ensure that the correct set of resource packages is provisioned.

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


-   You cannot install an app package (.appx) on an operating system that does not support Windows 8 apps. You can’t install an app bundle package (.appxbundle) on an operating system that does not support at least Windows 8.1 apps. Apps aren't supported on WinPE 4.0, the Windows Server 2012 Server Core installation option, or on any versions of Windows older than Windows 8 and Windows Server 2012.

    To install and run apps on Windows Server 2012, you must install the [Desktop Experience](http://go.microsoft.com/fwlink/?LinkId=247330).

-   The **/FolderPath** option is only supported for app packages based on the .appx format.

-   **/PackagePath** must always be used for .appxbundle packages.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

[Sideload Apps with DISM](sideload-apps-with-dism-s14.md)
