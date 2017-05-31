---
author: Justinha
Description: 'DISM Image Management Command-Line Options'
ms.assetid: a6382d83-5748-4b08-9d9a-46ff576bac54
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Image Management Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Image Management Command-Line Options


Deployment Image Servicing and Management (DISM.exe) mounts a Windows image (.wim) file or virtual hard disk (.vhd or .vhdx) for servicing. You can also use the DISM image management command to list the image index numbers, to verify the architecture for the image that you are mounting, append an image, apply an image, capture an image and delete an image. After you update the image, you must unmount it and either commit or discard the changes that you have made.

This topic discusses DISM commands related to image management. To see other command-line options, see [Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md). For more information about common DISM scenarios, see [What is DISM?](what-is-dism.md).

In addition to the command-line tool, DISM is available by using Windows PowerShell. For more information, see [Deployment Imaging Servicing Management (DISM) Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=239926).

The following commands can be used to mount, unmount, capture, append, and delete and query .wim, .vhd and .vhdx files. These options are not case sensitive.

## /Append-Image

Adds an additional image to a .wim file. **/Append-Image** compares new files to the resources in the existing .wim file specified by the **/ImageFile** argument, and stores only a single copy of each unique file so that each file is only captured once. The .wim file can have only one assigned compression type. Therefore, you can only append files with the same compression type.

This command-line option does not apply to virtual hard disk (VHD) files.

**Important**  

Ensure that you have enough disk space for the **/Append-Image** option to run. If you run out of disk space while the image is being appended, you might corrupt the .wim file.

Syntax:

