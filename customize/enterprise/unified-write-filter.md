---
title: Unified Write Filter (UWF) feature
description: Unified Write Filter (UWF) feature
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 05f82dbf-64e7-4ed2-8932-9abcfad59598
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Unified Write Filter (UWF) feature


You can use the Unified Write Filter (UWF) feature on your device to help protect your physical storage media, including most standard writable storage types that are supported by Microsoft Windows, such as physical hard disks, solid-state drives, internal USB devices, external SATA devices, and so on. You can also use UWF to make read-only media appear to the OS as a writable volume.

**Important**  
You cannot use UWF to protect external removable drives, USB devices or flash drives.

 

UWF intercepts all write attempts to a protected volume and redirects those write attempts to a virtual overlay. This improves the reliability and stability of your device and reduces the wear on write-sensitive media, such as flash memory media like solid-state drives.

The overlay does not mirror the entire volume, but dynamically grows to keep track of redirected writes. Generally the overlay is stored in system memory, although you can cache a portion of the overlay on a physical volume.

**Note**  
UWF fully supports the NTFS file system; however, during device startup, NTFS file system journal files can write to a protected volume before UWF has loaded and started protecting the volume.

 

## Requirements


Windows 10 Enterprise or Windows 10 Education.

## Terminology


**Turn on, enable:** To make the setting available to the device and optionally apply the settings to the device. Generally *turn on* is used in the user interface or control panel, whereas *enable* is used for command line.

**Configure:** To customize the setting or sub-settings.

## Turn UWF on or off


UWF is an optional component and is not enabled by default in Windows 10. It must be turned on prior to configuring. You can turn on and configure UWF in a customized Windows 10 image (.wim) if Windows has not been installed. If Windows has already been installed and you are applying a provisioning package to configure UWF, you must first turn on UWF in order for a provisioning package successfully apply.

**Turn on UWF by using Control Panel**

1.  In the **Search the web and Windows** field, type **Programs and Features** and either press **Enter** or tap or click **Programs and Features** to open it.
2.  In the **Programs and Features** window, click **Turn Windows features on or off**.
3.  For Windows 10, version 1511, in the **Windows Features** box, select **Unified Write Filter**.

    For Windows 10, version 1607, in the **Windows Features** window, expand the **Device Lockdown** node, and check or clear the checkbox for **Unified Write Filter**.

4.  Click **OK**. The **Windows Features** window indicates Windows is searching for required files and displays a progress bar. Once found, the window indicates Windows is applying the changes. When completed, the window indicates the requested changes are completed.
5.  Click **Close** to close the **Windows Features** window.

