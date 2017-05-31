---
author: Justinha
Description: 'WinPE: Adding Windows PowerShell support to Windows PE'
ms.assetid: 8b653cf6-3584-4c80-be84-ca32d60aeba2
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Adding Windows PowerShell support to Windows PE'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Adding Windows PowerShell support to Windows PE


The following sample script creates a version of Windows PE with Windows PowerShell and its DISM and Storage cmdlets, which can be used to help automate Windows deployment.

**Prepare a local copy of the Windows PE files**

1.  Install the [Windows Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/p/?LinkID=526803), adding the **Deployment Tools** and **Windows PE** features.

2.  Start the **Deployment and Imaging Tools Environment** as an **administrator**.

3.  Create a working copy of the Windows PE files. Specify either x86, amd64, or arm:

    ``` syntax
    copype amd64 C:\WinPE_amd64_PS
    ```

## <span id="SampleScript"></span><span id="samplescript"></span><span id="SAMPLESCRIPT"></span>Sample script


Use the following script to mount the Windows image, add the Windows PE optional components for Windows PowerShell, and to unmount the image.

``` syntax
Dism /Mount-Image /ImageFile:"C:\WinPE_amd64_PS\media\sources\boot.wim" /Index:1 /MountDir:"C:\WinPE_amd64_PS\mount"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-WMI.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-WMI_en-us.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-NetFX.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-NetFX_en-us.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Scripting.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-Scripting_en-us.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-PowerShell.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-PowerShell_en-us.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-StorageWMI.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-StorageWMI_en-us.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-DismCmdlets.cab"

Dism /Add-Package /Image:"C:\WinPE_amd64_PS\mount" /PackagePath:"C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\en-us\WinPE-DismCmdlets_en-us.cab"

Dism /Unmount-Image /MountDir:C:\WinPE_amd64_PS\mount /Commit
```

## <span id="Install_this_version_of_Windows_PE_to_a_USB_key"></span><span id="install_this_version_of_windows_pe_to_a_usb_key"></span><span id="INSTALL_THIS_VERSION_OF_WINDOWS_PE_TO_A_USB_KEY"></span>Install this version of Windows PE to a USB key


``` syntax
MakeWinPEMedia /UFD C:\WinPE_amd64_PS F:
```

## <span id="Start_Windows_PowerShell_in_Windows_PE"></span><span id="start_windows_powershell_in_windows_pe"></span><span id="START_WINDOWS_POWERSHELL_IN_WINDOWS_PE"></span>Start Windows PowerShell in Windows PE


After you boot a PC to Windows PE using this USB key, start Windows PowerShell:

``` syntax
X:\Windows\system32\WindowsPowerShell\v1.0\powershell
```

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Add packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md)

[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[WinPE: Create a Boot CD, DVD, ISO, or VHD](winpe-create-a-boot-cd-dvd-iso-or-vhd.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

 

 






