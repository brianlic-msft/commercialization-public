---
author: Justinha
Description: 'DISM Driver Servicing (.inf) Command-Line Options'
ms.assetid: 39beacf3-7982-477c-93f6-4c6883efd69e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Driver Servicing (.inf) Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Driver Servicing (.inf) Command-Line Options


Use DISM with INF-style drivers to add, remove, or list drivers to an online or offline Windows image (.wim). Microsoft Windows Installer or other driver package types (such as .exe files) are not supported.

You can specify a directory where the driver INF files are located, or you can point to a driver by specifying the name of the INF file.

The base syntax for servicing a Windows image using DISM is:

**DISM.exe** {**/Image:**&lt;*path\_to\_ image\_directory*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

The following driver servicing options are available for an offline image.

**DISM.exe /image:**&lt;*path\_to\_image\_directory*&gt; \[**/Get-Drivers** | **/Get-DriverInfo** | **/Add-Driver** | **/Remove-Driver** | **/Export-Driver**\]

The following driver servicing options are available for a running operating system.

**DISM.exe /Online** \[**/Get-Drivers** | **/Get-DriverInfo** | **/Export-Driver**\]

The following table provides a description of how each driver servicing option can be used. These options are not case sensitive.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Option/Argument</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Option: <strong>/Get-Help /?</strong></p></td>
<td align="left"><p>When used immediately after a driver servicing command-line option, information about the option and the arguments is displayed. Additional topics might become available when an image is specified.</p>
<p>Examples:</p>
<p><strong>Dism /image:C:\test\offline /Add-Driver /?</strong></p>
<p><strong>Dism /online /Get-Drivers /?</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Get-Drivers</strong></p>
<p>Arguments:</p>
<p><strong>/All</strong></p>
<p><strong>/Format:{Table | List}</strong></p></td>
<td align="left"><p>Displays basic information about driver packages in the online or offline image.</p>
<p>By default, only third-party drivers will be listed. Use the <strong>/all</strong> argument to display information about default drivers and third-party drivers. Use the <strong>/Format:Table</strong> or <strong>/Format:List</strong> argument to display the output as a table or a list.</p>
<p>If you point to an image, you can determine what drivers are in the image, in addition to the state of the drivers (installed or staged).</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Get-Drivers</strong></p>
<p><strong>Dism /online /Get-Drivers</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Get-DriverInfo</strong></p>
<p>Arguments:</p>
<p><strong>/Driver:</strong>&lt;<em>installed_INF_FileName</em>&gt;</p>
<p><strong>/Driver:</strong>&lt;<em>path_to_driver.inf</em>&gt;</p></td>
<td align="left"><p>Displays detailed information about a specific driver package.</p>
<p>You can point to an INF file installed in the image, or one that is not yet installed. You can specify the name of the uninstalled driver or the third-party driver in the device driver store. Installed third-party drivers in the driver store will be named Oem0.inf, Oem1.inf, and so on. This is referred to as the published name.</p>
<p>You can specify multiple drivers on the command line by using the <strong>/driver</strong> option multiple times.</p>
<p>Example:</p>
<p>First, use the <strong>/Get-Drivers</strong> option so that you can identify a driver INF file. Then run the following command:</p>
<p><strong>Dism /image:C:\test\offline /Get-DriverInfo /driver:&lt;path_to_driver.inf&gt;</strong></p>
<p><strong>Dism /online /Get-DriverInfo /driver:C:\test\drivers\usb\usb.inf</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Add-Driver</strong></p>
<p>Arguments:</p>
<p><strong>/Driver:</strong>&lt;<em>folder_containing_INF</em>&gt;</p>
<p><strong>/Driver:</strong>&lt;<em>path_to_driver.inf</em>&gt;</p>
<p><strong>/Recurse</strong></p>
<p><strong>/ForceUnsigned</strong></p></td>
<td align="left"><p>Adds third-party driver packages to an offline Windows image.</p>
<p>When you use the <strong>/Driver</strong> option to point to a folder, INF files that are not valid driver packages are ignored. These files are reported on the console when the command runs, and a warning is included in the log file. You will not receive an error message.</p>
<p>If you point to a path and use the <strong>/Recurse</strong> option, all subfolders are queried for drivers to add.</p>
<p>For testing purposes you can use <strong>/ForceUnsigned</strong> to add unsigned drivers and override the requirement that drivers installed on X64-based computers must have a digital signature. For more information about driver signing requirements, see [Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md).</p>
<p>Examples:</p>
<p><strong>Dism /image:C:\test\offline /Add-Driver /driver:C:\test\drivers\</strong></p>
<p><strong>Dism /image:C:\test\offline /Add-Driver /driver:C:\test\drivers /recurse</strong></p>
<p><strong>Dism /image:C:\test\offline /Add-Driver /driver:C:\test\drivers\mydriver.inf</strong></p>
<p><strong>Dism /image:C:\test\offline /Add-Driver /driver:C:\test\drivers\mydriver.inf /ForceUnsigned</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Option: <strong>/Remove-Driver</strong></p>
<p>Arguments:</p>
<p><strong>/Driver:</strong>&lt;<em>published_name</em>&gt;</p></td>
<td align="left"><p>Removes third-party drivers from an offline image.</p>
<p>When third-party drivers are added, they are named Oem0.inf, Oem1.inf, and so on. You must specify the &lt;<em>published name</em>&gt; (for example, Oem1.inf) to remove the driver. You cannot remove default drivers.</p>
<div class="alert">
<strong>Warning</strong>  
<p>Removing a boot-critical driver package can make the offline Windows image unbootable.</p>
</div>
<div>
 
</div>
<p></p>
<p>You can specify multiple drivers on the command line by using the <strong>/Driver</strong> option multiple times.</p>
<p>Examples:</p>
<p><strong>Dism /image:C:\test\offline /Remove-Driver /driver:oem1.inf</strong></p>
<p><strong>Dism /image: C:\test\offline /Remove-Driver /driver:oem1.inf /driver:oem2.inf</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Option: <strong>/Export-Driver</strong></p>
<p>Arguments:</p>
<p><strong>/Destination:</strong>&lt;<em>path_to_destination_folder</em>&gt;</p></td>
<td align="left"><p>Exports all third-party driver packages from a Windows image to a destination path. The exported drivers can then be injected to an offline image by running the <strong>DISM Add-Driver</strong> command. This command is new for Windows 8.1 Update.</p>
<p>Examples:</p>
<p><strong>DISM /Online /Export-Driver /Destination:C:\destpath</strong></p>
<p><strong>DISM /Image:C\test\offline /Export-Driver /Destination:C:\destpath</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="Limitations"></span><span id="limitations"></span><span id="LIMITATIONS"></span>Limitations


-   The driver servicing command supports only .inf files. Windows Installer or other driver package types (such as .exe files) are not supported.
-   Drivers are installed in the order that they are listed in the command line. In the following example, 1.inf, 2.inf, and 3.inf will be installed in the order that they are listed in the command line.

    ``` syntax
    Dism /Image:C:\test\offline /Add-Driver /Driver:C:\test\drivers\1.inf /Driver:C:\test\drivers\2.inf /Driver:C:\test\drivers\3.inf
    ```

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

 

 






