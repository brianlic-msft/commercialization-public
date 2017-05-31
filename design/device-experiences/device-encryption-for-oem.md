---
title: Device encryption in Windows 10 for OEMs
description: OEMs can configure hardware to support Windows 10 automatic device encryption.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
---

# Device encryption in Windows 10

With the right hardware configurations, Windows 10 automatically encrypts a device, helping to keep customer data safe.  OEMs can create a more secure device by implementing and testing the right hardware.

Windows 10 device encryption is enabled only after users sign in with a **Microsoft Account** or an **Azure Active Directory** account. Device encryption is not enabled with local accounts.

## Hardware requirements
Device encryption is enabled when:
- The device contains a **TPM** (Trusted Platform Module) with PCR7 support
- **UEFI Secure Boot** is enabled
- **Platform Secure Boot** is enabled
- **Direct memory access (DMA)** protections is enabled.  

The following list shows the hardware and tests that a device must pass before Windows 10 can enable device encryption. OEMs who want to create hardware that supports this capability must verify that their device passes these tests. If any test in this sequence fails, no further tests can will pass.


1. **TPM**: Device must include a TPM with PCR 7 support.  See [System.Fundamentals.TPM20.TPM20](https://msdn.microsoft.com/windows/hardware/commercialize/design/compatibility/systems#systemfundamentalstpm20tpm20).
2. **Secure boot**: UEFI Secure Boot is enabled. See [System.Fundamentals.Firmware.UEFISecureBoot](https://msdn.microsoft.com/windows/hardware/commercialize/design/compatibility/systems#systemfundamentalsfirmwareuefisecureboot).
3. **InstantGo (AOAC)** requirements or **HSTI** validation. This requirement is met by one of the following:
    - InstantGo (AOAC) requirements are implemented. These include [requirements for UEFI secure boot](https://msdn.microsoft.com/windows/hardware/commercialize/design/compatibility/systems#systemfundamentalsfirmwarecsuefisecurebootconnectedstandby) and protection from unauthorized DMA.
    - Starting with Windows 10, version, 1703, this requirement can be met through [HSTI test](https://msdn.microsoft.com/library/windows/hardware/mt712332.aspx):
        1.	Platform Secure Boot self-test (or additional self-tests as configured in the registry) must be reported by HSTI as implemented and passed.
        2.	Excluding Thunderbolt, HSTI must report no non-allowed DMA busses.
        3.	If Thunderbolt is present, HSTI must report that Thunderbolt is configured securely (security level must be SL1 – “User Authorization” or higher).

### Verify the device supports encryption
Starting with Windows 10, version 1703, use the following steps to determine if the system supports automatic device encryption.
1.	Click **Start**, and type **System information**
2.	Right-click **System Information** app and click **Open as Administrator**. Allow the app to make changes to your device by clicking **Yes**. Some devices might require elevated permissions to view the encryption settings.
3.	In **System Summary**, see **Device Encryption Support**.  The value will state if the device is encrypted, or if not, reasons why it is disabled. 

## Disable device encryption
OEMs can choose to disable device encryption and instead implement their own encryption technology on a device. To disable device encryption:

- Use an Unattend file and set [PreventDeviceEncryption](https://msdn.microsoft.com/windows/hardware/commercialize/customize/desktop/unattend/microsoft-windows-securestartup-filterdriver-preventdeviceencryption) to True. See [Use an answer file with Sysprep](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/desktop/use-answer-files-with-sysprep).

- Update this registry key:
**HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\BitLocker**
Value: **PreventDeviceEncryption** equal to True (1).