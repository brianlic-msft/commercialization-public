---
author: Justinha
Description: 'How push-button reset features work'
ms.assetid: 86c93069-916c-4c94-8ba8-2fbf0d792a36
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'How push-button reset features work'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="How_push-button_reset_features_work"></span>How push-button reset features work


## <span id="Restoring_the_operating_system_and_customizations"></span><span id="restoring_the_operating_system_and_customizations"></span><span id="RESTORING_THE_OPERATING_SYSTEM_AND_CUSTOMIZATIONS"></span>Restoring the operating system and customizations


This section discusses the mechanisms Push-button reset features use to restore software on the PC.

### <span id="Restoring_Windows"></span><span id="restoring_windows"></span><span id="RESTORING_WINDOWS"></span>Restoring Windows

Push-button reset features restore Windows 10 by constructing a new copy of the OS using runtime system files located in the Windows Component Store (C:\\Windows\\WinSxS). This allows recovery to be possible even without a separate recovery image containing a backup copy of all system files.

In addition, push-button reset features restore Windows to an updated state rather than to the factory-preinstalled state. Specifically, the latest release or major update installed on the PC (such as Windows 10, version 1511) will be restored, while other updates installed after that are discarded.

This approach provides a balance between user experience in terms of the number of updates which need to be reinstalled and the features’ effectiveness in addressing update problems. It also allows Windows to remove older system files which are no longer needed for runtime use or for recovery, freeing up disk space.

By default, non-major updates are not restored. To ensure that updates preinstalled during manufacturing are not discarded after recovery, they should be marked as permanent by using the /Cleanup-Image command in DISM with the /StartComponentCleanup and /ResetBase options. Updates marked as permanent are always restored during recovery.

### <span id="Restoring_language_packs"></span><span id="restoring_language_packs"></span><span id="RESTORING_LANGUAGE_PACKS"></span>Restoring language packs

Language packs that are installed and used by at least one user account are restored. Other language packs are removed from the Windows Component Store seven days after the Out-of-Box Experience (OOBE). Using Push-button reset features after that will not restore the removed language packs.

On PCs running single-language editions of Windows, such as Windows 10 Home, users cannot download or install additional language packs, and they cannot use push-button reset features to switch languages if the preinstalled language packs have been removed.

### <span id="Restoring_drivers"></span><span id="restoring_drivers"></span><span id="RESTORING_DRIVERS"></span>Restoring drivers

Drivers are restored in a similar fashion as the OS. Instead of restoring them from a recovery image, existing drivers are preserved across recovery. As with system files, drivers are restored to the state they were in when the most recent release or major update is installed. For example:

-   If the customer performs recovery after booting up a new PC preinstalled with Windows 10, drivers that are present during OOBE will be restored, even if newer drivers have been installed since.
-   If the customer performs recovery after upgrading from Windows 10 to Windows 10, version 1511, the drivers that are present during the upgrade will be restored, even if newer drivers have been installed since.

Device applets which are installed outside of the driver INF package are not restored as part of this process. They are restored to factory version and state in the same way as other customizations such as Windows desktop applications. (See Restoring other customizations for more information.) If the device applet must always stay in sync (version wise) with the driver, it is recommended that both the driver and the device applet be installed via the same INF package.

### <span id="Restoring_previously_installed_Windows_apps"></span><span id="restoring_previously_installed_windows_apps"></span><span id="RESTORING_PREVIOUSLY_INSTALLED_WINDOWS_APPS"></span>Restoring previously installed Windows apps

Preinstalled Windows apps are always restored to their factory version and state. Instead of restoring them from a recovery image, a copy of the Windows apps is automatically backed up when they are provisioned during image customization and manufacturing, and the backups are restored when Push-button reset features are used.

### <span id="Restoring_other_customizations"></span><span id="restoring_other_customizations"></span><span id="RESTORING_OTHER_CUSTOMIZATIONS"></span>Restoring other customizations

By default, Push-button reset features restore only OS files, drivers, and preinstalled Universal Windows apps. Different mechanisms are used to restore other customizations, such as settings and Windows desktop applications.