``` syntax
DISM.exe /Append-Image /ImageFile:<path_to_image_file> /CaptureDir:<source_directory> /Name:<image_name> [/Description:<image_description>] [/ConfigFile:<configurtion_file.ini>] [/Bootable] /WIMBoot [/CheckIntegrity] [/Verify] [/NoRpFix]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
|   /WIMBoot | Use /WIMBoot to append the image with Windows image file boot (WIMBoot) configuration. This only applies to Windows 8.1 images that have been captured or exported as a WIMBoot file. This feature isn't supported in Windows 10.|
| /ConfigFile | specifies the location of a configuration file that lists exclusions for image capture and compress commands. For more information, see [DISM Configuration List and WimScript.ini Files](dism-configuration-list-and-wimscriptini-files-winnext.md). |
| /Bootable | Marks a volume image as being a bootable image. This argument is available only for Windows Preinstallation Environment (WinPE) images. Only one volume image can be marked as bootable in a .wim file.|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /Verify |  Checks for errors and file duplication. |
| /NoRpFix  | Disables the reparse point tag fix. A reparse point is a file that contains a link to another file on the file system. If /NoRpFix is not specified, reparse points that resolve to paths outside of the value specified by /ImageFile will not be captured.|

Example:

``` syntax
Dism /Append-Image /ImageFile:install.wim /CaptureDir:D:\ /Name:Drive-D
```

## /Apply-Image

For WIM, this command applies a Windows image file (.wim) or a split Windows image (.swm) files to a specified partition. Beginning with Windows 10, version 1607, DISM can apply and capture extended attributes (EA).

For FFU, this command applies a full flash update (.ffu) image to a specified drive. It doesn’t support applying an image from a virtual hard disk (.vhdx) file, though you can use this command to apply a full image to a VHD. FFU applies to Windows 10 only.

This option doesn’t support applying an image from a virtual hard disk (VHD), though you can use this command to apply images to a .vhdx file that's been attached, partitioned, and formatted.

If Dism /Apply-Image fails with error code 5 and you are using Windows 10 version 1607 with Windows Subsystem for Linux (WSL) feature, see [KB article 319598](https://support.microsoft.com/kb/3179598).

Arguments for WIM:

``` syntax
DISM.exe /Apply-Image /ImageFile:<path_to_image_file> [/SWMFile:<pattern>] /ApplyDir:<target_directory> {/Index:< image_index> | /Name:<image_name>} [/CheckIntegrity] [/Verify] [/NoRpFix] [/ConfirmTrustedFile] [/WIMBoot (deprecated)] [/Compact] [/EA]
```

Arguments for FFU

``` syntax
DISM.exe /Apply-Image /ImageFile:<path_to_image_file> /ApplyDrive:<target_drive> [/SFUFile:<pattern>] [/SkipPlatformCheck]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /Verify | Checks for errors and file duplication. |
| /NoRpFix | Disables the reparse point tag fix. A reparse point is a file that contains a link to another file on the file system. If /NoRpFix is not specified, reparse points that resolve to paths outside the value specified by /ImageFile will not be captured. |
| /SWMFile | Enables you to reference split .wim files (SWMs). *Pattern* is the naming pattern and location of split files. You can also specify wildcard characters. For example, "E:\image\install.swm" will apply all of the split files in the E:\image directory named install1.swm, install2.swm, and so on. |
| /ConfirmTrustedFile | Validates the image for Trusted Desktop on a Windows 10, Windows 8.1, or Windows 8. This option can only be run on a computer running at least WinPE 4.0. When using /Apply-Image with the /ConfirmTrustedFile option in WinPE, always specify the /ScratchDir option pointed to a physical media location. This ensures that short file names will always be available. See [DISM Global Options for Command-Line Syntax](dism-global-options-for-command-line-syntax.md) for more information about the default behavior of the /ScratchDir option. Beginning with Windows 10, version 1607, you can use /EA to apply extended attributes.  |
|   /WIMBoot | Use /WIMBoot to append the image with Windows image file boot (WIMBoot) configuration. This only applies to Windows 8.1 images that have been captured or exported as a WIMBoot file. This feature isn't supported in Windows 10.|
| /Compact | Applies an image in compact mode, saving drive space. Replaces WIMBoot. For Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) only. <br><br>**Note:** If you're applying an image in compact mode with the /ScratchDir option, make sure your ScratchDir folder is not on a FAT32-formatted partition. Using a FAT32 partition could result in unexpected reboots during OOBE. | 
| /EA      | New in Windows 10, version 1607. Applies extended attributes. |
| /ApplyDrive  | Specifies the logical drive, using the DeviceID. to get the device ID from the command line, type "wmic diskdrive list brief". Note: a VHD may appear with the name “PhysicalDrive” in the description, for example, \.\PhysicalDrive2.|
| /SFUFile  | Use /SFUFile to reference split FFU files (SFUs). *Pattern* is the naming pattern and location of split files. |
|  /SkipPlatformCheck | Use /SkipPlatformCheck if the FFU file being applied is targeted for a device other than the device performing the application. A special FFU file is required. |

Examples:

``` syntax
Dism /apply-image /imagefile:install.wim /index:1 /ApplyDir:D:\
```

``` syntax
Dism /apply-image /imagefile:install.swm /swmfile:install.swm /index:1 /applydir:D:
```

``` syntax
DISM.exe /Apply-Ffu /ImageFile:flash.ffu /ApplyDrive:\\.\PhysicalDrive0
```

``` syntax
DISM.exe /Apply-Ffu /ImageFile:flash.sfu /SFUFile:flash*.sfu /ApplyDrive:\\.\PhysicalDrive0
```

## /Capture-CustomImage

Captures the incremental file changes based on the specific install.wim file to a new file, custom.wim for a WIMBoot image. You can’t capture an empty directory. The captured files are converted to pointer files. The custom.wim is placed in the same folder next to the install.wim.

**Important**

- /Capture-CustomImage only captures the customization files. It can’t be used to capture installation files into a new WIM.
- Keep the install.wim and custom.wim files together. Don't switch out either the custom.wim file or the install.wim file.
- You can only capture the custom image once. Don’t remove or recapture a custom.wim after capturing the incremental file changes.

Syntax: 

