---
author: Justinha
Description: 'DISM Application Servicing (.msp) Command-Line Options'
ms.assetid: 78ed3303-1e79-4257-ad04-d5f68d34b758
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Application Servicing (.msp) Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Application Servicing (.msp) Command-Line Options


Application servicing command-line options can be used on an offline image to check the applicability of Windows Installer application patches (.msp files) and to query your offline image for information about installed Windows Installer applications and application patches (.msp files).

For information about using Deployment Image Servicing and Management (DISM) with app packages, see [DISM App Package (.appx or .appxbundle) Servicing Command-Line Options](dism-app-package--appx-or-appxbundle--servicing-command-line-options.md).

The base syntax for servicing a Windows image using DISM is:

**DISM.exe** **/Image:**&lt;*path\_to image\_directory*&gt; \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

The following servicing options are available to list Windows Installer applications and .msp application patches, and to check the applicability of an application patch for an offline Windows image:

**DISM.exe /Image:**&lt;*path\_to\_directory*&gt; \[**/Check-AppPatch** | **/Get-AppPatchInfo:** | **/Get-AppPatches** | **/Get-AppInfo** | **/Get-Apps**\]

## <span id="Application_servicing_options"></span><span id="application_servicing_options"></span><span id="APPLICATION_SERVICING_OPTIONS"></span>Application servicing options


This section describes how you can use each application servicing option. These options are not case sensitive.

### <span id="_Get-Help___"></span><span id="_get-help___"></span><span id="_GET-HELP___"></span>/Get-Help /?

When used immediately after a package servicing command-line option, information about the option and the arguments is displayed. Additional topics might become available when an image is specified.

Example:

**Dism /image:C:\\test\\offline /Check-AppPatch /?**

### <span id="_Check-AppPatch__PatchLocation___path_to_patch.msp__"></span><span id="_check-apppatch__patchlocation___path_to_patch.msp__"></span><span id="_CHECK-APPPATCH__PATCHLOCATION___PATH_TO_PATCH.MSP__"></span>/Check-AppPatch /PatchLocation:&lt; path\_to\_patch.msp&gt;

Displays information only if the MSP patches apply to the offline image. The path to the MSP patch file must be specified. Multiple patch files can be specified.

Example:

**Dism /image:C:\\test\\offline /Check-AppPatch /PatchLocation:C:\\test\\MSIPatches\\MsiTestPatch1.msp /PatchLocation:C:\\test\\MSIPatches\\MsiTestPatch2.msp**

### <span id="_Get-AppPatchInfo____PatchCode___patch_code_GUID_____ProductCode___product_code_GUID___"></span><span id="_get-apppatchinfo____patchcode___patch_code_guid_____productcode___product_code_guid___"></span><span id="_GET-APPPATCHINFO____PATCHCODE___PATCH_CODE_GUID_____PRODUCTCODE___PRODUCT_CODE_GUID___"></span>/Get-AppPatchInfo: \[/PatchCode:&lt; patch\_code\_GUID&gt;\] \[/ProductCode:&lt; product\_code\_GUID&gt;\]

Displays detailed information about installed MSP patches filtered by &lt;patch\_code\_GUID&gt; and &lt;product\_code\_GUID&gt;.

If the **/PatchCode** option is specified, detailed information is displayed for all Windows Installer applications that the patch is applied to.

If the **/ProductCode** option is specified, information about all MSP patches in the specified application is displayed.

If the **/PatchCode** and **/ProductCode** options are specified, information is displayed only if that specific patch is applied to the specified Windows Installer application.

Use the **/Get-AppPatches** option to find the patch code GUID and the product code GUID specific to the patch. Use the **/Get-Apps** option to list all product code GUIDs for an installed Windows Installer applications.

If **/PatchCode** and **/ProductCode** are not specified, all installed Windows Installer packages and MSP patches are displayed.

Example:

**Dism /image:C:\\test\\offline /Get-AppPatchInfo**

**Dism /image:C:\\test\\offline /Get-AppPatchInfo: /PatchCode:{B0B9997C-GUID-GUID-GUID-74D866BBDFFF}**

**Dism /image:C:\\test\\offline /Get-AppPatchInfo: /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}**

**Dism /image:C:\\test\\offline /Get-AppPatchInfo: /PatchCode:{B0B9997C-GUID-GUID-GUID-74D866BBDFFF} /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}**

### <span id="_Get-AppPatches____ProductCode___product_code_GUID___"></span><span id="_get-apppatches____productcode___product_code_guid___"></span><span id="_GET-APPPATCHES____PRODUCTCODE___PRODUCT_CODE_GUID___"></span>/Get-AppPatches: \[/ProductCode:&lt; product\_code\_GUID&gt;\]

Displays basic information about all applied MSP patches for all applications installed on the offline image. If a product code GUID is specified, information is displayed about all patches in the specified Windows Installer application.

Examples:

**Dism /image:C:\\test\\offline /Get-AppPatches**

**Dism /image:C:\\test\\offline /Get-AppPatches /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}**

### <span id="_Get-AppInfo____ProductCode___product_code_GUID___"></span><span id="_get-appinfo____productcode___product_code_guid___"></span><span id="_GET-APPINFO____PRODUCTCODE___PRODUCT_CODE_GUID___"></span>/Get-AppInfo: \[/ProductCode:&lt; product\_code\_GUID&gt;\]

Displays detailed information about a specific installed Windows Installer application.

Use the **/Get-Apps** option to find the GUID for an installed Windows Installer application. If a product code GUID is not specified, information is displayed for all Windows Installer applications installed in the offline image.

Examples:

**Dism /image:C:\\test\\offline /Get-AppInfo**

**Dism /image:C:\\test\\offline /Get-AppInfo /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}**

### <span id="_Get-Apps_"></span><span id="_get-apps_"></span><span id="_GET-APPS_"></span>/Get-Apps

Displays basic information about all Windows Installer applications in the offline image.

Example:

**Dism /image:C:\\test\\offline /Get-Apps**

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


**/Get-AppPatches** and **/Get-AppPatchInfo** apply only to installed patches (.msp files).

When you determine the applicability of an MSP patch, only the Windows Installer applications for which the patch is applicable will be displayed. One patch can apply to many installed applications and many patches can apply to one application.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

[DISM App Package (.appx or .appxbundle) Servicing Command-Line Options](dism-app-package--appx-or-appxbundle--servicing-command-line-options.md)

 

 






