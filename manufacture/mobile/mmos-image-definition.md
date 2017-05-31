---
author: kpacquer
Description: MMOS image definition
ms.assetid: 3b548778-0551-4ca0-9768-725d0f33dfca
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MMOS image definition
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MMOS image definition


This section provides instructions for creating Windows 10 Mobile MMOS images. This process is similar to the process for creating the primary OS image.

## <span id="Creating_an_MMOS_image"></span><span id="creating_an_mmos_image"></span><span id="CREATING_AN_MMOS_IMAGE"></span>Creating an MMOS image


The MMOS image created during this process requires packages from the SoC manufacturer and the OEM in addition to those provided by Microsoft. The OEM packages that are included in the sample MfgOEMInput.xml configuration file are for illustration purposes only. OEMs should remove those example packages and replace them with their own OEM packages. It is up to the OEM to determine which set to include in MMOS. OEMs can add additional OEM packages containing test applications and test controllers, etc.

**Important**  
All the imaging and packaging tools are located in %WPDKCONTENTROOT%\\Tools\\bin\\i386. This path must be included in your environment Path for the tools to work. You must run these tools from a Visual Studio command-line window as an Administrator with access to MakeCat.exe in the environment path.

 

### <span id="Creating_OEM_packages"></span><span id="creating_oem_packages"></span><span id="CREATING_OEM_PACKAGES"></span>Creating OEM packages

Adding content to an image is done by creating your own packages. OEM packages can be added to an image by modifying the MfgOEMInput.xml file before creating an image with Windows Imaging and Configuration Designer (ICD).