``` syntax
Dism /Capture-CustomImage /CaptureDir:<source_directory> [/ConfigFile:<configuration_file.ini>] [/CheckIntegrity] [/Verify] [/ConfirmTrustedFile]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /CaptureDir | Specifies the directory to which the image was applied and customized. |
| /ConfigFile | Specifies the location of a configuration file that lists exclusions for image capture and compress commands. For more information, see [DISM Configuration List and WimScript.ini Files](dism-configuration-list-and-wimscriptini-files-winnext.md).
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /Verify | Checks for errors and file duplication. |
| [/ConfirmTrustedFile | Validates the image for Trusted Desktop on a Windows 10, Windows 8.1, or Windows 8. This option can only be run on a computer running at least WinPE 4.0. |

Example:

``` syntax
Dism /Capture-CustomImage /CaptureDir:D:\
```

## /Capture-Image

Captures an image of a drive to a new .wim file. Captured directories include all subfolders and data. You cannot capture an empty directory. A directory must contain at least one file.

You can capture the image as a Windows image (.wim) file or a set of split Windows image (.swm) files; this option doesn’t support capturing a virtual hard disk (.vhd/.vhdx) file or a full flash update (.ffu) image. Beginning with Windows 10, version 1607, DISM can apply and capture extended attributes (EA).

Syntax:

``` syntax
Dism /Capture-Image /ImageFile:<path_to_image_file> /CaptureDir:<source_directory> /Name:<image_name> [/Description:<image_description>]
[/ConfigFile:<configuration_file.ini>] {[/Compress:{max|fast|none}] [/Bootable] | [/WIMBoot]} [/CheckIntegrity] [/Verify] [/NoRpFix] [/EA]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /ConfigFile | Specifies the location of a configuration file that lists exclusions for image capture and compress commands. For more information, see [DISM Configuration List and WimScript.ini Files](dism-configuration-list-and-wimscriptini-files-winnext.md).
| /Compress |   Specifies the type of compression used for the initial capture operation. The **maximum** option provides the best compression, but takes more time to capture the image. The **fast** option provides faster image compression, but the resulting files are larger than those compressed by using the maximum option. This is also the default compression type that is used if you do not specify the argument. The **none** option does not compress the captured image at all. |
| /Bootable | Marks a volume image as being a bootable image. This argument is available only for WinPE images. Only one volume image can be marked as bootable in a .wim file.|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /Verify | Checks for errors and file duplication. |
| /NoRpFix  | Disables the reparse point tag fix. A reparse point is a file that contains a link to another file on the file system. If /NoRpFix is not specified, reparse points that resolve to paths outside of the value specified by /ImageFile will not be captured.|
|   /WIMBoot | Use /WIMBoot to append the image with Windows image file boot (WIMBoot) configuration. This only applies to Windows 8.1 images that have been captured or exported as a WIMBoot file. This feature isn't supported in Windows 10.|
| /EA      | New in Windows 10, version 1607. Captures extended attributes. The switch must be explicitly specified to capture extended attributes. DISM will capture extended attribute bits if they are set in the components to be captured in the WIM image. If the bits are not set, DISM won't set them. Only the inbox components of CAB packages and drivers will have these extended attribute bits, not the AppX package components or Win32 application components. Extended attributes with prefix “$Kernel.” in name will be skipped because only user mode extended attributes are captured. If you use DISM in Windows 10, version 1607 to capture extended attributes and use an earlier version of DISM to apply the image, the operation will succeed but the extended attributes will not be set to the applied image.  |

Examples:

``` syntax
Dism /Capture-Image /ImageFile:install.wim /CaptureDir:D:\ /Name:Drive-D
```

```syntax
dism /Capture-Image /CaptureDir:C:\ /ImageFile:"C:\WindowsWithOffice.wim" /Name:"Chinese Traditional" /ea
```

## /Cleanup-Mountpoints

Deletes all of the resources associated with a mounted image that has been corrupted. This command will not unmount images that are already mounted, nor will it delete images that can be recovered using the **/Remount-Image** command. 

Example: 

``` syntax
Dism /Cleanup-Mountpoints
```

To learn more, see [Repair a Windows Image](repair-a-windows-image.md)

## /Commit-Image

Applies the changes that you have made to the mounted image. The image remains mounted until the **/Unmount-Image** option is used.

Syntax:

``` syntax
Dism /Commit-Image /MountDir:<path_to_mount_directory> [/CheckIntegrity] [/Append]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /Append   |  Adds the modified image to the existing .wim file instead of overwriting the original image. The /CheckIntegrity and /Append arguments do not apply to virtual hard disk (VHD) files. |

Example: 

``` syntax
Dism /Commit-Image /MountDir:C:\test\offline
```

## /Delete-Image

Deletes the specified volume image from a .wim file that has multiple volume images. This option deletes only the metadata entries and XML entries. It does not delete the stream data and does not optimize the .wim file.

This command-line option does not apply to virtual hard disk (VHD) files.

Syntax:

``` syntax
Dism /Delete-Image /ImageFile:<path_to_image_file> {/Index:<image_index> | /Name:<image_name>} [/CheckIntegrity]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |

Example: 

``` syntax
Dism /Delete-Image /ImageFile:install.wim /Index:1
```

## /Export-Image

Exports a copy of the specified image to another file. The source and destination files must use the same compression type. You can also optimize an image by exporting to a new image file. When you modify an image, DISM stores additional resource files that increase the overall size of the image. Exporting the image will remove unnecessary resource files.

This command-line option does not apply to virtual hard disk (VHD) files.

Syntax:

``` syntax
Dism /Export-Image /SourceImageFile:<path_to_image_file> {/SourceIndex:<image_index> | /SourceName:<image_name>} /DestinationImageFile:<path_to_image_file> [/DestinationName:<Name>] [/Compress:{fast|max|none|recovery}] [/Bootable] [/WIMBoot] [/CheckIntegrity]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
|  /SWMFile     |  Enables you to reference split .wim files. pattern is the naming pattern and location of split files. You can also specify wildcard characters. For example, "E:\image\install*.swm" will export the split files in the E:\image directory named install1.swm, install2.swm, and so on.|
| /Compress | Specifies the type of compression used for the initial capture operation. The /Compress argument does not apply when you export an image to an existing .wim file, you can only use this argument when you export an image to a new .wim file. The **maximum** option provides the best compression, but takes more time to capture the image. The **fast** option provides faster image compression, but the resulting files are larger than those compressed by using the **maximum** option. This is also the default compression type that is used if you do not specify the argument. Use the **recovery** option to export push-button reset images. The resulting files are much smaller in size, which in turn, greatly reduce the amount of disk space needed for saving the push-button reset image on a recovery drive. The destination file must be specified with an .esd extension. The **none** option does not compress the captured image at all. |
| /Bootable | Marks a volume image as being a bootable image. This argument is available only for WinPE images. Only one volume image can be marked as bootable in a .wim file.|
|   /WIMBoot | Use /WIMBoot to append the image with Windows image file boot (WIMBoot) configuration. This only applies to Windows 8.1 images that have been captured or exported as a WIMBoot file. This feature isn't supported in Windows 10.|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |

Example: 

``` syntax
Dism /Export-Image /SourceImageFile:install.wim /SourceIndex:1 /DestinationImageFile:install2.wim
```

## /Get-MountedImageInfo

Lists the images that are currently mounted and information about the mounted image such as whether the image is valid, read/write permissions, mount location, mounted file path, and mounted image index.

Example: 

``` syntax
Dism /Get-MountedImageInfo
```

## /Get-ImageInfo

Displays information about the images that are contained in the .wim, vhd or .vhdx file. When used with the /Index or /Name argument, information about the specified image is displayed, which includes if an image is a WIMBoot image, if the image is Windows 8.1, see Take Inventory of an Image or Component Using DISM. The /Name argument does not apply to VHD files. You must specify /Index:1 for VHD files.

Syntax: 

``` syntax
Dism /Get-ImageInfo /ImageFile:<path_to_image.wim> [{/Index:<Image_index> | /Name:<Image_name>}]
```

Examples: 

``` syntax
Dism /Get-ImageInfo /ImageFile:C:\test\offline\install.wim
```

``` syntax
Dism /Get-ImageInfo /ImageFile:C:\test\images\myimage.vhd /Index:1
```

## /Get-WIMBootEntry

Use /Get-WIMBootEntry to display WIMBoot configuration entries for the specified disk volume.

For more information about how to display WIMBoot configuration entries, see Take Inventory of an Image or Component Using DISM.

This only applies to Windows 8.1; this feature isn't supported in Windows 10.

Syntax:

``` syntax
Dism /Get-WIMBootEntry /Path:<volume_path>
```

Example: 

``` syntax
Dism /Get-WIMBootEntry /Path:C:\
```

## /List-Image

Displays a list of the files and folders in a specified image.

This command-line option does not apply to virtual hard disk (VHD) files.

Syntax:

``` syntax
Dism /List-Image /ImageFile:<path_to_image_file> {/Index:<image_index> | /Name:<image_name>}
```

Example: 

``` syntax
Dism /List-Image /ImageFile:install.wim /Index:1
```

## /Mount-Image

Mounts an image from a .wim, .vhd or .vhdx file to the specified directory so that it is available for servicing. An index or name value is required for most operations that specify a .wim file. 

Syntax:

``` syntax
Dism /Mount-Image /ImageFile:<path_to_image_file> {/Index:<image_index> | /Name:<image_name>} /MountDir:<path_to_mount_directory> [/ReadOnly] [/Optimize] [/CheckIntegrity]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /ReadOnly  | Sets the mounted image with read-only permissions. Optional. |
| /Optimize |   Reduces initial mount time. |
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |

