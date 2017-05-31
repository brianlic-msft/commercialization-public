---
author: Justinha
Description: 'Windows 8.1 Upgrade Scenarios for OEMs'
ms.assetid: 92f0ef1c-06e0-4f9b-8009-9567ae1bfaac
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Windows 8.1 Upgrade Scenarios for OEMs'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows 8.1 Upgrade Scenarios for OEMs


The Windows 8.1 upgrade retains the majority of OEM customizations, including OEM branding, apps, help and support information, drivers, and OEM store listings. Some OEM solutions, including a custom Help and Support experience or custom recovery solution might not persist through the upgrade. To mitigate any potential problems for your customers, test the end-to-end upgrade experience.

The Windows 8.1 can be installed from the Windows Store or from media.

Upgrade options for Windows 8.1 include:

-   **Full Upgrade** preserves apps, user data, user accounts, and PC settings.

-   **Data Only** preserves user accounts and data, but doesn’t preserve desktop application installs or OS settings. Drivers that are critical for installation (storage and networking drivers) are migrated to the new installation.

-   **Clean install** doesn’t save any data or Windows configurations.

All personal files, and Windows files and directories, are moved to a Windows.old folder, and can be accessed after Windows Setup is complete. Personal files will remain in Windows.old. After a period of time, Windows files from the previous installation are removed.

The supported options for upgrade are:

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Previous OS</th>
<th align="left">Full Upgrade</th>
<th align="left">Data Only</th>
<th align="left">Clean Install</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Windows 8 (from Windows Store)</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows RT (from Windows Store)</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows 8 (from Media)</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows 7 (from Media)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
</tbody>
</table>

 

Windows 8.1 upgrade installations from Windows Vista and Windows XP aren’t supported.

## <span id="ROLLBACK"></span><span id="rollback"></span>System Rollback log files


Rollback to the previous installation occurs when the Windows upgrade fails. Troubleshoot issues by looking at the log files (*&lt;Drive&gt;*$Windows.~BT\\sources\\Panther and sources\\Rollback, where *&lt;Drive&gt;* is the root of the drive where Windows is installed).

**Warning**  
The Push-Button Reset image will no longer be available on Windows RT devices if a system rollback occurs.

 

## <span id="LOWDISK"></span><span id="lowdisk"></span>Low disk space


Windows 8.1 can be installed on PCs with limited disk space. The Windows upgrade process compresses the previous Windows installation and deletes large cache files.

## <span id="WinRE"></span><span id="winre"></span><span id="WINRE"></span>Windows RE


A Windows 8.1 version of Windows RE is installed so that the operating system can be repaired. During the upgrade, boot critical and input device drivers are added to the new Windows RE image.

Windows RE is installed in the following ways:

1.  The existing Windows RE partition is used on Windows RT.

2.  The Windows RE partition is left in place on Windows 8 PCs with an OEM-configured Windows RE partition. A new Windows RE partition is created by shrinking the Windows partition.

3.  The existing Windows RE partition is used on Windows 8 PCs with a generic Windows RE partition.

**Caution**  
Any OEM customizations to the existing Windows RE image aren’t migrated to the new Windows RE image.

 

## <span id="RECPBR"></span><span id="recpbr"></span>Recovery Image for Push Button Reset


The Push Button Reset image is updated based on the following implementation:

Before upgrade
After upgrade
Platform
**Local recovery image availability**

**Upgrade method**

**Recovery image**

**Recovery Image partition**

x64, x86

Local recovery image is available

Media or Windows Store

Existing Windows 8 recovery image

Existing partition is unmodified

x64, x86

Local recovery image is not available

Media or Windows Store

None

None

Windows RT

Local recovery image is available

Windows Store

New Windows 8.1 recovery image

Existing partition is reused

Windows RT

Local recovery image is not available

Windows Store

None

None

 

On Windows RT PCs with an existing recovery image, the image will be replaced by a Windows 8.1 recovery image. The following customizations are migrated to the Windows 8.1 recovery image, including:

-   Store customizations and licenses for pre-loaded Windows Store apps

-   Drivers compatible with Windows 8.1

-   OEM support information

The recovery image will remain on Windows 8 PCs with an existing recovery image.

If the previous operating system doesn’t have an existing recovery image partition, no recovery image or partitions are created.

## <span id="DRIVERS"></span><span id="drivers"></span>Drivers


In Full upgrade scenarios, the following driver types are migrated:

-   Compatible drivers

-   Third-party drivers installed by an OEM or end-user

-   Storage drivers that are critical to installation are migrated to Windows PE as well as the operating system in all upgrade scenarios.

The following drivers are not migrated:

-   Third-party in-box drivers, such as printer drivers, aren’t migrated because the new operating system typically contains more up-to-date drivers.

-   Software filter drivers aren’t migrated, with the exception of antivirus filter drivers, or drivers installed by an .inf file.

Network and Wi-Fi drivers are migrated on clean installations and Data Only upgrade scenarios.

All migrated drivers are placed in the driver repository and Windows automatically installs drivers during PnP based on the criteria defined in [How Windows Ranks Drivers](http://go.microsoft.com/fwlink/?LinkId=294347).

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Windows Setup Log Files and Event Logs](windows-setup-log-files-and-event-logs.md)

 

 






