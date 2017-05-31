---
author: Justinha
Description: 'BCDBoot Command-Line Options'
ms.assetid: 294a0181-f3e9-42c1-8e7f-5a5c28323e25
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'BCDBoot Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BCDBoot Command-Line Options


BCDBoot is a command-line tool used to configure the boot files on a PC or device to run the Windows operating system. You can use the tool in the following scenarios:

-   **Add boot files to a PC after applying a new Windows image.** In a typical image-based Windows deployment, use BCDBoot to set up the firmware and system partition to boot to your image. To learn more, see [Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md).
-   **Set up the PC to boot to a virtual hard disk (VHD) file that includes a Windows image.** To learn more, see [Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu](boot-to-vhd--native-boot--add-a-virtual-hard-disk-to-the-boot-menu.md).
-   **Repair the system partition.** If the system partition has been corrupted, you can use BCDBoot to recreate the system partition files by using new copies of these files from the Windows partition.
-   **Set up or repair the boot menu on a dual-boot PC.** If you've installed more than one copy of Windows on a PC, you can use BCDBoot to add or repair the boot menu.

## <span id="File_Locations"></span><span id="file_locations"></span><span id="FILE_LOCATIONS"></span>File Locations


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>In Windows and Windows Preinstallation Environment (WinPE)</p></td>
<td align="left"><p>%WINDIR%\System32\BCDBoot.exe</p></td>
</tr>
<tr class="even">
<td align="left"><p>In the Windows Assessment and Deployment Kit (Windows ADK):</p></td>
<td align="left"><p>C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\BCDBoot\BCDBoot.exe</p></td>
</tr>
</tbody>
</table>

 

## <span id="Supported_operating_systems"></span><span id="supported_operating_systems"></span><span id="SUPPORTED_OPERATING_SYSTEMS"></span>Supported operating systems


BCDBoot can copy boot environment files from images of Windows 10, Windows 8.1, Windows 8, Windows 7, Windows Vista, Windows Server 2016 Technical Preview, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2, or Windows Server 2008.

## <span id="How_It_Works"></span><span id="how_it_works"></span><span id="HOW_IT_WORKS"></span>How It Works


To configure the system partition, BCDBoot copies a small set of boot-environment files from the installed Windows image to the system partition.

BCDBoot can create a Boot Configuration Data (BCD) store on the system partition using the latest version of the Windows files:

-   BCDBoot creates a new BCD store and initialize the BCD boot-environment files on the system partition, including the Windows Boot Manager, using the %WINDIR%\\System32\\Config\\BCD-Template file.
-   New in Windows 10: During an upgrade, BCDBoot preserves any other existing boot entries, such as **debugsettings**, when creating the new store. Use the **/c** option to ignore the old settings and start fresh with a new BCD store.
-   If there is already a boot entry for this Windows partition, by default, BCDBoot erases the old boot entry and its values. Use the **/m** option to retain the values from an existing boot entry when you update the system files.
-   By default, BCDBoot moves the boot entry for the selected Windows partition to the top of the Windows Boot Manager boot order. Use the **/d** option to preserve the existing boot order.

On UEFI PCs, BCDBoot can update the firmware entries in the device’s NVRAM:

-   BCDBoot adds a firmware entry in the NVRAM to point to the Windows Boot Manager. By default, this entry is placed as the first item in the boot list. Use the **/p** option to preserve the existing UEFI boot order. Use **/addlast** to add it to the bottom of the boot order list.

## <span id="Command-Line_Options"></span><span id="command-line_options"></span><span id="COMMAND-LINE_OPTIONS"></span>Command-Line Options


The following command-line options are available for BCDBoot.exe.

