---
author: Justinha
Description: 'DISM Operating System Package (.cab or .msu) Servicing Command-Line Options'
ms.assetid: ddb5f223-1c65-4380-95eb-316918e880fc
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Operating System Package (.cab or .msu) Servicing Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Operating System Package (.cab or .msu) Servicing Command-Line Options


Use DISM with Windows cabinet (.cab) or Windows Update Stand-alone Installer (.msu) files to install or remove updates, service packs, language packs, and to enable or disable Windows features. Features are optional components for the core operating system. 

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax

``` syntax
DISM.exe {/Image:<path_to_image_directory> | /Online} [dism_global_options] {servicing_option} [<servicing_argument>]
```

The following operating system package-servicing options are available for an offline image:

``` syntax
DISM.exe /Image:<path_to_image_directory> [/Get-Packages | /Get-PackageInfo | /Add-Package | /Remove-Package ] [/Get-Features | /Get-FeatureInfo | /Enable-Feature | /Disable-Feature ] [/Cleanup-Image]
```

The following operating system package-servicing options are available for a running operating system:

``` syntax
DISM.exe /Online [/Get-Packages | /Get-PackageInfo | /Add-Package | /Remove-Package ] [/Get-Features | /Get-FeatureInfo | /Enable-Feature | /Disable-Feature ] [/Cleanup-Image]
```

## <span id="Operating_system_package-servicing_options"></span><span id="operating_system_package-servicing_options"></span><span id="OPERATING_SYSTEM_PACKAGE-SERVICING_OPTIONS"></span>Operating system package-servicing options

This section describes how you can use each operating system package-servicing option. These options are not case sensitive.

### <span id="_Get-Help___"></span><span id="_get-help___"></span><span id="_GET-HELP___"></span>/Get-Help /?

When used immediately after a package-servicing command-line option, information about the option and the arguments is displayed.

Additional topics might become available when an image is specified.

Syntax:

``` syntax
Dism /Get-Help 
```

Examples:

``` syntax
Dism /Image:C:\test\offline /Add-Package /?
```

``` syntax
Dism /Online /Get-Packages /?
```

### <span id="_Get-Packages___Format__Table___List__"></span><span id="_get-packages___format__table___list__"></span><span id="_GET-PACKAGES___FORMAT__TABLE___LIST__"></span>/Get-Packages 

Displays basic information about all packages in the image. Use the /Format:Table or /Format:List argument to display the output as a table or a list.

Syntax:

``` syntax
Dism /Get-Packages [/Format:{Table | List}]
```

Examples:

``` syntax
Dism /Image:C:\test\offline /Get-Packages
```

``` syntax
Dism /Image:C:\test\offline /Get-Packages /Format:Table
```

``` syntax
Dism /Online /Get-Packages
```

### <span id="_Get-PackageInfo___PackageName___name_in_image_____PackagePath___path_to_cabfile__"></span><span id="_get-packageinfo___packagename___name_in_image_____packagepath___path_to_cabfile__"></span><span id="_GET-PACKAGEINFO___PACKAGENAME___NAME_IN_IMAGE_____PACKAGEPATH___PATH_TO_CABFILE__"></span>/Get-PackageInfo 

Displays detailed information about a package provided as a .cab file. Only .cab files can be specified. You cannot use this command to obtain package information for .msu files. /PackagePath can point to either a .cab file or a folder.

You can use the /Get-Packages option to find the name of the package in the image, or you can specify the path to the .cab file. The path to the .cab file should point to the original source of the package, not to where the file is installed on the offline image.

Syntax:

``` syntax
Dism /Get-PackageInfo {/PackageName:<name_in_image> | /PackagePath:<path_to_cabfile>}
```

Examples:

``` syntax
Dism /Image:C:\test\offline /Get-PackageInfo /PackagePath:C:\packages\package.cab
```

``` syntax
Dism /Image:C:\test\offline /Get-PackageInfo /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
```

### <span id="_Add-Package__PackagePath___path_to_cabfile____IgnoreCheck_____PreventPending_"></span><span id="_add-package__packagepath___path_to_cabfile____ignorecheck_____preventpending_"></span><span id="_ADD-PACKAGE__PACKAGEPATH___PATH_TO_CABFILE____IGNORECHECK_____PREVENTPENDING_"></span>/Add-Package 

Installs a specified .cab or .msu package in the image. An .msu package is supported only when the target image is offline, either mounted or applied. 

Multiple packages can be added on one command line. The applicability of each package will be checked. If the package cannot be applied to the specified image, you will receive an error message. Use the /IgnoreCheck argument if you want the command to process without checking the applicability of each package.

Use the /PreventPending option to skip the installation of the package if the package or Windows image has pending online actions. (Introduced in Windows 8/Windows PE 4.0).

