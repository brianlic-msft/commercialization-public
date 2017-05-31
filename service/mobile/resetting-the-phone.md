---
author: kpacquer
Description: 'Resetting the device addresses a number of key scenarios: A user may want to reset a device to transfer it to another owner.'
ms.assetid: 2db677f1-edf6-421d-8482-770ee5f16140
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Resetting a mobile device
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Resetting a mobile device


Resetting the device addresses a number of key scenarios:

-   A user may want to reset a device to transfer it to another owner.
-   The device has been lost or stolen and the owner wants to remotely reset the device
-   The device belongs to an organization, and the organization wants to remotely reset the device. For example, when an employee leaves the organization.
-   The device has malfunctioned and the user wants to reset the device.
-   An OEM has completed factory testing and wants to reset the device (optionally preserving preloaded map data).

**Important**  
When you reset a device, it does not return it to the original factory state. For example, any packages that were added or modified during an update remain. To return the device to the original factory state, you must flash it with the original factory image.

 

## <span id="Ways_to_reset_a_mobile_device"></span><span id="ways_to_reset_a_mobile_device"></span><span id="WAYS_TO_RESET_A_MOBILE_DEVICE"></span>Ways to reset a mobile device


The following reset options are available to different types of users.

### <span id="End_users"></span><span id="end_users"></span><span id="END_USERS"></span>End users

End users can invoke a reset by the following options:

-   If Settings is accessible, tap **Settings** &gt; **System** &gt; **About** &gt; **Reset your phone**.

    **Note**  
    If the device is not responsive, the user should first try restarting it; see [Restarting the OS](#restarting) later in this topic.

     

-   If Settings is not accessible, perform the following steps:

    1.  Turn off the device.

    2.  Turn on the device while holding down the volume down button until the exclamation mark appears on the screen.

    3.  Press the following four buttons in this order: volume up, volume down, power, volume down.

-   Use the erase function on the WindowsPhone.com website to reset a device remotely. For more information, see [Find a lost phone](http://www.windowsphone.com/how-to/wp8/basics/find-a-lost-phone).

### <span id="Partners"></span><span id="partners"></span><span id="PARTNERS"></span>Partners

In addition to the options listed in the previous section, partners such as OEMs and mobile operators have the following additional options for invoking a reset:

-   A reset can be invoked programmatically during manufacturing scenarios by calling the ResetPhone or ResetPhoneEx function.

-   In non-retail images (that is, images where the **ReleaseType** element in the OEMInput file is set to **Test**), a reset can be invoked through the developer boot menu.

**Note**  The end user factory reset process is not designed for use on the factory floor. We recommend resetting the phone programmatically in factory or refurbishment settings. It is faster than resetting the phone by using **Settings** &gt;**System**&gt; **About** &gt; **Reset your phone**.

 

You can verify that all data was successfully removed by using GetResetLogs.exe. The log files will show you any files that were not removed after the device was reset.

### <span id="Enterprises"></span><span id="enterprises"></span><span id="ENTERPRISES"></span>Enterprises

In enterprise scenarios where mobile devices are managed using device management software, a reset can be invoked remotely by the following options:

-   A reset can be invoked by using the RemoteWipe policy setting with Exchange ActiveSync. For more info, see the [Windows Phone Exchange ActiveSync Overview](http://go.microsoft.com/fwlink/?LinkId=270085) white paper on the Microsoft Download Center.

-   A reset can be invoked by using OMA DM. For more info, see [RemoteWipe CSP](http://go.microsoft.com/fwlink/p/?LinkId=708418).

## <span id="Operations_performed_by_phone_reset"></span><span id="operations_performed_by_phone_reset"></span><span id="OPERATIONS_PERFORMED_BY_PHONE_RESET"></span>Operations performed by phone reset


A reset performs the following operations:

-   It uses the chkdsk tool to scan the main OS for corruption issues, and it tries to automatically fix the issues if any are found. If the reset operation is initiated by using the ResetPhoneEx function with the **RESET\_PRESERVE\_USER\_STORE\_DATA** flag, the operation also scans the user data partition.

-   It executes a quick format of the user data partition. All pre-populated data (such as map data) on the user data partition is deleted and will need to be reloaded.

-   It removes any user-installed Store apps. The user can use the backup and restore feature to restore the installed apps.

-   It removes from the OS partition any files that are not described by packages. Because updates are described in packages, updates will be present after a reset.

-   It recreates the registry by using a stored copy that was saved during first boot, to which it adds all of the registry changes that have been received in update packages.

-   If device encryption is enabled before the reset operation, it permanently deletes the active device encryption key. However, device encryption will continue to be enabled using a different encryption key after the reset operation.

-   If the device has an SD card, in some scenarios the SD card is also reformatted. For more details, see [Reformatting the SD card](#sdcard) later in this topic.

The following items persist across a reset:

-   Update packages that have been delivered to the device and installed by the user.

-   Registry changes that were delivered in updates.

-   All data in the DPP partition, such as calibration data.

-   The contents of the Main OS and user data partitions are reset as described previously. Anything stored in the other OS partitions does persist.

-   Static cold-boot provisioning XML.

-   If the reset operation is initiated by using the ResetPhoneEx function, certain data in the user store can be optionally preserved by specifying **RESET\_PRESERVE\_USER\_STORE\_DATA** in the *dwFlags* parameter. Currently, the only user store data that is preserved is pre-loaded map data.

### <span id="sdcard"></span><span id="SDCARD"></span>Reformatting the SD card

If the device includes an SD card, the SD card can be reformatted in the following reset scenarios:

-   The user initiates a reset operation in system settings, and the user chooses the option to reformat the SD card along with resetting the device.

-   The user initiates a reset operation remotely from the WindowsPhone.com website. In this scenario, the reset operation automatically reformats the SD card; there is no option for keeping the SD card contents.

-   The reset operation is initiated remotely on a managed device by using Exchange ActiveSync or using OMA-DM and the RemoteWipe configuration service provider. In this scenario, the reset operation automatically reformats the SD card; there is no option for keeping the SD card contents. For more information, see [RemoteWipe CSP](http://go.microsoft.com/fwlink/p/?LinkId=708418).

-   The reset operation is initiated programmatically by a partner application that uses the ResetPhone or ResetPhoneEx function in the following ways:

    -   ResetPhone: Pass **TRUE** to the *bWipeStorageCard* parameter.

    -   ResetPhoneEx: Pass **RESET\_WIPE\_SD** to the *dwFlags* parameter.

In each of these scenarios, the OS attempts to execute a quick format of the SD card. If the attempt to reformat the SD card is unsuccessful, the operation proceeds with the rest of the reset process.

## <span id="OMA_provisioning_and_resetting_the_device"></span><span id="oma_provisioning_and_resetting_the_device"></span><span id="OMA_PROVISIONING_AND_RESETTING_THE_DEVICE"></span>OMA provisioning and resetting the device


OMA Client Provisioning and OMA Device Management (DM) settings that are stored in the modem are retained when the device is reset. Registry settings that are changed by provisioning are not retained when the device is reset. For more information, see [RemoteWipe CSP](http://go.microsoft.com/fwlink/p/?LinkId=708418).

## <span id="Persisting_provisioned_content_from_the_workplace"></span><span id="persisting_provisioned_content_from_the_workplace"></span><span id="PERSISTING_PROVISIONED_CONTENT_FROM_THE_WORKPLACE"></span>Persisting provisioned content from the workplace


If the device has been applied with provisioning packages or the organization uses EnterpriseExtFileSystem configuration service provider to push down provisioned content to a persistent location, the provisioned content can be persisted with a reset using the following ways:

-   The user initiates a reset operation in system settings, and the user chooses the option to persist the provisioned content from the workplace.
-   The reset operation is initiated remotely on a managed device by using OMA-DM and the RemoteWipe configuration service provider (doWipePersistProvisionedData node).

For more info about the RemoteWipe configuration service provider and EnterpriseExtFileSystem configuration service provider, see [RemoteWipe CSP](http://go.microsoft.com/fwlink/p/?LinkId=708418).

## <span id="Restarting"></span><span id="restarting"></span><span id="RESTARTING"></span>Restarting the OS


If the device is not responsive to the normal shutdown procedure or the power button alone, the device can be forced to restart by using a combination of buttons. This procedure does not reset the device; instead, it provides an alternate way to restart an unresponsive device.

To restart the device, press and hold both the volume down button and the power button for 10 seconds.

 

 