-   **Windows desktop applications** can be captured using the User State Migration Tool’s (USMT) ScanState utility into a reference device data image within a provisioning package. Push-button reset features look for and automatically restore this provisioning package from a well-known location.
-   **Settings common to all editions of Windows 10** (including Windows 10 Mobile) can be set using the Windows Imaging and Configuration Designer (ICD) tool and stored in provisioning packages. Push-button reset features look for and automatically restore these provisioning packages from a well-known location. Alternatively, these settings can be restored using a combination of an unattend file and extensibility scripts for Push-button reset.
-   **Settings specific to editions of Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)** can be restored using a combination of an unattend file and extensibility scripts for Push-button reset. Examples of these settings include manufacturer support information, manufacturer logos and Start Menu layout.

**Note**  
Many of the settings customizations allowed or required by the OPD are specific to Windows 10 for desktop, and cannot be stored in provisioning packages created using Windows ICD. For Windows 10 RTM, the use of an unattend file and Push-button reset extensibility scripts is recommended for restoring all settings customizations during recovery. The use of provisioning packages created using Windows ICD is completely optional.

 

## <span id="Refresh_your_PC"></span><span id="refresh_your_pc"></span><span id="REFRESH_YOUR_PC"></span>Refresh your PC


**The Refresh your PC feature can be summarized in the following steps:**