/PackagePath can point to:

-   A single .cab or .msu file.  

-   A folder that contains a single expanded .cab file.

-   A folder that contains a single .msu file.

-   A folder that contains multiple .cab or .msu files.

**Notes**  
-   If /PackagePath points to a folder that contains a .cab or .msu files at its root, any subfolders will also be recursively checked for .cab and .msu files.
-   /Add-Package doesn't check for a package's dependencies. If you're adding a package with dependencies, make sure that all dependencies are installed when you add the package.

Syntax:

``` syntax
Dism /Add-Package /PackagePath:<path_to_cabfile> [/IgnoreCheck] [/PreventPending]
```

Examples:

``` syntax
Dism /Image:C:\test\offline /LogPath:AddPackage.log /Add-Package /PackagePath:C:\packages\package.msu
```

``` syntax
Dism /Image:C:\test\offline /Add-Package /PackagePath:C:\packages\package1.cab /PackagePath:C:\packages\package2.cab /IgnoreCheck
```

``` syntax
Dism /Image:C:\test\offline /Add-Package /PackagePath:C:\test\packages\package.cab /PreventPending
```

### <span id="_Remove-Package___PackageName___name_in_image_____PackagePath___path_to_cabfile__"></span><span id="_remove-package___packagename___name_in_image_____packagepath___path_to_cabfile__"></span><span id="_REMOVE-PACKAGE___PACKAGENAME___NAME_IN_IMAGE_____PACKAGEPATH___PATH_TO_CABFILE__"></span>/Remove-Package 

Removes a specified .cab file package from the image. Only .cab files can be specified. You cannot use this command to remove .msu files.

**Note**  
Using this command to remove a package from an offline image will not reduce the image size.

You can use the /PackagePath option to point to the original source of the package, specify the path to the CAB file, or you can specify the package by name as it is listed in the image. Use the /Get-Packages option to find the name of the package in the image.

Syntax:

``` syntax
/Remove-Package {/PackageName:<name_in_image> | /PackagePath:<path_to_cabfile>}
```

Examples:

``` syntax
Dism /Image:C:\test\offline /LogPath:C:\test\RemovePackage.log /Remove-Package /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
```

``` syntax
Dism /Image:C:\test\offline /LogPath:C:\test\RemovePackage.log /Remove-Package /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0 /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~x86~~6.1.6801.0
```

``` syntax
Dism /Image:C:\test\offline /LogPath:C:\test\RemovePackage.log /Remove-Package /PackagePath:C:\packages\package1.cab /PackagePath:C:\packages\package2.cab
```

### <span id="_Get-Features___PackageName___name_in_image_____PackagePath___path_to_cabfile_____Format__Table___List__"></span><span id="_get-features___packagename___name_in_image_____packagepath___path_to_cabfile_____format__table___list__"></span><span id="_GET-FEATURES___PACKAGENAME___NAME_IN_IMAGE_____PACKAGEPATH___PATH_TO_CABFILE_____FORMAT__TABLE___LIST__"></span>/Get-Features 

Displays basic information about all features (operating system components that include optional Windows foundation features) in a package. You can use the /Get-Features option to find the name of the package in the image, or you can specify the path to the original source of the package. If you do not specify a package name or path, all features in the image will be listed. /PackagePath can point to either a .cab file or a folder.

Feature names are case sensitive if you are servicing a Windows image other than Windows 8.

Use the /Format:Table or /Format:List argument to display the output as a table or a list.

Syntax:

``` syntax
/Get-Features {/PackageName:<name_in_image> | /PackagePath:<path_to_cabfile>} [/Format:{Table | List}]
```

Examples:

``` syntax
Dism /Image:C:\test\offline /Get-Features
```

``` syntax
Dism /Image:C:\test\offline /Get-Features /Format:List
```

``` syntax
Dism /Image:C:\test\offline /Get-Features /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
```

``` syntax
Dism /Image:C:\test\offline /Get-Features /PackagePath:C:\packages\package1.cab
```

### <span id="_Get-FeatureInfo__FeatureName__name_in_image____PackageName___name_in_image_____PackagePath___path_to_cabfile___"></span><span id="_get-featureinfo__featurename__name_in_image____packagename___name_in_image_____packagepath___path_to_cabfile___"></span><span id="_GET-FEATUREINFO__FEATURENAME__NAME_IN_IMAGE____PACKAGENAME___NAME_IN_IMAGE_____PACKAGEPATH___PATH_TO_CABFILE___"></span>/Get-FeatureInfo

Displays detailed information about a feature. You must use /FeatureName. Feature names are case sensitive if you are servicing a Windows image other than Windows 10 or Windows 8.x. You can use the /Get-Features option to find the name of the feature in the image.

