---
author: Justinha
Description: BCD System Store Settings for UEFI
ms.assetid: bfafe378-7ac3-453e-99ca-e5fde83dee2f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: BCD System Store Settings for UEFI
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BCD System Store Settings for UEFI


For a typical deployment scenario, you do not need to modify the BCD store. This topic discusses the various BCD settings in the BCD store that you can modify. On UEFI systems, this includes settings for the following boot applications:

1.  [Windows Boot Manager](#windowsbootmanager)

2.  [Windows Boot Loader](#windowsbootloader)

3.  [Windows Memory Tester](#windowsmemorytester)

The following sections describe the available settings for each of these boot applications in detail and how to modify each application for UEFI systems.

For simplicity, the BCDEdit examples in this section modify the BCD system store. To modify another store, such as a copy of the BCD-template, include the store name in the command line.

## <span id="WindowsBootManager"></span><span id="windowsbootmanager"></span><span id="WINDOWSBOOTMANAGER"></span>Windows Boot Manager Settings for UEFI


Windows Boot Manager (`{bootmgr}`) manages the boot process. UEFI-based systems contain a firmware boot manager, Bootmgfw.efi, that loads an EFI application that is based on variables that are stored in NVRAM.

The BCD settings for the `device` and `path` elements in Windows Boot Manager indicate the firmware boot manager. The template that is named BCD-template for Windows includes the following settings for Windows Boot Manager.

``` syntax
## Windows Boot Manager

identifier              {bootmgr}
device                  partition=\Device\HarddiskVolume1
path                    \EFI\Microsoft\Boot\bootmgfw.efi
description             Windows Boot Manager
```

### <span id="Device_Setting"></span><span id="device_setting"></span><span id="DEVICE_SETTING"></span>Device Setting

The `device` element specifies the volume that contains Windows Boot Manager. For UEFI systems, the `device` element for Windows Boot Manager is set to the system partition volume letter. To determine the correct volume letter, use the Diskpart tool to view the disk partitions. The following example assumes that the system has a single hard drive that has multiple partitions, including a system partition that has been assigned a drive letter of S.

The following Diskpart commands select disk 0 and then list the details of the volumes on that disk, including their drive letters. It shows volume 2 as the system partition.

``` syntax
DISKPART> select disk 0
DISKPART> list volume

  Volume ###  Ltr  Label   Fs     Type        Size     Status     Info
  ----------  ---  ------  -----  ----------  -------  ---------  ------
  Volume 0     D           NTFS   Partition    103 GB  Healthy
  Volume 1     C           NTFS   Partition     49 GB  Healthy    Boot
  Volume 2     S           FAT32  Partition    200 MB  Healthy    System
```

If the system partition does not have an assigned drive letter, assign one by using the **Diskpart assign** command. The following example assumes that the system partition is volume 2 and assigns it S as the drive letter.

``` syntax
Diskpart
select disk 0
list volume
select volume 2   // assuming volume 2 is the system partition
assign letter=s
```

After you have determined the system partition volume, set the `device` element for Windows Boot Manager to the corresponding drive letter. The following example sets `device` to drive S.

``` syntax
Bcdedit /set {bootmgr} device partition=s:// system partition
```

### <span id="Path_Setting"></span><span id="path_setting"></span><span id="PATH_SETTING"></span>Path Setting

The `path` element specifies the location of the Windows Boot Manager application on that volume. For UEFI systems, `path` indicates the firmware boot manager, whose path is \\EFI\\Microsoft\\Boot\\Bootmgfw.efi.

You can confirm that BCD-template has the correct path by enumerating the values in the store, as follows:

``` syntax
bcdedit /store bcd-template /enum all
```

To explicitly set `path` to \\EFI\\Microsoft\\Boot\\Bootmgfw.efi, use the following command.

``` syntax
Bcdedit /set {bootmgr} path \efi\microsoft\boot\bootmgfw.efi
```

### <span id="Other_Settings"></span><span id="other_settings"></span><span id="OTHER_SETTINGS"></span>Other Settings

You should set Windows Boot Manager to be the first item in the display order of the UEFI firmware, as shown in the following example.

``` syntax
Bcdedit /set {fwbootmgr} displayorder {bootmgr} /addfirst
```

You should also specify the topmost Windows boot loader application in the Windows Boot Manager display order. The following example shows how to put a specified Windows boot loader at the top of the display order.

``` syntax
Bcdedit /set {bootmgr} displayorder {<GUID>} /addfirst
```

In the preceding example, &lt;GUID&gt; is the identifier for the specified Windows boot loader object. The next section discusses this identifier in greater detail.

**Note**  
A multiboot system that has multiple installed operating systems has multiple instances of the Windows boot loader. Each instance of the Windows boot loader has its own identifier. You can set the default Windows boot loader (`{default}`) to any of these identifiers.

 

## <span id="WindowsBootLoader"></span><span id="windowsbootloader"></span><span id="WINDOWSBOOTLOADER"></span>Windows Boot Loader Settings


A BCD store has at least one instance, and optionally multiple instances, of the Windows boot loader. A separate BCD object represents each instance. Each instance loads one of the installed versions of Windows that has a configuration that the object's elements have specified. Each Windows boot loader object has its own identifier, and the object's `device` and `path` settings indicate the correct partition and boot application.

`BCD-template` for Windows has a single Windows boot loader object that has the following settings.

``` syntax
## Windows Boot Loader

identifier              {9f25ee7a-e7b7-11db-94b5-f7e662935912}
device                  partition=C:
path                    \Windows\system32\winload.efi
description             Microsoft Windows Server
locale                  en-US
inherit                 {bootloadersettings}
osdevice                partition=C:
systemroot              \Windows
```

The identifier for this Windows boot loader is {9f25ee7a-e7b7-11db-94b5-f7e662935912}. You can use this GUID on your system or let the BCDEdit tool generate a new GUID for you.

To simplify BCDEdit commands, you can specify one of the Windows boot loaders in the BCD system store as the default loader. You can then use the standard identifier (`{default}`) in place of the full GUID.The following example specifies the Windows boot loader for EFI as the default boot loader, assuming that it uses the identifier GUID from BCD-template.

``` syntax
Bcdedit /default {9f25ee7a-e7b7-11db-94b5-f7e662935912}
```

### <span id="Device_and_OSDevice_Settings"></span><span id="device_and_osdevice_settings"></span><span id="DEVICE_AND_OSDEVICE_SETTINGS"></span>Device and OSDevice Settings

The following elements specify key locations:

The `device` element specifies the partition that contains the boot application.

The `osdevice` element specifies the partition that contains the system root.

For the Windows boot loader for EFI, both elements are usually set to the drive letter of the Windows system partition. However, if BitLocker is enabled or a computer has multiple installed versions of Windows, `osdevice` and `device` might be set to different partitions.BCD-template sets both elements to drive C, which is the typical value. You can also explicitly set the `osdevice` and `device` values, as shown in the following example. The example also assumes that you have specified the Windows boot loader for EFI as the default boot-loader object.

``` syntax
Bcdedit /set {default} device partition=c:
Bcdedit /set {default} osdevice partition=c:
```

### <span id="Path_Setting"></span><span id="path_setting"></span><span id="PATH_SETTING"></span>Path Setting

The `path` element of a Windows boot loader specifies the location of the boot loader on that volume. For UEFI systems, `path` indicates the Windows boot loader for EFI, whose path is \\Windows\\System32\\Winload.efi.

You can confirm that BCD-template has the correct `path` value by enumerating the values in the store. You can also explicitly set the `path` value, as shown in the following example.

``` syntax
Bcdedit /set {default} path \windows\system32\winload.efi
```

## <span id="WindowsMemoryTester"></span><span id="windowsmemorytester"></span><span id="WINDOWSMEMORYTESTER"></span>Windows Memory Tester Settings


The Windows memory tester (`{memdiag}`) runs memory diagnostics at boot time. The BCD settings for the application's `device` and `path` elements indicate the correct application.

**Note**  
Note: Intel Itanium computers do not include a Windows memory tester and do not require `{memdiag}` settings.

 

BCD-template for Windows has the following settings.

``` syntax
## Windows Memory Tester

identifier              {memdiag}
device                  partition=\Device\HarddiskVolume1
path                    \boot\memtest.exe
description             Windows Memory Diagnostic
```

### <span id="Device_Setting"></span><span id="device_setting"></span><span id="DEVICE_SETTING"></span>Device Setting

For UEFI systems, the `device` element for the Windows memory tester is set to the system partition drive letter. The following example assumes that the system partition is drive S, as used in earlier examples.

``` syntax
Bcdedit /set {bootmgr} device partition=s:  // system partition
```

### <span id="Path_Setting"></span><span id="path_setting"></span><span id="PATH_SETTING"></span>Path Setting

The `path` element specifies the location of Windows Test Manager on the volume that the `device` element has specified. For UEFI systems, `path` indicates the EFI version of the application (\\EFI\\Microsoft\\Boot\\Memtest.efi).

You can confirm that BCD-template has the correct `path` value by enumerating the values in the store. You can also use the BCDEdit tool to explicitly set the `path` value, as shown in the following example.

``` syntax
Bcdedit /set {memdiag} path \efi\microsoft\boot\memtest.efi
```

 

 





