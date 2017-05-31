---
author: Justinha
Description: Sysprep Process Overview
ms.assetid: e764e19f-8a8a-4fae-aa1f-22e70caf1599
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Sysprep Process Overview
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sysprep Process Overview


The System Preparation (**Sysprep**) tool is used to change Windows® images from a generalized state to a specialized state, and then back to a generalized state. A generalized image can be deployed on any computer. A specialized image is targeted to a specific computer. You must reseal, or generalize, a Windows image before you capture and deploy the image. For example, when you use the **Sysprep** tool to generalize an image, **Sysprep** removes all system-specific information and resets the computer. The next time that the computer restarts, your customers can add user-specific information through Out-Of-Box Experience (OOBE) and accept the Microsoft Software License Terms.

**Sysprep.exe** is located in the **%WINDIR%\\system32\\sysprep** directory on all Windows installations.

If you transfer a Windows image to a different computer, you must run the **Sysprep** command together with the **/generalize** option, even if the other computer has the same hardware configuration. The **Sysprep /generalize** command removes unique information from your Windows installation so that you can reuse that image on a different computer. For more information, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).


## <span id="SysprepExecutable"></span><span id="sysprepexecutable"></span><span id="SYSPREPEXECUTABLE"></span>Sysprep Executable


**Sysprep.exe** is the main program that calls other executable files that prepare the Windows installation. **Sysprep.exe** is located in the **%WINDIR%\\system32\\sysprep** directory on all Windows installations. If you use the command line instead of the **System Preparation Tool** GUI, you must first close the GUI and then run **Sysprep** from the **%WINDIR%\\system32\\sysprep** directory. You must also run **Sysprep** on the same version of Windows that you used to install **Sysprep**.

**Important**  
Beginning with Windows 8.1, the Sysprep user interface is deprecated. The Sysprep UI will continue to be supported in this release however it may be removed in a future release. We recommend that you update your Windows deployment workflow to use the Sysprep command line. For more information about the Sysprep Command line tool, see [Sysprep Command-Line Options](sysprep-command-line-options.md).

 

## <span id="SysprepProcess"></span><span id="sysprepprocess"></span><span id="SYSPREPPROCESS"></span>Sysprep Process Overview


When Sysprep runs, it goes through the following process:

1.  **Sysprep verification**. Verifies that Sysprep can run. Only an administrator can run Sysprep. Only one instance of Sysprep can run at a time. Also, Sysprep must run on the version of Windows that you used to install Sysprep.

