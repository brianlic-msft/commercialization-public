---
author: Justinha
Description: 'Use DISM to work with Provisioning Packages (.ppkg) files. For example, you can add settings and Windows desktop applications to Windows 10, or reduce the size of your Windows installation.'
ms.assetid: 205d296e-fced-429a-9e74-c445743ed7e9
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Provisioning Package (.ppkg) Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="dism_provisioning_package_command-line_options"></span>DISM Provisioning Package (.ppkg) Command-Line Options


Use DISM to work with Provisioning Packages (.ppkg) files. For example, you can add settings and Windows desktop applications to Windows 10, or reduce the size of your Windows installation.

## <span id="_Add-ProvisioningPackage"></span><span id="_add-provisioningpackage"></span><span id="_ADD-PROVISIONINGPACKAGE"></span>**/Add-ProvisioningPackage**

Adds applicable payload of provisioning package to the specified image.

Syntax:

``` syntax
DISM.exe /Add-ProvisioningPackage /PackagePath:<package_path> [/CatalogPath:<path>]
```

Example:

``` syntax
DISM.exe /Image=C:\ /Add-ProvisioningPackage /PackagePath:C:\oem.ppkg
```

## <span id="_Get-ProvisioningPackageInfo"></span><span id="_get-provisioningpackageinfo"></span><span id="_GET-PROVISIONINGPACKAGEINFO"></span>**/Get-ProvisioningPackageInfo**

Get the information of provisioning package.

Syntax:

``` syntax
DISM.exe /Get-ProvisioningPackageInfo /PackagePath:<package_path>
```

Example:

``` syntax
DISM.exe /Image=C:\ /Get-ProvisioningPackageInfo /PackagePath:C:\oem.ppkg
```

## <span id="_Apply-CustomDataImage"></span><span id="_apply-customdataimage"></span><span id="_APPLY-CUSTOMDATAIMAGE"></span>**/Apply-CustomDataImage**

Dehydrates files contained in the custom data image to save space. For client editions, this package is used by the push-button recovery tools.

Syntax:

``` syntax
/Apply-CustomDataImage /CustomDataImage:<path_to_image_file> /ImagePath:<target_drive> /SingleInstance
```


|   Parameter     |   Description     |
|-----------------|-------------------|
|   /CustomDataImage | Specifies where the provisioning package is stored. |
| /ImagePath | Specifies the drive that contains the Windows image. DISM scans this drive for any non-system files on this drive and incorporates them into the provisioning package. |
| /SingleInstance | After DISM captures the non-system files to a compressed provisioning package, DISM adds pointers on the drive to the new compressed provisioning package, and removes the original files. As a result, the files are still visible to the system, but take up less space on the drive.|


Example:

``` syntax
DISM.exe /Apply-CustomDataImage /CustomDataImage:C:\oem.ppkg /ImagePath:C:\ /SingleInstance
```

Applies to: Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) only.

 