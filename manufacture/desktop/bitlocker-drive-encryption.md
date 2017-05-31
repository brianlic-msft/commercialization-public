---
author: Justinha
Description: BitLocker Drive Encryption
ms.assetid: 47d6aadf-0496-4a8a-b0a5-dfb6fa9f5748
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: BitLocker Drive Encryption
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BitLocker Drive Encryption


This topic highlights the requirements for deploying a Windows BitLocker Drive Encryption solution. For more information about BitLocker, see [BitLocker Drive Encryption](http://go.microsoft.com/fwlink/?LinkId=116601) on the TechNet website.

## <span id="What_Is_BitLocker_Drive_Encryption_"></span><span id="what_is_bitlocker_drive_encryption_"></span><span id="WHAT_IS_BITLOCKER_DRIVE_ENCRYPTION_"></span>What Is BitLocker Drive Encryption?


BitLocker provides offline-data and operating-system protection for your computer. BitLocker helps ensure that data that is stored on a computer that is running Windows® is not revealed if the computer is tampered with when the installed operating system is offline. BitLocker uses a microchip that is called a Trusted Platform Module (TPM) to provide enhanced protection for your data and to preserve early boot-component integrity. The TPM can help protect your data from theft or unauthorized viewing by encrypting the entire Windows volume.

BitLocker is designed to offer the most seamless end-user experience with computers that have a compatible TPM microchip and BIOS. A compatible TPM is defined as a version 1.2 TPM that has the BIOS modifications that are required to support the Static Root of Trust Measurement, as defined by the Trusted Computing Group. The TPM interacts with BitLocker to help provide seamless protection when the computer restarts.

The path to the TPM driver file is %WINDIR%\\Inf\\Tpm.inf. For information about how to add the TPM driver to Windows Preinstallation Environment (Windows PE), see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

## <span id="BitLocker_Drive_Encryption_Partitioning_Requirements"></span><span id="bitlocker_drive_encryption_partitioning_requirements"></span><span id="BITLOCKER_DRIVE_ENCRYPTION_PARTITIONING_REQUIREMENTS"></span>BitLocker Drive Encryption Partitioning Requirements


BitLocker must use a system partition that is separate from the Windows partition. The system partition:

-   Must be configured as the active partition.

-   Must not be encrypted or used to store user files.

-   Must have at least 100 megabytes (MB) of space.

-   Must have at least 50 MB of free space.

-   May be shared with a recovery partition.

For more information about BitLocker partitioning requirements, see [Hard Drives and Partitions Overview](hard-drives-and-partitions.md).

## <span id="related_topics"></span>Related topics


[Hard Drives and Partitions Overview](hard-drives-and-partitions.md)

 

 






