---
author: Justinha
Description: 'UEFI Requirements: Boot time, Runtime, Hibernation State (S4)'
ms.assetid: 8fad2f32-6ff5-49db-9d34-041485a34a4c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'UEFI Requirements: Boot time, Runtime, Hibernation State (S4)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UEFI Requirements: Boot time, Runtime, Hibernation State (S4)


This section describes UEFI and firmware requirements, including:

-   Boot time requirements

-   Runtime requirements

-   Hibernation State (S4) requirements

-   Requirements to Enable UEFI Platforms without CSM

## <span id="Boot_time_requirements"></span><span id="boot_time_requirements"></span><span id="BOOT_TIME_REQUIREMENTS"></span>Boot time requirements


This section describes UEFI boot time requirements.

### <span id="Display_at_Boot_Time"></span><span id="display_at_boot_time"></span><span id="DISPLAY_AT_BOOT_TIME"></span>Display at Boot Time

For a platform that has a console device, the UEFI 2.0 specification requires the firmware to implement the Simple Text Output Protocol. Optionally, the firmware can also support a graphical protocol. UEFI 2.0 defines the Graphic Output Protocol (GOP), and EFI 1.1 defines the Universal Graphics Adapter (UGA) Protocol. Windows supports all three protocols, but the user experience with each protocol is different. For the best experience, if the firmware implements a graphical protocol, Windows recommends and prefers the GOP.

Windows requires a graphical protocol to render glyphs for non-English message resources. To do so, the firmware must support the following:

1.  A graphical protocol—either GOP or UGA.

2.  Either 1024x768 display resolution with 32-bit pixel color or 800x600 display resolution with 24-bit pixel color.

If the firmware does not support any of these graphics modes, Windows still functions, but all boot display reverts to text mode and English.

Windows 8.1, Windows Server 2012 R2, Windows 7, Windows Server 2008 R2, and Windows Server 2008 require GOP to display a high-resolution, animated image during boot. If GOP is not available, Windows uses the video graphics array (VGA) standard to display a lower resolution image and a simple progress indicator. For an optimal boot experience with these versions of Windows, sealed platforms without expansion card slots can safely boot with graphics mode enabled and eliminate transitions to text mode.

Whenever the firmware boot manager hands off execution to a Windows EFI application, platform firmware and the firmware boot manager must not use the frame buffer for any purpose.

### <span id="Input_at_Boot_Time"></span><span id="input_at_boot_time"></span><span id="INPUT_AT_BOOT_TIME"></span>Input at Boot Time

For a platform that has a console device, the UEFI 2.0 specification requires the firmware to implement the Simple Input Protocol. Windows supports this protocol for local keyboard input during boot.

### <span id="Network_Boot"></span><span id="network_boot"></span><span id="NETWORK_BOOT"></span>Network Boot

Windows implements support for the EFI Preboot eXecution Environment (PXE) Base Code Protocol. Windows uses this protocol to boot over the network and support Windows Deployment Services (WDS).

### <span id="Disk_Boot"></span><span id="disk_boot"></span><span id="DISK_BOOT"></span>Disk Boot

Windows requires Block I/O Protocol and Device Path Protocol support for the disk that contains the EFI system partition and the Windows OS partition.

### <span id="Other_Firmware_Boot_Requirements"></span><span id="other_firmware_boot_requirements"></span><span id="OTHER_FIRMWARE_BOOT_REQUIREMENTS"></span>Other Firmware Boot Requirements

To ensure proper operation, Windows requires EFI firmware to comply with its indicated specification version. EFI firmware must fully implement the appropriate version of the EFI System Table, EFI Boot Services, and EFI Runtime Services. Other specific required protocols and specifications include the following:

-   **Trusted Computing Group (TCG) EFI Specifications**. All UEFI platforms that have a Trusted Platform Module (TPM) must implement the TCG EFI Platform and Protocol specifications.

-   **EFI\_PCI\_ROOT\_BRIDGE\_IO\_PROTOCOL**. Windows uses this protocol if Windows Boot Configuration Data (BCD) specifies IEEE 1394 boot debugging.

## <span id="Runtime_Requirements"></span><span id="runtime_requirements"></span><span id="RUNTIME_REQUIREMENTS"></span>Runtime Requirements


Windows minimizes its use of UEFI services during operating system runtime and, wherever possible, relies on runtime firmware such as ACPI and Windows drivers. Windows uses the following UEFI Runtime Services to manage NVRAM boot entries and hardware error records after ExitBootServices() is called.

-   GetVariable

-   GetNextVariableName

-   SetVariable

-   QueryVariableInfo

## <span id="Hibernation_State__S4__Transition_Requirements"></span><span id="hibernation_state__s4__transition_requirements"></span><span id="HIBERNATION_STATE__S4__TRANSITION_REQUIREMENTS"></span>Hibernation State (S4) Transition Requirements


This section describes requirements for system and firmware memory that are related to transitions to the hibernation power state (S4).

### <span id="System_Memory_Requirements"></span><span id="system_memory_requirements"></span><span id="SYSTEM_MEMORY_REQUIREMENTS"></span>System Memory Requirements

Platform firmware must ensure that operating system physical memory is consistent across S4 sleep state transitions, in both size and location.

Operating system physical memory is defined according to the ACPI 3.0 specification as any memory that is described by the firmware system address map interface with a memory type other than **AddressRangeReserved** \[2\], **AddressRangeUnusable** \[5\], or **Undefined** \[any value greater than 5\].

### <span id="Firmware_Memory_Requirements"></span><span id="firmware_memory_requirements"></span><span id="FIRMWARE_MEMORY_REQUIREMENTS"></span>Firmware Memory Requirements

On a UEFI platform, firmware runtime memory must be consistent across S4 sleep state transitions, in both size and location. Runtime memory is defined according to the UEFI specification as any memory that is described by the GetMemoryMap() boot service, with the attribute **EFI\_MEMORY\_RUNTIME**.

## <span id="Requirements_to_Enable_UEFI_Platforms_without_CSM"></span><span id="requirements_to_enable_uefi_platforms_without_csm"></span><span id="REQUIREMENTS_TO_ENABLE_UEFI_PLATFORMS_WITHOUT_CSM"></span>Requirements to Enable UEFI Platforms without CSM


First-generation 64-bit UEFI platforms typically contain some form of limited BIOS emulation such as a CSM to preserve the ability to run 32-bit operating systems and operating systems that do not support UEFI. Existing Windows dependencies on INT 10 video BIOS functions also require a CSM.

To reduce the need for a CSM and improve boot times in the future, we are collaborating with the industry to eliminate this dependency and encourage changes to system firmware.

Firmware requirements:

**GOP**. Windows uses the GOP to obtain a frame buffer pointer at boot time for use during operating system runtime. GOP support is essential to replace VGA support and avoid the requirement for a CSM in future versions of Windows.

**EFI Capsule Services**. Windows can use the EFI UpdateCapsule() service to persist information across a system restart and pass that information to the firmware. This would potentially let the system report and/or respond to certain error conditions if the boot device or operating system were damaged or otherwise unavailable.

### <span id="Firmware_recommendations"></span><span id="firmware_recommendations"></span><span id="FIRMWARE_RECOMMENDATIONS"></span>Firmware recommendations

Note to firmware manufacturers: We recommend that when Secure Boot is disabled, then the firmware should trigger the following actions, to provide a better support experience for previous versions of Windows:

-   Enable the CSM for VGA support, though not BIOS mode emulation.

-   Enable messages during the POST process to show which keys open the boot menus.

 

 





