---
author: Justinha
Description: Understanding Virtual Hard Disks with Native Boot
ms.assetid: e063e475-6f39-4ed9-9473-ea7537adc30a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Understanding Virtual Hard Disks with Native Boot
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Understanding Virtual Hard Disks with Native Boot


Native boot enables virtual hard disks (VHDs) to run on a computer without a virtual machine or *hypervisor*. A hypervisor is a layer of software under the operating system that runs virtual machines.

## <span id="BKMK_whatIsVHD"></span><span id="bkmk_whatisvhd"></span><span id="BKMK_WHATISVHD"></span>What Is VHD with Native Boot?


A virtual hard disk can be used as the running operating system on designated hardware without any other parent operating system, virtual machine, or hypervisor. Windows disk-management tools, the DiskPart tool and the Disk Management Microsoft® Management Console (Diskmgmt.msc), can be used to create a VHD file. A supported Windows image (.wim) file can be applied to a VHD, and the VHD can be copied to multiple systems. The Windows boot manager can be configured to boot directly into the VHD.

The VHD can also be connected to a virtual machine for use with the Hyper-V Role in Windows Server.

Native-boot VHDs are not designed or intended to replace full image deployment on all client or server systems. Enterprise environments already managing and using .vhd files for virtual machine deployment will get the most benefit from the native-boot VHD capabilities. Using the .vhd file as a common image container format for virtual machines and designated hardware simplifies image management and deployment in an enterprise environment.

For more information about virtualization in Windows, see [this Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=142055). For more information about how to use VHDs with native boot, see [this Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=142054).

## <span id="BKMK_commonScenarios"></span><span id="bkmk_commonscenarios"></span><span id="BKMK_COMMONSCENARIOS"></span>Common Scenarios


VHDs with native boot are frequently used in the following scenarios:

-   Using disk-management tools to create and *attach* a VHD for offline image management. You can attach a VHD by using the **Attach vdisk** command which activates the VHD so that it appears on the host as a disk drive instead of as a .vhd file.

-   Mounting reference VHD images on remote shares for image servicing.

-   Maintaining and deploying a common reference VHD image to execute in either virtual or physical computers.

-   Configuring VHD files for native boot without requiring a full parent installation.

-   Configuring a computer to boot multiple local VHD files that contain different application workloads, without requiring separate disk partitions.

-   Using Windows Deployment Services (WDS) for network deployment of VHD images to target computers for native boot.

-   Managing desktop image deployment.

## <span id="BKMK_requirements"></span><span id="bkmk_requirements"></span><span id="BKMK_REQUIREMENTS"></span>Requirements


Native VHD boot has the following dependencies:

-   The local disk must have at least two partitions: a system partition that contains the Windows 8 boot-environment files and Boot Configuration Data (BCD) store, and a partition to store the VHD file. The .vhd file format is supported for native boot on a computer with a Windows® 7 boot environment, but you will have to update the system partition to a Windows 8 environment to use the .vhdx file format. For more information about how to add a Windows 8 boot environment for native VHD boot, see [Download and install Windows PE (WinPE) so you can boot from a USB flash drive or an external USB hard drive](download-and-install-windows-pe--winpe--so-you-can-boot-from-a-usb-flash-drive-or-an-external-usb-hard-drive.md).

-   The local disk partition that contains the VHD file must have enough free disk space for expanding a dynamic VHD to its maximum size and for the page file created when booting the VHD. The page file is created outside the VHD file, unlike with a virtual machine where the page file is contained inside the VHD.

## <span id="BKMK_benefits"></span><span id="bkmk_benefits"></span><span id="BKMK_BENEFITS"></span>Benefits


The benefits of native boot capabilities for VHDs include the following:

-   Using the same image-management tools for creating, deploying, and maintaining system images to be installed on designated hardware or on a virtual machine.

-   Deploying an image on a virtual machine or a designated computer, depending on capacity planning and availability.

-   Deploying Windows for multiple boot scenarios without requiring separate disk partitions.

-   Deploying supported Windows images in a VHD container file for faster deployment of reusable development and testing environments.

-   Replacing VHD images for server redeployment or recovery.

## <span id="BKMK_limitations"></span><span id="bkmk_limitations"></span><span id="BKMK_LIMITATIONS"></span>Limitations


Native VHD support has the following limitations:

-   Native VHD disk management support can attach approximately 512 VHD files concurrently.

-   Native VHD boot does not support hibernation of the system, although sleep mode is supported.

-   VHD files cannot be nested.

-   Native VHD boot is not supported over Server Message Block (SMB) shares.

-   Windows BitLocker Drive Encryption cannot be used to encrypt the host volume that contains VHD files that are used for native VHD boot, and BitLocker cannot be used on volumes that are contained inside a VHD.

-   The parent partition of a VHD file cannot be part of a volume snapshot.

