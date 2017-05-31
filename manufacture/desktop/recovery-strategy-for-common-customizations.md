---
author: Justinha
Description: 'Push-button reset features by default restore only drivers (installed through INF packages) and preinstalled Windows apps.'
ms.assetid: 909227f2-8969-4ab3-b296-c54977a38977
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Recovery components
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Recovery components


Push-button reset features by default restore only drivers (installed through INF packages) and preinstalled Windows apps. To configure the features to restore other customizations such as settings and Windows desktop applications, you will need to prepare one or more customization packages which contain the customizations. These customizations packages are in the form of provisioning packages (.ppkg).

Push-button reset features look for and automatically restore provisioning packages which are located in the folder C:\\Recovery\\Customizations.

To protect the packages from tampering or accidental deletion, the Write/Modify permissions of C:\\Recovery\\Customizations should be restricted to the local Administrators user group.

Some settings and customizations cannot be included in provisioning packages. Instead, you can restore them using an unattend file applied using the Push-button reset extensibility scripts. For settings which are supported by both provisioning packages and unattend, it is recommended that you specify them using only one of the mechanisms, not both. To learn more, see [How push-button reset features work](how-push-button-reset-features-work.md).

## <span id="Capturing_Classic_Windows_applications_using_Windows_User_State_Migration_Tool__USMT__s_ScanState_tool"></span><span id="capturing_windows_desktop_applications_using_windows_user_state_migration_tool__usmt__s_scanstate_tool"></span><span id="CAPTURING_WINDOWS_DESKTOP_APPLICATIONS_USING_WINDOWS_USER_STATE_MIGRATION_TOOL__USMT__S_SCANSTATE_TOOL"></span>Capturing Windows desktop applications using Windows User State Migration Tool (USMT)'s ScanState tool


The Windows User State Migration Tool (USMT) ScanState.exe has been updated in Windows 10 to support capturing Windows desktop applications applications. This functionality can be activated by specifying the `/apps` option.

When `/apps` is specified, ScanState uses a set of application discovery rules to determine what should be captured, and stores the output as a reference device data image inside a provisioning package. In general, the reference device data includes the following:

-   Windows desktop applications installed using either Microsoft Windows Installer or other installers
-   All files and folders outside of the Windows namespace (in other words, outside of \\Windows, \\Program Files, \\Program Files (x86), \\ProgramData, and \\Users). This applies only to the volume on which Windows is installed.
-   Not captured: Windows apps.
-   Not captured: User state/data.

You can also specify additional rules to include or exclude specific files, folders, and registry settings. For example, if you are using ScanState during factory deployment, you might need to exclude manufacturing-specific tools so that they will not be restored when end users use Push-button reset features. To specify additional rules, you will need to author a migration XML and specify the `/i` option when using ScanState.exe.

ScanState’s /apps option also supports the following optional parameters:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Parameter</th>
<th align="left">Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><code>+/-sysdrive</code></td>
<td align="left">Specifies whether applications, files, and folders outside of the Windows namespace should be captured.
<p>If <code>+sysdrive</code> is specified, all contents on the system drive are examined and eligible to be captured according to the discovery rules.</p>
<p>If <code>-sysdrive</code> is specified, only contents within the Windows namespace are examined and eligible to be captured according to the discovery rules.</p>
<p><code>+sysdrive</code> is the default.</p></td>
</tr>
<tr class="even">
<td align="left"><code>+/-oeminfo</code></td>
<td align="left">Specifies whether the OEM-specific help and support info should be captured.
<p>If <code>+oeminfo</code> is specified, OEM and support info are captured.</p>
<p>If <code>-oeminfo</code> is specified, OEM and support info are not captured.</p>
<p><code>+oeminfo</code> is the default.</p></td>
</tr>
</tbody>
</table>

 

