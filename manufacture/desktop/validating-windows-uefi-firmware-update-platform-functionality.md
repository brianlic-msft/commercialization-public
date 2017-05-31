---
author: Justinha
Description: 'This document lists the basic validation scenarios that are required to pass before signing-off on the Windows UEFI Firmware Update Platform functionality. Specification can be downloaded from here.'
ms.assetid: 42e7c93e-3af3-496a-8fdf-ac97b4e85970
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Validating Windows UEFI Firmware Update Platform Functionality
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Validating Windows UEFI Firmware Update Platform Functionality


This document lists the basic validation scenarios that are required to pass before signing-off on the Windows UEFI Firmware Update Platform functionality. Specification can be downloaded from [here](http://go.microsoft.com/fwlink/p/?linkid=523808).

## <span id="_Prerequisites"></span><span id="_prerequisites"></span><span id="_PREREQUISITES"></span> Prerequisites


-   For each EFI System Resource Table (ESRT) entry, you need a capsule for the latest firmware version. The scenarios will refer to the latest version as X. Each ESRT entry is identified using a unique GUID.
-   For each ESRT entry exposed, create a capsule package that its version is incremented above the package created in step 1. These capsules will be referred to as X+1.
-   Capsules that aid in simulating failure conditions such as a capsule for which the payload is not signed or signed with an invalid PK.
-   Make sure all capsules to be used are signed appropriately from the OS perspective, catalog signed, and firmware signed, PK signed. Unless, you are specifically testing the negative PK signing cases. See “Signing the Firmware driver Package” in the specification for details on how to sign a capsule or firmware driver package.

## <span id="How_To"></span><span id="how_to"></span><span id="HOW_TO"></span>How To


**Install a new capsule or reinstall a previously installed capsule**

1.  Open up device manager.
2.  Find the device node that represents your firmware, it is usually under the “Firmware” devices.
3.  Right click on the firmware device you wish to update.
4.  Select **Update driver software**. You will get a popup that states “Update Driver Software - &lt;Firmware&gt;”.
5.  Select **Browse my computer for driver software**.
6.  On the next window, select **Let me pick from a list of device drivers on my computer**.
7.  If the driver has been installed before, select it from the **Show compatible hardware** box. If it does not exist, select **Have disk** and continue on. Otherwise, select **OK** and reboot the system.
8.  If you select **Have Disk**, you will get a popup labeled **Install From Disk**.
9.  Use **Browse** to go to the directory that has the capsule of the firmware you wish to install.
10. Select the INF file in that directory and hit **OK** to install.
11. During installation, if you get a popup saying the driver is not signed, go ahead and accept this driver.
12. The system asks you to reboot.
13. After you installed the capsule for the firmware, you need to reboot. If you wish to install multiple capsule packages, then wait to reboot until all capsules are installed and then reboot on the final capsule.

**Query the version and status details:**

-   Run the QueryVersionAndStatus.ps1 PowerShell (PS) script to query the current firmware version, last attempt firmware version and last attempt status.

    **To run the script:**

    1.  Run PowerShell as administrator.
    2.  `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force` (This only has to be done once.)
    3.  Display the version and status details for the given GUID. For example: `.\QueryVersionAndStatus.ps1 6bd2efb9-23ab-4b4c-bc37-016517413e9a`
    4.  Check if firmware update was successful: Refer to the section “Validating the status of the firmware update” in the specification document. Make sure that the Last Attempt Status and the Current Version matches the expected version.
    5.  Recommended: Check to make sure that the devices you are updating are also still functioning.
    6.  Set the rollback policy: Some of the scenarios might require rolling back firmware. Rollback is not a production scenario. In order to be able to rollback, a registry policy key has to be created. Create a REG\_DWORD key with the name “Policy” under the node HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\FirmwareResources\\{&lt;GUID&gt;} and set the value of the Policy key to 1. Note that the GUID should be replaced with the actual GUID from the ESRT.

## <span id="Scenarios"></span><span id="scenarios"></span><span id="SCENARIOS"></span>Scenarios


### <span id="S1__Each_ESRT_entry_is_successfully_updatable_through_capsule"></span><span id="s1__each_esrt_entry_is_successfully_updatable_through_capsule"></span><span id="S1__EACH_ESRT_ENTRY_IS_SUCCESSFULLY_UPDATABLE_THROUGH_CAPSULE"></span>S1: Each ESRT entry is successfully updatable through capsule

The following steps should be completed for each ESRT entry that is supported by the platform. Or in other words, for System firmware and each device firmware that supports updating firmware through UpdateCapsule.

**Steps**

1.  For each ESRT entry, install the capsule for firmware version X.
2.  Make sure all the above capsules are installed, prior to rebooting.

**Expected Result**

Firmware update should be successful for each ESRT entry that was updated. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X
-   Last Attempt Status = 0 (STATUS\_SUCCESS)

### <span id="S2__The_latest_firmware_version_X_is_also_updatable_to_X_1_"></span><span id="s2__the_latest_firmware_version_x_is_also_updatable_to_x_1_"></span><span id="S2__THE_LATEST_FIRMWARE_VERSION_X_IS_ALSO_UPDATABLE_TO_X_1_"></span>S2: The latest firmware version X is also updatable to X+1

The following steps should be completed for each ESRT entry that is supported by the platform. Or in other words, for System firmware and each device firmware that supports updating firmware through UpdateCapsule.

**Steps**

1.  Complete scenario S1 above.
2.  For each ESRT entry, install the capsule for firmware version X+1.

**Expected Result**

Firmware update should be successful for each ESRT entry that was updated. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X+1
-   Last Attempt Version = X+1
-   Last Attempt Status = 0 (STATUS\_SUCCESS)

### <span id="S3__On_failure__firmware_update_returns_the_right_status_code_as_defined_in_the_specification_"></span><span id="s3__on_failure__firmware_update_returns_the_right_status_code_as_defined_in_the_specification_"></span><span id="S3__ON_FAILURE__FIRMWARE_UPDATE_RETURNS_THE_RIGHT_STATUS_CODE_AS_DEFINED_IN_THE_SPECIFICATION_"></span>S3: On failure, firmware update returns the right status code as defined in the specification

The Status codes are defined in the section named “UEFI System Resource Table Definition”, in the table with the title “ESRT Last Attempt Status Field Values”.

### <span id="S3.1_Insufficient_Battery_and_UEFI_System_Firmware_update"></span><span id="s3.1_insufficient_battery_and_uefi_system_firmware_update"></span><span id="S3.1_INSUFFICIENT_BATTERY_AND_UEFI_SYSTEM_FIRMWARE_UPDATE"></span>S3.1 Insufficient Battery and UEFI System Firmware update

**Steps**

1.  Drain the battery charge to less than 25% and then plug-in the AC power.
2.  Install the capsule for UEFI System Firmware version X+1. Let’s assume that the current version is X.
3.  Before rebooting, make sure that the battery charge is less than 25%

**Expected Result**

Firmware update should fail. For ESRT entry corresponding to the System Firmware, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X+1
-   Last Attempt Status = 0xc00002de (STATUS\_INSUFFICIENT\_POWER)

### <span id="S3.2_Insufficient_Battery_and_Device_Firmware_update_"></span><span id="s3.2_insufficient_battery_and_device_firmware_update_"></span><span id="S3.2_INSUFFICIENT_BATTERY_AND_DEVICE_FIRMWARE_UPDATE_"></span>S3.2 Insufficient Battery and Device Firmware update

**Steps**

1.  Drain the battery charge to less than 25% and then plug-in the AC power.
2.  Install the capsules for ALL supported devices in the system with firmware version X+1. Let’s assume that the current firmware version for the given device is X.
3.  Before rebooting, make sure that the battery charge is less than 25% .

**Expected Result**

Firmware update should fail. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X+1
-   Last Attempt Status = 0xc00002de (STATUS\_INSUFFICIENT\_POWER)

### <span id="S3.3_Insufficient_Battery__UEFI_System_and_Device_Firmware_update_at_the_same_time"></span><span id="s3.3_insufficient_battery__uefi_system_and_device_firmware_update_at_the_same_time"></span><span id="S3.3_INSUFFICIENT_BATTERY__UEFI_SYSTEM_AND_DEVICE_FIRMWARE_UPDATE_AT_THE_SAME_TIME"></span>S3.3 Insufficient Battery, UEFI System and Device Firmware update at the same time

**Steps**

1.  Drain the battery charge to less than 25% and then plug-in the AC power.
2.  Install the capsules for UEFI System Firmware and all Device Firmware with version X+1.
3.  Before rebooting, make sure that the battery charge is less than 25%.

**Expected Result**

Firmware update should fail for the System firmware and for all the device firmware for which the update was attempted. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X+1
-   Last Attempt Status = 0xc00002de (STATUS\_INSUFFICIENT\_POWER)

### <span id="S3.4_Firmware_update_should_fail_when_the_capsule_is_not_PK_signed"></span><span id="s3.4_firmware_update_should_fail_when_the_capsule_is_not_pk_signed"></span><span id="S3.4_FIRMWARE_UPDATE_SHOULD_FAIL_WHEN_THE_CAPSULE_IS_NOT_PK_SIGNED"></span>S3.4 Firmware update should fail when the capsule is not PK signed

The following steps should be completed for each ESRT entry that is supported by the platform. Or in other words, for System firmware and each device firmware that supports updating firmware through UpdateCapsule.

**Steps**

1.  For each ESRT entry, create a capsule X+2, the payload for which is not signed.
2.  Install the capsules X+2. Let’s assume that the current version is X.

**Expected Result**

Firmware update should fail for all the ESRT entries for which the update was attempted. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X+2
-   Last Attempt Status = 0xC0000022 (STATUS\_ACCESS\_DENIED)

### <span id="S3.5_Firmware_update_should_fail_when_the_capsule_is_signed_with_the_wrong_PK_certificate"></span><span id="s3.5_firmware_update_should_fail_when_the_capsule_is_signed_with_the_wrong_pk_certificate"></span><span id="S3.5_FIRMWARE_UPDATE_SHOULD_FAIL_WHEN_THE_CAPSULE_IS_SIGNED_WITH_THE_WRONG_PK_CERTIFICATE"></span>S3.5 Firmware update should fail when the capsule is signed with the wrong PK certificate

The following steps should be completed for each ESRT entry that is supported by the platform. Or in other words, for System firmware and each device firmware that supports updating firmware through UpdateCapsule.

**Steps**

1.  For each ESRT entry, create a capsule X+2, sign the payload with a wrong key or certificate (for example use a debug signed capsule on a production device).
2.  Install the capsules X+2. Let’s assume that the current version is X.

**Expected Result**

Firmware update should fail for all the ESRT entries for which the update was attempted. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X+2
-   Last Attempt Status = 0xC0000022 (STATUS\_ACCESS\_DENIED)

### <span id="S3.6_Firmware_update_should_fail_when_the_capsule_payload_is_tampered_with"></span><span id="s3.6_firmware_update_should_fail_when_the_capsule_payload_is_tampered_with"></span><span id="S3.6_FIRMWARE_UPDATE_SHOULD_FAIL_WHEN_THE_CAPSULE_PAYLOAD_IS_TAMPERED_WITH"></span>S3.6 Firmware update should fail when the capsule payload is tampered with

The following steps should be completed for each ESRT entry that is supported by the platform. Or in other words, for System firmware and each device firmware that supports updating firmware through UpdateCapsule.

**Steps**

1.  For each ESRT entry, create a capsule X+2, sign the payload with the right key or certificate. Then open the firmware bin file and flip 1 or more bits in the file and save the file back.
2.  Regenerate the catalog for the bin file and the INF file.
3.  Install the capsules X+2. Let’s assume that the current version is X.

**Expected Result**

Firmware update should fail for all the ESRT entries for which the update was attempted. For all ESRT entries, for which the update was attempted, validate that:

-   Current Firmware Version = X
-   Last Attempt Version = X+2
-   Last Attempt Status = 0xC0000022 (STATUS\_ACCESS\_DENIED) or 0xC000007B (STATUS\_INVALID\_IMAGE\_FORMAT)

### <span id="S3.7__Firmware_does_not_allow_rollback_beyond_the_LowestSupportedFirmwareVersion_"></span><span id="s3.7__firmware_does_not_allow_rollback_beyond_the_lowestsupportedfirmwareversion_"></span><span id="S3.7__FIRMWARE_DOES_NOT_ALLOW_ROLLBACK_BEYOND_THE_LOWESTSUPPORTEDFIRMWAREVERSION_"></span>S3.7: Firmware does not allow rollback beyond the LowestSupportedFirmwareVersion

The following steps should also be carried out for other device firmware (lower priority).

**Steps**

1.  For UEFI System Firmware, create a capsule X+1 such that the “LowestSupportedFirmwareVersion” in the ESRT entry for the system firmware is set to X+1.
2.  Install the capsule X+1 and make sure that the update succeeds.
3.  Create a UEFI System firmware update capsules, such that the version in the INF is X+2 but the actual firmware binary file is of version X.
4.  Install the capsule X+2 and reboot the system.

**Expected Result**

Firmware update should fail. For ESRT entry corresponding to the System Firmware, validate that:

-   Current Firmware Version = X+1
-   Last Attempt Version = X+2
-   Last Attempt Status = 0xC0000059 (STATUS\_REVISION\_MISMATCH)

### <span id="S4__Seamless_recovery_and_firmware_update__if_implemented__"></span><span id="s4__seamless_recovery_and_firmware_update__if_implemented__"></span><span id="S4__SEAMLESS_RECOVERY_AND_FIRMWARE_UPDATE__IF_IMPLEMENTED__"></span>S4: Seamless recovery and firmware update (if implemented)

This scenario varies from platform to platform depending on the implementation of the seamless recovery. Based on the implementation, the validation might require creating bad capsules that forces the system into recovery or disconnecting the power in the middle of an update or through any other means of exercising the recovery flows.

**Expected Result**

The system should boot into the OS and the firmware update should be marked as failed. The version reported by the UEFI firmware resource device should not have changed.

### <span id="S5__Firmware_Update_adheres_to_the_User_Experience__UX__requirement"></span><span id="s5__firmware_update_adheres_to_the_user_experience__ux__requirement"></span><span id="S5__FIRMWARE_UPDATE_ADHERES_TO_THE_USER_EXPERIENCE__UX__REQUIREMENT"></span>S5: Firmware Update adheres to the User Experience (UX) requirement

**Steps**

-   This scenario can be validated while executing any of the above scenarios that lead to a successful firmware update.

**Expected Result**

The user experience is in accordance to the specification, see section on “User Experience”.

-   The only text that is displayed on the screen is “Please wait while we install a system update”. The text is displayed at the right co-ordinates on the screen as called out in the specification.
-   OEM Logo is displayed as described in the specification.

## <span id="related_topics"></span>Related topics


[Windows UEFI Firmware Update Platform](http://go.microsoft.com/fwlink/p/?linkid=523808)

[UEFI Validation Option ROM Validation Guidance](uefi-validation-option-rom-validation-guidance.md)

 

 






