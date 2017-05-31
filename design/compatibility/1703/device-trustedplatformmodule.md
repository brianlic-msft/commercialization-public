---
title: Device.TrustedPlatformModule
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.TrustedPlatformModule


 - [Device.TrustedPlatformModule.TPM20](#device.trustedplatformmodule.tpm20)

<a name="device.trustedplatformmodule.tpm20"></a>
## Device.TrustedPlatformModule.TPM20

**Informative:** TPM hardware which shipped in a system qualified for Windows 10 version 1607 will be considered to pass Redstone 2 requirements until March 1, 2018, irrespective of newer requirements, at Microsoft’s discretion. This does not apply to any TPM which passed the tests with exceptions. This applies to all Device.TrustedPlatformModule.TPM20 subrequirements.

**Informative:** TPM hardware which completes qualification for Redstone 2 may continue to use that qualification until March 1, 2019, irrespective of newer compatibility requirements, at Microsoft’s discretion. This applies to all Device.TrustedPlatformModule.TPM20 subrequirements.

**Informative:** TPM hardware which shipped in a system certified for Windows Server 2016 will be considered to pass Redstone 2 certification requirements until March 1, 2019, irrespective of newer requirements, at Microsoft’s discretion. This does not apply to any TPM which passed the tests with exceptions. This applies to all Device.TrustedPlatformModule.TPM20 subrequirements.

> [!WARNING]
> Certification for Windows Server 2016, Azure Stack, and SDDC must continue to meet the Windows Hardware Compatibility Requirements as stated in version 1607 of documentation, must use [version 1607 of the HLK (build 14393)](https://go.microsoft.com/fwlink/p/?LinkID=404112) with [matching playlist](http://aka.ms/hlkplaylist) and supplemental content to generate logs, and must follow policies as stated in the [Windows Server Policy document](https://go.microsoft.com/fwlink/p/?linkid=834831). Questions about the Azure Stack or SDDC programs or how to submit the results for solution validation should be directed to the appropriate Microsoft technical account manager or partner management contact.

### Device.TrustedPlatformModule.TPM20.Features

*All TPM 2.0 Devices must support the features specified in this section.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile ARM64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Mandatory:** The TPM must comply with TCG Trusted Platform Module Library Specification, Family "2.0", Level 00, Revision 1.16 or later, including errata version 1.4 and all security patches published at least 120 days prior to testing.

**Recommended:** The TPM should comply with TCG Trusted Platform Module Library Specification, Family "2.0", Level 00, Revision 1.38.

**Mandatory:** Effective July 28, 2018 The TPM must comply with TCG Trusted Platform Module Library Specification, Family "2.0", Level 00, Revision 1.38.

**Mandatory:** The TPM 2.0 must implement all “Mandatory” features in the table below:

<table style="border-color: black;" border="1">
<tbody>
<tr>
<td style="background-color: black;"><span style="color: #ffffff;">Integrity Feature</span></td>
<td style="background-color: black;"><span style="color: #ffffff;">SOC Hardware Functionality</span></td>
<td style="background-color: black;"><span style="color: #ffffff;">Status</span></td>
</tr>
<tr>
<td>**Trusted Execution Environment**</td>
<td>Availability of storage for storing long term secrets. This storage must not be possible to modify by the OS without detection by pre-Operating System components.
<br>Availability of access to persistent storage prior to a call to ExitBootServices.
</td>
<td>**Mandatory**</td>
</tr>
<tr>
<td>**Secure Storage**</td>
<td>Secure (isolated from runtime OS) storage of:
<br>   -   Values (such as an endorsement primary seed) that survive complete platform power off as well as firmware updates
<br>   -   Values (such as a NV counters) that survive complete platform power off but do not necessarily survive firmware updates (in this case these values shall be reset to a random value)
<br>   -   Values (such as the Platform Configuration Registers) that survive platform power-down to the equivalent of ACPI S3 if TPM2_Shutdown (TPM_SU_STATE) is called but may be lost on further power-down.
</td>
<td>**Mandatory**</td>
</tr>
<tr>
<td>**Platform Attestationt**</td>
<td>Implementation of PCRs 0 through 23 for SHA-256.</td>
<td>**Mandatory**</td>
</tr>
<tr>
<td>**Side Channel Protection**</td>
<td>Robustness against side channel attacks including Differential Power Analysis (DPA) and Electromagnetic Emanations (EM)</td>
<td>**Recommended**</td>
</tr>
<tr>
<td>**Miscellaneous**</td>
<td>Execution of the TPM 2.0 command TPM2_NV_Increment must not require an open object slot.
<br>Under normal use cases the clock may not become “Unsafe”.  Normal use cases exclude a “disorderly shutdown” as defined in TCG TPM Library Specification Part 1, or a call to TPM2_ClockSet.
<br>The clock must be rendered “safe” within 15 seconds of any boot of the system. 
<br>The TPM may only increment the FailedTries counter on TPM_Startup if no TPM_Shutdown has occurred since the most recent use of a DA protected asset.
<br>The TPM Vendor must provide Microsoft with documentation detailing how to decode TPM Get Capability calls into the TPM Manufacturer Identity, Model Number and Firmware Version.  All of these items must be available on every device, and consistent with the actual firmware and model under test.
</td>
<td>**Mandatory**</td>
</tr>
</tbody>
</table>

**Mandatory:** The TPM must comply with “TCG PC Client Platform TPM Profile (PTP) Specification”, Family “2.0”, Level 00 Revision 00.43, dated January 26, 2015 except as stated below:

   -   Any statements in the “System.Fundamentals.TPM20” or “Device.TrustedPlatformModule.TPM20” are authoritative if there is a conflict between them and the PTP specification.

**Mandatory:** The following commands are required, in addition to all mandatory commands from the TPM specification:

   -   TPM2_HMAC
   
   -   TPM2_PolicyTicket
   
   -   TPM2_PolicySigned
   
   -   TPM2_ECDH_KeyGen
   
   -   TPM2_ECDH_ZGen
   
**Mandatory:** The following algorithms are required:

   -   TPM_ALG_RSA
   
   -   TPM_ALG_SHA1
   
   -   TPM_ALG_HMAC
   
   -   TPM_ALG_SHA256
   
   -   TPM_ALG_RSAES
   
   -   TPM_ALG_RSAPSS
   
   -   TPM_ALG_OAEP
   
   -   TPM_ALG_ECC
   
   -   TPM_ALG_ECDSA
   
   -   TPM_ALG_ECDH
   
**Mandatory:** The following parameters are required for all compatible algorithms/commands:

   -   TPM_ECC_NIST_P256
   
**Mandatory:** The TPM must support interrupt driven communication.

**Optional:** Support for TPM_EncryptDecrypt.

**Optional:** Support for TPM_EncryptDecrypt2.

**Recommended:** Support for the following.  Effective July 28, 2020 these become **Mandatory**

   1.	TPMI_AES_KEY_BITS with 256 as an allowed value for AES_KEY_SIZES_BITS
   2.	Internal use of symmetric cryptography must use a cipher with equivalent strength to TPM_ALG_AES with 256 bit strength.
   3.	Support for TPM_ALG_SHA_384
   4.	TPM_ALG_SHA_384 used by default for all hashing operations, including internal operations
   5.	TPM_ECC_NIST_P384 for TPM_ALG_ECC

**Optional:** Effective July 28, 2025 support for the following becomes Optional. If these commands are implemented they still must meet all applicable performance requirements.

   1.	TPM_ECC_NIST_P256
   2.	TPMI_AES_KEY_BITS with 128 as an allowed value for AES_KEY_SIZES_BITS
   3.	TPM_ALG_SHA_256
   4.	TPM_ALG_SHA1


### Device.TrustedPlatformModule.TPM20.MinimumPerformance

*All TPM 2.0 Devices must meet a minimum performance bar*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile ARM64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Mandatory:** The TPM shall Comply with the following performance requirements. These are measured with a tool which issues commands from the OS context.  Times specified as a mean refer to the mean of 100 or more operations completed in direct succession. For operations on keys other than import, the operations may be assumed to be being completed on imported (internal) keys.

**Mandatory:** TPM hardware in general must provide reasonable performance for an interactive user experience.  Microsoft reserves the right to modify any prospective requirements, including adding additional test cases, as it deems appropriate.

   -   RSA Prime Caching: For TPM2_Create to create an RSA 2048 bit key, if the TPM is able to create 5 keys in a maximum of 1 second each in direct succession, starting 5s after first boot by the end user, they may otherwise generate keys within double the allotted time below.

In the below table, if unspecified, all TPM_ALG_RSA keys are 2048 bit keys and TPM_ALG_ECC keys are of the TPM_ECC_NIST_256 curve.  

| **Command**                          | **Arguments**                                                                                                                                          | **Mean Requirement (ms)** |
|--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| **TPM2\_Create**                     | TPM\_ALG\_RSA with Bits=2048                                                                                                                           | 15,000                    |
|                                      | TPM\_ALG\_ECC with TPM\_ECC\_NIST\_P256                                                                                                                | 250                       |
|                                      | TPM\_ALG\_KEYEDHASH                                                                                                                                    | 250                       |
|                                      | 32 Bytes                                                                                                                                               | 250                       |
| **TPM2\_CreatePrimary**              | TPM\_ALG\_RSA with Bits=2048                                                                                                                           | 30,000                    |
|                                      | TPM\_ALG\_ECC with TPM\_ECC\_NIST\_P256                                                                                                                | 250                       |
|                                      | TPM\_ALG\_KEYEDHASH                                                                                                                                    | 250                       |
|                                      | 32 Bytes                                                                                                                                               | 250                       |
| **TPM2\_Load**                       | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 100                       |
|                                      | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                       | 100                       |
|                                      | TPM\_ALG\_KEYEDHASH Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 100                       |
| **TPM2\_Sign**                       | TPM\_ALG\_RSA, 2048                                                                                                                                    | 500                       |
|                                      | TPM_ALG_ECC, TPM_ECC_NIST_P256                                                                                                                         | 250                       |
| **TPM2\_VerifySignature**            | TPM\_ALG\_RSA, 2048                                                                                                                                    | 50                        |
|                                      | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                                                                    | 250                       |
| **TPM2\_ECDH\_ZGen**                 | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                                                                    | 250                       |
| **TPM2\_Import**                     | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 1000                      |
|                                      | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048 InSymSeed contains asymmetrically encrypted seed using RSA algorithm                                  | 1600                      |
|                                      | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 InSymSeed contains asymmetrically encrypted seed using ECDH algorithm | 400                       |
| **TPM2\_RSA\_Encrypt**               | 2048 bit RSA key, 256 bytes                                                                                                                            | 50                        |
| **TPM2\_RSA\_Decrypt**               | 2048 bit RSA key, 256 bytes                                                                                                                            | 500                       |
| **TPM2\_HMAC**                       | HMAC Operation                                                                                                                                         | 100                       |
| **TPM2\_PolicySigned**               | Ecdsa NistP256                                                                                                                                         | 150                       |
|                                      | Sapss RSA 2048                                                                                                                                         | 150                       |
|                                      | Sassa RSA 2048                                                                                                                                         | 150                       |
| **TPM2\_PolicyTicket**               |                                                                                                                                                        | 150                       |
| **TPM2\_Unseal**                     | 32 Bytes                                                                                                                                               | 30                        |
|                                      | With encrypt session                                                                                                                                   | 120                       |
| **TPM2\_PCR\_Extend**                | 32 Bytes                                                                                                                                               | 20                        |
| **TPM2\_StartAuthSession**           | Bind is not TPM\_RH\_NULL                                                                                                                              | 30                        |
|                                      | Bind is TPM\_RH\_NULL                                                                                                                                  | 15                        |
| **TPM2\_LoadExternal**               | TPM\_ALG\_RSA, 2048                                                                                                                                    | 200                       |
| **TPM2\_ReadPublic**                 | TPM\_ALG\_RSA, 2048                                                                                                                                    | 20                        |
|                                      | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                                                                    | 20                        |
| **TPM2\_ActivateCredential**         | TPM\_ALG\_RSA, 2048                                                                                                                                    | 600                       |
| **TPM2\_ObjectChangeAuth**           | TPM\_ALG\_RSA, 2048                                                                                                                                    | 200                       |
| **TPM2\_Duplicate**                  | TPM\_ALG\_RSA, 2048                                                                                                                                    | 100                       |
| **TPM2\_ECC\_Parameters**            |                                                                                                                                                        | 20                        |
| **TPM2\_GetRandom**                  |                                                                                                                                                        | 20                        |
| **TPM2\_StirRandom**                 |                                                                                                                                                        | 75                        |
| **TPM2\_Certify**                    | TPM\_ALG\_RSA, 2048                                                                                                                                    | 600                       |
| **TPM2\_CertifyCreation**            | TPM\_ALG\_RSA, 2048                                                                                                                                    | 600                       |
| **TPM2\_Quote**                      | TPM\_ALG\_RSA, 2048                                                                                                                                    | 600                       |
| **TPM2\_PCR\_Event**                 |                                                                                                                                                        | 50                        |
| **TPM2\_PCR\_Read**                  |                                                                                                                                                        | 20                        |
| **TPM2\_PolicySecret**               |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyOr**                   |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyPCR**                  |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyLocality**             |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyNV**                   |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyCounterTimer**         |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyCommandCode**          |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyCpHash**               |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyNameHash**             |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyDuplicationSelect**    |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyAuthorize**            |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyAuthValue**            |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyPassword**             |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyGetDigest**            |                                                                                                                                                        | 50                        |
| **TPM2\_PolicyNvWritten**            |                                                                                                                                                        | 50                        |
| **TPM2\_HierarchyChangeAuth**        |                                                                                                                                                        | 50                        |
| **TPM2\_DictionaryAttackLockReset**  |                                                                                                                                                        | 50                        |
| **TPM2\_DictionaryAttackParameters** |                                                                                                                                                        | 50                        |
| **TPM2\_FlushContext**               |                                                                                                                                                        | 50                        |
| **TPM2\_EvictControl**               |                                                                                                                                                        | 100                       |
| **TPM2\_ReadClock**                  |                                                                                                                                                        | 50                        |
| **TPM2\_GetCapability**              |                                                                                                                                                        | 50                        |
| **TPM2\_NV\_DefineSpace**            | 32 Bytes                                                                                                                                               | 100                       |
| **TPM2\_NV\_UndefineSpace**          | 32 Bytes                                                                                                                                               | 100                       |
| **TPM2\_NV\_ReadPublic**             |                                                                                                                                                        | 50                        |
| **TPM2\_NV\_Increment**              |                                                                                                                                                        | 50                        |
| **TPM2\_NV\_Extend**                 |                                                                                                                                                        | 50                        |
| **TPM2\_NV\_SetBits**                |                                                                                                                                                        | 50                        |
| **TPM2\_NV\_Read**                   | 32 Bytes                                                                                                                                               | 50                        |
| **TPM2\_NV\_ChangeAuth**             |                                                                                                                                                        | 50                        |
| **TPM2\_NV\_Certify**                | TPM\_ALG\_RSA, 2048                                                                                                                                    | 600                       |
| **TPM2\_NV\_Write**                  | 32 Bytes, First Write into Newly Defined Index                                                                                                         | 200                       |

   1  The performance requirements below come into effect on July 28, 2018. When in conflict with performance requirements above, they are superseding.

| **Command**               | **Arguments**                                                                                                                                          | **Mean Requirement (ms)** |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| **TPM2\_Create**          | TPM\_ALG\_RSA with Bits=2048                                                                                                                           | 10,000                    |
| **TPM2\_Load**            | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 100                       |
|                           | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                       | 100                       |
|                           | TPM\_ALG\_KEYEDHASH Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 100                       |
| **TPM2\_Sign**            | TPM\_ALG\_RSA, 2048                                                                                                                                    | 300                       |
|                           | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                                                                    | 150                       |
| **TPM2\_VerifySignature** | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                                                                    | 250                       |
| **TPM2\_Import**          | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 500                       |
|                           | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 InSymSeed contains asymmetrically encrypted seed using ECDH algorithm | 250                       |
| **TPM2\_RSA\_Decrypt**    | 1 kB of data                                                                                                                                           | 300                       |
| **TPM2\_HMAC**            | HMAC Operation                                                                                                                                         | 50                        |
| **TPM2\_PolicySigned**    | Sapss RSA 2048                                                                                                                                         | 50                        |
|                           | Sassa RSA 2048                                                                                                                                         | 50                        |
| **TPM2\_PolicyTicket**    |                                                                                                                                                        | 50                        |
| **TPM2\_Unseal**          | 1 kB of data                                                                                                                                           | 30                        |
| **TPM2\_NV\_Certify**     | TPM\_ALG\_RSA, 2048                                                                                                                                    | 400                       |
| **TPM2\_Certify**         | TPM\_ALG\_RSA, 2048                                                                                                                                    | 400                       |
| **TPM2\_Quote**           | TPM\_ALG\_RSA, 2048                                                                                                                                    | 400                       |
| **TPM2\_CertifyCreation** | TPM\_ALG\_RSA, 2048                                                                                                                                    | 400                       |

   2  The performance requirements below come into effect on July 28, 2019. When in conflict with performance requirements above, they are superseding.

| **Command**            | **Arguments**                                                                                                                                          | **Mean Requirement (ms)** |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| **TPM2\_Create**       | TPM\_ALG\_ECC with TPM\_ECC\_NIST\_P256                                                                                                                | 100                       |
|                        | TPM\_ALG\_KEYEDHASH                                                                                                                                    | 100                       |
|                        | 1 kB of data                                                                                                                                           | 100                       |
| **TPM2\_Load**         | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 50                        |
|                        | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                       | 50                        |
|                        | TPM\_ALG\_KEYEDHASH Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 50                        |
| **TPM2\_Sign**         | TPM\_ALG\_RSA, 2048                                                                                                                                    | 250                       |
|                        | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256                                                                                                                    | 100                       |
| **TPM2\_Import**       | TPM\_ALG\_RSA, 2048 Parent = TPM\_ALG\_RSA, 2048                                                                                                       | 500                       |
|                        | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P256 InSymSeed contains asymmetrically encrypted seed using ECDH algorithm | 250                       |
| **TPM2\_RSA\_Decrypt** | 1 kB of data                                                                                                                                           | 250                       |
| **TPM2\_HMAC**         | HMAC Operation                                                                                                                                         | 30                        |
| **TPM2\_PolicyTicket** |                                                                                                                                                        | 30                        |
| **TPM2\_Unseal**       | 1 kB of data                                                                                                                                           | 30                        |

   3  The performance requirements below come into effect on July 28, 2020. When in conflict with performance requirements above, they are superseding.

| **Command**               | **Arguments**                                                                    | **Mean Requirement (ms)** |
|---------------------------|----------------------------------------------------------------------------------|---------------------------|
| **TPM2\_Create**          | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384                                              | 100                       |
| **TPM2\_Load**            | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384 | 100                       |
| **TPM2\_Sign**            | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384                                              | 100                       |
| **TPM2\_VerifySignature** | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384                                              | 150                       |
| **TPM2\_Import**          | TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384 Parent = TPM\_ALG\_ECC, TPM\_ECC\_NIST\_P384 | 500                       |



### Device.TrustedPlatformModule.TPM20.EKCert

*Systems shipping with TPM 2.0 must have appropriate associated EK Certificates available*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile ARM64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Mandatory:** All TPMs must contain a full Endorsement Key (EK) certificate
stored in the TPM NV RAM as described in the "TCG EK Credential Profile for TPM
Family 2.0, Level 0, Revision 14" or be capable of retrieving such a certificate
on first boot.

The device may not be designed such that it contains a key with an associated
certificate from the TPM manufacturer which would allow the device to generate
EK Certificates.

**Mandatory:** Effective July 28, 2020, the TPM must include an EK Certificate
for the TPM\_ECC\_NIST\_P384 curve.

| TPM Artifact          | NV Index   | Required                                                                    |
|-----------------------|------------|-----------------------------------------------------------------------------|
| EK Certificate        | 0x01c00002 | Yes. This must be a certificate associated with an RSA 2048 bit key.        |
| EK nonce (Deprecated) | 0x01c00003 | **Deprecated. This field must not be populated.**                           |
| EK template           | 0x01c00004 | Optional, populate only if non-default values are used for the EK template. |
| EK Certificate        | 0x01c0000a | Yes. This must be a certificate associated with a TPM\_ECC\_NIST\_P256 key. |
| EK nonce (Deprecated) | 0x01c0000b | **Deprecated. This field must not be populated.**                           |
| EK template           | 0x01c0000c | Optional, populate only if non-default values are used for the EK template. |

Any EK certificates beyond those stored in 0x01c00002 and 0x01c0000a must be
stored at NV Indices starting at 0x01c00012. Each even index may store an EK
Certificate. The subsequent odd location shall store the associated template if
required. A nonce may not be present in a separate NV Index and instead must be
included in the template if needed. If a custom template is required to generate
the associated EK, it must be included in whole in the associated index such
that the template may be passed to TPM2\_CreatePrimary.

**How Windows 10 handles legacy EK Certificate nonces**

If a nonce is present in 0x01c00003, it will be copied to the beginning of the
unique.rsa.buffer field in the template. The unique field will be padded to
match the length of the modulus of the key. The unique.rsa.size field will be
set appropriately to match. The resulting template will be passed to the
TPM2\_CreatePrimary command. Any present nonce and template must, when processed
using this process, generate the EK associated with the EK Certificate for the
Nonce and Template.

If a nonce is present in 0x01c0000b, it will be copied into the beginning of the
unique.ecc.x.buffer field in the template. The unique.ecc.x.size field will be
set appropriately to match. The resulting template will be passed to the
TPM2\_CreatePrimary command. Any present nonce and template must, when generated
using this process, generate the EK associated with the EK Certificate for the
Nonce and Template.

The EK certificate must be capable of being written to the TPM NVRAM in such a
way that the action of clearing the TPM does not delete the EK certificate.

The certificate must have the EKU specified that indicates that it is indeed an
EK Certificate. The OID used for this purpose is "2.23.133.8.1".

The EK certificate may also be signed using ECDSA. The supported ECC curves for
this purpose are NIST 256, NIST 384 and NIST 521.

The EK certificate must contain an AIA extension that contains the URL for the
issuing CA Certificate in the certificate chain.

The AIA extension must also be present in each non-root cert in the chain with
URLs that make the issuing CA certificate (any intermediate CA certs and the
root CA cert) – discoverable and retrievable via iterative fetching when
starting only with a single EK cert. For more information on AIA extension,
please refer to http://go.microsoft.com/fwlink/?LinkId=717890.
