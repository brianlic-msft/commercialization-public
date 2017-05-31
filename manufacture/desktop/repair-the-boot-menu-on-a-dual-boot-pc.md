---
author: Justinha
Description: 'Repair the boot menu on a dual-boot PC'
ms.assetid: 166c9499-b9b2-48bb-9ff6-d91dc0e497a3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Repair the boot menu on a dual-boot PC'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Repair the boot menu on a dual-boot PC


When setting up a PC to boot more than one operating system, you may sometimes lose the ability to boot into one of the operating systems. The BCDBoot option allows you to quickly add boot options for a Windows-based operating system.

## <span id="Repairing_a_Windows_partition_on_a_dual-boot_PC"></span><span id="repairing_a_windows_partition_on_a_dual-boot_pc"></span><span id="REPAIRING_A_WINDOWS_PARTITION_ON_A_DUAL-BOOT_PC"></span>Repairing a Windows partition on a dual-boot PC


1.  Install a separate hard drive or prepare a separate partition for each operating system.

2.  Install the operating systems. For example, if your PC has Windows 8.1, install Windows 10 onto the other hard drive or partition.

3.  Reboot the PC. The boot menus should appear with both operating systems listed.

    If both operating systems aren't listed:

    1.  Open a command line, either as an administrator from inside Windows, or by booting to a command line using the Windows installation disk and presssing Shift+F10, or by booting to Windows PE ([WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)).

    2.  Add boot options for a Windows operating system.

        ``` syntax
        Bcdboot D:\Windows
        ```

    3.  Reboot the PC. Now, the boot menu will show both menu options.

## <span id="Repair_another_operating_system_partition"></span><span id="repair_another_operating_system_partition"></span><span id="REPAIR_ANOTHER_OPERATING_SYSTEM_PARTITION"></span>Repair another operating system partition


You can manually add create partitions using BCDEdit, or you can use a third-party tool such as [EasyBCD](http://go.microsoft.com/fwlink/?LinkId=330254) to set up the boot partitions.

## <span id="related_topics"></span>Related topics


[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

 

 