2.  **Logging initialization**. Initializes logging. For more information, see [Sysprep Log Files](#syspreplogfiles).

3.  **Parsing command-line arguments**. Parses command-line arguments. If a user does not provide command-line arguments, a System Preparation Tool window appears and enables users to specify Sysprep actions.

4.  **Processing Sysprep actions**. Processes Sysprep actions, calls appropriate .dll files and executable files, and adds actions to the log file.

5.  **Verifying Sysprep processing actions**. Verifies that all .dll files have processed all their tasks, and then either shuts down or restarts the system.

## <span id="bkmk_new"></span><span id="BKMK_NEW"></span>Persisting the Hardware Configuration


If you create an image of this installation for deployment to a different computer, you must run the **Sysprep** command together with the **/generalize** option, even if the other computer has the identical hardware configuration. The **Sysprep /generalize** command removes unique information from a Windows installation so that you can reuse that image on different computers. The next time that you boot the Windows image, the [specialize](specialize.md) configuration pass runs.

If you want to install a Windows image to computers that have the same hardware configuration, you can preserve the device-drivers installation in a Windows image. To do this, in your answer file, specify the **PersistAllDeviceInstalls** setting in the **Microsoft-Windows-PnPSysprep** component. The default value is **false**. If you set the setting to **true**, the Plug and Play devices remain on the computer during the [generalize](generalize.md) configuration pass. You do not have to reinstall these devices during the [specialize](specialize.md) configuration pass. For more information, see [Use Answer Files with Sysprep](use-answer-files-with-sysprep.md) and Unattended Windows Setup Reference Guide.

## <span id="device"></span><span id="DEVICE"></span>Adding Device Drivers


Plug and Play devices include modems, sound cards, network adapters, and video cards. The Plug and Play devices on the reference and destination computers do not have to come from the same manufacturer. However, you must include the drivers for these devices in the installation. For more information, see [Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md) and [Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md).

## <span id="BootingToAuditModeOrWindowsWelcome"></span><span id="bootingtoauditmodeorwindowswelcome"></span><span id="BOOTINGTOAUDITMODEORWINDOWSWELCOME"></span>Booting to Audit Mode or OOBE


When Windows boots, the computer can start in one of two modes:

-   OOBE

    OOBE, also named the out-of-box experience (OOBE), is the first user experience. The OOBE enables end users to customize their Windows installation. End users can create user accounts, read and accept the Microsoft® Software License Terms, and select their language and time zones. By default, all Windows installations boot to OOBE first. The [oobeSystem](oobesystem.md) configuration pass runs immediately before OOBE starts.

    If you do not automatically activate Windows by using a product key, OOBE prompts the user for a product key. If the user skips this step during OOBE, Windows reminds the user to enter a valid product key later. To automatically activate Windows by using a product key, specify a valid product key in the **Microsoft-Windows-Shell-Setup\\ProductKey** unattend setting during the [specialize](specialize.md) configuration pass. For more information, see [Work with Product Keys and Activation](work-with-product-keys-and-activation-auth-phases.md).

-   Audit Mode

    Audit mode enables you to add customizations to Windows images. Audit mode does not require that you apply settings in OOBE. By bypassing OOBE, you can access the desktop more quickly and perform your customizations. You can add more device drivers, install applications, and test the validity of the installation.

    You can configure Windows to boot directly to audit mode by using the **Microsoft-Windows-Deployment | Reseal | Mode** setting in an answer file. In audit mode, the computer processes settings in an unattended answer file in the [auditSystem](auditsystem.md) and [auditUser](audituser.md) configuration passes.

    If you are running a computer in audit mode to configure the installation to boot to OOBE, either use the **Sysprep** GUI or run the **Sysprep /oobe** command. To prepare a computer for an end user, you must configure the computer to boot to OOBE when an end user starts the computer for the first time. In a default Windows installation, OOBE starts after installation is completed, but you can skip OOBE and boot directly to audit mode to customize images.

For more information, see:

-   [Audit Mode Overview](audit-mode-overview.md)

-   [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

-   [How Configuration Passes Work](how-configuration-passes-work.md)

-   [Enable and Disable the Built-in Administrator Account](enable-and-disable-the-built-in-administrator-account.md)

-   [Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md)

## <span id="DetectingTheStateOfAWindowsImage"></span><span id="detectingthestateofawindowsimage"></span><span id="DETECTINGTHESTATEOFAWINDOWSIMAGE"></span>Detecting the State of a Windows Image


You can use Sysprep to identify the state of a Windows image. That is, you can determine whether the image will boot to audit mode or OOBE, or if the image is still in the process of installation. For more information, see [Windows Setup Installation Process](windows-setup-installation-process.md).

## <span id="SysprepLogFiles"></span><span id="syspreplogfiles"></span><span id="SYSPREPLOGFILES"></span>Sysprep Log Files


The **Sysprep** tool logs Windows Setup actions in different directories, depending on the configuration pass. Because the [generalize](generalize.md) configuration pass deletes certain Windows Setup log files, the **Sysprep** tool logs generalize actions outside the standard Windows Setup log files. The following table shows the different log file locations that **Sysprep** uses.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Item</th>
<th align="left">Log Path</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Generalize</strong></p></td>
<td align="left"><p><strong>%WINDIR%\System32\Sysprep\Panther</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Specialize</strong></p></td>
<td align="left"><p><strong>%WINDIR%\Panther\</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Unattended Windows Setup actions</p></td>
<td align="left"><p><strong>%WINDIR%\Panther\Unattendgc</strong></p></td>
</tr>
</tbody>
</table>

 

For more information, see [Deployment Troubleshooting and Log Files](deployment-troubleshooting-and-log-files.md).

## <span id="CreatingAndUsingSysprepProviders"></span><span id="creatingandusingsysprepproviders"></span><span id="CREATINGANDUSINGSYSPREPPROVIDERS"></span>Creating and Using Sysprep Providers


Independent software vendors (ISVs) and independent hardware vendors (IHVs) can create **Sysprep** providers that enable their applications to support imaging and deployment scenarios. If an application does not currently support generalize operations by using the **Sysprep** tool, you can create a provider that removes all software-specific and hardware-specific information from the application.

To create a **Sysprep** provider, you must do the following:

1.  Determine which configuration pass (**cleanup**, **generalize**, or **specialize**) your Sysprep provider addresses.

2.  Create the appropriate entry point for your **Sysprep** provider, based on your choice of configuration pass.

3.  Register the **Sysprep** provider for use by the **Sysprep** tool.

4.  Test your **Sysprep** provider to validate that the provider functions correctly. Make sure that you review the log files for warnings and errors.

For more information about **Sysprep** providers, see the [System Preparation (Sysprep) Tool Provider Developer’s Guide](http://go.microsoft.com/fwlink/?LinkId=205568).

## <span id="related_topics"></span>Related topics


[Sysprep (System Preparation) Overview](sysprep--system-preparation--overview.md)

[Sysprep Command-Line Options](sysprep-command-line-options.md)

[Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md)

[Sysprep Support for Server Roles](sysprep-support-for-server-roles.md)

[Use Answer Files with Sysprep](use-answer-files-with-sysprep.md)

 

 






