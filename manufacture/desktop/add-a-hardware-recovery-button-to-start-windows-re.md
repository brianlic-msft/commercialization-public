---
author: Justinha
Description: 'On UEFI-based computers, you can configure a hardware recovery button (or button combination) to start Windows RE, including push-button reset features for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education).'
ms.assetid: d7edf215-ced0-4052-a442-08a6c19e6078
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add a hardware recovery button to start Windows RE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add a hardware recovery button to start Windows RE


On UEFI-based computers, you can configure a hardware recovery button (or button combination) to start Windows RE, including push-button reset features for Windows 10 for desktop editions (Home, Pro, Enterprise, and Education). This can help users get to the Windows RE menus more easily.

Relative to Windows 8/8.1, the recommended implementation in Windows 10 for such hardware buttons has been greatly simplified. You no longer need to copy Windows boot files to an unmanaged location on the EFI system partition (ESP) to create a secondary boot path. Instead, Windows configures and manages all the on-disk resources required to support the hardware buttons. The design can be summarized as follows:

1.  Windows 10 automatically creates a secondary Boot Configuration Data (BCD) store in the folder \\EFI\\Microsoft\\Recovery.

    When Windows RE is installed, this secondary BCD store is automatically populated with the appropriate settings to boot Windows RE by default.

    If the location of Windows RE changes (for example, due to future updates), the secondary BCD store is updated automatically.

2.  You will still need to create a static boot device entry for recovery at the end of the UEFI firmware boot order list.

    This boot device entry should point to the default Windows Boot Manager (bootmgfw.efi) in the folder \\EFI\\Microsoft\\Boot on the ESP.

    The boot device entry must specify the `/RecoveryBCD` parameter.

    When the hardware button is triggered, the recovery boot device entry should be selected automatically.

    To learn more, see your hardware manufacturer's instructions for modifying the UEFI firmware on the device.

3.  When Windows Boot Manager is launched with the `/RecoveryBCD` parameter, it uses the secondary BCD store which is configured to boot Windows RE, instead of the default BCD store.

The following diagram illustrates the recommended implementation and the various boot paths:

![diagram showing process to add firmware button](images/dep-winre-hardwarebuttonoverview.png)

## <span id="Design_recommendations_for_the_hardware_button_"></span><span id="design_recommendations_for_the_hardware_button_"></span><span id="DESIGN_RECOMMENDATIONS_FOR_THE_HARDWARE_BUTTON_"></span>Design recommendations for the hardware button:


The hardware recovery button (or button combination) should be usable even when the PC is powered off. When triggered, the PC should power on and go through the secondary boot path. This eliminates the need for users to press the button within a very short time window during and after POST.

For PCs which support firmware options menu, triggering the button (or button combination) should first display a simple menu which gives users the options to either boot Windows RE or to enter the firmware options menu. This removes the need to support multiple button combinations.

**Note**  The hardware button will not be able to boot the PC into Windows RE until Windows RE is installed. In general, this means after the PC has completed the Specialize configuration pass.

 

## <span id="related_topics"></span>Related topics


[Deploy Windows RE](deploy-windows-re.md)

 

 