1.  PC boots into the Windows Recovery Environment (Windows RE).
2.  **EXTENSIBILITY POINT A**: OEMs can optionally add a script here. (See [Extensibility points](#extensibility-points) later in this topic).
3.  User accounts, settings, and data are gathered and moved to a temporary location.
4.  A new copy of the OS is constructed in a temporary location using files from the Windows Component Store.
5.  Customizations stored in provisioning packages under C:\\Recovery\\Customizations are applied to the new OS.
6.  Drivers are copied from the existing OS and injected into the new OS.
7.  Preinstalled Windows apps are restored from their backup location.
8.  System-critical settings are applied to the new OS.
9.  Existing OS is moved to C:\\Windows.old.
10. New OS is moved to the root of the OS volume.
11. **EXTENSIBILITY POINT B**: OEMs can optionally add a script here. (See [Extensibility points](#extensibility-points) later in this topic).
12. PC reboots to the new OS.
13. During first boot, user data and settings are reapplied.

### <span id="Preserved_settings"></span><span id="preserved_settings"></span><span id="PRESERVED_SETTINGS"></span>Preserved settings

The **Refresh your PC** feature preserves a number of system and user settings that are required to keep the system running while minimizing the need for users to reconfigure their PCs.

Preserved settings can be broadly categorized into one of the following categories:

-   Are required for users to log on to their PCs after running the **Refresh your PC** feature.
-   Affect how users access their documents and personal files.
-   Are difficult for most users to recreate.
-   Affect system security or user privacy.
-   Personalize the PC.

The preserved settings are summarized as follows:

-   User accounts (local, domain, Microsoft account), and group memberships
-   Domain settings
-   Windows Update settings
-   Library settings
-   Lock screen background
-   Desktop themes
-   International settings
-   Wireless network profiles
-   Settings configured in Windows Welcome

### <span id="User_data"></span><span id="user_data"></span><span id="USER_DATA"></span>User data

Because user data can be stored in many locations, the **Refresh your PC** feature preserves most folders and files that are not part of a standard Windows installation. The **Refresh your PC** feature refreshes the following system locations and does not preserve the contents.

-   \\Windows
-   \\Program Files
-   \\Program Files(x86)
-   \\ProgramData
-   \\Users\\&lt;user name&gt;\\AppData (in each user profile)

**Note**  Some applications store user data in the \\AppData folder in user profiles. The \\AppData folders are available in C:\\Windows.old after using the **Refresh your PC** feature.

 

The **Refresh your PC** feature bypasses the following locations and preserves the contents:

-   File History versioning data
-   All files and folders on non-OS partitions

### <span id="Windows_Applications"></span><span id="windows_applications"></span><span id="WINDOWS_APPLICATIONS"></span>Windows Applications

The Refresh your PC feature handles application types differently in order to ensure that the PC can be restored to a reliable state. Applications are handled as follows:

-   User-acquired Windows apps from the Windows Store are not preserved. Users will need to reinstall them from the Windows Store. This is a change from Windows 8/8.1.
-   Preinstalled Windows apps are restored to their factory version and state. Updates to these apps will be downloaded and reapplied automatically when internet connectivity is available.
-   User-acquired Windows desktop applications are not preserved. Users will need to reinstall them manually.
-   Preinstalled Windows desktop applications captured in the customizations provisioning package will be restored to their factory condition, even if users have previously uninstalled them.

The **Refresh your PC** feature does not preserve user-installed Windows desktop applications by default, and locations that are commonly used for storing application settings (\\AppData and \\ProgramData) are deleted. Manufacturers can leverage the push-button reset extensibility points to save and later restore specific application settings and data, if necessary.

## <span id="Reset_your_PC"></span><span id="reset_your_pc"></span><span id="RESET_YOUR_PC"></span>Reset your PC


**The Reset your PC feature can be summarized in the following steps:**

1.  PC boots into the Windows Recovery Environment (Windows RE).
2.  User accounts, data and installed Windows apps and Windows desktop applications are removed from the OS volume.
3.  Data volumes are formatted (if requested by the user).
4.  Data erasure is performed on OS and data volumes (if requested by the user).
5.  **EXTENSIBILITY POINT C**: OEMs can optionally add a script here. (See [Extensibility points](#extensibility-points) later in this topic).
6.  A new copy of the OS is constructed in a temporary location using files from the Windows Component Store.
7.  Customizations stored in provisioning packages under C:\\Recovery\\Customizations are applied to the new OS.
8.  Drivers are copied from the existing OS and injected into the new OS.
9.  Preinstalled Universal Windows apps are restored from their backup location.
10. Existing OS is removed.
11. New OS is moved to the root of the OS volume.
12. **EXTENSIBILITY POINT D**: OEMs can optionally add a script here. (See [Extensibility points](#extensibility-points) later in this topic).
13. PC reboots to the new OS.
14. OOBE starts.

### <span id="Data_removal_options"></span><span id="data_removal_options"></span><span id="DATA_REMOVAL_OPTIONS"></span>Data removal options

When users use the **Reset your PC** feature, they will be presented with options that affect the way that their data is removed from the PC.

-   If the PC has more than one user-accessible hard drive volumes, users can choose to remove data from all volumes or only the Windows volume.

    The Windows volume is never formatted, as the files needed to rebuild the OS are on it. Instead, user data files are deleted individually.

    If user chooses to remove data from all volumes, the data volumes are formatted.
	
-   Users can choose to simply delete their files or to also perform data erasure on the drive(s) so that recovery of the data by someone else is much more difficult.

Manufacturers must configure custom utility partitions as follows to ensure these partitions are not affected by the reset process.

-   For UEFI-based PCs, utility partitions on GUID Partition Table (GPT) disks should have the GPT\_ATTRIBUTE\_PLATFORM\_REQUIRED attribute set. See [PARTITION\_INFORMATION\_GPT structure](http://go.microsoft.com/fwlink/?LinkId=617162) for more information on GPT partition attributes.
-   For BIOS-based PCs, utility partitions on Master Boot Record (MBR) disks must be of a type other than 0x7, 0x0c, 0x0b, 0x0e, 0x06, and 0x42.

The time it takes to perform data erasure depends on drive speed, partition size, and whether the drive is encrypted using Windows BitLocker Drive Encryption. The data erasure functionality is targeted at consumers and does not meet government and industry data erasure standards.

If [Compact OS](compact-os.md) is enabled on the OS before the reset, Compact OS will remain enabled after the PC has been reset. 

## <span id="Bare_metal_recovery"></span><span id="bare_metal_recovery"></span><span id="BARE_METAL_RECOVERY"></span>Bare metal recovery


If the user needs to replace their hard drive or completely wipe it, they can use bootable recovery media to perform bare metal recovery. Bare metal recovery removes all existing partitions on the system disk and recreates all partitions, before restoring software onto the PC. Two types of recovery media are supported:

-   **User-created recovery media** using the **Create a recovery drive** utility in Windows 10. This backs up the files needed to restore the PC to a pristine state.
-   **Manufacturer-created recovery media** for support and refurbishing scenarios by placing a recovery image on a piece of bootable Windows RE media.

**When user-created recovery media are used, the bare metal recovery feature can be summarized in the following steps:**

1.  The system disk is identified.
2.  All partitions from the system disk are removed.
3.  Data erasure is performed on the system disk (if requested by the user).
4.  Factory or default partition layout is recreated on the system disk.
5.  All partitions are formatted.
6.  Recovery files from recovery media are copied to the OS volume.
7.  A new copy of the OS is constructed at the root of the OS volume.
8.  Customizations stored in provisioning packages are applied.
9.  Drivers are injected into the new OS.
10. Preinstalled Windows apps are restored.
11. Boot files are configured on the system partition.
12. PC reboots to the new OS.
13. OOBE starts.

### <span id="Data_removal_options"></span><span id="data_removal_options"></span><span id="DATA_REMOVAL_OPTIONS"></span>Data removal options

When users use the bare metal recovery feature, they can choose to perform data erasure on the entire system disk before the factory partition layout is reapplied. On most PCs, this data erasure process is done in software, writing cryptographically random patterns to the entire LBA range of the system disk once.

However, on certain hardware configurations, the data erasure process is performed by the storage device’s hardware controller. This often takes less time to complete and is usually more thorough in removing remnant data. Hardware-based data erasure is supported on PCs with storage devices which meet the following criteria:

-   eMMC
-   Supports the Secure Trim and Sanitize commands

### <span id="System_disk_selection"></span><span id="system_disk_selection"></span><span id="SYSTEM_DISK_SELECTION"></span>System disk selection

Bare metal recovery automatically identifies the system disk using the following methods:

-   Adaptor location path and GUID of the system disk are written to a UEFI variable during OOBE.
    -   Performed only when both the system and Windows partitions are on the system disk.

    -   The variable is updated if necessary when Windows RE gets disabled and then re-enabled.

-   During bare metal recovery, if multiple internal disks are detected, the system disk is searched in this order:
    -   Disk with GUID matching the value stored in the UEFI variable.
    -   Disk with location path matching the value stored in firmware.
    -   Disk with an existing ESP.
        -   If multiple disks with ESP are found, bare metal recovery will not proceed.
    -   Uninitialized (raw) disk.
        -   If multiple uninitialized disks are found, bare metal recovery will not proceed.
-   On legacy BIOS/MBR systems, the BIOS-reported system disk is used.

### <span id="User-created_recovery_media"></span><span id="user-created_recovery_media"></span><span id="USER-CREATED_RECOVERY_MEDIA"></span>User-created recovery media

When users create USB recovery media using the Create a recovery drive utility, the resulting media always contain a bootable copy of Windows RE. This gives users access to troubleshooting and recovery tools when booting from recovery media.

Users can optionally back up files required to perform bare metal recovery. When the option is selected, the following are copied onto the USB recovery media as well:

-   Windows Component Store
-   Installed drivers
-   Backup of preinstalled Windows apps
-   Provisioning packages containing preinstalled customizations (under C:\\Recovery\\Customizations)
-   Push-button Reset configuration XML and scripts (under C:\\Recovery\\OEM)

### <span id="Manufacturer-created_recovery_media"></span><span id="manufacturer-created_recovery_media"></span><span id="MANUFACTURER-CREATED_RECOVERY_MEDIA"></span>Manufacturer-created recovery media

Bare metal recovery supports the use of a recovery WIM image when the media are prepared by manufacturers. This type of media is primarily used in support and refurbishing scenarios.

Manufacturer-created media must contain the following:

1.  A bootable Windows RE image.
2.  A Push-button reset-compatible recovery image (install.wim).
3.  A Push-button reset configuration file (Resetconfig.xml) which specifies disk partitioning information.
4.  A DISKPART script to perform partitioning of the disk.

### <span id="extensibility-points"></span><span id="EXTENSIBILITY-POINTS"></span>Extensibility points for push-button reset features

Push-button reset provides extensibility points where manufacturers can insert custom operations when a user runs the **Refresh your PC** and **Reset your PC** features.

See the sections above to see where the custom operations that can be executed for these features appear.

The extensibility points for **Refresh your PC** are summarized in the following table:

|            |                                                                                                                            |                                                                                                                                                   |
|------------|----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Ext. point | System state                                                                                                               | Example usage                                                                                                                                     |
| A          | Settings and data to be migrated have been moved to a temporary location                                                   | Copy files, drivers, or settings that are not migrated by default when the user runs the Refresh your PC feature.                                 |
| B          | The OS has been rebuilt. Drivers and customizations have been reapplied. Only critical system settings have been migrated. | Restore customization files (e.g. unattend.xml, layoutmodification.xml), or files and settings you might have backed up at extensibility point A. |

 

The extensibility points for **Reset your PC** are summarized in the following table:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left">Ext. point</td>
<td align="left">System state</td>
<td align="left">Example usage</td>
</tr>
<tr class="even">
<td align="left">C</td>
<td align="left">All user data have been removed from the Windows partition and data partitions have (optionally) been formatted.</td>
<td align="left">Reconfigure data partitions if needed.
<div class="alert">
<strong>Important</strong>  Do not modify the Windows partition.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left">D</td>
<td align="left">The OS has been rebuilt. Drivers and customizations have been reapplied.</td>
<td align="left">Restore customization files (e.g. unattend.xml, layoutmodification.xml), or apply additional customizations.</td>
</tr>
</tbody>
</table>

 

## <span id="Compact_OS"></span><span id="compact_os"></span><span id="COMPACT_OS"></span>Compact OS


Compact OS is a collection of technologies which allow Windows 10 to be deployed on PCs with storage capacity as low as 16 gigabytes (GB). The following two technologies in particular work in conjunction with the Push-button reset changes to reduce Windows’ disk footprint:

-   Per-file compression When applying a reference image file (WIM) to a PC, the files written to the disk can be compressed individually using the XPRESS Huffman codec. This is the same codec used by the WIMBoot technology in Windows 8.1. When Push-button reset features rebuilds the OS, the runtime system files remain compressed.
-   Single-instancing of installed customizations After the installed customizations (e.g. Windows desktop applications) have been captured (using ScanState) into a reference device data image stored inside a provisioning package, the two copies of the customizations can be singled-instanced to reduce disk footprint impact. This is accomplished by converting the installed customizations (e.g. C:\\Program Files\\Foo\\Foo.exe) into file pointers linked to the contents of the reference device data image.

The following diagram illustrates the high-level content layout of PCs with Compact OS enabled:

![Diagram shows the partition structure. The OS partition includes the Runtime OS and provisioning packages, which are in C:\Recovery\Customizations. The Runtime OS is compressed. Desktop apps are in provisioning packages, in the C:\Recovery\Customizations folder, and these provisioning packages are compressed. To run the desktop apps, the runtime OS uses file pointers that go to the provisioning package.](images/dep-winre-compactos.png)

Both technologies are optional and can be configured during deployment.

## <span id="Updating_the_on-disk_Windows_Recovery_Environment"></span><span id="updating_the_on-disk_windows_recovery_environment"></span><span id="UPDATING_THE_ON-DISK_WINDOWS_RECOVERY_ENVIRONMENT"></span>Updating the on-disk Windows Recovery Environment


In Windows 10, the on-disk copy of Windows RE can be serviced as part of rollup updates for the OS. Not all rollup updates will service Windows RE.

Unlike the normal OS update process, updates for Windows RE do not directly serviced the on-disk Windows RE image (winre.wim). Instead, a newer version of the Windows RE image replaces the existing one, with the following contents being injected or migrated into the new image:

-   Boot critical and input device drivers from the full OS environment are added to the new Windows RE image.
-   Windows RE customizations under \\Sources\\Recovery of the mounted winre.wim are migrated to the new image.

The following contents from the existing Windows RE image are not migrated to the new image:

-   Drivers which are in the existing Windows RE image but not in the full OS environment
-   Windows PE optional components which are not part of the default Windows RE image
-   Language packs for Windows PE and optional components

The Windows RE update process makes every effort to reuse the existing Windows RE partition without any modification. However, in some rare situations where the new Windows RE image (along with the migrated/injected contents) does not fit in the existing Windows RE partition, the update process will behave as follows:

-   If the existing Windows RE partition is located immediately after the Windows partition, the Windows partition will be shrunk and space will be added to the Windows RE partition. The new Windows RE image will be installed onto the expanded Windows RE partition.
-   If the existing Windows RE partition is not located immediately after the Windows partition, the Windows partition will be shrunk and a new Windows RE partition will be created. The new Windows RE image will be installed onto this new Windows RE partition. The existing Windows RE partition will be orphaned.
-   If the existing Windows RE partition cannot be reused and the Windows partition cannot successfully be shrunk, the new Windows RE image will be installed onto the Windows partition. The existing Windows RE partition will be orphaned.

**Important**  To ensure that your customizations continue to work after Windows RE has been updated, they must not depend on functionalities provided by Windows PE optional components which are not in the default Windows RE image (e.g. WinPE-NetFX). To facilitate development of Windows RE customizations, the WinPE-HTA optional component has been added to the default Windows RE image in Windows 10.

 

**Note**  The new Windows RE image deployed as part of the rollup update contains language resources only for the system default language, even if the existing Windows RE image contains resources for multiple languages. On most PCs, the system default language is the language selected at the time of OOBE.

 

 

 