/PackageName and /PackagePath are optional and can be used to find a specific feature in a package.

Syntax:

``` syntax
/Get-FeatureInfo /FeatureName:<name_in_image> [{/PackageName:<name_in_image> | /PackagePath:<path_to_cabfile>}]
```

Examples:

``` syntax
Dism /Image:C:\test\offline /Get-FeatureInfo /FeatureName:Hearts
```

``` syntax
Dism /Image:C:\test\offline /Get-FeatureInfo /FeatureName:Hearts /PackagePath:C:\packages\package.cab
```

### <span id="_Enable-Feature__FeatureName___name_in_image___PackageName___name_in_image_____Source___source_____LimitAccess___All_"></span><span id="_enable-feature__featurename___name_in_image___packagename___name_in_image_____source___source_____limitaccess___all_"></span><span id="_ENABLE-FEATURE__FEATURENAME___NAME_IN_IMAGE___PACKAGENAME___NAME_IN_IMAGE_____SOURCE___SOURCE_____LIMITACCESS___ALL_"></span>/Enable-Feature 

Enables or updates the specified feature in the image. You must use the /FeatureName option. Feature names are case sensitive if you are servicing a Windows image other than Windows 8. Use the /Get-Features option to find the name of the feature in the image.

You can specify the /FeatureName option multiple times in one command line for features that share the same parent package.

You do not have to specify the package name using the /PackageName option if the package is a Windows Foundation Package. Otherwise, use /PackageName to specify the parent package of the feature.

You can restore and enable a feature that has previously been removed from the image. Use the /Source argument to specify the location of the files that are required to restore the feature. The source of the files can by the Windows folder in a mounted image, for example c:\test\mount\Windows. You can also use a Windows side-by-side folder as the source of the files, for example z:\sources\SxS.

If you specify multiple /Source arguments, the files are gathered from the first location where they are found and the rest of the locations are ignored. If you do not specify a /Source for a feature that has been removed, the default location in the registry is used or, for online images, Windows Update (WU) is used.

Use /LimitAccess to prevent DISM from contacting WU for online images.

Use /All to enable all parent features of the specified feature.

The /Source, /LimitAccess, and /All arguments can be used with Windows 10, Windows 8.x, and Windows PE images above 4.0.

Syntax:

``` syntax
/Enable-Feature /FeatureName:<name_in_image> [/PackageName:<name_in_image>] [/Source: <source>] [/LimitAccess] [/All]
```

Examples:

``` syntax
Dism /Online /Enable-Feature /FeatureName:Hearts /All
```

``` syntax
Dism /Online /Enable-Feature /FeatureName:Calc /Source:c:\test\mount\Windows /LimitAccess
```

``` syntax
Dism /Image:C:\test\offline /Enable-Feature /FeatureName:Calc /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
```

### <span id="_Disable-Feature__FeatureName___name_in_image____PackageName___name_in_image_____Remove_"></span><span id="_disable-feature__featurename___name_in_image____packagename___name_in_image_____remove_"></span><span id="_DISABLE-FEATURE__FEATURENAME___NAME_IN_IMAGE____PACKAGENAME___NAME_IN_IMAGE_____REMOVE_"></span>/Disable-Feature 

Disables the specified feature in the image. You must use the /FeatureName option. Feature names are case sensitive if you are servicing a Windows image other than Windows 8. Use the /Get-Features option to find the name of the feature in the image.

You can specify /FeatureName multiple times in one command line for features in the same parent package.

You do not have to specify the package name using the /PackageName option if it the package is a Windows Foundation Package. Otherwise, use /PackageName to specify the parent package of the feature.

Use /Remove to remove a feature without removing the feature's manifest from the image. This option can only be used can be used with Windows 10, Windows 8.x, and Windows PE images above 4.0. The feature will be listed as "Removed" when you use /Get-FeatureInfo to display feature details and can be restored and enabled using /Enable-Feature with the /Source option.

Syntax:

``` syntax
/Disable-Feature /FeatureName:<name_in_image> [/PackageName:<name_in_image>] [/Remove]
```

Examples:

``` syntax
*Dism /Online /Disable-Feature /FeatureName:Hearts
```

``` syntax
Dism /Image:C:\test\offline /Disable-Feature /FeatureName:Calc /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
```

### <span id="_Cleanup-Image___RevertPendingActions____SPSuperseded___HideSP_____StartComponentCleanup___ResetBase_____AnalyzeComponentStore____CheckHealth____ScanHealth____RestoreHealth___Source___filepath_____LimitAccess__"></span><span id="_cleanup-image___revertpendingactions____spsuperseded___hidesp_____startcomponentcleanup___resetbase_____analyzecomponentstore____checkhealth____scanhealth____restorehealth___source___filepath_____limitaccess__"></span><span id="_CLEANUP-IMAGE___REVERTPENDINGACTIONS____SPSUPERSEDED___HIDESP_____STARTCOMPONENTCLEANUP___RESETBASE_____ANALYZECOMPONENTSTORE____CHECKHEALTH____SCANHEALTH____RESTOREHEALTH___SOURCE___FILEPATH_____LIMITACCESS__"></span>/Cleanup-Image

