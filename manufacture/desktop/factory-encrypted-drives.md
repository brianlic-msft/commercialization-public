---
author: Justinha
Description: Factory Encrypted Drives
ms.assetid: 3469481b-f380-4585-87c8-ca8a267fe607
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Factory Encrypted Drives
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Factory Encrypted Drives


You can install Windows on factory-encrypted drives, also known as encrypted hard disk drives (eHDD). A *factory-encrypted drive* is a drive that is capable of full-disk encryption.

By default, when you install Windows on a factory-encrypted drive, Windows automatically encrypts the drive by using Trusted Computing Group (TCG) and IEEE 1667 transport encryption standards.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


To install Windows onto a factory-encrypted drive, use the following:

1.  Firmware: UEFI version 2.3.1 that has been configured to use the EFI storage security protocol.

2.  Hardware: a hard disk drive that is capable of using TCG and IEEE 1667 transport encryption standards.

## <span id="Using_other_encryption_standards"></span><span id="using_other_encryption_standards"></span><span id="USING_OTHER_ENCRYPTION_STANDARDS"></span>Using other encryption standards


To use another encryption standard on your drive, you must first disable the automatic drive provisioning that Windows provides. To do this on a new installation, set the Microsoft-Windows-EnhancedStorage-Adm/TCGSecurityActivationDisabled Unattend setting to **true**. For more information, see the [Unattended Windows Setup Reference](https://msdn.microsoft.com/library/windows/hardware/dn923277).

## <span id="related_topics"></span>Related topics


[Hard Drives and Partitions](hard-drives-and-partitions.md)

 

 