-   An attached VHD cannot be configured as a *dynamic disk*. A dynamic disk provides features that basic disks do not, such as the ability to create volumes that span multiple disks (spanned and striped volumes), and the ability to create fault-tolerant volumes (mirrored and RAID-5 volumes). All volumes on dynamic disks are known as dynamic volumes.

-   The parent volume of the VHD cannot be configured as a dynamic disk.

## <span id="BKMK_recommendations"></span><span id="bkmk_recommendations"></span><span id="BKMK_RECOMMENDATIONS"></span>Recommended Precautions


The following are recommended precautions for using VHDs with native boot:

-   Use Fixed VHD disk types for production servers, to increase performance and help protect user data. Use Dynamic or Differencing VHD disk types only in non-production environments, such as for development and testing.

-   When using Dynamic VHDs, store critical application or user data on disk partitions that are outside the VHD file, when it is possible. This reduces the size requirements of the VHD. It also makes it easier to recover application or user data if the VHD image is no longer usable due to a catastrophic system shutdown such as a power outage.

## <span id="BKMK_typesOfVHDs"></span><span id="bkmk_typesofvhds"></span><span id="BKMK_TYPESOFVHDS"></span>Types of Virtual Hard Disks


Three types of VHD files can be created by using the disk-management tools:

-   **Fixed hard-disk image.** A fixed hard-disk image is a file that is allocated to the size of the virtual disk. For example, if you create a virtual hard disk that is 2 gigabytes (GB) in size, the system will create a host file approximately 2 GB in size. Fixed hard-disk images are recommended for production servers and working with customer data.

-   **Dynamic hard-disk image.** A dynamic hard-disk image is a file that is as large as the actual data written to it at any given time. As more data is written, the file dynamically increases in size. For example, the size of a file backing a virtual 2 GB hard disk is initially around 2 megabytes (MB) on the host file system. As data is written to this image, it grows with a maximum size of 2 GB.

    Dynamic hard-disk images are recommended for development and testing environments. Dynamic VHD files are smaller, easier to copy, and will expand once mounted.

-   **Differencing hard-disk image.** A differencing hard-disk image describes a modification of a parent image. This type of hard-disk image is not independent; it depends on another hard-disk image to be fully functional. The parent hard-disk image can be any of the mentioned hard-disk image types, including another differencing hard-disk image.

## <span id="BKMK_technologies"></span><span id="bkmk_technologies"></span><span id="BKMK_TECHNOLOGIES"></span>Technologies Related to VHDs with Native Boot


VHDs with native boot generally use the following technologies:

### <span id="BCDboot"></span><span id="bcdboot"></span><span id="BCDBOOT"></span>BCDboot

The BCDboot tool is used for initializing the BCD store and copying boot-environment files to the system partition during image deployment. BCD files describe boot applications and boot application settings. The objects and elements in the store effectively replace the Boot.ini file. When installing a native-boot VHD on designated hardware, you may have to update to a Windows 8 BCD store. For more information about the BCDboot tool, see [BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md).

### <span id="BCDedit"></span><span id="bcdedit"></span><span id="BCDEDIT"></span>BCDedit

BCDedit is a command-line tool for managing BCD stores. It can be used for a variety of purposes such as creating new stores, modifying existing stores, and adding boot menu parameters. For more information about the BCDedit tool, see [this Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=128459).

### <span id="DiskPart"></span><span id="diskpart"></span><span id="DISKPART"></span>DiskPart

DiskPart is a command-line tool in Windows that enables you to manage objects such as disks, partitions, or volumes, by using scripts or direct input at a command prompt. In Windows 8, the DiskPart tool can be used to create, partition, and attach VHDs. For more information about the DiskPart tool, see [this Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=128458).

### <span id="Windows_Deployment_Services_"></span><span id="windows_deployment_services_"></span><span id="WINDOWS_DEPLOYMENT_SERVICES_"></span>Windows Deployment Services

Windows Deployment Services is a network-based installation server that enables corporations to remotely administer and deploy the latest operating system by using Windows PE and Windows Deployment Services server. Windows Deployment Services supports deployment of VHD image files in addition to .wim files. Using Windows Deployment Services automates the network deployment of VHD images for native boot. Windows Deployment Services handles copying the VHD image to a local partition, and configuring the local BCD for native boot from the VHD.

## <span id="related_topics"></span>Related topics


[Deploy Windows on a VHD (Native Boot)](deploy-windows-on-a-vhd--native-boot.md)

[Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu](boot-to-vhd--native-boot--add-a-virtual-hard-disk-to-the-boot-menu.md)

[Download and install Windows PE (WinPE) so you can boot from a USB flash drive or an external USB hard drive](download-and-install-windows-pe--winpe--so-you-can-boot-from-a-usb-flash-drive-or-an-external-usb-hard-drive.md)

 

 