Examples: 

``` syntax
Dism /Mount-Image /ImageFile:C:\test\images\myimage.wim /index:1 /MountDir:C:\test\offline
```

``` syntax
Dism /Mount-Image /ImageFile:C:\test\images\myimage.vhd /index:1 /MountDir:C:\test\offline /ReadOnly
```

## /Optimize-Image /WIMBoot

Performs specified configurations to an offline image.

|   Parameter     |   Description     |
|-----------------|-------------------|
| /WIMBoot  | configure an offline image for installing on a Windows image file boot (WIMBoot) system. |
| /Optimize |   Reduces initial mount time. /Optimize-Image /WIMBoot only applies to Windows 8.1 images that have been captured or exported as a WIMBoot file. Only use /Optimize-Image with images that will be used for WIMBoot supported systems. If /Optimize-Image is used with a non-WIMBoot supported system image, Windows may not work as expected, after installation on a non-WIMBoot supported device. |

Example: 

``` syntax
Dism /Image:C:\test\offline /Optimize-Image /WIMBoot
```

## /Remount-Image

Remounts a mounted image that has become inaccessible and makes it available for servicing.

Syntax: 

``` syntax
Dism /Remount-Image /MountDir:<path_to_mount_directory>
```

Example:

``` syntax
Dism /Remount-Image /MountDir:C:\test\offline
```

## /Split-Image

For WIM, this command splits an existing .wim file into multiple read-only split .swm files.

This option creates the .swm files in the specified directory, naming each file the same as the specified *path_to_swm*, but with an appended number. For example, if you set *path_to_swm* as `c:\Data.swm`, this option creates a Data.swm file, a Data2.swm file, a Data3.swm file, and so on, defining each portion of the split .wim file and saving it to the C:\ directory.

This command-line option does not apply to virtual hard disk (VHD) files.

For FFU, this command splits an existing full-flash update (.ffu) file into multiple read-only split .sfu files.

The /Split-Ffu option applies only to Windows 10 for desktop editions.

This option creates the .sfu files in the specified directory, naming each file the same as the specified /SFUFile, but with an appended number. For example, if you use `c:\flash.sfu`, you'll get a flash.sfu file, a flash2.ffu file, a flash3.sfu file, and so on, defining each portion of the split .sfu file and saving it to the C:\ directory.

Syntax for WIM:

``` syntax
Dism /Split-Image /ImageFile:<path_to_image_file> /SWMFile:<path_to_swm> /FileSize:<MB-Size> [/CheckIntegrity]
```

Syntax for FFU:

``` syntax
Dism /Split-Ffu /ImageFile:<path_to_image_file> /SFUFile:<pattern> /FileSize:<MB-Size>
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /FileSize     | Specifies the maximum size in megabytes (MB) for each created file. If a single file is larger than the value specified in the /FileSize option, one of the split .swm files that results will be larger than the value specified in the /FileSize option, in order to accommodate the large file.  |
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /ImageFile  | Specifies the path of a .FFU file, example: flash.ffu. |
|  /SFUFile  | References split FFU files (SFUs). *Pattern* is the naming pattern and location of split files.

Examples:

``` syntax
Dism /Split-Image /ImageFile:install.wim /SWMFile:split.swm /FileSize:650
```

``` syntax
DISM.exe /Split-Ffu /ImageFile:flash.ffu /SFUFile:flash.sfu /FileSize:650
```

## /Unmount-Image 

Unmounts the .wim, .vhd or .vhdx file and either commits or discards the changes that were made when the image was mounted.

You must use either the /commit or /discard argument when you use the /Unmount-Image option.

Syntax: 

``` syntax
Dism /Unmount-Image /MountDir:<path_to_mount_directory> {/Commit | /Discard} [/CheckIntegrity] [/Append]
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /CheckIntegrity | Detects and tracks .wim file corruption when used with capture, unmount, export, and commit operations. /CheckIntegrity stops the operation if DISM detects that the .wim file is corrupted when used with apply and mount operations. |
| /Append   |  Adds the modified image to the existing .wim file instead of overwriting the original image. The /CheckIntegrity and /Append arguments do not apply to virtual hard disk (VHD) files. |

Examples:

``` syntax
Dism /Unmount-Image /MountDir:C:\test\offline /commit
```

``` syntax
Dism /Unmount-Image /MountDir:C:\test\offline /discard
```

## /Update-WIMBootEntry

Updates the WIMBoot configuration entry, associated with the specified data source ID, with the renamed image file or moved image file path.

**Note:** **/Update-WIMBootEntry** requires a restart in order for any updates to take effect.

Syntax:

```
Dism /Update-WIMBootEntry /Path:<Volume_path> /DataSourceID:<Data_source_id> /ImageFile:<Renamed_image_path>
```

|   Parameter     |   Description     |
|-----------------|-------------------|
| /Path | Specifies the disk volume of the WIMBoot configuration. |
|  /DataSourceID  | Specifies the data source ID as displayed by /Get-WIMBootEntry. |

Example:

``` syntax
DISM.exe /Update-WIMBootEntry /Path:C:\ /DataSourceID:0 /ImageFile:R:\Install.wim
```

## /Apply-SiloedPackage

Applies one or more siloed provisioning packages (SPPs) to a specified image. This option is only available after running CopyDandI.cmd from the ADK for Windows 10, Version 1607, and running ``` dism.exe /Apply-SiloedPackage ``` from the target folder created by CopyDandI.cmd. 

**Note:** **/Apply-SiloedPackage** can only be run once against a Windows image, but **/PackagePath** can used more than once in the same command to apply multiple SPPs. SPPs will be applied in the specified order, so a dependency should be specified before the SPP that depends on it. 

For more information about siloed provisioning packages, and how to use CopyDandI.cmd, see [Siloed provisioning packages.](siloed-provisioning-packages.md)

To find out how to work with siloed provisioning packages, see [Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md).

``` Syntax
/Apply-SiloedPackage /PackagePath:<package_path> /ImagePath:<applied_image_path>
```

|  Parameter   | Description  |
|--------------|--------------|
| /PackagePath | Specifies the path of a siloed provisioning package file. |
| /ImagePath   | Specifies the path of the Windows image where you are applying the SPP. |

Example:

``` syntax
Dism.exe /apply-SiloedPackage /PackagePath:C:\test\Word.spp /PackagePath:C:\test\spp2.spp /ImagePath:C:\
```

## <span id="related_topics"></span>Related topics


[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[What is DISM?](what-is-dism.md)

[DISM Global Options for Command-Line Syntax](dism-global-options-for-command-line-syntax.md)

[Deploy Windows using Full Flash Update (FFU)](deploy-windows-using-full-flash-update--ffu.md)

[WIM vs. VHD vs. FFU: comparing image file formats](wim-vs-ffu-image-file-formats.md)
