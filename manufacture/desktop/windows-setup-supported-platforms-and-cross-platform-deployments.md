---
author: Justinha
Description: 'Windows Setup Supported Platforms and Cross-Platform Deployments'
ms.assetid: 044cbb4f-7330-473d-8654-3371b2d6aff1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Windows Setup Supported Platforms and Cross-Platform Deployments'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup Supported Platforms and Cross-Platform Deployments


This topic describes the supported platforms and deployment scenarios for running for Windows Setup.

When you’re deploying different types of PCs, you can use Windows Setup as a way to choose between your images through the Windows Setup user interface to select a specific image. You can include images for a variety of hardware platforms (such as BIOS and UEFI, 32-bit and 64-bit PCs), and across different versions of Windows (such as Windows 8.1, Windows Server 2012 R2, and Windows 7).

You can also run Windows Setup through a script. Boot the PC to Windows PE, and then use the \\sources\\setup.exe file to specify your image.

## <span id="firmware_considerations__bios_vs._uefi"></span><span id="FIRMWARE_CONSIDERATIONS__BIOS_VS._UEFI"></span>Firmware considerations: BIOS vs. UEFI


For UEFI-based PCs that support booting into either UEFI or legacy BIOS modes, make sure your PC is booted into the correct firmware mode before starting Windows Setup. Otherwise, Windows Setup may set up the hard drive partitions incorrectly, or may abort the installation if the hard drives are preconfigured. For more information, see [WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md).

## <span id="Firmware__BIOS_32-bit_and_64-bit"></span><span id="firmware__bios_32-bit_and_64-bit"></span><span id="FIRMWARE__BIOS_32-BIT_AND_64-BIT"></span>Firmware: BIOS 32-bit and 64-bit


To set up a single environment or set of scripts that can deploy Windows to both 32-bit and 64-bit BIOS PCs, use a 32-bit version of Windows PE and a 32-bit version of Windows Setup.

The 64-bit version of Windows Setup does not run on the 32-bit version of Windows PE.

**To install a 64-bit version of Windows from a 32-bit version of Windows PE:**

1.  Boot the PC using the 32-bit version of Windows PE.

