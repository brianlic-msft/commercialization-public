---
title: Security and reliability
description: Provides guidance on platform integrity and data protection features including Secure boot and BitLocker.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0C1E8C46-553F-4877-8119-683F6883B4A1
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Security and reliability


Windows 10 has platform integrity and data protection features that rely on the underlying hardware to strengthen the system's security:

-   Secure boot

    Helps ensure the user is running verified, authorized code to prevent malware infection or malicious modifications.

-   Measured boot

    Securely measures all components that load during boot so the health of a system can be determined and attested to.

-   Data protection (BitLocker)

    Encrypts the full volume to ensure that all user data is protected when a device is lost or stolen.

The underlying hardware and firmware must support a secure boot path, TPM capabilities, and cryptographic offload from the pre-operating system and run-time Windows components. To deliver a robust system performance, a set of defined cryptographic functions must be implemented. To do so, use an acceleration engine or dedicated security processor available within the SoC or core logic chipset or processor.

## Secure boot


The firmware requirements for implementing secure boot are:

-   The platform exposes an interface that adheres to the profile of UEFI v2.3.1 Section 27.
-   The platform must come provisioned with the correct keys in the UEFI Signature database (db) to allow Windows to boot. It must also support secure authenticated updates to the db and dbx per the spec.
-   Storage of secure variables must be isolated from the running operating system such that they cannot be modified without detection.
-   All firmware components are signed using at least RSA-2048 with SHA-256.
-   When power is turned on, the system starts executing code in the firmware and uses public key cryptography as per algorithm policy to verify the signatures of all images in the boot sequence, up to and including the Windows Boot Manager.
-   The system must protect against rollback of firmware to older versions.
-   The platform provides the EFI\_HASH\_PROTOCOL (per UEFI v2.3.1) for offloading cryptographic hash operations and the EFI\_RNG\_PROTOCOL (Microsoft defined) for accessing platform entropy.

## Measured boot


Measured boot requires the following firmware requirements:

-   The platform must provide a TCG-compliant TPM implementation available to the pre-operating system and runtime operating system.
-   During the boot sequence, the boot firmware and software measures all firmware and all software components being loaded into the TPM.
-   For platform attestation, the SoC vendor must provision an Endorsement Key certificate. The certificate profile is provided separately.
-   Support for platform attestation.

    -   Ability to protect register values from within Windows, and sign the values with a platform key.
-   Support for isolated storage.

    -   Access to isolated non-volatile, sealed storage for storing long term secrets.
    -   Loading and storing key data within sealed storage.

For TPM requirements, see [Minimum hardware requirements](../minimum/minimum-hardware-requirements-overview.md). For detailed TPM information, see [Trusted Platform Module](http://go.microsoft.com/fwlink/?LinkId=624832) topic on TechNet.

## Data protection (BitLocker)


To support full volume encryption of all data in a manner that does not consume excessive power yet performs well, Advanced Encryption Standard (AES) acceleration within the must be provided to Windows.

A BCrypt provider for the is required to access the platform's cryptographic acceleration capabilities. The BCrypt interface is documented on the MSDN website, and provides the base framework for cryptographic operations. A BCrypt provider is used in both user mode and kernel mode to provide the necessary cryptographic run-time services.

### Encrypted drive

An encrypted drive is a hardware solution that protects the user's data with BitLocker. It uses the hardware-based encryption solution to provide the user with a seamless end-to-end data security solution.

With Encrypted Drive, you can deliver enhanced security protection out-of-the-box, with near zero-impact to the user. The combination of BitLocker and Encrypted Drive provides immediate encryption support with nonoticeable effect on the user experience. You can set up BitLocker so the user doesn’t have to do anything. Encrypted Drive offers a premium configuration.

To enable support for Encrypted Drive, the PC must meet the following requirements:

-   Self-encrypting drives that meet industry specifications of IEEE 1667, TCG OPAL (subset), and INCITS T13
-   UEFI 2.3.1 Class 2 implementation using GPT on the Encrypted Drive (to support boot)
-   Windows SKUs that support BitLocker
-   TPM

For additional recommendations, see [Bitlocker topic on TechNet](http://go.microsoft.com/fwlink/?LinkId=624828).

### Preboot memory protection

Before Windows finishes booting and taking control of the system and its buses and ports, the firmware is the go-between for port and bridge controller availability on the platform. However, during the boot process for encrypted operating system volumes, BitLocker handles encryption keys in memory to decrypt the volume containing the Windows loader and the rest of the Windows operating system - these keys must be protected.

The boot firmware must protect physical memory from all DMA-capable external ports prior to boot, during boot or resume from S3 if supported, and until such time as the operating system powers up DMA ports through related bridge controllers. When the device enters a low-power state, the DMA port device context must be saved and restored upon returning to an active state.

If the firmware has the option to enable and disable this protection, the shipping configuration must be with protection enabled, and turning protection off must be protected. For example, platform authentication through the BIOS password.

**Note**  This requirement precludes the use of attached storage as boot media if it can only be accessed through an external DMA-capable port, such as ExpressCard, CardBus, IEEE 1394, or Thunderbolt interface if supported.

 

## Related topics


****
[Keep Windows 10 secure](http://go.microsoft.com/fwlink/?LinkId=624831)

 

 







