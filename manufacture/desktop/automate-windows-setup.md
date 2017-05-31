---
author: Justinha
Description: Automate Windows Setup
ms.assetid: 882a3774-d0c3-405f-af31-2b9a5d1458d5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Automate Windows Setup
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Automate Windows Setup


You can prevent some or all of the user interface (UI) pages from Windows® Setup from being displayed during installation. The default behavior of Windows Setup is to display the Setup UI if any of the required settings are incorrect or empty.

## <span id="Use_an_answer_file_while_installing_Windows"></span><span id="use_an_answer_file_while_installing_windows"></span><span id="USE_AN_ANSWER_FILE_WHILE_INSTALLING_WINDOWS"></span>Use an answer file while installing Windows


You can automate Windows installation by using an answer file:

**Use a USB flash drive**

1.  Use a sample answer file or create your own with Windows System Image Manager (Windows SIM).

2.  Save the file as **Autounattend.xml** on the root of a USB flash drive.

3.  On a new PC, put in the Windows product DVD and the USB flash drive, and then boot the PC. When no other answer file is selected, Windows Setup searches for this file.

**Select an answer file**

-   You can select a specific answer file during installation by booting to the Windows Preinstallation Environment, and using the **setup.exe** command with the **/unattend:***filename* option.

For sample answer files and a list of settings used to automate installation, see Settings for Automating Windows Setup.

## <span id="Sample_answer_files"></span><span id="sample_answer_files"></span><span id="SAMPLE_ANSWER_FILES"></span>Sample answer files


The following sample files are included in the Windows Assessment and Deployment Kit (Windows ADK) in the following folder:

C:\\Program Files (x86)\\Windows Kits\\8.0\\Assessment and Deployment Kit\\Deployment Tools\\Samples\\Unattend.

## <span id="List_of_settings"></span><span id="list_of_settings"></span><span id="LIST_OF_SETTINGS"></span>List of settings


The following is a list of the settings used in these answer files:

