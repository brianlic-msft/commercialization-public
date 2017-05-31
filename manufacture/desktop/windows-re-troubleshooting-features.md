---
author: Justinha
Description: Windows RE troubleshooting features
ms.assetid: 5812bba2-a4ed-4659-87b0-774de7a84bf5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Windows RE troubleshooting features
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows RE troubleshooting features


If a Windows device can't start, it automatically fails over to the Windows Recovery Environment (Windows RE). The Automatic Repair tool in Windows RE automates the diagnosis and repair of an unbootable Windows installation. Windows RE is also a starting point for several tools for manual system recovery. This topic describes the automatic failover behavior, manual diagnosis, and repair process in Windows RE.


## <span id="bkmk_1"></span><span id="BKMK_1"></span>Recovering from startup failures


If the system detects a boot failure on a computer running Windows, the system automatically fails over into the on-disk Windows RE tool. At startup, the Windows loader sets a status flag to indicate that the boot process has started. Windows typically clears this flag before the Windows logon screen appears. However, if the boot attempt fails, Windows doesn't clear the flag. The next time that the computer starts, the loader detects the flag and assumes that a boot failure occurred. When this occurs, the loader starts Windows RE instead of Windows.

**Note**  
Boot failure detection relies on boot completion and not whether an error occurred in Windows 8. For example, a false positive may occur if power is lost during the boot process, and your user starts Windows RE even though the Windows installation is bootable.

 

Because the failover mechanism relies on the Windows boot manager and the Windows boot loader, some failures can make Windows RE inaccessible. In the following scenarios, your user must use the bootable Windows RE media to recover the computer:

-   Corrupt disk metadata exists in the master boot record (MBR), partition table, or boot sector of a Windows RE partition.

-   The boot manager is missing or corrupted.

-   The Boot Configuration Data (BCD) store is missing or corrupted.

If the boot loader can't read or write to the boot status flag, Windows won't be able to automatically fail over into Windows RE. However, your user can still manually start the on-disk Windows RE tool through the **Boot Options** menu.

## <span id="bkmk_2"></span><span id="BKMK_2"></span>Advanced troubleshooting utilities in Windows RE


Your user can manually start several system recovery tools after starting the on-disk Windows RE tool from the recovery media, or from the **Boot Options** menu. With the exception of Automatic Repair, the Windows Assessment and Deployment Kit (Windows ADK) doesn't include these tools. Push-button reset is the recommended recovery solution in Windows.

### <span id="bkmk_a"></span><span id="BKMK_A"></span>Automatic Repair

The Automatic Repair tool automates common diagnostic and repair tasks for non-bootable operating system installations. Automatic Repair starts if the computer fails over into Windows RE because of a detected boot failure. If automatic failover to an on-disk instance of Windows RE is not available, your users can also start Automatic Repair as a manual recovery tool from a Windows RE CD or DVD.

### <span id="bkmk_c"></span><span id="BKMK_C"></span>System Image Recovery

Use System Image Recovery for file backup and system image backup. System Image Recovery requires an external storage device. For file backup, your users can let Windows choose what to back up, or they can select individual folders, libraries, and drives. By default, backups are created on a regular schedule. Your users can change the schedule and manually create a backup at any time. After your user sets up System Image Recovery, Windows keeps track of the new or modified files and folders, adding them to the backup.

For system image backup, your users can create a system image or an exact image of a drive. A system image includes Windows and system settings, programs, and files. Your users can use a system image to restore the contents of their computer if the hard disk drive or computer stops working.

If your users restore their computer from a system image, the restoration is a complete restoration. Your users can't choose individual items to restore. All of the current programs, system settings, and files are replaced.

If you set up a scheduled file backup, you can include a system image with only the drives Windows requires to run. You can manually create a system image if you want to include additional data drives.

**Note**  
Previous system image versions are copies of the files and folders saved automatically by Windows as part of the system protection process. Depending on the type of file or folder, your users can open a previous version, save the version to a different location, or restore a previous version. Your users can use these previous versions to restore accidentally modified, deleted, or damaged files or folders. However, because Windows replaces these files with new versions the files won't be available if the drive fails.

 

### <span id="bkmk_d"></span><span id="BKMK_D"></span>Command Prompt

All Windows PE command-line tools are available from a command prompt window. For example, you can use Registry Editor (Regedit.exe), which includes command-line switches, to modify the Windows registry. Or, you can use the Chkdisk.exe tool to troubleshoot and fix volumes. For more information, see [Registry Editor](http://go.microsoft.com/fwlink/?LinkId=207693), [Chkdsk](http://go.microsoft.com/fwlink/?LinkId=207694), and [Troubleshooting Tools and Strategies](http://go.microsoft.com/fwlink/?LinkId=207695).

### <span id="bkmk_e"></span><span id="BKMK_E"></span>Custom Support and Recovery Tools

Computer manufacturers can provide custom support and recovery tools. These tools will vary by manufacturer. For more information, see the manufacturer-provided documentation.

## <span id="related_topics"></span>Related topics


[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

[REAgentC Command-Line Options](reagentc-command-line-options.md)

 

 






