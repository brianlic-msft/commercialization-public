---
author: Justinha
Description: 'WinPE: Boot in UEFI or legacy BIOS mode'
ms.assetid: bc3c4d41-c4f7-4432-b11a-f409e171d60d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Boot in UEFI or legacy BIOS mode'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Boot in UEFI or legacy BIOS mode


When you boot Windows PE on a UEFI PC, you may need to check whether the PC is booted in UEFI mode or legacy BIOS-compatibility mode.

For example, running Windows Setup through Windows PE requires you to be in the correct firmware mode.

For many operations, such as applying Windows images using Diskpart and DISM, the firmware mode might not make a difference.

**Boot to UEFI mode**

-   When booting the PC, you may need to manually select the UEFI boot files: \\EFI\\BOOT\\BOOTX64.EFI.

    1.  Boot your PC and press the key to get into the firmware menus (examples: Esc, F2, F9, F12).

    2.  Look for a firmware option to choose the boot file (examples: Boot to file, Boot to EFI file).

    3.  Select the file from the USB drive: `\EFI\BOOT\BOOTX64.EFI`.

**Detect whether Windows PE is booted in BIOS or UEFI mode**

1.  Check the **HKLM\\System\\CurrentControlSet\\Control\\PEFirmwareType** registry value to see if the PC is booted to UEFI or BIOS mode. Note: you may need to run `wpeutil UpdateBootInfo` to make sure this value is present.

    ``` syntax
    reg query HKLM\System\CurrentControlSet\Control /v PEFirmwareType
    ```

    This command returns 0x1 if the PC is booted into BIOS mode, or 0x2 if the PC is booted in UEFI mode.

    Sample script:

    ``` syntax
    wpeutil UpdateBootInfo
    for /f "tokens=2* delims=    " %%A in ('reg query HKLM\System\CurrentControlSet\Control /v PEFirmwareType') DO SET Firmware=%%B
    :: Note: delims is a TAB followed by a space.
    if %Firmware%==0x1 echo The PC is booted in BIOS mode.
    if %Firmware%==0x2 echo The PC is booted in UEFI mode.
    ```

2.  If this is a frequent problem, you can remove the boot files for UEFI mode or BIOS mode to prevent the PC from booting in the wrong mode. If the PC firmware is set up to boot in the wrong mode, the media will immediately fail to boot, allowing you to immediately retry booting the PC into the correct mode.

    -   **Boot in UEFI mode**: To prevent Windows PE from booting in BIOS mode, remove the **bootmgr** file on the root of the media.

    -   **Boot in BIOS mode**: To prevent Windows PE from booting in UEFI mode, remove the **efi** folder on the root of the media.

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[Windows Setup: Installing using the MBR or GPT partition style](windows-setup-installing-using-the-mbr-or-gpt-partition-style.md)

[Wpeutil Command-Line Options](wpeutil-command-line-options.md)

[UEFI Firmware](uefi-firmware.md)

 

 






