---
title: Hibernate Once/Resume Many (HORM)
description: Hibernate Once/Resume Many (HORM)
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 602B4A95-7C98-41DC-B604-DBA7832A96ED
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hibernate Once/Resume Many (HORM)


You can use the Hibernate Once/Resume Many (HORM) feature with Unified Write Filter (UWF) to start your device in a preconfigured state. When HORM is enabled, your system always resumes and restarts from the last saved hibernation file (hiberfil.sys).

A device with HORM enabled can quickly be turned off or shut down, and then restarted into the preconfigured state, even in the event of a sudden power loss.

**Note**  HORM cannot be used on a Unified Extensible Firmware Interface (UEFI) device. The installation procedure for UEFI always creates a hidden system partition and Unified Write Filter (UWF) cannot protect hidden partitions. Since HORM requires all fixed partitions to be protected, you cannot use HORM on any devices that contain a hidden partition, including UEFI-capable devices.

 

## Requirements


Windows 10 Enterprise, Windows 10 Education or Windows 10 IoT Core (IoT Core).

## UWF configuration


UWF must be enabled before you can enable or disable HORM. UWF must be configured in the following ways to protect the hibernation file from becoming invalid:

-   All fixed volumes that are mounted on the system must be protected by UWF.
-   Your system must not have any file, folder, or registry exclusions configured for UWF.
-   The UWF overlay must be configured to use RAM mode. HORM does not support disk-backed overlays.

UWF does not filter hibernation files from being written to disk. If you want to protect the preconfigured state of your device, lock down any functionality that can modify the hibernation file. For example, disable hibernation, hybrid sleep, and fast startup on your device for standard user accounts so that the saved hibernation file is not overwritten when entering a sleep, hibernate, or shutdown state.

## HORM and Unified Extensible Firmware Interface (UEFI) capable devices


When you install Windows 10 on a UEFI-capable device, the installation procedure always creates a hidden system partition. UWF cannot protect hidden partitions.

Since HORM requires all fixed partitions to be protected, you cannot use HORM on any device that contains a hidden partition, including all UEFI capable devices.

## Configure HORM


1.  On the device, open a command prompt as an administrator.
2.  To enable hibernation on the device, type the following command:

    `powercfg /h on`

3.  To enable UWF on your device, type the following command:

    `uwfmgr.exe filter enable`

4.  To protect all volumes on your device, type the following command:

    `uwfmgr.exe volume protect all`

    **Note**  DVD RW and floppy drives throw an expected error that can be safely ignored.

     

5.  To restart your device to enable UWF, type the following command:

    `uwfmgr.exe filter restart`

6.  After the device restarts, to verify the UWF changes that you made on your device, type the following command:

    `uwfmgr.exe get-config`

7.  To enable HORM on your device, type the following command:

    `uwfmgr.exe filter enable-horm`

    **Note**  Remove all file and registry exclusions before you enable HORM.

     

8.  (Optional) In Control Panel, set the Power Option When I press the power button to avoid displaying the command prompt when resuming from hibernation, or use a script to close the command prompt on startup.
9.  To hibernate the system one time to create an initial hibernation file, at the command prompt, type the following command:

    `shutdown /h`

10. Press the power button to wake the system from hibernation.
11. After the system starts from hibernation to create an initial hibernation file, to shut down and restart the system, type the following command:

    `uwfmgr.exe restart`

12. When HORM is enabled, you cannot change the UWF configuration. To make changes, you must first disable HORM. To disable HORM, type the following command:

    `uwfmgr.exe filter disable-horm`

13. To restart the system to finish disabling HORM, type the following command:

    `uwfmgr.exe restart`

    The system will restart normally with HORM disabled.

**Caution**  Do not uninstall UWF when the filter is enabled or when HORM is enabled, either online or offline by using Windows PE.

 

## Fix an issue when you cannot disable HORM


In rare circumstances, your device can enter a state where you cannot disable HORM normally.

If you cannot disable HORM on your device, use following procedure to resolve this issue:

1.  Start your device in Windows PE.
2.  Type the following command:

    `bcdedit.exe /set {bootmgr} custom:26000024 0`

3.  Restart the device:

    `shutdown /r/t 0`

4.  Disable HORM:

    `uwfmgr.exe filter disable-horm`

5.  Enable HORM:

    `uwfmgr.exe filter enable-horm`

6.  Hibernate the device:

`shutdown /h`

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Hibernate%20Once/Resume%20Many%20%28HORM%29%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




