---
author: kpacquer
Description: Flashing security requirements
ms.assetid: 78c22243-e9a4-4394-9f91-5922c15286e8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Flashing security requirements
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Flashing security requirements


Before flashing occurs, all OEM flashing mechanisms must validate cryptographic signatures in the image that chain to keys owned by the OEM. This validation of the cryptographic signature on the image must be done on the device (not on a desktop flashing tool) and must be done before the image is flashed to eMMC memory. This requirement is intended to protect devices from being compromised by users attempting to subvert the security protections in the system. Mechanisms that can flash or update the state of the device (debuggers, memory inspectors, etc.) and that are not properly secured could be used by an attacker to circumvent the device’s security mechanisms.

The implemented solutions must be fully resilient even if the device is reverse engineered (that is, even if the user understands the operation of the security code in the firmware or SoC).

## <span id="Flashing_security_requirements_summary"></span><span id="flashing_security_requirements_summary"></span><span id="FLASHING_SECURITY_REQUIREMENTS_SUMMARY"></span>Flashing security requirements summary


Security on retail devices must also meet the following requirements:

-   Only secure flashing technologies can be included on retail devices.

-   Images to be flashed must be cryptographically signed through a process that is controlled and verified by the OEM or Microsoft.

-   Cryptographic signatures on images to be flashed must be verified by code on the device immediately before flashing.

-   Code that verifies cryptographic signatures on the device must be tamper proof, and cryptographic key material on the device used for verification must be trustworthy at the point in time that it is used.

-   Sufficiently large encryption algorithms must be used—at a minimum, RSA 2048 with SHA-256.

-   The flashing tool must check the SMBIOS device identification values before flashing. For more info, see [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md).

-   The flashing tool must implement image integrity validation to protect against tampered images. For more info, see [Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md).

-   Industry best practices for source code development and supply chain security must be followed.

-   A threat model must be applied to identify priority risks, threats, and vulnerabilities.

## <span id="Recommended_flashing_solution"></span><span id="recommended_flashing_solution"></span><span id="RECOMMENDED_FLASHING_SOLUTION"></span>Recommended flashing solution


The following diagram illustrates a flashing solution that conforms to the flashing security requirements. Images to be flashed must be signed by the OEM signing authority using documented procedures, ensuring that there is a high level of control and security throughout the process. The component that initiates the flashing operation must perform a cryptographic verification of the signature on the image to be flashed using trustworthy key material immediately before flashing.

The cryptographic key should be stored so that it is tied either to secure boot key material (OEM\_PK\_HASH or UEFI Variable PK) or to a public key that is embedded in a binary that is cryptographically validated by secure boot. It is not acceptable to store the public or private key in the DPP, or in any other unsigned and unvalidated file store.

![oem\-fieldservicesec\-flashingreq](images/oem-fieldservicesec-flashingreq.png)

## <span id="related_topics"></span>Related topics


[Developing custom OEM flashing tools](developing-custom-oem-flashing-tools.md)

[Implementing image integrity validation in custom flashing tools](implementing-image-integrity-validation-in-custom-flashing-tools.md)

 

 






