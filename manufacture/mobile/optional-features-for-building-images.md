---
title: Optional features for building mobile images
description: You can add optional features to images by including them under the Features element in the OEMInput XML file.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8147e170-f21f-4ed3-8130-4d498368ff92
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Optional features for building mobile images


You can add optional features to images by including them under the **Features** element in the OEMInput XML file. Adding a feature will add the packages associated with the feature to the image. Some features can only be used with certain types of images. For more information about using optional features, see [Building an image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md).

Updates should be tested by submitting OS update requests using the Ingestion Client and verifying successful OS updates.

## Conditional features


If a device meets the installation conditions listed for a feature in the following table, then the update path for the device will fail unless the feature is installed. For example, if there’s an update for Rich Communications Suite Platform support for Windows 10 Mobile, and you removed that feature from a device that’s otherwise capable of using it, then that entire update package (and all subsequent updates) will fail to install. To get updates again, you need to deliver an image that includes the feature to customers, and have them re-flash the device.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature name and ID</th>
<th>Update Path</th>
<th>Condition</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Rich Communications Suite Platform support (RCS_FEATURE_PACK)</td>
<td>Windows 8.1 to Windows 10</td>
<td><p>Install if PhoneManufacturer=NOKIA</p>
<p>Update if installed</p></td>
</tr>
<tr class="even">
<td>Nearby Numbers/Block and Filter (MS_COMMSENHANCEMENT* apps)</td>
<td>Windows 8.1 to Windows 10</td>
<td><p>Install MS_COMMSENHANCEMENTCHINA if HKEY_LOCAL_MACHINE\system\Platform\DeviceTargetingInfo\phoneromlanguage = 0804. Update if it’s already installed.</p>
<p>Install MS_COMMSENHANCEMENTGLOBAL if HKEY_LOCAL_MACHINE\system\Platform\DeviceTargetingInfo\phoneromlanguage &lt;&gt; 0804. Update if it’s already installed.</p></td>
</tr>
</tbody>
</table>

 

## Retail features defined by Microsoft


The following table describes the Microsoft-defined features that can be used by OEMs in the **Features** element in the OEMInput file for retail devices.

