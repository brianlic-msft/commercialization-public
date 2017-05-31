---
author: Justinha
Description: 'Oscdimg Command-Line Options'
ms.assetid: 4c64a7fe-3bab-4ab9-97ed-1b14e820b0c8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Oscdimg Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Oscdimg Command-Line Options


Oscdimg is a command-line tool that you can use to create an image (.iso) file of a customized 32-bit or 64-bit version of Windows Preinstallation Environment (Windows PE). You can then burn the .iso file to a CD or DVD. Oscdimg supports ISO 9660, Joliet, and Universal Disk Format (UDF) file systems.

In this topic:

-   [File System Options](#file)

-   [CD or DVD Boot Options](#bootoptions)

-   [Optimization Options](#optim)

-   [Order Options](#order)

-   [DVD Video and Audio Options](#video)

-   [Messaging Options](#mess)

-   [General Image Creation Options](#general)

-   [Examples](#examples)

## <span id="Oscdimg_Command-Line_Options"></span><span id="oscdimg_command-line_options"></span><span id="OSCDIMG_COMMAND-LINE_OPTIONS"></span>Oscdimg Command-Line Options


The following command-line options are available for Oscdimg.

**Oscdimg** \[*&lt;options&gt;*\] *&lt;sourceLocation&gt;* *&lt;destinationFile&gt;*

### <span id="file"></span><span id="FILE"></span>File System Options

The Oscdimg tool and Microsoft Windows image mastering API (IMAPI) support three file system formats: ISO 9660, Joliet, and UDF.

### <span id="iso"></span><span id="ISO"></span>ISO 9660 Options

ISO 9660 options cannot be combined with Joliet or UDF options. The length of the file name combined with the length of the file name extension cannot exceed 30 characters in the ISO 9660 file system.

The **-d** and **-nt** options cannot be used together.

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
<td align="left"><p><strong>-d</strong></p></td>
<td align="left"><p>Permits lower case file names. Does not force lowercase file names to upper case.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-n</strong></p></td>
<td align="left"><p>Permits file names longer than DOS 8.3 file names.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-nt</strong></p></td>
<td align="left"><p>Permits long file names that are compatible with Windows NT 3.51.</p></td>
</tr>
</tbody>
</table>

 

### <span id="joliet"></span><span id="JOLIET"></span>Joliet Options

Joliet is an extension of the ISO 9660 file system. Joliet allows longer file names, Unicode characters, and directory depths larger than eight. Joliet options cannot be combined with ISO 9660 options.

The **-j2** Joliet option cannot be used with any UDF options.

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
<td align="left"><p><strong>-j1</strong></p></td>
<td align="left"><p>Permits both file systems to view all the data on the disk. Using this option does not duplicate all files on the image. This option encodes Joliet Unicode file names and generates DOS-compatible 8.3 file names in the ISO 9660 namespace. These file names can be read by either Joliet systems or conventional ISO 9660 systems. However, Oscdimg may change some of the file names in the ISO 9660 namespace to comply with DOS 8.3 and ISO 9660 naming restrictions.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-j2</strong></p></td>
<td align="left"><p>Encodes Joliet Unicode file names without standard ISO 9660 names. This option is used to produce an image that contains only the Joliet file system.  Any system that cannot read Joliet sees only a default text file that alerts the user that this image is only available on computers that support Joliet.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-js</strong></p></td>
<td align="left"><p>Overrides the default text file that is used when the user specifies the <strong>-j2</strong> option. For example:</p>
<pre class="syntax" space="preserve"><code>-jsC:\readme.txt</code></pre></td>
</tr>
</tbody>
</table>

 

### <span id="udf"></span><span id="UDF"></span>UDF Options

UDF options cannot be combined with ISO 9660 options. The **-ue**, **-uf**, and **-us** options only apply when they are used together with the **-u2** option.

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
<td align="left"><p><strong>-u1</strong></p></td>
<td align="left"><p>Produces an image that has both the UDF file system and the ISO 9660 file system. The ISO 9660 file system is written by using DOS-compatible 8.3 file names. The UDF file system is written by using Unicode file names.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-u2</strong></p></td>
<td align="left"><p>Produces an image that contains only the UDF file system. Any system that cannot read UDF sees only a default text file that alerts the user that this image is only available on computers that support UDF.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-udfver102</strong></p></td>
<td align="left"><p>Specifies UDF file system version 1.02.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-ue</strong></p></td>
<td align="left"><p>Creates embedded files.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-uf</strong></p></td>
<td align="left"><p>Embeds UDF file identifier entries.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-ur</strong></p></td>
<td align="left"><p>Overrides the default text file that is used together with the <strong>-u2</strong> option. For example:</p>
<pre class="syntax" space="preserve"><code>-urC:\Readme.txt</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-us</strong></p></td>
<td align="left"><p>Creates sparse files, when available, to make disk space usage more efficient.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-yl</strong></p></td>
<td align="left"><p>Specifies long allocation descriptors instead of short allocation descriptors.</p></td>
</tr>
</tbody>
</table>

 

### <span id="bootOptions"></span><span id="bootoptions"></span><span id="BOOTOPTIONS"></span>CD or DVD Boot Options

Boot options can be used to create bootable CD or DVD images. The following boot options can be used to generate single-boot entries. For more information, see [Use a single boot entry to create a bootable image](#example_singleboot).

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
<td align="left"><p><strong>-b</strong><em>&lt;bootSectorFile&gt;</em></p></td>
<td align="left"><p>Specifies the El Torito boot sector file that will be written in the boot sector or sectors of the disk. Do not use spaces. For example:</p>
<p>On UEFI: <code>-bC:\winpe_x86\Efisys.bin</code></p>
<p>On BIOS: <code>-bC:\winpe_x86\Etfsboot.com</code></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-e</strong></p></td>
<td align="left"><p>Disables floppy disk emulation in the El Torito catalog.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-p</strong></p></td>
<td align="left"><p>Specifies the value to use for the platform ID in the El Torito catalog. The default ID is 0xEF to represent a Unified Extensible Firmware Interface (UEFI) system. 0x00 represents a BIOS system.</p></td>
</tr>
<tr class="even">
<td align="left"><p><em>&lt;sourceLocation&gt;</em></p></td>
<td align="left"><p>Required. Specifies the location of the files that you intend to build into an .iso image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><em>&lt;targetFile&gt;</em></p></td>
<td align="left"><p>Specifies the name of the .iso image file.</p></td>
</tr>
</tbody>
</table>

 

**Important**  
Single-boot entries and multi-boot entries cannot be combined in the same command.

 

The following boot options can be used to generate multi-boot entries. For more information, see [Use multi-boot entries to create an image file](#examples_multi-boot).

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
<td align="left"><p><strong>b</strong><em>&lt;bootSectorFile&gt;</em></p></td>
<td align="left"><p>Specifies the El Torito boot sector file that will be written in the boot sector or sectors of the disk. Do not use spaces. For example:</p>
<p>On UEFI: <code>bEfisys.bin</code></p>
<p>On BIOS: <code>bEtfsboot.com</code></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-bootdata:</strong><em>&lt;number&gt;</em></p></td>
<td align="left"><p>Specifies a multi-boot image, followed by the number of boot entries. Do not use spaces. For example:</p>
<pre class="syntax" space="preserve"><code>-bootdata:&lt;3&gt;#&lt;defaultBootEntry&gt;#&lt;bootEntry1&gt;#&lt;bootEntryN&gt;</code></pre>
<p>where <em>&lt;3&gt;</em> is the number of boot entries that follow.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>e</strong></p></td>
<td align="left"><p>Disables floppy disk emulation in the El Torito catalog.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>p</strong></p></td>
<td align="left"><p>Specifies the value to use for the platform ID in the El Torito catalog. The default ID is 0xEF to represent a UEFI system. 0x00 represents a BIOS system.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>t</strong></p></td>
<td align="left"><p>Specifies the El Torito load segment. If not specified, this option defaults to 0x7C0.</p></td>
</tr>
<tr class="even">
<td align="left"><p><em>&lt;sourceLocation&gt;</em></p></td>
<td align="left"><p>Required. Specifies the location of the files that you intend to build into an .iso image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><em>&lt;targetFile&gt;</em></p></td>
<td align="left"><p>Specifies the name of the .iso image file.</p></td>
</tr>
</tbody>
</table>

 

### <span id="optim"></span><span id="OPTIM"></span>Optimization Options

Optimization options can be used to optimize storage by encoding duplicate files only once.

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
<td align="left"><p><strong>-o</strong></p></td>
<td align="left"><p>Uses a MD5 hashing algorithm to compare files.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-oc</strong></p></td>
<td align="left"><p>Uses a binary comparison of each file, and is slower than the <strong>-o</strong> option.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-oi</strong></p></td>
<td align="left"><p>Ignores Diamond compression timestamps when comparing files.</p></td>
</tr>
</tbody>
</table>

 

### <span id="order"></span><span id="ORDER"></span>Order Options

Order options specify the file order on disk. The file order does not have to list all files. Any files that do not appear in this file are ordered as they would be ordinarily (that is, if the ordering file did not exist). For more information, see [Specify the boot order](#example_bootorder).

The **-yo** option takes precedence over the **-y5** option.

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
<td align="left"><p><strong>-y5</strong></p></td>
<td align="left"><p>Specifies file layout on disk. This option writes all files in an i386 directory first and in reverse sort order.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-yo</strong>&lt;bootOrder.txt&gt;</p></td>
<td align="left"><p>Specifies a text file that has a layout for the files to be put in the image. Do not use spaces. For example:</p>
<pre class="syntax" space="preserve"><code>-yoC:\temp\bootOrder.txt</code></pre></td>
</tr>
</tbody>
</table>

 

### <span id="video"></span><span id="VIDEO"></span>DVD Video and Audio Options

The DVD video and audio disk creation options cannot be combined with ISO 9660, Joliet, or UDF options.

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
<td align="left"><p><strong>-ut</strong></p></td>
<td align="left"><p>Truncates the ISO 9660 section of the image during DVD video and audio disk creation. When this option is used, only the VIDEO_TS, AUDIO_TS, and JACKET_P directories are visible from the ISO 9660 file system.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-uv</strong></p></td>
<td align="left"><p>Specifies UDF Video Zone compatibility during DVD video and audio disk creation. During creation, UDF 1.02 and ISO 9660 are written to the disk. All files in the VIDEO_TS, AUDIO_TS, and JACKET_P directories are written first. These directories take precedence over all other ordering rules that are used for this image.</p></td>
</tr>
</tbody>
</table>

 

### <span id="mess"></span><span id="MESS"></span>Messaging Options

Messaging options customize how file and directory information appears.

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
<td align="left"><p><strong>-a</strong></p></td>
<td align="left"><p>Displays the allocation summary for files and directories.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-os</strong></p></td>
<td align="left"><p>Shows duplicate files when the system creates the image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-w1</strong></p></td>
<td align="left"><p>Reports all file names or directories that are not ISO-compliant or Joliet-compliant.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-w2</strong></p></td>
<td align="left"><p>Reports all file names that are not DOS-compliant.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-w3</strong></p></td>
<td align="left"><p>Reports all zero-length files.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-w4</strong></p></td>
<td align="left"><p>Reports each file name that is copied to the image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-yd</strong></p></td>
<td align="left"><p>Suppresses warnings for non-identical files that have the same initial 64,000 bytes.</p></td>
</tr>
</tbody>
</table>

 

### <span id="general"></span><span id="GENERAL"></span>General Image Creation Options

General image creation options can be used together with a single-boot entry option or multi-boot entry options to create bootable CD or DVD images. For more information, see [Boot Options](#bootoptions) and [Examples](#examples).

The **-m** and **-maxsize** options cannot be used together.

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
<td align="left"><p><strong>-c</strong></p></td>
<td align="left"><p>Specifies that the system must use ANSI file names instead of OEM file names.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-g</strong></p></td>
<td align="left"><p>Encodes time values as Universal Coordinated Time (UCT) for all files, instead of the local time.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-h</strong></p></td>
<td align="left"><p>Includes hidden files and directories in the source path of the image.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-k</strong></p></td>
<td align="left"><p>Creates an image even if some of the source files cannot be opened.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-l</strong><em>&lt;volumeLabel&gt;</em></p></td>
<td align="left"><p>Specifies the volume label. Do not use spaces. For example:</p>
<pre class="syntax" space="preserve"><code>-l&lt;volumeLabel&gt;</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-m</strong></p></td>
<td align="left"><p>Ignores the maximum size limit of an image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-maxsize:</strong><em>&lt;limit&gt;</em></p></td>
<td align="left"><p>Overrides the default maximum size of an image. The default value is a 74-minute CD. However, if UDF is used, the default has no maximum size. Do not use spaces. For example:</p>
<pre class="syntax" space="preserve"><code>-maxsize:&lt;4096&gt;</code></pre>
<p>where <em>&lt;4096&gt;</em> limits the image to 4096 MB.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-q</strong></p></td>
<td align="left"><p>Scans the source files only. This option does not create an image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-r</strong></p></td>
<td align="left"><p>New for Windows 8. Resolves symbolic links to their target location.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-t</strong><em>&lt;mm/dd/yyyy,hh:mm:ss&gt;</em></p></td>
<td align="left"><p>Specifies the timestamp for all files and directories. Do not use spaces. You can use any delimiter between the items. For example:</p>
<pre class="syntax" space="preserve"><code>-t12/31/2000,15:01:00</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>-y6</strong></p></td>
<td align="left"><p>Specifies that directory records must be exactly aligned at the end of sectors.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>-yw</strong></p></td>
<td align="left"><p>Opens source files that have write sharing.</p></td>
</tr>
</tbody>
</table>

 

## <span id="examples"></span><span id="EXAMPLES"></span>Examples


These examples illustrate how to do the following:

-   Create a bootable CD or DVD for a UEFI-based computer by using a single-boot entry.

-   Create a bootable CD or DVD for a UEFI-based or BIOS-based computer by using a multi-boot entry.

-   Specify the boot file order on a disk.

### <span id="example_singleboot"></span><span id="EXAMPLE_SINGLEBOOT"></span>Use a single-boot entry to create a bootable image

You can use the Oscdimg tool to create a bootable CD or DVD by using a single-boot entry.

**To use a single-boot entry**

-   Create an image file for a UEFI-based computer. For example:

    ``` syntax
    Oscdimg -bC:\winpe_amd64\Efisys.bin -pEF -u1 -udfver102 C:\winpe_amd64\media C:\winpe_amd64\winpeamd64.iso
    ```

    where C:\\winpe\_amd64\\media is the location of the source files, and C:\\winpe\_amd64\\winpeamd64.iso is the path of the .iso file.

### <span id="examples_multi-boot"></span><span id="EXAMPLES_MULTI-BOOT"></span>Use multi-boot entries to create a bootable image

You can use the Oscdimg tool to create a bootable CD or DVD by using multi-boot entries. When you do this, note the following:

-   The **bootdata** option must be followed by the number of boot entries in the command (**-bootdata:***&lt;number&gt;*).

-   Each multi-boot entry must be delimited by using a hash symbol (\#).

-   Each option for a boot entry must be delimited by using a comma (,).

-   Each boot entry must specify the platform ID.

**To use multi-boot entries**

-   Create an image file for either a UEFI-based or BIOS-based computer by using a multi-boot command. For example:

    ``` syntax
    Oscdimg -bootdata:2#p0,e,bEtfsboot.com#pEF,e,bEfisys.bin -u1 
    -udfver102 C:\winpe_amd64\media C:\winpe_amd64\winpeamd64.iso
    ```

    where this command starts the Etfsboot.com boot file for a BIOS image, and then starts the Efisys.bin boot file for a UEFI image.

### <span id="example_bootorder"></span><span id="EXAMPLE_BOOTORDER"></span>Specify the boot order

For images larger than 4.5 GB, you must create a boot order file to make sure that boot files are located at the beginning of the image.

The rules for file ordering are as follows:

-   The order file must be in ANSI.

-   The order file must end in a new line.

-   The order file must have one file per line.

-   Each file must be specified relative to the root of the image.

-   Each file must be specified as a long file name. No short names are allowed.

-   Each file path cannot be longer than MAX\_PATH. This includes the volume name.

For example, D:\\cdimage would resemble the following (where D is the drive letter of the DVD drive):

-   D:\\cdimage\\1\\1.txt

-   D:\\cdimage\\2\\2.txt

-   D:\\cdimage\\3\\3.txt

-   D:\\cdimage\\3\\3\_5.txt

-   D:\\cdimage\\*&lt;longFileName&gt;*.txt

**To create a boot order file**

-   Create a boot order file. For example:

    ``` syntax
    Oscdimg -m -n -yoC:\temp\bootOrder.txt 
    -bC:\winpe_amd64\Efisys.bin C:\winpe_amd64\winpeamd64.iso
    ```

    where BootOrder.txt contains the following list of files:

    ``` syntax
    boot\bcd
    boot\boot.sdi
    boot\bootfix.bin
    boot\bootsect.exe
    boot\etfsboot.com
    boot\memtest.efi
    boot\memtest.exe
    boot\en-us\bootsect.exe.mui
    boot\fonts\chs_boot.ttf
    boot\fonts\cht_boot.ttf
    boot\fonts\jpn_boot.ttf
    boot\fonts\kor_boot.ttf
    boot\fonts\wgl4_boot.ttf
    sources\boot.wim
    ```

## <span id="related_topics"></span>Related topics


[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[Windows Deployment Command-Line Tools Reference](windows-deployment-command-line-tools-reference.md)

 

 