This example uses a Windows image called install.wim, but you can use the same procedure to apply a provisioning package. For more information on DISM, see [What Is Deployment Image Servicing and Management](https://technet.microsoft.com/en-us/library/dd744566.aspx)?

When you create the WIM, you configure the settings.

**Turn on and configure UWF by using DISM**

1.  Open a command prompt with administrator privileges.
2.  Copy install.wim to a temporary folder on hard drive (in the following steps, we'll assume it's called C:\\wim).
3.  Create a new directory.

    ```
    md c:\wim
    ```

4.  Mount the image.

    ```
    dism /mount-wim /wimfile:c:\bootmedia\sources\install.wim /index:1 /MountDir:c:\wim
    ```

5.  Enable the feature.

    ```
    dism /image:c:\wim /enable-feature /featureName:Client-UnifiedWriteFilter
    ```

6.  Commit the change.

    ```
    dism /unmount-wim /MountDir:c:\wim /Commit
    ```

If Windows has already been installed and you are applying a provisioning package to configure UWF, you must first turn on UWF in order for a provisioning package to be successfully applied.

**Turn on and configure UWF by using Windows Imaging and Configuration Designer (ICD)**

1.  Build a provisioning package in Windows Imaging and Configuration Designer (ICD) by following the instructions in [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107).

    In the **Select Windows Edition** window, choose **Common to all Windows desktop editions**.

    **Note**  When setting the file exclusion in Windows ICD, you do not need to specify the drive letter since that is already input via the Volume protection setting. For example, if the file being excluded is C:\\testdir\\test.txt, after adding a drive in Volume protection, you only need to input \\testdir\\test.txt to add this file exclusion.

     

2.  In the Available customizations page, select **Runtime settings** &gt; **SMISettings** and then set the value for the unified write filter setting.
3.  Once you have finished configuring the settings and building the provisioning package, you can apply the package to the image deployment time or runtime. See the To apply a provisioning package to a Windows 10 for desktop editions image section in [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107) for more information. Note that the process for applying the image to a Windows 10 Enterprise is the same.

## Turn on and configure UWF by using Windows Management Instrumentation (WMI)


If Windows has already been installed and you do not want to use a provisioning package, you can also configure UWF by using the Windows Management Instrumentation (WMI) providers. To turn on UWF using WMI, you can use the [UWF\_Filter](uwf-filter.md) function, specifically the [UWF\_Filter.Enable](uwf-filterenable.md) method. You can do this in one of the following ways:

-   Use the WMI providers directly in a PowerShell script.
-   Use the WMI providers directly in an application.
-   Use the command line tool, [uwfmgr.exe](uwfmgrexe.md).

You must restart your device after you turn on or turn off UWF before the change takes effect.

The first time you enable UWF on your device, UWF makes the following changes to your system to improve the performance of UWF:

-   Paging files are disabled.
-   System restore is disabled.
-   SuperFetch is disabled.
-   File indexing service is turned off.
-   Fast boot is disabled.
-   Defragmentation service is turned off.
-   BCD setting **bootstatuspolicy** is set to **ignoreallfailures**.

You can change these settings after you turn on UWF if you want to. For example, you can move the page file location to an unprotected volume and re-enable paging files.

**Important**  
If you add UWF to your image by using SMI settings in an unattend.xml file, turning on UWF only sets the **bootstatuspolicy** BCD setting and turns off the defragmentation service. In this case, you must manually turn off the other features and services if you want to increase the performance of UWF.

 

All configuration settings for UWF are stored in the registry. UWF automatically excludes these registry entries from filtering.

UWF maintains configuration settings in the registry for the current session and for the next session after a device restart. Static configuration changes do not take effect until after a device restart, and these changes are saved in the registry entries for the next session. Dynamic configuration changes occur immediately and persist after a device restart.

For more information about UWF WMI providers, see [Unified Write Filter WMI provider reference](uwf-wmi-provider-reference.md).

For more information about the command line tool for configuring UWF, see [uwfmgr.exe](uwfmgrexe.md).

## UWF overlay


In UWF, an overlay is a virtual storage space that keeps track of changes made to the underlying protected volumes.

UWF intercepts all modifications to any sector on a protected volume. A sector is the smallest unit that can be changed on a storage volume. Any time the file system attempts to modify a protected sector, UWF instead copies the sector from the protected volume to the overlay, and then modifies the overlay instead. If an application attempts to read from that sector, UWF returns the data from the overlay instead, so that the system maintains the appearance of having written to the volume, while the volume remains unchanged.

You can increase the uptime of a system by configuring UWF to use a disk-backed overlay. This causes UWF to cache a portion of the overlay on the system volume, which generally enables a significantly greater maximum overlay size. If your device is write-sensitive, you can configure UWF to maintain the overlay entirely in system memory.

UWF also supports the use of paging to increase virtual memory, if the page file exists on an unprotected volume. When paging is used together with a RAM-based overlay, the uptime of the system can be significantly increased.

UWF does not support the use of fast startup when shutting down your device. If fast startup is turned on, shutting down the device does not clear the overlay. You can disable fast startup in Control Panel by navigating to **Control Panel** &gt; **All Control Panel Items** &gt; **Power Options** &gt; **System Settings** and clearing the checkbox next to **Turn on fast startup (recommended)**.

For more information about overlays in UWF, see [Overlay for Unified Write Filter (UWF)](uwfoverlay.md).

## Volumes


A volume is a logical unit that represents an area of persistent storage to the file system that is used by the OS. A volume can correspond to a single physical storage device, such as a hard disk, but volumes can also correspond to a single partition on a physical storage device with multiple partitions, or can span across multiple physical storage devices. For example, a collection of hard disks in a RAID array can be represented as a single volume to the OS.

UWF supports all fixed volume types (except for external USB volumes), including master boot record (MBR) volumes and GUID partition table (GPT) volumes.

**Important**  
UWF does not support Storage Spaces. For more information, see [Storage Spaces Overview](http://go.microsoft.com/fwlink/?LinkId=690587).

 

When you configure UWF to protect a volume, you can specify the volume by using either a drive letter or the volume device identifier. To determine the device identifier for a volume, query the **DeviceID** property in the **Win32\_Volume**WMI class.

If you specify a volume using a drive letter, UWF uses *loose binding* to recognize the volume. By using loose binding, drive letters can be assigned to different volumes if the hardware or volume configuration changes. If you specify a volume using the volume device identifier, UWF uses *tight binding* to recognize the volume. By using tight binding, the device identifier is unique to the storage volume and is independent from the drive letter assigned to the volume by the file system.

## Exclusions


If you want to protect a volume with UWF while excluding specific files, folders, or registry keys from being filtered by UWF, you can add them to an exclusion list.

**Note**  
On non-NTFS file system and non-FAT volumes, for example, Extended File Allocation Table (exFAT) volumes, you can protect the volume, but cannot create file exclusions or do file commit operations on the volume. Note that writes to excluded files still influence the growth of the Overlay.

 

### File and folder exclusions

You can add specific files or folders on a protected volume to a file exclusion list to exclude those files and folders from being filtered by UWF. When a file or folder is in the exclusion list for a volume, all writes to that file or folder bypass UWF filtering, and are written directly to the protected volume and persist after the device restarts.

You must use an administrator account to add or remove file or folder exclusions during run time, and you must restart the device for new exclusions to take effect.

**Important**  
You cannot add exclusions for the following items:

-   \\Windows\\System32\\DEFAULT
-   \\Windows\\System32\\SAM
-   \\Windows\\System32\\SECURITY
-   \\Windows\\System32\\SOFTWARE
-   \\Windows\\System32\\SYSTEM
-   \\Users\\*&lt;User Name&gt;*\\NTUSER.DAT

You also cannot add exclusions for the following items:

-   The volume root. For example, C: or D:.
-   The \\Windows folder on the system volume.
-   The \\Windows\\System32 folder on the system volume.
-   The \\Windows\\System32\\Drivers folder on the system volume.
-   Paging files.

However, you can exclude subdirectories and files under these items.

 

You cannot rename or move a file or folder from a protected location to an unprotected location, or vice versa. When write filters are active and you attempt to delete an excluded file or folder in Windows Explorer, the system attempts to move the file or folder to the Recycle Bin. This causes an error, because you cannot move files that are not filtered to a location that is write filter protected.

To work around this, you can disable the Recycle Bin. Alternatively, the user can press Ctrl+Shift and then left-click on the file to directly delete the excluded file, bypassing the Recycle Bin, or the user can delete the excluded file directly from a command prompt. You must restart the device for new exclusions to take effect.

For more information about common file exclusions, see [Common write filter exclusions](uwfexclusions.md).

### Virtual Hard Disk (VHD) file exclusions

When you deploy a Windows 10 Enterprise image with UWF on a VHD boot disk, you can protect the volume that contains the VHD file by adding a file exclusion for the VHD file before enabling UWF and protecting the volume.

To add a file exclusion for the VHD file, at an administrator command prompt, type the following:

``` syntax
uwfmgr.exe file add-exclusion <drive containing VHD file>:\<path to VHD file>\<VHD file name>.vhd
```

For example:

``` syntax
uwfmgr.exe file add-exclusion E:\VHD\test.vhd
```

### Registry exclusions

You can add specific registry keys to an exclusion list to exclude those keys from being filtered by UWF. When a registry key is in the exclusion list, all writes to that registry key bypass UWF filtering and are written directly to the registry and persist after the device restarts.

You must use an administrator account to add or remove registry exclusions during run time, and you must restart the device for new exclusions to take effect.

If you exclude a registry key, all its subkeys are also excluded from filtering. You can exclude registry subkeys only under the following registry keys:

-   HKEY\_LOCAL\_MACHINE\\BCD00000000
-   HKEY\_LOCAL\_MACHINE\\SYSTEM
-   HKEY\_LOCAL\_MACHINE\\SOFTWARE
-   HKEY\_LOCAL\_MACHINE\\SAM
-   HKEY\_LOCAL\_MACHINE\\SECURITY
-   HKEY\_LOCAL\_MACHINE\\COMPONENTS

**Note**  
UWF automatically excludes certain registry keys from being filtered. These registry keys are primarily related to UWF configuration settings and cannot be removed from the exclusion list.

 

For more information about common registry exclusions, see [Common write filter exclusions](uwfexclusions.md).

## UWF servicing mode


When a device is protected with UWF, you must use UWF servicing mode commands to service the device and apply updates to an image. You can use UWF servicing mode to apply Windows updates, antimalware signature file updates, and custom software or third-party software updates.

For more information about how to use UWF servicing mode to apply software updates to your device, see [Service UWF-protected devices](service-uwf-protected-devices.md).

## Troubleshooting UWF


UWF uses Windows Event Log to log events, errors and messages related to overlay consumption, configuration changes, and servicing.

For more information about how to find event log information for troubleshooting problems with Unified Write Filter (UWF), see [Troubleshooting Unified Write Filter (UWF)](uwftroubleshooting.md).

## Related topics


[Unbranded Boot](unbranded-boot.md)

[Custom Logon](custom-logon.md)

[Shell Launcher](shell-launcher.md)

[Assigned access](assigned-access.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Unified%20Write%20Filter%20%28UWF%29%20feature%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