Refer to the Mobile Operator guides for any additional retail features that are used for specific mobile operators.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>OPTIMIZED_BOOT</p></td>
<td><p>Modifies the behavior of the OS boot process to start some system processes and services before all device drivers are started. Enabling this feature may decrease boot time, but it may also cause regressions in boot behavior in some scenarios.</p></td>
</tr>
<tr class="even">
<td><p>STANDARD_FEATURE_1</p></td>
<td><p>This feature includes standard features that must be included in all images.</p></td>
</tr>
<tr class="odd">
<td><p>NETLOG_RETAIL</p></td>
<td><p>This feature adds network capture logging to assist in troubleshooting network connectivity issues. This feature is used to gather network diagnostic information by Field Medic.</p></td>
</tr>
<tr class="even">
<td><p>NAVIGATIONBAR</p></td>
<td><p>This feature adds a phone setting that enables users to configure the color of the software buttons.</p></td>
</tr>
<tr class="odd">
<td><p>FACEBOOK</p></td>
<td><p>This feature includes Facebook in the image.</p></td>
</tr>
<tr class="even">
<td><p>SKYPE</p></td>
<td><p>This feature includes the Skype Windows Phone Silverlight app in the image.</p></td>
</tr>
<tr class="odd">
<td><p>BINGAPPS</p></td>
<td><p>This feature adds Bing News, Finance, Sports and Weather.</p></td>
</tr>
<tr class="even">
<td><p>BINGFOOD</p></td>
<td><p>This feature adds Bing Food &amp; Drink.</p></td>
</tr>
<tr class="odd">
<td><p>BINGHEALTH</p></td>
<td><p>This feature adds Bing Health &amp; Fitness.</p></td>
</tr>
<tr class="even">
<td><p>BINGTRAVEL</p></td>
<td><p>This feature adds Bing Travel.</p></td>
</tr>
<tr class="odd">
<td><p>WIFI_FEATURE_PACK</p></td>
<td><p>This feature removes all cellular-related functionality from the operating system and is intended only for devices that will not be connected to a cellular network. It removes all cellular related tiles, icons, and settings from the user interface. Including this feature reduces memory usage and improves the user experience by not displaying nonfunctional cellular settings and icons.</p></td>
</tr>
<tr class="even">
<td><p>RELEASE_PRODUCTION</p></td>
<td><p>Deprecated, no longer in use.</p></td>
</tr>
<tr class="odd">
<td><p>COMMSENHANCEMENTGLOBAL</p></td>
<td><p>The feature includes message and call filtering application in image.</p></td>
</tr>
<tr class="even">
<td><p>COMMSENHANCEMENTCHINA</p></td>
<td><p>The feature includes message&amp;call filter, call location, and category application in the image. It’s used for China only.</p></td>
</tr>
<tr class="odd">
<td><p>4GBFEATURESONDATA</p></td>
<td><p>On devices with 4GB of storage, provisioned packages are stored on the data partition.</p></td>
</tr>
<tr class="even">
<td><p>8GBFEATURESONDATA</p></td>
<td><p>On devices with 8GB of storage, provisioned packages are stored on the data partition.</p>
<div class="alert">
<strong>Note</strong>  We strongly recommend that you also use 8GBFEATURESONSYSTEM when you specify this feature.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>8GBFEATURESONSYSTEM</p></td>
<td><p>On devices with 8GB of storage, provisioned packages are stored on the OS partition.</p></td>
</tr>
<tr class="even">
<td><p>16GBFEATURESONDATA</p></td>
<td><p>On devices with 16GB of storage, provisioned packages are stored on the data partition.</p>
<div class="alert">
<strong>Note</strong>  We strongly recommend that you also use 16GBFEATURESONSYSTEM when you specify this feature.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>16GBFEATURESONSYSTEM</p></td>
<td><p>On devices with 16GB of storage, provisioned packages are stored on the OS partition.</p></td>
</tr>
<tr class="even">
<td><p>SPATIALSOUND_FILTERDATA</p></td>
<td><p>Contains all the data files and registry keys necessary to enable Spatial Audio functionality on a mobile device. Spatial audio is used to make audio sound like it is coming from a specific direction, and to make the audio sound like it exists naturally inside a specific type of room.</p></td>
</tr>
<tr class="odd">
<td><p>TAIWAN_ENABLEMENT</p></td>
<td><p>Remove Taiwan references from the image.</p></td>
</tr>
<tr class="even">
<td><p>MYANMAR_ZAWGYI_ENABLEMENT</p></td>
<td><p>Enable this image to use the Zawgyi encoding in Myanmar. You should also add the Zawgyi keyboard when adding this feature.</p></td>
</tr>
<tr class="odd">
<td><p>SOCProdTest_HSTI</p></td>
<td><p>This feature installs the correct driver for the security watermark checks and is required for Windows 10 Mobile. If this package is not installed, you will see the <strong>Not For Retail</strong> watermark.</p>
<div class="alert">
<strong>Important</strong>  This feature must be included in your OS image. If this feature is not included, the device might not boot.
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>ATTWIFI</p></td>
<td><p>This feature installs a third-party plugin that allows devices with an AT&amp;T SIM to automatically connect to AT&amp;T hotspots.</p></td>
</tr>
<tr class="odd">
<td><p>DISABLE_ABNORMAL_RESET</p></td>
<td><p>This feature disables abnormal resets and does not report it to Watson.</p></td>
</tr>
<tr class="even">
<td><p>Docking</p></td>
<td><p>This feature enables Continuum for Windows 10 Mobile.</p></td>
</tr>
<tr class="odd">
<td><p>RESET_PROTECTION</p></td>
<td><p>This feature enables Reset Protection on a retail image. When the device boots for the first time, the appropriate secure UEFI variable are written.</p></td>
</tr>
<tr class="even">
<td><p>PERF_TRACING_TOOLS</p></td>
<td><p>Contains tools for doing performance analysis, such as tools for stopping and merging ETL tracing.</p></td>
</tr>
<tr class="odd">
<td><p>ENABLE_BOOT_PERF_BASIC_TRACING</p></td>
<td><p>Enables boot performance tracing events to be generated.</p></td>
</tr>
<tr class="even">
<td><p>ENABLE_BOOT_PERF_CPU_PROFILING_TRACING</p></td>
<td><p>Enables CPU profiling events. in addition to the boot performance tracing events that are enabled with ENABLE_BOOT_PERF_BASIC_TRACING.</p></td>
</tr>
<tr class="odd">
<td><p>MESSAGINGGLOBAL</p></td>
<td><p>This feature installs the Messaging package that includes Skype integration. It must be used for any devices except those being submitted for NAL certification in China.</p></td>
</tr>
<tr class="even">
<td><p>MESSAGINGLITE</p></td>
<td><p>This feature installs the Messaging package without Skype integration. It must be used for any phone or other device that is submitted for NAL certification in China (excluding Hong Kong SAR and Macau).</p></td>
</tr>
<tr class="odd">
<td><p>SPATIALSOUND_FILTERDATA</p></td>
<td><p>This feature installs <a href="https://dev.windows.com/holographic/spatial_sound">Spatial sound</a>.</p></td>
</tr>
</tbody>
</table>

 

