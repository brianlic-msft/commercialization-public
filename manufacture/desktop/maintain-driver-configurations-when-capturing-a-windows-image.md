---
author: Justinha
Description: Maintain Driver Configurations when Capturing a Windows Image
ms.assetid: 4712b33a-c6ab-4715-ba55-041c0c6fa2b1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Maintain Driver Configurations when Capturing a Windows Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maintain Driver Configurations when Capturing a Windows Image


A common deployment scenario is to capture a single Windows image from a reference computer and then apply the image to a group of destination computers that have identical hardware configurations.

To save time during installation and to speed up the out-of-box experience (OOBE) for end users, you can instruct Windows Setup to maintain the driver configurations from the reference computer as part of the Windows image. You should do this only when the hardware on the reference computer and the hardware on the destination computers are identical. When you do this, Windows Setup maintains driver configurations during image capture and deployment.

## <span id="bkmk_1"></span><span id="BKMK_1"></span>Instructing Windows Setup to Maintain Driver Configurations


Before you capture an image, generalize the computer by using an answer file that instructs Windows Setup to maintain the driver configurations.

**To maintain driver configurations by using an answer file**

1.  On your technician computer, open Windows System Image Manager (Windows SIM). Click **Start**, type **Windows System Image Manager**, and then select **Windows System Image Manager**.
2.  Create a new answer file, or update an existing answer file. For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085) and [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073).
3.  Add the Microsoft-Windows-PnpSysprep/**PersistAllDeviceInstalls** setting. For more information, see the [Overview](#bkmk_2) section in this topic.
4.  If the computer has undetectable hardware, include the Microsoft-Windows-PnpSysprep/**DoNotCleanUpNonPresentDevices** setting. For more information, see the [Undetectable hardware](#undetectablehardware) section in this topic.
5.  Generalize the computer by using the answer file. For example:

    ``` syntax
    Sysprep /generalize /unattend:C:\unattend.xml
    ```

## <span id="bkmk_2"></span><span id="BKMK_2"></span>Overview


The Windows in-box driver packages include device drivers that support a wide variety of popular hardware. If your specific hardware requires additional device drivers to boot, you can preinstall additional device drivers on your Windows image. Independent Hardware Vendors (IHVs) often supply these additional device drivers together with their device hardware. For more information about how to add device drivers, see [Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md).

To prepare a Windows image for deployment to multiple computers, you must use the System Preparation (Sysprep) tool to generalize the Windows image. Generalizing a Windows image removes the computer-specific information and prepares the device drivers for first boot. This preparation includes these steps:

-   Device state for hardware is removed.

-   Boot-critical driver settings are reset to their default values.

-   Device log files are deleted.

When you generalize the computer, use an answer file that has the Microsoft-Windows-PnpSysPrep\\**PersistAllDeviceInstalls** setting to save time. This setting prevents Windows Setup from removing and reconfiguring the device state for identical hardware. On first boot, the detected device drivers are already preconfigured, potentially enabling a quicker first-boot experience.

**Important**  
Avoid using the **PersistAllDeviceInstalls** setting when the hardware and the hardware configuration on the reference computer are not identical to those of the destination computers. Even seemingly minor differences in hardware or hardware configuration can cause severe or easily overlooked problems. For more information, see the [Troubleshooting Hardware Configuration Differences](#bkmk_4) section of this topic.

 

It's a good practice not to use the **PersistAllDeviceInstalls** setting on your primary reference image. Instead, for each group of computers that have a different hardware configuration, first load your primary reference image onto a new reference computer that has the planned hardware configuration. Next, capture a new image of this setup and use the **PersistAllDeviceInstalls** setting.

For more information about how to generalize the Windows image, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).

## <span id="bkmk_3"></span><span id="BKMK_3"></span>Best Practices for Driver Revisions and Driver Ranking


Don't maintain multiple versions or revisions of the same driver package in the same image. Use offline or online servicing tools to update drivers.

Normally, when Windows Setup boots a computer and multiple versions of a driver package exist on that computer, Setup determines which driver to install by using driver ranking. But when you use the **PersistAllDeviceInstalls** setting, the normal driver-ranking processes don't occur. So, devices that use outdated drivers may remain installed. For more information about driver ranking, see [How Windows Ranks Drivers](http://go.microsoft.com/fwlink/?LinkId=91227) on MSDN.

If you must add a device driver to an image that uses the **PersistAllDeviceInstalls** setting, you can update your device drivers by using one of the following methods:

-   Use offline servicing tools, like the Deployment Image Servicing and Management (DISM) tool or an unattended answer file. For more information, see [Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md).

-   Use online servicing methods or tools, like an unattended answer file. For more information, see [Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md).

## <span id="bkmk_4"></span><span id="BKMK_4"></span>Troubleshooting Hardware Configuration Differences


For the **PersistAllDeviceInstalls** setting to work correctly, the hardware configuration must be identical on the reference computer and on the destination computers. Hardware configuration includes the following components:

-   **Hardware make and model.**

-   **Firmware.** Updates, revisions, and configuration differences can cause some devices to report different criteria for matching device drivers or to use different resources. For example:

    -   Peripheral Component Interconnect (PCI)–based devices can embed different subsystem revision numbers in their reported hardware IDs.

    -   BIOS revisions can change the Advanced Configuration and Power Interface (ACPI) namespace. This causes Windows Setup to report existing devices differently or to introduce existing devices as new devices.

    -   BIOS system configuration differences can cause system devices to claim different memory, I/O, direct memory access (DMA), or interrupt request (IRQ) resources.

-   **Physical location.** Hardware configurations must use the same slot, port, or socket numbers to connect to external devices. For example:

    -   PCI expansion cards must be inserted in the same slot numbers.

    -   USB devices must be connected or wired to the same port numbers on the same USB host controllers and integrated hubs.

    -   Storage devices must be connected to the same storage controllers and channels.

### <span id="TypesOfHardwareLikelyToCauseProblems"></span><span id="typesofhardwarelikelytocauseproblems"></span><span id="TYPESOFHARDWARELIKELYTOCAUSEPROBLEMS"></span>Low-risk, medium-risk, and high-risk differences in hardware configuration

When you use the **PersistAllDeviceInstalls** setting, any hardware differences can potentially cause problems. But some differences are more likely to cause problems than others.

### <span id="Low-risk_differences"></span><span id="low-risk_differences"></span><span id="LOW-RISK_DIFFERENCES"></span>Low-risk differences

For the following types of hardware differences, you may be able to work around potential driver conflicts and still use the **PersistAllDeviceInstalls** setting:

-   CPU clock speed

-   Amount of memory

-   Hard disk capacity

-   External input devices, like keyboards and mouse devices

-   Monitors

### <span id="Medium-risk_differences"></span><span id="medium-risk_differences"></span><span id="MEDIUM-RISK_DIFFERENCES"></span>Medium-risk differences

For the following types of hardware differences, we recommend that you don't use the **PersistAllDeviceInstalls** setting:

-   Video cards

-   Storage drives and media readers, like optical drives and card readers

-   Internal or integrated bus devices, like USB or 1394 devices

When these types of hardware differences exist, using this setting may not reduce installation time, even if you work around potential driver conflicts.

### <span id="High-risk_differences"></span><span id="high-risk_differences"></span><span id="HIGH-RISK_DIFFERENCES"></span>High-risk differences

For major hardware differences, don't use the **PersistAllDeviceInstalls** setting. These differences include:

-   Motherboard chipset or CPU brand

-   Storage controllers

-   Form-factor differences, like a change from a desktop to a laptop or from a laptop to a desktop

-   Keyboard layout differences, like a change from a standard 101-key keyboard to a Japanese 106-key keyboard

-   Any other devices that are in the enumeration path of the Windows boot volume

### <span id="WhatTypesOfProblemsCanOccur"></span><span id="whattypesofproblemscanoccur"></span><span id="WHATTYPESOFPROBLEMSCANOCCUR"></span>Types of problems that can occur with a hardware configuration change

Even seemingly minor differences in hardware or hardware configuration can cause severe or easily overlooked problems, like these:

-   System instability

-   Inability to use some of the basic or extended functionality of a device

-   Extended boot times and extended installation times

-   Misnamed devices in the Devices and Printers folder, Device Manager, and other device-related user interfaces

-   Severe system problems that leave the computer in a non-bootable state

### <span id="BootCriticalDriverPackages"></span><span id="bootcriticaldriverpackages"></span><span id="BOOTCRITICALDRIVERPACKAGES"></span>Hardware configuration differences that can cause system boot failures

When the boot-critical hardware is not identical on the reference computer and destination computers, using the **PersistAllDeviceInstalls** setting can cause severe system problems that can leave the computer in a non-bootable state.

Boot-critical driver packages can belong to any of the following Windows device setup classes, as identified by the ClassGUID directive in the *&lt;Version&gt;* section of the .inf files in their driver packages.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">System-supplied device setup class</th>
<th align="left">ClassGUID</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>System</p></td>
<td align="left"><p>{4D36E97D-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="even">
<td align="left"><p>Computer</p></td>
<td align="left"><p>{4D36E966-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Processor</p></td>
<td align="left"><p>{50127DC3-0F36-415E-A6CC-4CB3BE910B65}</p></td>
</tr>
<tr class="even">
<td align="left"><p>PCMCIA</p></td>
<td align="left"><p>{4D36E977-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>HDC</p></td>
<td align="left"><p>{4D36E96A-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="even">
<td align="left"><p>SCSIAdapter</p></td>
<td align="left"><p>{4D36E97B-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>DiskDrive</p></td>
<td align="left"><p>{4D36E967-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="even">
<td align="left"><p>CDROM</p></td>
<td align="left"><p>{4D36E965-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>FDC</p></td>
<td align="left"><p>{4D36E969-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="even">
<td align="left"><p>FloppyDisk</p></td>
<td align="left"><p>{4D36E980-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Volume</p></td>
<td align="left"><p>{71A27CDD-812A-11D0-BEC7-08002BE2092F}</p></td>
</tr>
<tr class="even">
<td align="left"><p>USB</p></td>
<td align="left"><p>{36FC9E60-C465-11CF-8056-444553540000}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>SBP2</p></td>
<td align="left"><p>{D48179BE-EC20-11D1-B6B8-00C04FA372A7}</p></td>
</tr>
<tr class="even">
<td align="left"><p>1394</p></td>
<td align="left"><p>{6BDD1FC1-810F-11D0-BEC7-08002BE2092F}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Enum1394</p></td>
<td align="left"><p>{C459DF55-DB08-11D1-B009-00A0C9081FF6}</p></td>
</tr>
<tr class="even">
<td align="left"><p>Keyboard</p></td>
<td align="left"><p>{4D36E96B-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Mouse</p></td>
<td align="left"><p>{4D36E96F-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
<tr class="even">
<td align="left"><p>HIDClass</p></td>
<td align="left"><p>{745A17A0-74D3-11D0-B6FE-00A0C90F57DA}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ports</p></td>
<td align="left"><p>{4D36E978-E325-11CE-BFC1-08002BE10318}</p></td>
</tr>
</tbody>
</table>

 

For more information about these device setup classes, see [System-Supplied Device Setup Classes](http://go.microsoft.com/fwlink/?LinkId=237677) on MSDN.

### <span id="UndetectableHardware"></span><span id="undetectablehardware"></span><span id="UNDETECTABLEHARDWARE"></span>Undetectable hardware

When you deploy a new computer to an end user, some hardware, like a removable device or a device that has an on/off switch, may not be present or detected during first boot. By default, on first boot, Windows Setup removes the preconfigured device state for undetected hardware.

To deploy hardware that may not be present or detected on first boot, add any applicable device drivers to the reference image, connect or turn on the applicable devices so that Windows can install them, and use the Microsoft-Windows-PnpSysprep/**DoNotCleanUpNonPresentDevices** setting when you capture the image.

**Important**  
Using the **DoNotCleanUpNonPresentDevices** setting can lead to the unnecessary storage of excess device states and contribute to slower boot times.

 

## <span id="bkmk_5"></span><span id="BKMK_5"></span>Troubleshooting Driver Conflicts


To avoid driver conflicts between independent boot-critical driver packages, the IHV must make sure that each device driver uses different service names, registry key values, and binary file names.

### <span id="Example_of_a_potential_driver_conflict"></span><span id="example_of_a_potential_driver_conflict"></span><span id="EXAMPLE_OF_A_POTENTIAL_DRIVER_CONFLICT"></span>Example of a potential driver conflict

In the following example, a fictitious IHV named Fabrikam produces two types of storage controllers: StandardController and ExtremeController. Fabrikam assumes that only one type of storage controller is installed at a time on a particular computer.

The driver package defines the StandardController and ExtremeController configurations to use the same driver service name, storctrl. The storctrl driver service uses different service settings that change depending on which hardware (StandardController or ExtremeController) is installed. Because both StandardController and ExtremeController use the same service, they cannot coexist.

This sample shows the contents of the driver package file Storctrl.inf:

``` syntax
[Version]
Signature = "$WINDOWS NT$"
Class = SCSIAdapter
ClassGuid = {4D36E97B-E325-11CE-BFC1-08002BE10318}
...
[Manufacturer]
%Fabrikam% = Fabrikam,NTx86

[Fabrikam.NTx86]
%StandardController% = StandardController_DDInstall,PCI\VEN_ABCD&DEV_0001
%ExtremeController%  = ExtremeController_DDInstall, PCI\VEN_ABCD&DEV_0002

...

[StandardController_DDInstall.Services]
AddService = storctrl,0x00000002,StandardController_ServiceInstall

[StandardController_ServiceInstall]
ServiceType  = 1 ; SERVICE_KERNEL_DRIVER
StartType    = 0 ; SERVICE_BOOT_START
ErrorControl = 1 ; SERVICE_ERROR_NORMAL
ImagePath    = %12%\storctrl.sys
AddReg       = StandardController_ServiceSettings

[StandardController_ServiceSettings]
HKR,Settings,LowPowerMode,0x00010001,1
HKR,Settings,ErrorCorrection,0x00010001,1

...

[ExtremeController_DDInstall.Services]
AddService = storctrl,0x00000002,ExtremeController_ServiceInstall

[ExtremeController_ServiceInstall]
ServiceType  = 1 ; SERVICE_KERNEL_DRIVER
StartType    = 0 ; SERVICE_BOOT_START
ErrorControl = 1 ; SERVICE_ERROR_NORMAL
ImagePath    = %12%\storctrl.sys
AddReg       = ExtremeController_ServiceSettings

[ExtremeController_ServiceSettings]
HKR,Settings,LowPowerMode,0x00010001,0
HKR,Settings,ErrorCorrection,0x00010001,4
...
```

If StandardController is on the reference computer and its settings are maintained during image capture, the storctrl driver service is preconfigured. If ExtremeController is on the destination computer, Windows may use the preconfigured settings and files that are intended for StandardController. This can cause unexpected results.

The IHV can help resolve the conflict by using one of these options:

-   Create separate driver packages that have separate .inf files for each configuration, and import only the required driver package into the Windows image during deployment. For example, split Storctrl.inf into two separate .inf files, one version for StandardController and one version for ExtremeController, and import only the required driver package into the Windows image.

<!-- -->

-   Create another service in the driver package for each configuration. Give each service a different name (for example, storctrl and storctrlx) and point to a different binary image file (for example, Storctrl.sys and Storctrlx.sys).

## <span id="related_topics"></span>Related topics


[Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md)

 

 