**Important**  
-   Although push-button reset features can restore multiple provisioning packages, only one of the packages can contain reference device data image captured using ScanState.
-   ScanState should be used only after all customizations have been applied to the PC. It does not support appending additional changes to an existing reference device data image.
-   A provisioning package captured using ScanState.exe can only be applied using push-button reset features and deployment media created using Windows Imaging and Configuration Designer (ICD). It cannot be applied using tools such as DISM or USMT’s LoadState.exe.
-   When you prepare ScanState for capturing customizations, you should exclude Windows Defender settings to prevent possible failures during recovery that can be caused by file conflicts. For more information, see Step 1 in [Deploy push-button reset features](deploy-push-button-reset-features.md).

 

## <span id="Creating_customization_packages_using__Windows_ICD"></span><span id="creating_customization_packages_using__windows_icd"></span><span id="CREATING_CUSTOMIZATION_PACKAGES_USING__WINDOWS_ICD"></span>Creating customization packages using Windows ICD


For customizations involving settings which apply to all editions of Windows 10 (including Windows 10 Mobile), you can create provisioning packages using the Windows ICD.

In build-to-stock (BTS) scenarios, if you have already captured your Windows desktop applications from your reference PC using the ScanState tool, you can import the output provisioning package into Windows ICD and specify additional settings which should be restored during recovery.

## <span id="restoring_settings_using_unattend.xml_and_extensibility_scripts"></span><span id="RESTORING_SETTINGS_USING_UNATTEND.XML_AND_EXTENSIBILITY_SCRIPTS"></span>Restoring settings using unattend.xml and extensibility scripts


Most settings which are configured using unattend.xml and other configuration files (e.g. oobe.xml, LayoutModification.xml) cannot be restored using provisioning packages. Instead, you will need to use the Push-button reset extensibility points in order to restore them during recovery. These extensibility points allow you run scripts which can:

-   Inject an unattend.xml into the recovered OS
-   Copy other configuration files and assets into the recovered OS

**Important**  
-   You should not use unattend.xml (or other mechanisms) to boot the recovered OS into Audit Mode. The recovered OS must remain configured to boot to OOBE.
-   A copy of the configuration files and assets which need to be restored must be placed under C:\\Recovery\\OEM. Contents in this folder are not modified by push-button reset features and are automatically backed up to recovery media created using the **Create a recovery drive** utility. To protect the unattend.xml and configuration files/assets from tampering or accidental deletion, Write/Modify permissions of C:\\Recovery\\OEM should be restricted to the local Administrators user group.

 

To learn how to author scripts to be run using extensibility points, see [Add a script to push-button reset features](add-a-script-to-push-button-reset-features.md).

To learn how to use ScanState to capture and store the resulting PPKG under C:\\Recovery\\Customizations, which is restored automatically during PBR, see [Deploy push-button reset features using ScanState](deploy-push-button-reset-features.md).

## <span id="Recovery_strategies_for_common_customizations"></span><span id="recovery_strategies_for_common_customizations"></span><span id="RECOVERY_STRATEGIES_FOR_COMMON_CUSTOMIZATIONS"></span>Recovery strategies for common customizations