**Retail boot sequence settings**

The next two settings control the phone start up. Only one can be selected.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>BOOTSEQUENCE_RETAIL</p></td>
<td><p>This feature enables the standard retail boot sequence.</p></td>
</tr>
</tbody>
</table>

 

**Microsoft internal retail features**

The following components are reserved for Microsoft internal use only, but are documented here for completeness.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>SELFHOST</p></td>
<td><p>This feature adds components used exclusively for self-hosting scenarios in Microsoft.</p></td>
</tr>
<tr class="even">
<td><p>FieldMedicCustomProfiles</p></td>
<td><p>This feature adds additional tracing profiles used by Field Medic.</p></td>
</tr>
<tr class="odd">
<td><p>RESET_PROTECTION_INTERNAL</p></td>
<td><p>This feature enables Reset Protection on a test image. When the device boots for the first time, the appropriate secure UEFI variable are written.</p></td>
</tr>
</tbody>
</table>

 

**Retail Demo Experience features**

The Retail Demo Experience FOD contains offline retail demo content that is critical to a great retail demo experience. This offline content contains Windows and Office content that is shown along with any OEM or Retailer retail demo content. Adding of this Retail Demo Experience FOD is required and necessary for any OEMs participating in enabling a Retail Demo Experience on their Windows 10 devices.

-   MS\_RETAILDEMOCONTENT\_AR-SA
-   MS\_RETAILDEMOCONTENT\_BG-BG
-   MS\_RETAILDEMOCONTENT\_CS-CZ
-   MS\_RETAILDEMOCONTENT\_DA-DK
-   MS\_RETAILDEMOCONTENT\_DE-DE
-   MS\_RETAILDEMOCONTENT\_EL-GR
-   MS\_RETAILDEMOCONTENT\_EN-GB
-   MS\_RETAILDEMOCONTENT\_EN-US
-   MS\_RETAILDEMOCONTENT\_ES-ES
-   MS\_RETAILDEMOCONTENT\_ES-MX
-   MS\_RETAILDEMOCONTENT\_ET-EE
-   MS\_RETAILDEMOCONTENT\_FI-FI
-   MS\_RETAILDEMOCONTENT\_FR-CA
-   MS\_RETAILDEMOCONTENT\_FR-FR
-   MS\_RETAILDEMOCONTENT\_HE-IL
-   MS\_RETAILDEMOCONTENT\_HR-HR
-   MS\_RETAILDEMOCONTENT\_HU-HU
-   MS\_RETAILDEMOCONTENT\_ID-ID
-   MS\_RETAILDEMOCONTENT\_IT-IT
-   MS\_RETAILDEMOCONTENT\_JA-JP
-   MS\_RETAILDEMOCONTENT\_KO-KR
-   MS\_RETAILDEMOCONTENT\_LT-LT
-   MS\_RETAILDEMOCONTENT\_LV-LV
-   MS\_RETAILDEMOCONTENT\_NB-NO
-   MS\_RETAILDEMOCONTENT\_NEUTRAL
-   MS\_RETAILDEMOCONTENT\_NL-NL
-   MS\_RETAILDEMOCONTENT\_PL-PL
-   MS\_RETAILDEMOCONTENT\_PT-BR
-   MS\_RETAILDEMOCONTENT\_PT-PT
-   MS\_RETAILDEMOCONTENT\_RO-RO
-   MS\_RETAILDEMOCONTENT\_RU-RU
-   MS\_RETAILDEMOCONTENT\_SK-SK
-   MS\_RETAILDEMOCONTENT\_SL-SI
-   MS\_RETAILDEMOCONTENT\_SR-LATN-RS
-   MS\_RETAILDEMOCONTENT\_SV-SE
-   MS\_RETAILDEMOCONTENT\_TH-TH
-   MS\_RETAILDEMOCONTENT\_TR-TR
-   MS\_RETAILDEMOCONTENT\_UK-UA
-   MS\_RETAILDEMOCONTENT\_VI-VN
-   MS\_RETAILDEMOCONTENT\_ZH-CN
-   MS\_RETAILDEMOCONTENT\_ZH-HK
-   MS\_RETAILDEMOCONTENT\_ZH-TW

