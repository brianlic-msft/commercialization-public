---
author: Justinha
Description: Windows Setup Automation Overview
ms.assetid: 240b02ae-1f06-4b92-9b46-b4dbd1089c65
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Windows Setup Automation Overview
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup Automation Overview

## Use Setupconfig.ini to install Windows

### What is a setupconfig file?

Setupconfig is a configuration file that is used to pass a set of flags or parameters to Windows setup.exe. Use this file as an alternative to passing parameters to Windows setup on a command line. This functionality is available in Windows 10, version 1511 and later.

IT pros can use the setupconfig file to add parameters to Windows Setup from Windows Update and Windows Server Update Services.

The different parameters that can be used with Windows 10 Setup.exe are described in this topic.

Setupconfig.ini files can contain single parameters, or parameters and value pairs. Do not include “/” characters, and with parameter and value pairs, include “=” between the two. 

For example, you create a Setupconfig.ini with the following. Note that the header `[SetupConfig]` is required.

```syntax
[SetupConfig]
NoReboot
ShowOobe=None
Telemetry=Enable
ReflectDrivers = <path of folder containing INF and SYS files for the encryption drivers>
```

This is equivalent to the following command line:

```syntax
Setup /NoReboot /ShowOobe None /Telemetry Enable
```

### How does Windows Setup use Setupconfig.ini?

#### Using media/ISO file

If you are running Windows setup from media or an ISO file, you must include the location to the setupconfig file on the command line (“/ConfigFile `<path>`”) when running setup.exe. For example:

```syntax
Setup.exe /ConfigFile <path to Setupconfig.ini>
```

If you include a parameter on the command line and the same parameter in the setupconfig file, the setupconfig file parameter and value has precedence. 

#### Using Windows Update

If the update is delivered through Windows Update, Windows Setup searches in a default location for a setupconfig file. You can include the setupconfig file here:

"%systemdrive%\Users\Default\AppData\Local\Microsoft\Windows\WSUS\SetupConfig.ini"


## Use an answer file while installing Windows

You can automate Windows installation by using an answer file:

**Use a USB flash drive**

1.  Use a sample answer file or create your own with Windows System Image Manager (Windows SIM).

2.  Save the file as **Autounattend.xml** on the root of a USB flash drive.

3.  On a new PC, put in the Windows product DVD and the USB flash drive, and then boot the PC. When no other answer file is selected, Windows Setup searches for this file.

**Select an answer file**

-   You can select a specific answer file during installation by booting to the Windows Preinstallation Environment, and using the **setup.exe** command with the **/unattend:***filename* option. For more information, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

For sample answer files and a list of settings used to automate installation, see [Automate Windows Setup](automate-windows-setup.md).

## Modify an existing installation

Because reboots are required during Setup, a copy of the answer file is cached to the %WINDIR%\\Panther directory of the Windows installation. You can modify this file to do any of the following:

-   Update system and control panel settings without booting the image.