The following table outlines the recovery strategy for common customizations which are described in the User Experience Windows Engineering Guide (UX WEG) as well as those covered in the OEM Policy Document (OPD). For up-to-date details on these customizations, refer to the latest version of the UX WEG and OPD.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Customization</th>
<th align="left">How it is configured</th>
<th align="left">How it can be restored during PBR</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">OOBE – HID pairing</td>
<td align="left">Settings in the <code>&lt;hidSetup&gt;</code> section of OOBE.xml and images (e.g. .png files)</td>
<td align="left">Use PBR extensibility script to restore OOBE.xml and images from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">OOBE – OEM EULA</td>
<td align="left"><code>&lt;Eulafilename&gt;</code> setting in OOBE.xml and license terms .rtf file(s) stored under %WINDIR%\System32\Oobe\Info</td>
<td align="left">Use PBR extensibility script to restore OOBE.xml and .rtf files from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">OOBE – Preconfigured language and time zone</td>
<td align="left">Settings in the <code>&lt;defaults&gt;</code> section of OOBE.xml</td>
<td align="left">Use PBR extensibility script to restore OOBE.xml from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">OOBE – Hide mobile broadband page</td>
<td align="left">Microsoft-Windows-WwanUI | NotInOOBE setting in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">OOBE – OEM Registration page</td>
<td align="left">Settings in the &lt;registration&gt; section of OOBE.xml and HTML files for in-place links</td>
<td align="left">Use PBR extensibility script to restore OOBE.xml and HTML files from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">Start – Pinned tiles and groups</td>
<td align="left">LayoutModification.xml stored under %SYSTEMDRIVE%\Users\Default\AppData\Local\Microsoft\Windows\Shell or settings under Microsoft-Windows-Shell-Setup | StartTiles in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore LayoutModification.xml or unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">Start – Prepopulated MFU list</td>
<td align="left">LayoutModification.xml stored under %SYSTEMDRIVE%\Users\Default\AppData\Local\Microsoft\Windows\Shell</td>
<td align="left">Use PBR extensibility scripts to restore LayoutModification.xml from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">Continuum – Form factor</td>
<td align="left">Settings in unattend.xml:
<p>• Microsoft-Windows-Deployment | DeviceForm</p>
<p>• Microsoft-Windows-GPIOButtons | ConvertibleSlateMode</p></td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">Continuum – Default mode</td>
<td align="left">Microsoft-Windows-Shell-Setup | SignInMode setting in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">Desktop – Default and additional accent colors</td>
<td align="left">RunSynchronous command in unattend.xml which adds the AGRB hex color values to the registry under HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Accents</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">Desktop – Background image</td>
<td align="left">Microsoft-Windows-Shell-Setup | Themes | DesktopBackground setting in unattend.xml and image (e.g. .jpg/.png/.bmp file)</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml and background image file from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">Desktop – Pinned taskbar items</td>
<td align="left">Settings under Microsoft-Windows-Shell-Setup | TaskbarLinks in unattend.xml and shortcut (.lnk) files stored in a folder under %ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml and .lnk files from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">Desktop – Systray icons</td>
<td align="left">Settings under Microsoft-Windows-Shell-Setup | NotificationArea in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">Mobile broadband – Rename “WiFi” to “WLAN” in network list</td>
<td align="left">Microsoft-Windows-SystemSettings | WiFiToWlan setting in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">Mobile broadband – Enable Network Selection control in Settings</td>
<td align="left">Microsoft-Windows-SystemSettings | DisplayNetworkSelection setting in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">PC Settings – Preinstalled settings apps</td>
<td align="left">Settings apps are preinstalled in the same way as any other app, and automatically appear in Settings. Capability declared in the app manifest determines whether it is a settings app or not.</td>
<td align="left">Restored automatically along with other preinstalled apps</td>
</tr>
<tr class="odd">
<td align="left">Default browser and handlers of protocols</td>
<td align="left">Default application association settings XML file imported using the /Import-DefaultAppAssociations command in DISM</td>
<td align="left">Use PBR extensibility scripts to re-import the XML from C:\Recovery\OEM using DISM</td>
</tr>
<tr class="even">
<td align="left">Support information in Contact Support app</td>
<td align="left">Settings under Microsoft-Windows-Shell-Setup | OEMInformation in unattend.xml and logo.bmp file</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml and .bmp file from C:\Recovery\OEM</td>
</tr>
<tr class="odd">
<td align="left">Store content modifier</td>
<td align="left">Microsoft-Windows-Store-Client-UI | StoreContentModifier setting in unattend.xml</td>
<td align="left">Use PBR extensibility scripts to restore unattend.xml from C:\Recovery\OEM</td>
</tr>
<tr class="even">
<td align="left">Windows desktop applications (including driver applets installed via setup.exe)</td>
<td align="left">MSI or custom installers</td>
<td align="left">Use ScanState to capture and store the resulting PPKG under C:\Recovery\Customizations, which is restored automatically during PBR.</td>
</tr>
<tr class="odd">
<td align="left">RDX contents</td>
<td align="left">See UX WEG for details</td>
<td align="left">Should not be restored during PBR</td>
</tr>
</tbody>
</table>

 

 

 