## Test features defined by Microsoft


The following table describes the Microsoft-defined test features that can be used by OEMs in the **Features** element in the OEMInput file. These features are defined in MSOptionalFeatures.xml, which is included with the MobileOS under %WPDKCONTENTROOT%\\FMFiles.

### Boot option features

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>BOOTSEQUENCE_TEST</p></td>
<td><p>This feature includes the BCD boot sequence configuration for booting into the full OS in a test image. This feature also includes a pre-boot crash dump application and a pre-boot crash dump entry.</p>
<div class="alert">
<strong>Note</strong>  
<p>The following features are mutually exclusive; only one of them can be referenced in an OEMInput file: BOOTSEQUENCE_TEST, MMOSLOADER_TEST.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>MMOSLOADER_TEST</p></td>
<td><p>This feature includes the BCD boot sequence configuration to support booting into MMOS in a test image. This feature also includes a pre-boot crash dump application and a pre-boot crash dump entry. For more information about MMOS, see <a href="mmos-image-definition.md">MMOS image definition</a>.</p>
<div class="alert">
<strong>Note</strong>  
<p>The following features are mutually exclusive; only one of them can be referenced in an OEMInput file: BOOTSEQUENCE_TEST, MMOSLOADER_TEST.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>MOBILECOREBOOTSH</p></td>
<td><p>Enables the bootsh service (bootshscv) so that startup.bsc features, such as telnet and ftp, can be used.</p></td>
</tr>
<tr class="even">
<td><p>MOBILECORE_TEST</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="odd">
<td><p>PRODUCTION</p></td>
<td><p>Includes core OS files that are used to support base OS functionality for production builds in the main OS, UEFI and the update OS. This feature is used for PRODUCTION Image types.</p></td>
</tr>
<tr class="even">
<td><p>PRODUCTION_CORE</p></td>
<td><p>This feature adds production boot and main OS binaries to the image. PRODUCTION_CORE automatically includes the following features:</p>
<ul>
<li><p>CODEINTEGRITY_PROD</p></li>
</ul>
<p>Because these features are already included, they should not be manually included in PRODUCTION_CORE builds.</p></td>
</tr>
<tr class="odd">
<td><p>DISABLE_FFU_PLAT_ID_CHECK</p></td>
<td><p>Disables the device platform validation in the Microsoft flashing application. For more information about the platform check in flashing, see <a href="use-the-flashing-tools-provided-by-microsoft.md">Use the flashing tools provided by Microsoft</a>.</p>
<div class="alert">
<strong>Important</strong>  
<p>The device platform validation for flashing must not be disabled in retail images.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>RESET_PROTECTION_INTERNAL</p></td>
<td><p>This feature enables Reset Protection on the device. When the device boots for the first time, the appropriate secure UEFI variable are written.</p></td>
</tr>
</tbody>
</table>

 

### Boot option feature constraints

You can specify feature constraints to avoid illogical or inappropriate build configurations.

Some settings are mutually exclusive and only one setting should be specified at a time. For example, consider the features, RELEASE\_PRODUCTION and RELEASE\_TEST. These features are mutually exclusive. This means that if RELEASE\_TEST is set, RELEASE\_PRODUCTION must not be set. For more information about how constraints are specified in XML see, [Feature groupings and constraints](feature-groupings-and-constraints.md).