2.  Use any of the following techniques to install a 64-bit version of Windows:

    -   Run a 32-bit version of Windows Setup, and use the **/InstallFrom** command-line option to select a 64-bit Windows image:

        ``` syntax
        X:\windows\system32> D:\setup /InstallFrom:"N:\Windows_64-bit\sources\install.wim"
        ```

        -or-

    -   Run a 32-bit version of Windows Setup, and use the `Microsoft-Windows-Setup\ImageInstall\OSImage\`[InstallFrom](http://go.microsoft.com/fwlink/?LinkId=275617) unattend setting to select a 64-bit Windows image.

        ``` syntax
        X:\windows\system32> D:\setup /unattend:"D:\unattend_install_64-bit.xml"
        ```

        -or-

    -   Use image-capturing tools to apply a 64-bit version of Windows to the PC.

        ``` syntax
        Dism /Apply-Image /ImageFile:"Fabrikam_64-bit_image.wim" /Index:1 /ApplyDir:D:\
        ```

        For more information, see [Apply Images Using DISM](apply-images-using-dism.md).

**Warning**  
This procedure does not support deploying Windows 7.

 

## <span id="Using_Windows_Setup_to_Install_Previous_Versions_of_Windows"></span><span id="using_windows_setup_to_install_previous_versions_of_windows"></span><span id="USING_WINDOWS_SETUP_TO_INSTALL_PREVIOUS_VERSIONS_OF_WINDOWS"></span>Using Windows Setup to Install Previous Versions of Windows


You can use the Windows 8.1 and Windows Server 2012 R2 versions of Windows Setup to install previous versions of Windows:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Host Operating System</th>
<th align="left">Windows 8.1 Setup Support</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Windows 8.1</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2012 R2</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 8</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2012</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 7</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2008 R2</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows Vista</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2008</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows XP with SP3</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2003 R2 and previous versions</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows XP with SP2 and previous versions</p></td>
<td align="left"><p>No</p></td>
</tr>
</tbody>
</table>

 

You can also run Windows Setup from the Windows Preinstallation Environment (Windows PE). The following table lists the supported Windows PE environments:

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Version of Windows Setup</th>
<th align="left">Windows PE 5.0 (Windows 8.1)</th>
<th align="left">Windows PE 4.0 (Windows 8)</th>
<th align="left">Windows PE 3.0 (Windows 7)</th>
<th align="left">Windows PE 2.0 (Windows Vista)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Windows 8.1 Setup</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows 8 Setup</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 7 Setup</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Vista Setup</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
</tbody>
</table>

 

## <span id="bkmk_unsupported"></span><span id="BKMK_UNSUPPORTED"></span>Cross-Platform Deployment


Cross-platform deployment is the process of installing a specific architecture of Windows from an environment of a different architecture. For example, you can deploy a 64-bit edition of Windows 8.1 or Windows 8 from a 32-bit edition of Windows PE. The benefit of using a cross-platform deployment solution is that you don't have to maintain multiple versions of Windows PE for installing different architecture editions of Windows. You can build a single Windows PE image that you can use to install both 32-bit and 64-bit editions of Windows.

When you install a 64-bit edition of Windows from a 32-bit version of Windows PE, you must use Windows PE 2.0 or a later version. For more information about Windows PE releases, see [WinPE for Windows 10](winpe-intro.md).

The following table lists the different architecture types of Windows images (32-bit or 64-bit) that a specific version of Windows 8.1 Setup is able to install.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">64-Bit Windows 8.1 image</th>
<th align="left">32-bit Windows 8.1 image</th>
<th align="left">64-Bit Windows 8 image</th>
<th align="left">32-bit Windows 8 image</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>64-bit Windows 8.1 Setup</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>32-bit Windows 8.1 Setup</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
</tbody>
</table>

 

### <span id="Limitations_of_cross-platform_deployment"></span><span id="limitations_of_cross-platform_deployment"></span><span id="LIMITATIONS_OF_CROSS-PLATFORM_DEPLOYMENT"></span>Limitations of cross-platform deployment

These cross-platform deployment scenarios aren't supported:

-   Installing a 64-bit Windows image on a 32-bit computer.

-   Deploying a 32-bit Windows image from a 64-bit preinstallation environment.

-   Using a 32-bit version of Windows Setup to upgrade a 64-bit operating system.

-   Using a 32-bit version of Windows 8 Setup to deploy a 64-bit version of the Windows 7 operating system.

    For example, you must use a 64-bit version of Windows 8 Setup to deploy a 64-bit version of Windows 7. In previous releases, the version of Windows Setup version had to match the operating system that you would deploy. For example, you had to use the Windows 7 Setup.exe to install Windows 7.

-   Using Microsoft Internet SCSI (iSCSI) boot disk in a cross-platform deployment scenario.

    For example, installing Windows (64-bit version) from cross-platform media, such as Windows PE (32-bit version), to an iSCSI boot disk is unsupported. You must use the same architecture for Windows PE as the target deployment architecture when you deploy Windows to an iSCSI boot disk.

-   On Unified Extensible Firmware Interface (UEFI), deploying a 64-bit edition of Windows from a 32-bit version of Windows PE. On some UEFI computers, you can't install Windows in BIOS-compatibility mode and must switch to UEFI-compatibility mode. For more information, see [Boot to UEFI Mode or Legacy BIOS mode](boot-to-uefi-mode-or-legacy-bios-mode.md).

-   On BIOS:

    -   Performing cross-platform deployments, except as part of a clean installation, or performing a Windows Deployment Services deployment.

    -   Providing cross-platform installation media to users for recovery.

        To prevent users from installing the wrong edition of Windows for the architecture of their computer, don't provide cross-platform installation media to users for recovery or reinstallation. Also, the Windows Recovery Environment (Windows RE) feature that's included on the media applies only to 32-bit Windows installations.

### <span id="Creating_WIMFile"></span><span id="creating_wimfile"></span><span id="CREATING_WIMFILE"></span>Creating a .wim file for multiple architecture types

If a .wim file contains both 32-bit and 64-bit Windows editions, you must select the Windows image that you want to install. Typically, Windows Setup uses the product key that you specify in the `ProductKey` setting to determine which Windows image to install. But if the file contains 2 editions of the same Windows version, like Windows 8.1 Pro, you must use the `MetaData` setting in an answer file to specify the edition to install.

To choose an image, specify metadata that corresponds to the image index, name, description, or architecture type. For the metadata for architecture type, use 0 for 32-bit editions and 9 for 64-bit editions. For more info, see the `MetaData` [Key](http://go.microsoft.com/fwlink/?LinkId=320263) setting.

The answer file must include processor-specific components. The answer-file settings in the [windowsPE](windowspe.md) configuration pass must match the architecture type of the preinstallation environment. The settings that apply to the Windows image must match the architecture type of the image. For example, if you create an answer file that deploys 64-bit images from a 32-bit preinstallation environment, all components in the answer file for the windowsPE configuration pass must include the processor attribute type of **x86**. Settings to be applied in the [specialize](specialize.md), [oobeSystem](oobesystem.md), or other configuration passes must include the processor attribute type of **amd64**.

### <span id="bkmk_5"></span><span id="BKMK_5"></span>Installing 64-bit drivers

All drivers that are included with Windows are signed. In cross-architecture deployments, you can use an out-of-box device driver. But if you use an unsigned out-of-box device driver that's boot critical in a 64-bit installation, the installation may become unusable.

You can install 64-bit drivers for a Windows image during Windows Setup in either of these ways:

-   In attended installations, you can press F6 or click the **Load Driver** button on the **Disk Configuration** page of Windows Setup.

-   In unattended installations, you can use the Microsoft-Windows-PnpCustomizationsWinPE or Microsoft-Windows-PnpCustomizationsNonWinPE component in an answer file to specify a driver path. For more information about how to automate your installation, see [Automate Windows Setup](automate-windows-setup.md).

## <span id="Hardware_considerations__Encrypted_Hard_Drives__e-Drives_"></span><span id="hardware_considerations__encrypted_hard_drives__e-drives_"></span><span id="HARDWARE_CONSIDERATIONS__ENCRYPTED_HARD_DRIVES__E-DRIVES_"></span>Hardware considerations: Encrypted Hard Drives (e-Drives)


We added support for Encrypted Hard Drive Devices (also known as E-Drives) in Windows 8, Windows Server 2012, and Windows PE 4.0.

To install a previous version of Windows (examples: Windows 7 or Windows Vista) to an Encrypted Hard Drive Device, use Windows PE 4.0 or later.

For more information, see [Encrypted Hard Drive Device Guide](http://go.microsoft.com/fwlink/?LinkId=290954).

## <span id="related_topics"></span>Related topics


[WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)

[Windows Setup Scenarios and Best Practices](windows-setup-scenarios-and-best-practices.md)

[Windows Setup Installation Process](windows-setup-installation-process.md)

[Windows Setup Automation Overview](windows-setup-automation-overview.md)

[Audit Mode Overview](audit-mode-overview.md)

[Windows Setup Configuration Passes](windows-setup-configuration-passes.md)

 

 






