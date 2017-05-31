---
author: Justinha
Description: 'Bootsect Command-Line Options'
ms.assetid: 2021a0b5-955a-4193-a6e2-9864c047d82d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Bootsect Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Bootsect Command-Line Options


Bootsect.exe updates the master boot code for hard disk partitions to switch between Bootmgr and NT Loader (**NTLDR**). You can use this tool to restore the boot sector on your computer. This tool replaces **FixFAT** and **FixNTFS**.

## <span id="Bootsect_Commands"></span><span id="bootsect_commands"></span><span id="BOOTSECT_COMMANDS"></span>Bootsect Commands


Bootsect uses the following command-line options:

**bootsect {/help | /nt52 | /nt60} {SYS | ALL | &lt;DriveLetter:&gt;} \[/force\] /mbr**

For example, to apply the master boot code that is compatible with NTLDR to the volume labeled E, use the following command:

**bootsect /nt52 E:**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Command-line options</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>/help</strong></p></td>
<td align="left"><p>Displays these usage instructions.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/nt52</strong></p></td>
<td align="left"><p>Applies the master boot code that is compatible with NTLDR to <strong>SYS</strong>, <strong>ALL</strong>, or &lt;DriveLetter&gt;. The operating system installed on <strong>SYS</strong>, <strong>ALL</strong>, or &lt;DriveLetter&gt; must be older than Windows Vista.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/nt60</strong></p></td>
<td align="left"><p>Applies the master boot code that is compatible with Bootmgr to <strong>SYS</strong>, <strong>ALL</strong>, or &lt;DriveLetter&gt;. The operating system installed on <strong>SYS</strong>, <strong>ALL</strong>, or &lt;DriveLetter&gt; must be Windows 8, Windows® 7, Windows Vista, Windows Server® 2012, Windows Server 2008 R2, or Windows Server 2008.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>SYS</strong></p></td>
<td align="left"><p>Updates the master boot code on the system partition that is used to boot Windows.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>ALL</strong></p></td>
<td align="left"><p>Updates the master boot code on all partitions. The <strong>ALL</strong> option does not necessarily update the boot code for each volume. Instead, this option updates the boot code on volumes that can be used as Windows boot volumes, which excludes any dynamic volumes that are not connected with an underlying disk partition. This restriction is present because boot code must be located at the beginning of a disk partition.</p></td>
</tr>
<tr class="even">
<td align="left"><p>&lt;DriveLetter&gt;</p></td>
<td align="left"><p>Updates the master boot code on the volume associated with this drive letter. Boot code will not be updated if either:</p>
<ul>
<li><p>&lt;DriveLetter&gt; is not associated with a volume</p></li>
<li><p>&lt;DriveLetter&gt; is associated with a volume not connected to an underlying disk partition.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/force</strong></p></td>
<td align="left"><p>Forcibly dismounts the volumes during the boot code update. You must use this option with caution.</p>
<p>If Bootsect.exe cannot gain exclusive volume access, then the file system may overwrite the boot code before the next reboot. Bootsect.exe always attempts to lock and dismount the volume before each update. When <strong>/force</strong> is specified, a forced dismount is tried if the initial lock attempt fails. A lock can fail, for example, if files on the destination volume are currently opened by other programs.</p>
<p>When successful, a forced dismount enables exclusive volume access and a reliable boot code update even though the initial lock failed. At the same time, a forced dismount invalidates all open handles to files on the destination volume. This can cause unexpected behavior from the programs that opened these files. Therefore, use this option with caution.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/mbr</strong></p></td>
<td align="left"><p>Updates the master boot record without changing the partition table on sector 0 of the disk that contains the partition specified by <strong>SYS</strong>, <strong>ALL</strong>, or &lt;drive letter&gt;. When used with the <strong>/nt52</strong> option, the master boot record is compatible with operating systems older than Windows Vista. When used with the <strong>/nt60</strong> option, the master boot record is compatible with Windows 8, Windows 7, Windows Vista, Windows Server 2012, Windows Server 2008 R2, or Windows Server 2008.</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

 

 