When &lt;ReleaseType&gt;Production&lt;/ReleaseType&gt; is set in the OEMInput file, this maps to RELEASE\_PRODUCTION. When &lt;ReleaseType&gt;Test&lt;/ReleaseType&gt; is set in the OEMInput file, this maps to RELEASE\_TEST. For more information about the release type, see [OEMInput file contents](oeminput-file-contents.md).

The release constraints for RELEASE\_PRODUCTION can be summarized as follows.

-   Either RELEASE\_PRODUCTION or CODEINTEGRITY\_PROD can be selected. This is because production code integrity is automatically enabled when RELEASE\_PRODUCTION is selected and therefore can’t be manually enabled.

These feature constraints can be used to prevent incorrect build option configurations. These feature constraints specify that PRODUCTION\_CORE is mutually exclusive with RELEASE\_PRODUCTION and TEST but is not mutually exclusive with HEALTH, PRODUCTION, or SELFHOST.

This table provides a summary of build options and indicates if the option is exclusive to any other option.

<table style="width:100%;">
<colgroup>
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
</colgroup>
<thead>
<tr class="header">
<th></th>
<th>RELEASE_PRODUCTION</th>
<th>TEST</th>
<th>HEALTH</th>
<th>PRODUCTION</th>
<th>SELFHOST</th>
<th>PRODUCTION_CORE</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>RELEASE_PRODUCTION</p></td>
<td><p>NA</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>TEST</p></td>
<td><p>Yes</p></td>
<td><p>NA</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>HEALTH</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>NA</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>PRODUCTION</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>NA</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>SELFHOST</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>NA</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>PRODUCTION_CORE</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>NA</p></td>
</tr>
</tbody>
</table>

 

### Other boot related features

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>STARTUPOVERRIDES</p></td>
<td><p>This feature starts the FTP service (ftpd.exe) and Telnet service (telnetd.exe) automatically on startup.</p></td>
</tr>
<tr class="even">
<td><p>LABIMAGE</p></td>
<td><p>This feature causes the device to enter the FFU download mode automatically when the device is booted. For more information, see <a href="use-the-flashing-tools-provided-by-microsoft.md">Use the flashing tools provided by Microsoft</a>.</p></td>
</tr>
<tr class="odd">
<td><p>BOOTKEYACTIONS_RETAIL</p></td>
<td><p>This feature enables a set of button actions for use in retail devices.</p></td>
</tr>
<tr class="even">
<td><p>SKIPOOBE</p></td>
<td><p>This feature disables the initial setup process wizard. This feature is supported in Test, Health and Production image types. This feature must not be used in Retail images.</p></td>
</tr>
</tbody>
</table>

 

### Security related features