**BCDBOOT** &lt;*source*&gt; \[**/l** &lt;*locale*&gt;\] \[**/s** &lt;*volume-letter*&gt; \[**/f** &lt;*firmware type*&gt;\]\] \[**/v**\] \[**/m** \[{*OS Loader GUID*}\]\] \[**/addlast** or **/p**\] \[**/d**\] \[**/c**\]

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Option</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><em>&lt;source&gt;</em></p></td>
<td align="left"><p>Required. Specifies the location of the Windows directory to use as the source for copying boot-environment files.</p>
<p>The following example initializes the system partition by using BCD files from the C:\Windows folder:</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>/l <em>&lt;locale&gt;</em></p></td>
<td align="left"><p>Optional. Specifies the locale. The default is US English (<code>en-us</code>).</p>
<p>The following example sets the default BCD locale to Japanese:</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /l ja-jp</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p>/s <em>&lt;volume letter&gt;</em></p></td>
<td align="left"><p>Optional. Specifies the volume letter of the system partition. This option should not be used in typical deployment scenarios.</p>
<p>Use this setting to specify a system partition when you are configuring a drive that will be booted on another computer, such as a USB flash drive or a secondary hard drive.</p>
<p><strong>UEFI</strong>:</p>
<ul>
<li><p>BCDBoot copies the boot files to either the EFI system partition, or the partition specified by the /s option.</p>
<p>BCDBoot creates the BCD store in the same partition.</p>
<p>By default, BCDBoot creates a Windows Boot Manager entry in the NVRAM on the firmware to identify the boot files on the system partition. If the /s option is used, then this entry is not created. Instead, BCDBoot relies on the default firmware settings to identify the boot files on the system partition. By the UEFI 2.3.1 spec, the default firmware settings should open the file: \efi\boot\bootx64.efi in the EFI System Partition (ESP).</p></li>
</ul>
<p><strong>BIOS</strong>:</p>
<ol>
<li><p>BCDBoot copies the boot files to either the active partition on the primary hard drive, or the partition specified by the /s option.</p></li>
<li><p>BCDBoot creates the BCD store in the same partition.</p></li>
</ol>
<p>The following example copies BCD files from the C:\Windows folder to a system partition on a secondary hard drive that will be booted on another computer. The system partition on the secondary drive was assigned the volume letter <em>S</em>:</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /s S:</code></pre>
<p>The following example creates boot entries on a USB flash drive with the volume letter S, including boot files to support either a UEFI-based or a BIOS-based computer:</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /s S: /f ALL</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>/f <em>&lt;firmware type&gt;</em></p></td>
<td align="left"><p>Optional. Specifies the firmware type. Valid values include <code>UEFI</code>, <code>BIOS</code>, and <code>ALL</code>.</p>
<ul>
<li><p>On BIOS/MBR-based systems, the default value is <code>BIOS</code>. This option creates the <strong>\Boot</strong> directory on the system partition and copies all required boot-environment files to this directory.</p></li>
<li><p>On UEFI/GPT-based systems, the default value is <code>UEFI</code>. This option creates the <strong>\Efi\Microsoft\Boot</strong> directory and copies all required boot-environment files to this directory.</p></li>
<li><p>When you specify the <code>ALL</code> value, BCDBoot creates both the <strong>\Boot</strong> and the <strong>\Efi\Microsoft\Boot</strong> directories, and copies all required boot-environment files for BIOS and UEFI to these directories.</p></li>
</ul>
<p>If you specify the <strong>/f</strong> option, you must also specify the <strong>/s</strong> option to identify the volume letter of the system partition.</p>
<p>The following example copies BCD files that support booting on either a UEFI-based or a BIOS-based computer from the C:\Windows folder to a USB flash drive that was assigned the volume letter <em>S</em>:</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /s S: /f ALL </code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p>/v</p></td>
<td align="left"><p>Optional. Enables verbose mode. Example:</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /v</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>/m [<em>{OS Loader GUID}</em>]</p></td>
<td align="left"><p>Optional. Merges the values from an existing boot entry into a new boot entry.</p>
<p>By default, this option merges only global objects. If you specify an <em>OS Loader GUID</em>, this option merges the loader object in the system template to produce a bootable entry.</p>
<p>The following example merges the operating-system loader in the current BCD store that the specified GUID identifies in the new BCD store:</p>
<pre class="syntax" space="preserve"><code>bcdboot c:\Windows /m {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p>/addlast</p></td>
<td align="left"><p>Optional. Specifies that the Windows Boot Manager firmware entry should be added last. The default behavior is to add it first. Cannot be used with /p.</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /addlast</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>/p</p></td>
<td align="left"><p>Optional. Specifies that the existing Windows Boot Manager firmware entry position should be preserved in the UEFI boot order. If entry does not exist, a new entry is added in the first position. Cannot be used with /addlast.</p>
<p>By default, during an upgrade BCDBoot moves the Windows Boot Manager to be the first entry in the UEFI boot order.</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /p
bcdboot C:\Windows /p /d</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p>/d</p></td>
<td align="left"><p>Optional. Preserves the existing default operating system entry in the {bootmgr} object in Windows Boot Manager.</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /d</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p>/c</p></td>
<td align="left"><p>Optional. Specifies that any existing BCD elements should not be migrated.</p>
<p>New for Windows 10: By default, during an upgrade, BCD elements such as <strong>debugsettings</strong> or <strong>flightsigning</strong> are preserved.</p>
<pre class="syntax" space="preserve"><code>bcdboot C:\Windows /c</code></pre></td>
</tr>
</tbody>
</table>

 

## <span id="Repair_the_system_partition"></span><span id="repair_the_system_partition"></span><span id="REPAIR_THE_SYSTEM_PARTITION"></span>Repair the system partition


If the system partition has been corrupted, you can use BCDBoot to recreate the system partition files by using new copies of these files from the Windows partition.

1.  Boot your PC to a command line. For example, boot to the Windows installation disk and press Shift+F10, or boot to Windows PE ([WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)).

2.  Use Diskpart to determine which drive letter contains your Windows partition and system partition (`diskpart, list vol, exit`).

3.  Optional: Format your system partition: `format (drive letter of your system partition) /q`

4.  Add a boot entry for your Windows partition: `bcdboot D:\Windows`

5.  Reboot the PC. Windows should appear.

## <span id="Set_up_or_repair_the_boot_menu_on_a_dual-boot_PC"></span><span id="set_up_or_repair_the_boot_menu_on_a_dual-boot_pc"></span><span id="SET_UP_OR_REPAIR_THE_BOOT_MENU_ON_A_DUAL-BOOT_PC"></span>Set up or repair the boot menu on a dual-boot PC


When setting up a PC to boot more than one operating system, you may sometimes lose the ability to boot into one of the operating systems. The BCDBoot option allows you to quickly add boot options for a Windows-based operating system. To set up a dual-boot PC:

1.  Install a separate hard drive or prepare a separate partition for each operating system.

2.  Install the operating systems. For example, if your PC has Windows 7, install Windows 10 onto the other hard drive or partition.

3.  Reboot the PC. The boot menus should appear with both operating systems listed.

    If both operating systems aren't listed:

    1.  Open a command line, either as an administrator from inside Windows, or by booting to a command line using the Windows installation media and pressing Shift+F10, or by booting to Windows PE ([WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)).
    2.  Add boot options for a Windows operating system.

        ``` syntax
        bcdboot D:\Windows
        ```

    3.  Reboot the PC. Now, the boot menu will show both menu options.

## <span id="Troubleshooting"></span><span id="troubleshooting"></span><span id="TROUBLESHOOTING"></span>Troubleshooting


For information about repairing the boot files on a PC with Windows XP and a more recent version of Windows such as Windows 7, see the Microsoft Knowledge Base Article [2277998](http://go.microsoft.com/fwlink/?LinkId=234039).

## <span id="related_topics"></span>Related topics


[Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md)

[Configure BIOS/MBR-Based Hard Drive Partitions](configure-biosmbr-based-hard-drive-partitions.md)

[Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md)

[BCDedit](http://go.microsoft.com/fwlink/?LinkId=128459)

[Bootsect Command-Line Options](bootsect-command-line-options.md)

[Diskpart Command line syntax](http://go.microsoft.com/fwlink/?LinkId=128458)

 

 






