---
title: PC OEM requirements for Device Guard and Credential Guard
description: OEMs can use this document to determine the Device Guard (DG) and Credential Guard (CG) deployment requirements (as specified in the Windows Hardware Compatibility Requirements (WHCR) for these Windows 10 OS versions Windows 10, version 1507; Windows 10, version 1511; Windows 10, version 1607; and Windows Server 2016.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 824210CA-B45C-49D9-854B-4DC40D620106
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PC OEM requirements for Device Guard and Credential Guard


OEMs can use this document to determine the Device Guard (DG) and Credential Guard (CG) deployment requirements (as specified in the Windows Hardware Compatibility Requirements (WHCR) for these Windows 10 OS versions: Windows 10, version 1507; Windows 10, version 1511; Windows 10, version 1607; and Windows Server 2016.

OEMs must meet the following DG/CG requirements for each OS version:

-   Windows 10, version 1507 and Windows 10, version 1511 - There are no differences in the firmware/hardware requirements between these two versions.

-   Windows 10, version 1607 - There are requirements in addition to the requirements for the previous versions.

-   Additional requirements for the next major version of Windows (scheduled for 2017): This list is not final and subject to change.



**Note**  If you are an enterprise IT administrator looking to deploy Device Guard or Credential Guard, see [Requirements and deployment planning guidelines for Device Guard](http://go.microsoft.com/fwlink/?LinkId=822877) and [Requirements and deployment planning guidelines for Credential Guard](https://technet.microsoft.com/itpro/windows/keep-secure/credential-guard#hardware-and-software-requirements) on TechNet.

 

## Hardware readiness


Devices fall into three readiness categories which are associated with Device Guard and Credential Guard readiness independently:

-   **Capable** - Devices support the required hardware features, but the configuration state of the device is such that a physically present, privileged user must change them to the required state before the device is in the Credential Guard and Device Guard Ready state. An example is a computer that supports virtualization extensions but does not have virtualization extensions enabled in the BIOS. As a result, those extensions will need to be enabled before any of the virtualization-based security features may be enabled.

-   **Ready** - Devices are immediately capable of enabling all Credential Guard and Device Guard features through central administration tasks, such as Group Policy or device management. Credential Guard and Device Guard Ready machines that are imaged with a Customer Custom Desktop image can be provided to a customer with fully enabled virtualization-based security features. Required configurations and settings for configuring Credential Guard and Device Guard in fully enabled mode is detailed out in later sections.

-   **Not supported** - Devices that do not support the required hardware features and configurations in the following tables are not capable of supporting Device Guard and Credential Guard.

**Important** The following tables are additive, so that you must meet all of the previous requirements in addition to the requirements for the current build. 

## PC OEM requirements for Windows 10, Version 1507 and Windows 10, Version 1511

| Requirement | Details | Security benefit | Required for Credential Guard | Required for Device Guard |
|-------------|---------|------------------|-------------------------------|---------------------------|
| Hardware: 64-bit CPU | Virtualization-based security (VBS) features require the Windows hypervisor, which is only supported on 64-bit processors | N/A | <center> X </center> | <center> X </center> |
| Hardware: Virtualization extensions - Intel VT-x, AMD-V, and extended page tables | VBS is the foundation of Device Guard, and VBS works only if the processor supports virtualization with second level address translation support. This is required to support virtualization based security. | VBS provides isolation of the secure kernel from the normal OS. Vulnerabilities and zero-days in the normal OS cannot be exploited because of this isolation. | <center> X </center> | <center> X </center> |
| Hardware: VT-D or AMD Vi IOMMU (Input/output memory management unit) | In Windows 10, an IOMMU can be used to enhance system resiliency against memory attacks. For more information, see [ACPI system description tables](https://msdn.microsoft.com/windows/hardware/drivers/bringup/acpi-system-description-tables). | Prevents advanced memory attacks | <center> X </center> | |
| Hardware: Trusted Platform Module (TPM) version | TPMs, either discrete or firmware, will suffice. | • TPM 1.2 and 2.0 provide protection for VBS encryption keys that are stored in the firmware.<br><br>• Secrets stored in CG are protected against attacks involving physically present user with BIOS and Hardware access. | <center> X </center> | |
| Firmware: UEFI 2.3.1.c or higher firmware along with Secure Boot | UEFI Secure Boot ensures that the device boots with only authorized code in the pre-OS environment. For more information, see the Hardware Compatibility Specification for Systems for Windows 10 under [System.Fundamentals.Firmware.UEFISecureBoot](https://msdn.microsoft.com/en-us/library/windows/hardware/dn932805.aspx#systemfundamentalsfirmwareuefisecureboot). | Prevents boot kits and root kits from installing and persisting across reboots. | <center> X </center> | <center> X </center> |
| Firmware: Secure firmware update process | Like UEFI software, UEFI firmware can have security vulnerabilities. It is essential to have the capability to immediately patch such vulnerabilities when found through firmware updates. <p> UEFI firmware must support secure firmware update following Hardware Compatibility Specification for Systems for Windows 10 under [System.Fundamentals.Firmware.UEFISecureBoot](https://msdn.microsoft.com/en-us/library/windows/hardware/dn932805.aspx#systemfundamentalsfirmwareuefisecureboot). | • Provides capability to patch security vulnerabilities.<br><br>Prevents root kits from getting installed. | <center> X </center> | <center> X </center> |
| Firmware: Securing boot configuration and management | Required BIOS capabilities:<br><ul><li>BIOS password or stronger authentication supported to ensure that only the authenticated Platform BIOS administrator can change BIOS settings.</li><li>Protected BIOS option to configure a list of permitted boot devices and the boot device order, which overrides the BOOTORDER modification made by the OS, for example, to boot only from an internal hard drive.</li></ul><p>Required configurations:<p><ul><li>BIOS options related to security and boot options must be secured to prevent other operating systems from starting and to prevent changes to the BIOS settings.</li><li>BIOS authentication must be set. For example, the BIOS password must be set.</li></ul> | • BIOS password is required to protect against a physically present user with BIOS access.<br><br>• Boot order when locked provides protection against admin user booting into WinRE or any other OS from a bootable media. | <center> X </center> | <center> X </center> |
| Firmware: Secure MOR revision 2 implementation | A secure MOR bit prevents certain memory attacks so this is necessary for Credential Guard. This will further enhance security of Credential Guard. For more information, see [Secure MOR implementation](https://msdn.microsoft.com/windows/hardware/drivers/bringup/device-guard-requirements). | Prevents advanced memory attacks. | <center> X </center> | |
| Software: Windows edition | Windows 10 Enterprise, Windows 10 Education, Windows Server 2016, Windows 10 IoT Enterprise <p> <blockquote><p><strong>Important:</strong><br> Windows Server 2016 running as a domain controller does not support Credential Guard. Only Device Guard is supported in this configuration.</p></blockquote><br> | • These editions provide VBS that is the base for DG.<br><br>• These editions also provide manageability that makes it easier to configure DG. | <center> X </center> | <center> X </center> |
| Software: HVCI compatible drivers |  HVCI compatible drivers ensure that virtualization-based security can maintain the appropriate memory permissions. <p>Must meet all [HVCI Compatible](http://go.microsoft.com/fwlink/p/?LinkId=627463) Driver requirements as described in Hardware Compatibility Specification for Systems for Windows 10 under [Filter.Driver.DeviceGuard.DriverCompatibility](https://msdn.microsoft.com/en-us/library/windows/hardware/mt589732.aspx#filterdriverdeviceguarddrivercompatibility). | • Increase resistance to bypassing vulnerable kernel drivers.<br><br>• Code can only run in kernel mode when it is verified (code integrity) in VBS.<br><br>• Ensures malware cannot run in kernel. | | <center> X </center> |


## Additional requirements for Windows 10, version 1607 and Windows Server 2016

| Protections for Improved Security - requirement         | Description                            | Required for Credential Guard | Required for Device Guard |
|---------------------------------------------|----------------------------------------------------|-----|-----|
| Firmware: **Hardware Rooted Trust Platform Secure Boot** | **Requirements**:<br>Boot Integrity (Platform Secure Boot) must be supported. See the Windows Hardware Compatibility Program requirements under [System.Fundamentals.Firmware.CS.UEFISecureBoot.ConnectedStandby](https://msdn.microsoft.com/library/windows/hardware/dn932807(v=vs.85).aspx#system_fundamentals_firmware_cs_uefisecureboot_connectedstandby)<br>• The Hardware Security Test Interface (HSTI) must be implemented. See [Hardware Security Testability Specification](https://msdn.microsoft.com/en-us/library/windows/hardware/mt712332(v=vs.85).aspx).<br><br>**Security benefits**:<br>• Boot Integrity (Platform Secure Boot) from Power-On provides protections against physically present attackers, and defense-in-depth against malware.<br>• HSTI provides additional security assurance for correctly secured silicon and platform.<br><blockquote><p><strong>Note:</strong><br> This is independent of Modern Standby/Connected Standby Systems; all Device Guard and Credential Guard systems must pass HSTI 1.1.a.</p></blockquote><br> | <center> X </center> | <center> X </center> |
| Firmware: **Firmware Update through Windows Update** | **Requirements**: Firmware must support field updates through Windows Update and UEFI encapsulation update.<br><br>**Security benefits**: Helps ensure that firmware updates are fast, secure, and reliable. | <center> X </center> | <center> X </center> |
| Firmware: **Securing Boot Configuration and Management** | **Requirements**:<br>• Required BIOS capabilities: Ability of OEM to add ISV, OEM, or Enterprise Certificate in Secure Boot DB at manufacturing time.<br>• Required configurations: Microsoft UEFI CA must be removed from Secure Boot DB. Support for 3rd-party UEFI modules is permitted but should leverage ISV-provided certificates or OEM certificate for the specific UEFI software.<br><br>**Security benefits**:<br>• Enterprises can choose to allow proprietary EFI drivers/applications to run.<br>• Removing Microsoft UEFI CA from Secure Boot DB provides full control to enterprises over software that runs before the operating system boots. | <center> X </center> | <center> X </center> |


## <a href="" id="additional-qualification-requirements-for-the-next-major-release-of-windows-10"></a>Additional requirements for Windows 10, Version 1703 - in addition to the above



| Requirement       | Details            | Security Benefit                            | Required for Credential Guard | Required for Device Guard |
|------------------------------|---------------|----------------------------------------------------|------|------|
| Firmware: **VBS enablement of NX protection for UEFI runtime services** | • VBS will enable No-Execute (NX) protection on UEFI runtime service code and data memory regions. UEFI runtime service code must support read-only page protections, and UEFI runtime service data must not be executable.<br><br>• UEFI runtime services must meet these requirements:<ul><li>Implement the UEFI 2.6 EFI_MEMORY_ATTRIBUTES_TABLE. All UEFI runtime service memory (code and data) must be described by this table.</li><li>PE sections need to be page-aligned in memory (not required in non-volatile storage).<li>The Memory Attributes Table needs to correctly mark code and data as RO/NX for configuration by the OS: <ul><li>All entries must include attributes EFI_MEMORY_RO, EFI_MEMORY_XP, or both.</li><li>No entries may be left with neither of the above attributes, indicating memory that is both executable and writable. Memory must be either readable and executable or writeable and non-executable.</li></ul></li></ul>**Note:** this only applies to UEFI runtime service memory, and not UEFI boot service memory.<p>**Note:** this protection is applied by VBS on OS page tables.</ul><p>Please also note the following:<br>• Do not use sections that are both writable and executable<br>• Do not attempt to directly modify executable system memory<br>• Do not use dynamic code</li></ul> | • Vulnerabilities in UEFI runtime services, if any (such as in functions like UpdateCapsule and SetVariable), will be blocked from compromising VBS<br><br>• Reduces the attack surface to VBS from system firmware | <center>X</center> | <center> X </center>|
|Firmware: **Firmware support for SMM protection** | The Windows SMM Security Mitigations Table (WSMT) specification contains details of an Advanced Configuration and Power Interface (ACPI) table that was created for use with Windows operating systems that support Windows virtualization-based security (VBS) features.<br><br>• For more information, see the [Windows SMM Security Mitigations Table (WMST) specification](https://msdn.microsoft.com/en-us/library/windows/hardware/dn614617.aspx). | • Vulnerabilities in UEFI runtime services, if any (such as in functions like UpdateCapsule and SetVariable), will be blocked from compromising VBS<br><br>• Reduced the attack surface to VBS from system firmware<br><br>• Blocks additional security attacks against SMM |<center> X </center> | <center> X </center> |