There are two code signing modes on a Windows 10 Mobile device, retail and test. With retail, all code must be production signed to be able to run on the device. For test signing, all code must be signed with test certificates. For more information about code signing, see [Code signing](https://msdn.microsoft.com/library/windows/hardware/dn756634).

The two code signing modes are automatically managed in the build system. The previous DISABLETESTSIGNING and ENABLETESTSIGNING feature settings are no longer used. Instead test code signing is automatically enabled in the following build types:

-   TEST

-   HEALTH

-   PRODUCTION

-   SELFHOST

Test code signing cannot be enabled in the RELEASE\_PRODUCTION build type that is used for retail devices

The following table summarizes the security related features.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>CODEINTEGRITY_PROD</p></td>
<td><p>This feature includes code integrity binaries that are used for signature verification on production images. Code integrity verifies the integrity of binary files as they are loaded into memory by the operating system. This feature is automatically included when PRODUCTION_CORE is selected. Because of this, CODEINTEGRITY_PROD should not be manually added when PRODUCTION_CORE is selected.</p></td>
</tr>
<tr class="even">
<td><p>CODEINTEGRITY_TEST</p></td>
<td><p>This feature includes code integrity binaries that are used for signature verification on test images. Code integrity verifies the integrity of binary files as they are loaded into memory by the operating system.</p></td>
</tr>
<tr class="odd">
<td><p>GWPCERTTESTPROV</p></td>
<td><p>This feature provisions a set of test Genuine Windows Phone Certificates (GWPC) certificates in the image.</p></td>
</tr>
</tbody>
</table>

 

### Test related features

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>TEST</p></td>
<td><p>This feature adds many test drivers, applications, and other components to be used for testing the OS in different conditions.</p></td>
</tr>
<tr class="even">
<td><p>TESTINFRASTRUCTURE</p></td>
<td><p>This feature adds the following components to the image:</p>
<ul>
<li><p>MinTE.exe and other components that support a minimal test harness environment for Test Authoring and Execution Framework (TAEF) tests.</p></li>
<li><p>The Verifier.cmd script, which is used to configure Driver Verifier.</p></li>
<li><p>Tux.exe and other components related to the Tux test harness for native code.</p></li>
<li><p>TuxNet.exe and other components related to the TuxNet test harness for managed code.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td><p>HEALTH</p></td>
<td><p>This feature adds components for running tests related to power and performance.</p></td>
</tr>
<tr class="even">
<td><p>DRIVERS_WDTFINFRA</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="odd">
<td><p>DRIVERS_WDTFPOWER</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="even">
<td><p>DRIVERS_WDTFPLGINS</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="odd">
<td><p>DRIVERS_WDTFDRVCOV</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="even">
<td><p>DRIVERS_WDTFIOSPY</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
</tbody>
</table>

 

### Debug related features

Use the following settings to specify the transport that is used for debugging. The previous DEBUGGERON feature has been deprecated.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p></p></td>
<td><p><strong>Debug transport settings</strong></p></td>
</tr>
<tr class="even">
<td><p>KDNETUSB_ON</p></td>
<td><p>Includes all kernel debugger transports and enables KDNET over USB.</p>
<p>The default debug transport settings for this feature are an IP address of &quot;1.2.3.4&quot;, a port address of &quot;50000&quot;, and a debugger key of &quot;4.3.2.1&quot;. To use the default IP address of 1.2.3.4, run VirtEth.exe with the <em>/autodebug</em> flag. To establish a kernel debugger connection to the phone, use the following command.</p>
<p>Windbg -k net:port=50000,key=4.3.2.1</p></td>
</tr>
<tr class="odd">
<td><p>KDUSB_ON</p></td>
<td><p>Includes all kernel debugger transports and enables KDUSB.</p>
<p></p>
<p>The default debug transport target name for this feature is WOATARGET. To establish a kernel debugger connection to the phone, use the following command.</p>
<p>Windbg -k usb:targetname=WOATARGET</p>
<div class="alert">
<strong>Note</strong>  
<p>Do not include either KDUSB_ON or KDNETUSB_ON if you need to enable MTP or IP over USB in the image. If the kernel debugger is enabled in the image and the debug transports are used to connect to the device, the kernel debugger has exclusive use of the USB port and prevents MTP and IP over USB from working.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>KDSERIAL_ON</p></td>
<td><p>Includes all kernel debugger transports and enables KDSERIAL with the following settings: 115200 Baud, 8 bit, no parity.</p></td>
</tr>
<tr class="odd">
<td><p>KD</p></td>
<td><p>Includes all kernel debugger transports in the image, but does not enable the kernel debugger.</p></td>
</tr>
<tr class="even">
<td><p>KD_TEST</p></td>
<td><p>Includes all kernel debugger transports in the image, but does not enable the kernel debugger.</p></td>
</tr>
<tr class="odd">
<td><p>KDNETUSB_TEST_ON</p></td>
<td><p>Includes all kernel debugger transports and enables KDNET over USB in test images. This option must only be used with test images.</p></td>
</tr>
</tbody>
</table>

 

**Other debug settings**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p></p></td>
<td><p>Dumpsize setting features - The following three features must only be used with the Test and Health image types. These features must not be used with retail images. Only one dumpsize setting can be selected at a time.</p></td>
</tr>
<tr class="even">
<td><p>DUMPSIZE512MB</p></td>
<td><p>Specifies a pre-allocated crash dump file size of 592 MB. This is intended for a phone with 512 MB of memory.</p></td>
</tr>
<tr class="odd">
<td><p>DUMPSIZE1G</p></td>
<td><p>Specifies a pre-allocated crash dump file size of 1104 MB. This is intended for a phone with 1024 MB of memory.</p></td>
</tr>
<tr class="even">
<td><p>DUMPSIZE2G</p></td>
<td><p>Specifies a pre-allocated crash dump file size of 2128 MB. This is intended for a phone with 2048 MB of memory.</p></td>
</tr>
<tr class="odd">
<td><p>DUMPSIZE4G</p></td>
<td><p>Specifies a pre-allocated crash dump file size of 4 GB. This is intended for a phone with 4096 MB of memory.</p></td>
</tr>
<tr class="even">
<td><p></p></td>
<td><p>Dump data storage location - The next two settings control if crash dump data is stored on eMMC or if crash dump data is stored on an SD card. Only one of these settings can be selected at a time. These two features must only be used with the Test, Health and Selfhost image types. These features must not be used with retail images.</p></td>
</tr>
<tr class="odd">
<td><p>DEDICATEDDUMPONEMMC</p></td>
<td><p>Specifies that the DedicatedDumpFile location as c:\crashdump\dedicateddump.sys.</p></td>
</tr>
<tr class="even">
<td><p>DEDICATEDDUMPONSD</p></td>
<td><p>DEDICATEDDUMPONSD – Specifies that the DedicatedDumpFile location as d:\dedicateddump.sys</p>
<p>When DEDICATEDDUMPONSD is used, crash dump will be disabled if the user removes the SD card or if the card is not present when the device booted. To re-enable crash dump:</p>
<ol>
<li><p>Set this registry key <code>HKLM\System\CurrentControlSet\Control\CrashControl\CrashDumpEnabled</code> to the value of <code>HKLM\System\CurrentControlSet\Control\CrashControl\ExpectedCrashDumpEnabled</code></p></li>
<li><p>Reboot the phone.</p></li>
</ol></td>
</tr>
<tr class="odd">
<td><p></p></td>
<td><p>Test disk idle power behavior - The next two settings determine if storage devices (internal and SD card) can enter into a low power state after they become idle. They must not be used with retail images.</p>
<p></p></td>
</tr>
<tr class="even">
<td><p>TEST_ENABLE_DISK_IDLE</p></td>
<td><p>This feature will allow the storage devices (internal and SD card) to go into a low power state shortly after they become idle. This setting may prevent the collection of crashdumps on the MSM8960 processor devices. If crashdumps need to be gathered from an MSM8960 device, use the TEST_DISABLE_DISK_IDLE feature instead.</p></td>
</tr>
<tr class="odd">
<td><p>TEST_DISABLE_DISK_IDLE</p></td>
<td><p>This feature will prevent the storage devices (internal and SD card) from going into a low power state after they become idle. This setting should be used if crashdumps need to be gathered from MSM8960 devices.</p></td>
</tr>
<tr class="even">
<td><p>DRVRF_SIPLAT</p></td>
<td><p>Sets driver verifier parameters for OEM and SoC drivers. This feature sets the VerifyDriverLevel to a value of 002209BB and VerifierOptions to 00000009. Windows drivers provided by Microsoft are excluded using the VerifyDrivers key. You can use the following debug command to list the drivers that are being verified in your environment.</p>
<pre class="syntax" space="preserve"><code>!verifier 1    </code></pre></td>
</tr>
<tr class="odd">
<td><p>DBGCHKDISABLE</p></td>
<td><p>This feature disables debugger connection checking and the debugger connection status is ignored.</p>
<p>The effect on the debugger behavior is different depending on the SoC that is being used.</p>
<ul>
<li><p>For QC8x26 and QC8974 devices, include DBGCHKDISABLE to ensure that offline dumps will be generated even if the device is connected to a debugger. Otherwise, an Offline Dump (Bug Check Code 0x14C dump) will not be created but a raw dump will still be created.</p></li>
<li><p>For 8960 devices, include DBGCHKDISABLE to ensure that offline dumps will be generated even if the device is connected to a debugger. Otherwise, an Offline Dump (i.e. Bug Check Code 0x14C dump) will not be created.</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p>MSVCRT_DEBUG</p></td>
<td><p>This feature adds support for explicit linking of debug c-runtime libs by including msvcp120d.dll and msvcr120d.dll in the image. For more information, see this topic on MSDN: <a href="http://msdn.microsoft.com/library/abx4dbyh.aspx">CRT Library Features</a>.</p></td>
</tr>
<tr class="odd">
<td><p>MWDBGSRV</p></td>
<td><p>This feature adds support for the user mode debug server.</p></td>
</tr>
<tr class="even">
<td><p>NOLIVEDUMPS</p></td>
<td><p>Disables non-fatal kernel error reports.  These reports contain debugging information for OS and driver developers.</p></td>
</tr>
<tr class="odd">
<td><p>TELEMETRYONSDCARD</p></td>
<td><p>This feature enables temporary storage of debugging logs and files on the SD card.  This feature is only appropriate for test/self-host images and only on devices with less than 8 GB of free space of primary storage.</p></td>
</tr>
</tbody>
</table>

 

### Non-production features

The following are some features that can be used for development and testing support.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>POWERTRACINGTOOL</p></td>
<td><p>This feature adds PowerTracingTool.exe, which is used to collect power-related ETW logs, to the image.</p></td>
</tr>
<tr class="even">
<td><p>TASKSCHEDULERTOOL</p></td>
<td><p>This feature adds TaskSchTestUtil.exe, which is used to do task scheduling-related operations, to the image.</p></td>
</tr>
<tr class="odd">
<td><p>DISABLEPREBOOTCRASHDUMP</p></td>
<td><p>This feature adds a registry setting that disables offline crash dumps.</p></td>
</tr>
<tr class="even">
<td><p>ALWAYSKEEPMEMORYDUMP</p></td>
<td><p>This feature adds a registry setting that tells the device to keep kernel dump files.</p></td>
</tr>
<tr class="odd">
<td><p>AUTOREBOOT</p></td>
<td><p>This feature adds a registry setting that restarts the device immediately after a crash dump is complete.</p></td>
</tr>
<tr class="even">
<td><p>DISABLEDEBUGCHECKSCREEN</p></td>
<td><p>This feature adds a registry setting that suppresses the bug check screen.</p></td>
</tr>
</tbody>
</table>

 

### Other features

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>FAKEVIBRA</p></td>
<td><p>This feature adds a test hardware notification driver for controlling the vibration feedback mechanism.</p></td>
</tr>
<tr class="even">
<td><p>IMGFAKELED</p></td>
<td><p>This feature adds a test hardware notification driver for controlling LEDs to the image.</p></td>
</tr>
<tr class="odd">
<td><p>LOCATIONFRAMEWORKAPP</p></td>
<td><p>This feature adds LFApp, a test and debug application for the location framework.</p></td>
</tr>
<tr class="even">
<td><p>PSEUDOLOCALES</p></td>
<td><p>This feature enables the use of pseudo-locales for localization testing. For more information, see <a href="http://msdn.microsoft.com/library/windows/desktop/dd374118.aspx">Using Psuedo-Locales for Localization Testing</a> on MSDN.</p></td>
</tr>
<tr class="odd">
<td><p>GRAPHICSSOFTWAREDRIVERS</p></td>
<td><p>This feature adds BasicDisplay and WARP graphics drivers. This feature is normally used by the SoC vendor in early device bring-up.</p></td>
</tr>
</tbody>
</table>

 

## Microsoft internal features


The following components are reserved for Microsoft internal use only, but are documented here for completeness.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>SELFHOST</p></td>
<td><p>This feature adds components used exclusively for self-hosting scenarios in Microsoft.</p></td>
</tr>
<tr class="even">
<td><p>IMGUPD_POWERTOYS</p></td>
<td><p>This feature includes several utility applications related to updating packages on devices.</p></td>
</tr>
<tr class="odd">
<td><p>INSTRUMENT_FOR_COVERAGE</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="even">
<td><p>IMGFAKEMODEM</p></td>
<td><p>Information on this feature will be provided in a later release of this documentation.</p></td>
</tr>
<tr class="odd">
<td><p>USE_WMC</p></td>
<td><p>This feature is used for Microsoft testing.</p></td>
</tr>
<tr class="even">
<td><p>CORTANADBG_TEST_PROTECTED</p></td>
<td><p>This feature is for Microsoft use only.</p></td>
</tr>
<tr class="odd">
<td><p>LIMITED</p></td>
<td><p>This feature is for Microsoft use only.</p></td>
</tr>
<tr class="even">
<td><p>TEST_PROTECTED</p></td>
<td><p>This feature is for Microsoft use only.</p></td>
</tr>
<tr class="odd">
<td><p>SELFHOST_PROTECTED</p></td>
<td><p>This feature is for Microsoft use only.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Building and flashing images](building-and-flashing-images.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Optional%20features%20for%20building%20mobile%20images%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