For instructions on creating packages, see [Creating packages](https://msdn.microsoft.com/library/dn756642).

### <span id="Specifying_features_in_MMOS"></span><span id="specifying_features_in_mmos"></span><span id="SPECIFYING_FEATURES_IN_MMOS"></span>Specifying features in MMOS

You can use the **Feature** element in the MfgOEMInput.xml file to include optional packages provided by Microsoft. You can modify the input XML file to support different features in MMOS for development, manufacturing, and retail service needs.

**Manufacturing development and debugging environment**

The following features are defined and supported in the manufacturing development and debugging environment. This environment can be used to create test applications for use in manufacturing.

**Important**  
The following features can only be used for test-signed packages and are not to be included in Customer Care WIM Images.

 

**General features**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ENABLE_BOOT_KEYS_TEST</p></td>
<td align="left"><p>Enables a boot menu that is launched by pressing and holding the power button. Use the Volume key to navigate and the Camera key to select. This feature is mutually exclusive with <strong>ENABLE_BOOT_KEYS_RETAIL</strong>.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MOBILECOREBOOTSH</p></td>
<td align="left"><p>Enables the bootsh service (bootshscv) so that features in startup.bsc, such as telnet and ftp, can be used.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>LABIMAGE</p></td>
<td align="left"><p>This feature causes the device to enter the FFU download mode automatically when the device is booted. For more info, see [Use the flashing tools provided by Microsoft](https://msdn.microsoft.com/library/windows/hardware/dn789235).</p></td>
</tr>
<tr class="even">
<td align="left"><p>MFGTSHELL</p></td>
<td align="left"><p>Enables TShell in MMOS and manufacturing mode. If you use this, you need to set the TestSirepServer service to auto in your manufacturing profile.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>OPTIMIZED_BOOT</p></td>
<td align="left"><p>Modifies the behavior of the OS boot process to start some system processes and services before all device drivers are started. Enabling this feature may decrease boot time, but it may also cause regressions in boot behavior in some scenarios.</p></td>
</tr>
<tr class="even">
<td align="left"><p>BOOTKEYACTIONS_RETAIL</p></td>
<td align="left"><p>This feature enables a set of button actions for use in retail devices.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>DISABLE_FFU_PLAT_ID_CHECK</p></td>
<td align="left"><p>Disables the device platform validation in the Microsoft flashing application. For more information about the platform check in flashing, see [Use the flashing tools provided by Microsoft](https://msdn.microsoft.com/library/windows/hardware/dn789235).</p>
<div class="alert">
<strong>Important</strong>  
<p>The device platform validation for flashing must not be disabled in retail images.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td align="left"><p>PERF_TRACING_TOOLS</p></td>
<td align="left"><p>Contains tools for doing performance analysis, such as tools for stopping and merging ETL tracing.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ENABLE_BOOT_PERF_BASIC_TRACING</p></td>
<td align="left"><p>Enables boot performance tracing events to be generated.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ENABLE_BOOT_PERF_CPU_PROFILING_TRACING</p></td>
<td align="left"><p>Enables CPU profiling events on top of what ENABLE_BOOT_PERF_BASIC_TRACING enables.</p></td>
</tr>
</tbody>
</table>

 

**Debug features**

Use the following settings to specify the transport that is used for debugging. If a debugging feature is not specified, debugging will not be enabled in MMOS.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>KDNETUSB_ON</p></td>
<td align="left"><p>Includes all kernel debugger transports and enables KDNET over USB.</p></td>
</tr>
<tr class="even">
<td align="left"><p>KDUSB_ON</p></td>
<td align="left"><p>Includes all kernel debugger transports and enables KDUSB.</p>
<div class="alert">
<strong>Note</strong>  
<p>Do not include either KDUSB_ON or KDNETUSB_ON if you need to enable MTP or IP over USB in the image. If the kernel debugger is enabled in the image and the debug transports are used to connect to the phone, the kernel debugger has exclusive use of the USB port and prevents MTP and IP over USB from working.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>KDSERIAL_ON</p></td>
<td align="left"><p>Includes all kernel debugger transports and enables KDSERIAL with the following settings: 115200 Baud, 8 bit, no parity.</p></td>
</tr>
<tr class="even">
<td align="left"><p>KD</p></td>
<td align="left"><p>Includes all kernel debugger transports in the image, but does not enable the kernel debugger.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MFGCRASHDUMPSUPPORT</p></td>
<td align="left"><p>This feature enables offline crash dump functionality by using the wpcrdmp method for MMOS images. When the device crashes, it activates wpcrdmp and saves a dump of the memory and SOC subsystems to the disk for an offline investigation.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MWDBGSRV</p></td>
<td align="left"><p>This feature adds support for the user mode debug server.</p></td>
</tr>
</tbody>
</table>

 

The previous DEBUGGERON feature has been deprecated.

**Other debug features**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p></p></td>
<td align="left"><p>Dumpsize setting features - The following three features must only be used with the Test and Health image types. These features must not be used with retail images. Only one dumpsize setting can be selected at a time.</p></td>
</tr>
<tr class="even">
<td align="left"><p>DUMPSIZE512MB</p></td>
<td align="left"><p>Specifies a pre-allocated crash dump file size of 592 MB. This is intended for a phone with 512 MB of memory.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>DUMPSIZE1G</p></td>
<td align="left"><p>Specifies a pre-allocated crash dump file size of 1104 MB. This is intended for a phone with 1024 MB of memory.</p></td>
</tr>
<tr class="even">
<td align="left"><p>DUMPSIZE2G</p></td>
<td align="left"><p>Specifies a pre-allocated crash dump file size of 2128 MB. This is intended for a phone with 2048 MB of memory.</p></td>
</tr>
<tr class="odd">
<td align="left"><p></p></td>
<td align="left"><p>Dump data storage location - The next two settings control if crash dump data is stored on eMMC or if crash dump data is stored on an SD card. Only one of these settings can be selected at a time. These two features must only be used with the Test, Health and Selfhost image types. These features must not be used with retail images.</p></td>
</tr>
<tr class="even">
<td align="left"><p>DEDICATEDDUMPONEMMC</p></td>
<td align="left"><p>Specifies that the DedicatedDumpFile location as c:\crashdump\dedicateddump.sys.</p>
<div class="alert">
<strong>Note</strong>  This cannot be used with DEDICATEDDUMPONSDCARD.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>DEDICATEDDUMPONSD</p></td>
<td align="left"><p>DEDICATEDDUMPONSD – Specifies that the DedicatedDumpFile location as d:\dedicateddump.sys</p>
<p>When DEDICATEDDUMPONSD is used, crash dump will be disabled if the user removes the SD card or if the card is not present when the device booted. To re-enable crash dump:</p>
<ol>
<li><p>Set this registry key <code>HKLM\System\CurrentControlSet\Control\CrashControl\CrashDumpEnabled</code> to the value of <code>HKLM\System\CurrentControlSet\Control\CrashControl\ExpectedCrashDumpEnabled</code></p></li>
<li><p>Reboot the device.</p></li>
</ol>
<div class="alert">
<strong>Note</strong>  This cannot be used with DEDICATEDDUMPONEEMC.
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td align="left"><p>DBGCHKDISABLE</p></td>
<td align="left"><p>This feature disables debugger connection checking and the debugger connection status is ignored.</p>
<p>The effect on the debugger behavior is different depending on the SoC that is being used.</p>
<ul>
<li><p>For QC8x26 and QC8974 devices, include DBGCHKDISABLE to ensure that offline dumps will be generated even if the device is connected to a debugger. Otherwise, an Offline Dump (Bug Check Code 0x14C dump) will not be created but a raw dump will still be created.</p></li>
<li><p>For 8960 devices, include DBGCHKDISABLE to ensure that offline dumps will be generated even if the device is connected to a debugger. Otherwise, an Offline Dump (i.e. Bug Check Code 0x14C dump) will not be created.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><p>MSVCRT_DEBUG</p></td>
<td align="left"><p>This feature adds support for explicit linking of debug c-runtime libs by including msvcp120d.dll and msvcr120d.dll in the image. For more information, see this topic on MSDN: [CRT Library Features](http://msdn.microsoft.com/library/abx4dbyh.aspx).</p></td>
</tr>
<tr class="even">
<td align="left"><p>MWDBGSRV</p></td>
<td align="left"><p>This feature adds support for the user mode debug server.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>NOLIVEDUMPS</p></td>
<td align="left"><p>Disables non-fatal kernel error reports.  These reports contain debugging information for OS and driver developers.</p></td>
</tr>
<tr class="even">
<td align="left"><p>TELEMETRYONSDCARD</p></td>
<td align="left"><p>This feature enables temporary storage of debugging logs and files on the SD card.  This feature is only appropriate for test/self-host images and only on devices with less than 8 GB of free space of primary storage.</p></td>
</tr>
</tbody>
</table>

 

**Customer Care WIM Images**

The following features are supported in MMOS in the manufacturing production environment.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ENABLE_BOOT_KEYS_RETAIL</p></td>
<td align="left"><p>Enables a set of buttons on the phone for use in retail device. This feature is mutually exclusive with <strong>ENABLE_BOOT_KEYS_TEST</strong> (see the previous table).</p></td>
</tr>
<tr class="even">
<td align="left"><p>ENABLE_IP_OVER_USB</p></td>
<td align="left"><p>Enables IP Over USB.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ENABLE_USB_COMPOSITE</p></td>
<td align="left"><p>Enables the systems on a chip (SoC) provided composite USB stack in MMOS.</p></td>
</tr>
</tbody>
</table>

 

**Dual use features**

These MMOS features can be used with either test or retail customer care images.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>ENABLE_MMOS_CHARGING</p></td>
<td align="left"><p>Enables battery charging when running in MMOS.</p></td>
</tr>
</tbody>
</table>

 

UEFI charging must be either disabled or enabled for MMOS to work. Only one of these options can be set at a time.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>ENABLE_UEFI_CHARGING</p></td>
<td align="left"><p>Enables battery charging when running in UEFI.</p></td>
</tr>
<tr class="even">
<td align="left"><p>DISABLE_UEFI_CHARGING</p></td>
<td align="left"><p>Disables battery charging when running in UEFI.</p></td>
</tr>
</tbody>
</table>

 

There are additional features that are defined in other image types of the operating system that are not supported in MMOS. This list is not exhaustive, but it provides examples of features that are not supported in the manufacturing or retail environments:

-   TESTINFRASTRUCTURE

-   IMGFAKELED

-   LABIMAGE

-   LOCATIONFRAMEWORKAPP

### <span id="Adding"></span><span id="adding"></span><span id="ADDING"></span>Configuring the MMOS MfgOEMInput.xml file

1.  Open the sample MfgOEMInput.xml file using a text editor. By default, this file is installed to %WPDKCONTENTROOT%\\OEMInputSamples\\8960Fluid.

2.  Add needed MMOS features as described previously.

3.  Add any required OEM packages to the file.

4.  Locate the **Product** element and confirm that it is set to "`Manufacturing OS`".

    You can optionally update the description to record information about the OS image.

    ``` syntax
    <Description>Manufacturing OS generation for ARM.fre</Description>
    <Product>Manufacturing OS</Product>
    ```

5.  Locate the **SOC** and **Device** elements and change them as necessary.

6.  Add %WPDKCONTENTROOT%\\Tools\\bin\\i386 to your environment **Path** variable.

 

 