Performs cleanup or recovery operations on the image. /AnalyzeComponentStore and /ResetBase can be used with Windows 10, Windows 8.1, and Windows PE images above 5.0. Beginning with Windows 10, version 1607, you can specify /Defer with /ResetBase. But we highly recommend you **only** use /Defer as an option in the factory where DISM /Resetbase requires more than 30 minutes to complete. /StartComponentCleanup can be used with Windows 10, Windows 8.x, and Windows PE images above 4.0. /CheckHealth, /ScanHealth, /RestoreHealth, /Source, and /LimitAccess can be used with Windows 10, Windows 8.x, and Windows PE images above 4.0. /HideSP and /SPSuperseded can’t be used when servicing a version of Windows that is earlier than Windows 7 Service Pack 1 (SP1) image.

**Tip**  
To determine when the /ResetBase option was last run, check the LastResetBase_UTC registry entry under this registry path:

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing

Syntax:

``` syntax
/Cleanup-Image {/RevertPendingActions | /SPSuperseded [/HideSP] | /StartComponentCleanup [/ResetBase [/Defer]] | /AnalyzeComponentStore | /CheckHealth | /ScanHealth | /RestoreHealth [/Source: <filepath>] [/LimitAccess]}
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /RevertPendingActions | If you experience a boot failure, you can use the /RevertPendingActions option to try to recover the system. The operation reverts all pending actions from the previous servicing operations because these actions might be the cause of the boot failure. The /RevertPendingActions option is not supported on a running operating system or a Windows PE or Windows Recovery Environment (Windows RE) image. Important: You should use the /RevertPendingActions option only in a system-recovery scenario on a Windows image that did not boot.|
| SPSuperseded | Removes any backup files created during the installation of a service pack. Use /HideSP to prevent the service pack from being listed in the Installed Updates Control Panel. The service pack cannot be uninstalled after the /SPSuperseded operation is completed. |
| /StartComponentCleanup | Cleans up the superseded components and reduces the size of the component store. Use /ResetBase to reset the base of superseded components, which can further reduce the component store size. Installed Windows updates can’t be uninstalled after running /StartComponentCleanup with the /ResetBase option. Use /Defer with /ResetBase to defer long-running cleanup operations to the next automatic maintenance.|
| /AnalyzeComponentStore | Creates a report of the component store. For more information about the report and how to use the information provided in the report, see [Determine the Actual Size of the WinSxS Folder](determine-the-actual-size-of-the-winsxs-folder.md). |
| /CheckHealth | Checks whether the image has been flagged as corrupted by a failed process and whether the corruption can be repaired. |
| /ScanHealth | Scans the image for component store corruption. This operation will take several minutes.  |
| /RestoreHealth | Scans the image for component store corruption, and then performs repair operations automatically. This operation will take several minutes. |
| /Source | Used with /RestoreHealth to specify the location of known good versions of files that can be used for the repair, such as a path to the Windows directory of a mounted image.|
| /LimitAccess | Prevents DISM from contacting Windows Update for repair of online images. | 

Examples:

``` syntax
Dism /Image:C:\test\offline /Cleanup-Image /RevertPendingActions
```

``` syntax
Dism /Image:C:\test\offline /Cleanup-Image /SPSuperseded /HideSP
```

``` syntax
Dism /Online /Cleanup-Image /ScanHealth
```

``` syntax
Dism /Online /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows /LimitAccess
```

To learn more, see [Repair a Windows Image](repair-a-windows-image.md).

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


-   When you are installing a package in an offline image, the package state is “install pending” because of pending online actions. In other words, the package will be installed when the image is booted and the online actions are processed. If subsequent actions are requested, they cannot be processed until the previous pending online action is completed. You can use the /PreventPending option when you add a package with /AddPackage to skip the installation of a package when there are pending online actions.
-   Some packages require other packages to be installed first. You should not assume that dependencies will be satisfied. If there are dependency requirements, you should use an answer file to install the necessary packages. By passing an answer file to DISM, multiple packages can be installed in the correct order. This is the preferred method for installing multiple packages. For more information, see [Add or Remove Packages Offline Using DISM](add-or-remove-packages-offline-using-dism.md).
-   Packages are installed in the order that they are listed in the command line.
-   When using DISM to list the optional components in a Windows PE image, the optional components will always be listed as pending even when the servicing operation was successful. This is by design and requires no additional action from you.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

 