-   Windows Setup language settings: Microsoft-Windows-International-Core-WinPE\\[UILanguage](http://go.microsoft.com/fwlink/?LinkId=224328) and Microsoft-Windows-International-Core-WinPE\\SetupUILanguage\\[UILanguage](http://go.microsoft.com/fwlink/?LinkId=224329).

-   Product key: Microsoft-Windows-Setup\\UserData\\ProductKey\\[Key](http://go.microsoft.com/fwlink/?LinkId=224330).

## <span id="Automating_Windows_Setup"></span><span id="automating_windows_setup"></span><span id="AUTOMATING_WINDOWS_SETUP"></span>Automating Windows Setup


To automate Windows Setup, add settings for each of the following Windows Setup pages to your unattended Setup answer file. When a setting for a Windows Setup page is configured, Windows Setup skips that page.

### <span id="Language__Region__and_Input_Method_Selection_Page_"></span><span id="language__region__and_input_method_selection_page_"></span><span id="LANGUAGE__REGION__AND_INPUT_METHOD_SELECTION_PAGE_"></span>Language, Region, and Input Method Selection Page

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-International-Core-WinPE | [UILanguage](http://go.microsoft.com/fwlink/?LinkId=224328)</p></td>
<td align="left"><p>Specifies the default language to use on the installed Windows operating system.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Microsoft-Windows-International-Core-WinPE | SetupUILanguage | [UILanguage](http://go.microsoft.com/fwlink/?LinkId=224329)</p></td>
<td align="left"><p>Specifies the default language to use during Windows Setup. During installation, Windows Setup displays installation progress in the selected language.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
When you use an Autounattend.xml file with Windows Setup and rely on an implicit answer-file search, the language selection page in Setup is not displayed, even if you explicitly do not configure language settings in your answer file. For more information about implicit answer files, see [Windows Setup Automation Overview](windows-setup-automation-overview.md).

 

### <span id="Type_your_Product_Key_for_Activation_Page"></span><span id="type_your_product_key_for_activation_page"></span><span id="TYPE_YOUR_PRODUCT_KEY_FOR_ACTIVATION_PAGE"></span>Type your Product Key for Activation Page

The product key must match the Windows edition you intend to install. For more information, see [Work with Product Keys and Activation](work-with-product-keys-and-activation-auth-phases.md).

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | UserData | ProductKey | [Key](http://go.microsoft.com/fwlink/?LinkId=224330)</p></td>
<td align="left"><p>Specifies the product key used to install Windows.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Microsoft-Windows-Setup | ImageInstall | OSImage | InstallFrom | MetaData | ([Key](http://go.microsoft.com/fwlink/?LinkId=252771) and [Value](http://go.microsoft.com/fwlink/?LinkId=252772)).</p></td>
<td align="left"><p>Use Key and Value together to select a specific Windows image to install. Required for some Windows Server® 2012 editions.</p>
<p>You can get the image information by using the DISM /Get-ImageInfo command. For more information, see [Image Management Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=208186).</p></td>
</tr>
</tbody>
</table>

 

### <span id="Accept_Microsoft_Software_License_Terms_Page"></span><span id="accept_microsoft_software_license_terms_page"></span><span id="ACCEPT_MICROSOFT_SOFTWARE_LICENSE_TERMS_PAGE"></span>Accept Microsoft Software License Terms Page

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | UserData | [AcceptEula](http://go.microsoft.com/fwlink/?LinkId=224331)</p></td>
<td align="left"><p>Specifies whether to accept Microsoft License Software Terms during Windows Setup.</p></td>
</tr>
</tbody>
</table>

 

### <span id="Select_Upgrade_or_Custom_Installation_Page"></span><span id="select_upgrade_or_custom_installation_page"></span><span id="SELECT_UPGRADE_OR_CUSTOM_INSTALLATION_PAGE"></span>Select Upgrade or Custom Installation Page

By default, when an answer file is used, this page does not appear and Windows is configured as a new installation. To configure Windows as an upgrade, add the following setting:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | UpgradeData | [Upgrade](http://go.microsoft.com/fwlink/?LinkId=224332)</p></td>
<td align="left"><p>Specifies that the present installation is an upgrade from a previous version of Windows.</p></td>
</tr>
</tbody>
</table>

 

### <span id="Specify_Where_to_Install_Windows_Page"></span><span id="specify_where_to_install_windows_page"></span><span id="SPECIFY_WHERE_TO_INSTALL_WINDOWS_PAGE"></span>Specify Where to Install Windows Page

You can either specify the exact disk ID and partition ID, or you can install Windows to the first available partition. To preconfigure your partitions, you may also need to configure your drive partitions. For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | ImageInstall | OSImage | InstallTo | [DiskID](http://go.microsoft.com/fwlink/?LinkId=224334)</p></td>
<td align="left"><p>Specifies the disk where Windows will be installed.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Microsoft-Windows-Setup | ImageInstall | OSImage | InstallTo | [PartitionID](http://go.microsoft.com/fwlink/?LinkId=224335)</p></td>
<td align="left"><p>Specifies the partition where Windows will be installed.</p></td>
</tr>
</tbody>
</table>

 

-or-

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | ImageInstall | OSImage | [InstallToAvailablePartition](http://go.microsoft.com/fwlink/?LinkId=224335)</p></td>
<td align="left"><p>Specifies to install Windows on the first available partition.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Settings_to_Use_with_Unattended_Windows_Deployment_Services"></span><span id="settings_to_use_with_unattended_windows_deployment_services"></span><span id="SETTINGS_TO_USE_WITH_UNATTENDED_WINDOWS_DEPLOYMENT_SERVICES"></span>Settings to Use with Unattended Windows Deployment Services


When deploying Windows using Windows Deployment Services, add each of the settings in the following sections to your unattended-Setup answer file. These are the only settings required for an unattended installation.

### <span id="Select_a_Language_and_Locale_Page"></span><span id="select_a_language_and_locale_page"></span><span id="SELECT_A_LANGUAGE_AND_LOCALE_PAGE"></span>Select a Language and Locale Page

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-International-Core-WinPE | SetupUILanguage | [UILanguage](http://go.microsoft.com/fwlink/?LinkId=224337)</p></td>
<td align="left"><p>Specifies the default language to use during Windows Setup.</p></td>
</tr>
</tbody>
</table>

 

### <span id="Provide_Windows_Deployment_Services_Credentials_Page"></span><span id="provide_windows_deployment_services_credentials_page"></span><span id="PROVIDE_WINDOWS_DEPLOYMENT_SERVICES_CREDENTIALS_PAGE"></span>Provide Windows Deployment Services Credentials Page

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | WindowsDeploymentServices | [Login](http://go.microsoft.com/fwlink/?LinkId=224338)</p></td>
<td align="left"><p>Specifies the credentials used for Windows Deployment Services logon, and specifies in what circumstances the UI is displayed for logon.</p></td>
</tr>
</tbody>
</table>

 

### <span id="Select_an_Image_to_Install_Page"></span><span id="select_an_image_to_install_page"></span><span id="SELECT_AN_IMAGE_TO_INSTALL_PAGE"></span>Select an Image to Install Page

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | WindowsDeploymentServices | [ImageSelection](http://go.microsoft.com/fwlink/?LinkId=224339)</p></td>
<td align="left"><p>Specifies the image to be installed and the location where it is installed, as well as whether the UI is displayed.</p></td>
</tr>
</tbody>
</table>

 

### <span id="Specify_Where_to_Install_Windows_Page"></span><span id="specify_where_to_install_windows_page"></span><span id="SPECIFY_WHERE_TO_INSTALL_WINDOWS_PAGE"></span>Specify Where to Install Windows Page

These settings assume that you are installing to a partitioned disk drive.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Setting</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Microsoft-Windows-Setup | WindowsDeploymentServices | ImageSelection | InstallTo | [DiskID](http://go.microsoft.com/fwlink/?LinkId=224340)</p></td>
<td align="left"><p>Specifies the disk ID of the disk to which the image is to be installed.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Microsoft-Windows-Setup | WindowsDeploymentServices | ImageSelection | InstallTo | [PartitionID](http://go.microsoft.com/fwlink/?LinkId=224342)</p></td>
<td align="left"><p>Specifies the partition ID of the partition to which the image is to be installed.</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Settings for Automating OOBE](settings-for-automating-oobe.md)

[Windows Setup Technical Reference](windows-setup-technical-reference.md)

 

 






