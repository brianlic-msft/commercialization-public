---
author: Justinha
Description: Secure Boot
ms.assetid: 3917c13b-4a23-4d3b-b76a-f22b6f5e5fb1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Secure Boot
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Secure Boot


Secure Boot is a security standard developed by members of the PC industry to help make sure that your PC boots using only software that is trusted by the PC manufacturer. Support for Secure Boot was introduced in Windows 8.

When the PC starts, the firmware checks the signature of each piece of boot software, including firmware drivers (Option ROMs), EFI applications, and the operating system. If the signatures are good, the PC boots, and the firmware gives control to the operating system.

 

## <span id="Frequently_asked_questions_"></span><span id="frequently_asked_questions_"></span><span id="FREQUENTLY_ASKED_QUESTIONS_"></span>Frequently asked questions:


-   **Do I need Secure Boot in order to upgrade to the latest version of Windows?**

    No. There are no additional hardware or firmware requirements from Windows Vista or Windows 7 to upgrade to the latest version of Windows.


-   **What happens if my new hardware isn’t trusted by my PC manufacturer?**

    Your PC may not be able to boot. There are two kinds of problems that can occur:

    -   The firmware may not trust the operating system, option ROM, driver, or app because it is not trusted by the Secure Boot database.

    -   Some hardware requires kernel-mode drivers that must be signed. Note: many older 32-bit (x86) drivers are not signed, because kernel-mode driver signing is a recent requirement for Secure Boot. For more info, see [Secure boot feature signing requirements for kernel-mode drivers](http://msdn.microsoft.com/library/windows/desktop/hh848062.aspx).

    For more info, see [Windows 8 with Secure Boot enabled may no longer boot after installing new hardware](http://support.microsoft.com/kb/2800988).

-   **How can I add hardware or run software or operating systems that haven’t been trusted by my PC manufacturer?**

    -   Most software and hardware should work seamlessly on Windows because they are signed by a trusted Microsoft certificate to support UEFI Secure Boot.

    -   You can check for software updates from Microsoft and/or the PC manufacturer.

    -   You can contact your manufacturer to request new hardware or software to be added to the Secure Boot database.

    -   For most PCs, you can disable Secure Boot through the PC’s BIOS. For more info, see [Disabling Secure Boot](disabling-secure-boot.md).

    -   You can customize which certificates are trusted by Secure Boot through the PC's BIOS, in the customize Secure Boot menu.

        
-   **How do I edit my PC’s Secure Boot database?**

    This can only be done by the PC manufacturer.

## <span id="Manufacturing_Requirements"></span><span id="manufacturing_requirements"></span><span id="MANUFACTURING_REQUIREMENTS"></span>Manufacturing Requirements


Secure Boot requires a PC that meets the UEFI Specifications Version 2.3.1, Errata C or higher.

Secure Boot is supported for UEFI Class 2 and Class 3 PCs. For UEFI Class 2 PCs, when Secure Boot is enabled, the compatibility support module (CSM) must be disabled so that the PC can only boot authorized, UEFI-based operating systems.

Secure Boot does not require a Trusted Platform Module (TPM).

To enable kernel-mode debugging, enable TESTSIGNING, or to disable NX, you must disable Secure Boot. For detailed info for OEMs, see [Windows 8.1 Secure Boot Key Creation and Management Guidance](windows-secure-boot-key-creation-and-management-guidance.md).

## <span id="How_it_works"></span><span id="how_it_works"></span><span id="HOW_IT_WORKS"></span>How it works


The OEM uses instructions from the firmware manufacturer to create Secure Boot keys and to store them in the PC firmware. For info, see [Windows 8.1 Secure Boot Key Creation and Management Guidance](windows-secure-boot-key-creation-and-management-guidance.md), [Secure Boot Key Generation and Signing Using HSM (Example)](secure-boot-key-generation-and-signing-using-hsm--example.md), or contact your hardware manufacturer.

When you add UEFI drivers (also known as Option ROMs), you'll also need to make sure these are signed and included in the Secure Boot database. For info, see [UEFI Validation Option ROM Validation Guidance](uefi-validation-option-rom-validation-guidance.md).

When Secure Boot is activated on a PC, the PC checks each piece of software, including the Option ROMs and the operating system, against databases of known-good signatures maintained in the firmware. If each piece of software is valid, the firmware runs the software and the operating system.

### <span id="Signature_Databases_and_Keys"></span><span id="signature_databases_and_keys"></span><span id="SIGNATURE_DATABASES_AND_KEYS"></span>Signature Databases and Keys

Before the PC is deployed, the OEM stores the Secure Boot databases onto the PC. This includes the *signature database* (db), *revoked signatures database* (dbx), and *Key Enrollment Key database* (KEK) onto the PC. These databases are stored on the firmware nonvolatile RAM (NV-RAM) at manufacturing time.

The *signature database* (db) and the *revoked signatures database* (dbx) list the signers or image hashes of UEFI applications, operating system loaders (such as the Microsoft Operating System Loader, or Boot Manager), and UEFI drivers that can be loaded on the individual PC, and the revoked images for items that are no longer trusted and may not be loaded.

The *Key Enrollment Key database* (KEK) is a separate database of signing keys that can be used to update the signature database and revoked signatures database. Microsoft requires a specified key to be included in the KEK database so that in the future Microsoft can add new operating systems to the signature database or add known bad images to the revoked signatures database.

After these databases have been added, and after final firmware validation and testing, the OEM locks the firmware from editing, except for updates that are signed with the correct key or updates by a physically present user who is using firmware menus, and then generates a platform key (PK). The PK can be used to sign updates to the KEK or to turn off Secure Boot.

OEMs should contact their firmware manufacturer for tools and assistance in creating these databases. For more info, see [Windows 8.1 Secure Boot Key Creation and Management Guidance](windows-secure-boot-key-creation-and-management-guidance.md).

### <span id="Boot_Sequence"></span><span id="boot_sequence"></span><span id="BOOT_SEQUENCE"></span>Boot Sequence

1.  After the PC is turned on, the signature databases are each checked against the platform key.

2.  If the firmware is not trusted, the UEFI firmware must initiate OEM-specific recovery to restore trusted firmware.

3.  If there is a problem with Windows Boot Manager, the firmware will attempt to boot a backup copy of Windows Boot Manager. If this also fails, the firmware must initiate OEM-specific remediation.

4.  After Windows Boot Manager has started running, if there is a problem with the drivers or NTOS kernel, Windows Recovery Environment (Windows RE) is loaded so that these drivers or the kernel image can be recovered.

5.  Windows loads antimalware software.

6.  Windows loads other kernel drivers and initializes the user mode processes.

For more information, see the whitepaper: [Secured Boot and Measured Boot: Hardening Early Boot Components Against Malware](http://go.microsoft.com/fwlink/?LinkId=278911).

## <span id="related_topics"></span>Related topics


[Secure Boot isn't configured correctly: troubleshooting](secure-boot-isnt-configured-correctly-troubleshooting.md)

[Secure Boot isn't configured correctly: Determine if the PC is in a manufacturing mode (info for manufacturers)](secure-boot-isnt-configured-correctly-determine-if-the-pc-is-in-a-manufacturing-mode--info-for-manufacturers.md)

[Secured Boot and Measured Boot: Hardening Early Boot Components Against Malware](http://go.microsoft.com/fwlink/?LinkId=278911)

[UEFI Firmware](uefi-firmware.md)

 

 