-   Update an image by preparing the PC to boot to audit mode (see Microsoft-Windows-Deployment\\Reseal\\[Mode](http://go.microsoft.com/fwlink/?LinkId=275830)).

-   Update the order in which drivers or packages are installed. (Packages with dependencies may require installation in a certain order.)

**Replace the answer file in an offline image**

1.  Create a custom answer file in Windows System Image Manager (Windows SIM).

2.  Open an elevated command prompt.

3.  Mount the Windows image.

    ``` syntax
    Dism /Mount-Image /ImageFile:"C:\images\CustomImage.wim" /Index:1 /MountDir:C:\mount
    ```

4.  Modify or replace the file: \\Windows\\Panther\\unattend.xml in the mounted image.

    ``` syntax
    Copy CustomAnswerFile.xml C:\mount\Windows\Panther\unattend.xml
    ```

    **Note**  
    The answer file in the image may contain settings that have not yet been processed. If you want these settings to get processed, edit the existing file rather than replacing it.

     

5.  Unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount /Commit
    ```

6.  Test the image by deploying it to a new PC, without specifying an answer file. When Windows Setup runs, it finds and uses this answer file.

## Implicit Answer File Search Order


Windows Setup searches for answer files at the beginning of each configuration pass, including the initial installation and after applying and booting an image. If an answer file is found, and it contains settings for the given configuration pass, it processes those settings.

Windows Setup identifies and logs all available answer files, depending on the search order. The answer file that has the highest precedence is used. The answer file is validated and then cached to the computer. Valid answer files are cached to the $Windows.~BT\\Sources\\Panther directory during the [windowsPE](windowspe.md) and [offlineServicing](offlineservicing.md) configuration passes. After the Windows installation is extracted to the hard disk, the answer file is cached to %WINDIR%\\panther.

The following table shows the implicit answer file search order.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Search Order</th>
<th align="left">Location</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>1</p></td>
<td align="left"><p>Registry</p>
<p>HKEY_LOCAL_MACHINE\System\Setup\UnattendFile</p></td>
<td align="left"><p>Specifies a pointer in the registry to an answer file. The answer file is not required to be named Unattend.xml.</p></td>
</tr>
<tr class="even">
<td align="left"><p>2</p></td>
<td align="left"><p>%WINDIR%\Panther\Unattend</p></td>
<td align="left"><p>The name of the answer file must be Unattend.xml or Autounattend.xml.</p>
<div class="alert">
<strong>Note</strong>  
<p>Windows Setup searches this directory only on downlevel installations. If Windows Setup starts from Windows PE, the %WINDIR%\Panther\Unattend directory is not searched.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>3</p></td>
<td align="left"><p>%WINDIR%\Panther</p></td>
<td align="left"><p>Windows Setup caches answer files to this location for use in subsequent stages of installation. For example, when a computer reboots, Setup can continue to apply the settings in an answer file. If you explicitly specify an answer file by using Windows Setup or Sysprep, the answer file cached to this directory is overwritten with the explicitly specified answer file.</p>
<div class="alert">
<strong>Important</strong>  
<p>Do not use, modify, or overwrite the answer file in this directory. The answer file in this directory is annotated by Windows Setup during installation. This answer file cannot be reused in Windows SIM or any other Windows installations.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td align="left"><p>4</p></td>
<td align="left"><p>Removable read/write media in order of drive letter, at the root of the drive.</p></td>
<td align="left"><p>Removable read/write media in order of drive letter, at the root of the drive.</p>
<p>The name of the answer file must be Unattend.xml or Autounattend.xml, and the answer file must be located at the root of the drive.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>5</p></td>
<td align="left"><p>Removable read-only media in order of drive letter, at the root of the drive.</p></td>
<td align="left"><p>Removable read-only media in order of drive letter, at the root of the drive.</p>
<p>The name of the answer file must be Unattend.xml or Autounattend.xml, and must be located at the root of the drive.</p></td>
</tr>
<tr class="even">
<td align="left"><p>6</p></td>
<td align="left"><p>[windowsPE](windowspe.md) and [offlineServicing](offlineservicing.md) configuration passes:</p>
<ul>
<li><p>\Sources directory in a Windows distribution</p></li>
</ul>
<p>All other passes:</p>
<ul>
<li><p>%WINDIR%\System32\Sysprep</p></li>
</ul></td>
<td align="left"><p>In the [windowsPE](windowspe.md) and [offlineServicing](offlineservicing.md) configuration passes, the name of the answer file must be Autounattend.xml.</p>
<p>For all other configuration passes, the file name must be Unattend.xml.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>7</p></td>
<td align="left"><p>%SYSTEMDRIVE%</p></td>
<td align="left"><p>The answer file name must be Unattend.xml or Autounattend.xml</p></td>
</tr>
<tr class="even">
<td align="left"><p>8</p></td>
<td align="left"><p>Drive from where Windows Setup (setup.exe) is running, at the root of the drive.</p></td>
<td align="left"><p>The name of the answer file must be Unattend.xml or Autounattend.xml, and must be located at the root of the Windows Setup folder path.</p></td>
</tr>
</tbody>
</table>

 

## Sensitive Data in Answer Files


Setup removes sensitive data in the cached answer file at the end of each configuration pass.

**Important**  
Because answer files are cached to the computer during Windows Setup, your answer files will persist on the computer between reboots. Before you deliver the computer to a customer, you must delete the cached answer file in the %WINDIR%\\panther directory. There might be potential security issues if you include domain passwords, product keys, or other sensitive data in your answer file. However, if you have unprocessed settings in the [oobeSystem](oobesystem.md) configuration pass that you intend to run when an end user starts the computer, consider deleting the sections of the answer file that have already been processed. One option when you run the **sysprep /oobe** command might be to use a separate answer file that only contains settings in the oobeSystem configuration pass.

 

However, if an answer file is embedded in a higher precedence location than the cached answer file, then the cached answer may be overwritten at the beginning of each subsequent configuration pass, if the embedded answer file matches the implicit search criteria. For example, if an answer file is embedded at %WINDIR%\\Panther\\Unattend\\Unattend.xml, the embedded answer file will replace the cached answer file at the beginning of each configuration pass. For example, if the embedded answer file specifies both the [specialize](specialize.md) and [oobeSystem](oobesystem.md) configuration passes, then the embedded answer file is discovered for the **specialize** configuration pass, cached, processed, and sensitive data is cleared. The embedded answer file is discovered again during the oobeSystem configuration pass and cached again. As a result, the sensitive data for the specialize configuration pass is no longer cleared. Sensitive data for previously processed configuration passes will not be cleared again. Unless the cached answer file must be overridden, we recommend that answer files be embedded at a location that has a lower precedence.

**Important**  
Because answer files are cached to the computer during Windows Setup, your answer files will persist on the computer between reboots. Before you deliver the computer to a customer, you must delete the cached answer file in the %WINDIR%\\panther directory. There might be potential security issues if you include domain passwords, product keys, or other sensitive data in your answer file. However, if you have unprocessed settings in the [oobeSystem](oobesystem.md) configuration pass that you intend to run when an end user starts the computer, consider deleting the sections of the answer file that have already been processed. One option when you run the **sysprep /oobe** command might be to use a separate answer file that only contains settings in the oobeSystem configuration pass.

 

You can add a command to the Setupcomplete.cmd command script that deletes any cached or embedded answer files on the computer. For more information, see [Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md).

##Windows Setup Annotates Configuration Passes in an Answer File


After a configuration pass is processed, Windows Setup annotates the cached answer file to indicate that the pass has been processed. If the configuration pass is run again and the cached answer file has not been replaced or updated in the interim, the answer file settings are not processed again. Instead, Windows Setup will search for implicit Unattend.xml files that are at a lower precedence location than the cached Unattend.xml file.

For example, you can install Windows with an answer file that contains Microsoft-Windows-Deployment/**RunSynchronous** commands in the [specialize](specialize.md) configuration pass. During installation, the specialize configuration pass runs and the **RunSynchronous** commands execute. After installation, run the **sysprep** command with the **/generalize** option. If there is no answer file in a higher precedence than the cached answer file or an answer file was not explicitly passed to the Sysprep tool, Setup runs the specialize configuration pass the next time that the computer boots. Because the cached answer file contains an annotation that the settings for that configuration pass were already applied, the **RunSynchronous** commands do not execute.

## Implicit Answer File Search Examples


The following examples help describe the behavior of implicit answer file searches.

### <span id="Answer_Files_Named_Autounattend.xml_are_Automatically_Discovered_by_Windows_Setup"></span><span id="answer_files_named_autounattend.xml_are_automatically_discovered_by_windows_setup"></span><span id="ANSWER_FILES_NAMED_AUTOUNATTEND.XML_ARE_AUTOMATICALLY_DISCOVERED_BY_WINDOWS_SETUP"></span>Answer Files Named Autounattend.xml are Automatically Discovered by Windows Setup

1.  Create an answer file that is named Autounattend.xml that includes settings in the [windowsPE](windowspe.md) configuration pass.

2.  Copy Autounattend.xml to a removable media device.

3.  Configure the BIOS of your computer to boot from CD or DVD.

4.  Boot the Windows product DVD.

5.  Insert the removable media device when Windows is booting. This example assumes that the removable media is assigned the drive letter D:\\.

    Windows Setup starts and automatically identifies Autounattend.xml as a valid answer file. Because the answer file uses a valid file name (Autounattend.xml), is located in one of the valid search paths (the root of D), and includes valid settings for the current configuration pass ([windowsPE](windowspe.md)), this answer file is used.

    The answer file is cached to the computer. If there are no additional answer files discovered in later passes, the cached answer file is used throughout Windows Setup.

### <span id="Answer_Files_are_Discovered_in_Order_of_Precedence_in_Predefined_Search_Paths"></span><span id="answer_files_are_discovered_in_order_of_precedence_in_predefined_search_paths"></span><span id="ANSWER_FILES_ARE_DISCOVERED_IN_ORDER_OF_PRECEDENCE_IN_PREDEFINED_SEARCH_PATHS"></span>Answer Files are Discovered in Order of Precedence in Predefined Search Paths

1.  Install Windows with an answer file by using the steps in the previous scenario. The answer file that is used to install Windows is cached to the system in the %WINDIR%\\Panther directory.

2.  Copy an Unattend.xml file to the %WINDIR%\\System32\\Sysprep directory.

    This answer file has settings in the [generalize](generalize.md) configuration pass.

3.  Run the **sysprep** command with the **/generalize** option to create a reference image.

    Because the %WINDIR%\\System32\\Sysprep directory is in the implicit search paths, the answer file copied to this directory is found. However, an answer file that was used to install Windows is still cached on the computer and contains settings for the [generalize](generalize.md) configuration pass. This cached answer file has a higher precedence than the one copied to the Sysprep directory. The cached answer file is used.

    **Note**  
    The Sysprep tool can be run as a command-line tool or as a GUI tool. If you run the Sysprep tool as a GUI tool, you can select the **Generalize** check box.

     

    To use the new answer file, you can copy it to a directory of a higher precedence than the cached answer file, or you can specify the answer file by using the **/unattend** option. For example:

    ``` syntax
    sysprep /generalize /unattend:C:\MyAnswerFile.xml
    ```

### Answer Files Must Include a Valid Configuration Pass

1.  Copy an Unattend.xml file to a removable media device.

    The Unattend.xml file has settings only for the [auditSystem](auditsystem.md) and [auditUser](audituser.md) configuration passes.

2.  On an installed Windows operating system, run the **sysprep /generalize /oobe** command.

    Even though the answer file is available in one of the implicit search paths, the Unattend.xml file is ignored because it does not contain a valid pass for the [generalize](generalize.md) configuration pass.

## <span id="bkmk_d"></span><span id="BKMK_D"></span>Additional Resources


See the following topics for more information about answer files and configuration passes:

-   [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073)

-   [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085)

-   [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078)

-   [Validate an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915106)

-   [Hide Sensitive Data in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915098)

-   [How Configuration Passes Work](how-configuration-passes-work.md)

## <span id="related_topics"></span>Related topics


[Windows Setup Scenarios and Best Practices](windows-setup-scenarios-and-best-practices.md)

[Windows Setup Installation Process](windows-setup-installation-process.md)

[Automate Windows Setup](automate-windows-setup.md)

[Audit Mode Overview](audit-mode-overview.md)

[Windows Setup Configuration Passes](windows-setup-configuration-passes.md)

[Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md)

 

 






