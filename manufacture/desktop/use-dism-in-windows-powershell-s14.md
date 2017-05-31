---
author: Justinha
Description: Use DISM in Windows PowerShell
ms.assetid: c258fead-059f-4a03-b6af-24cdc7451ca3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Use DISM in Windows PowerShell
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use DISM in Windows PowerShell


The Deployment Image Servicing and Management (DISM) cmdlets can be used to perform the same functions as the DISM.exe command-line tool. In many cases, the DISM cmdlet names correspond directly to Dism.exe options and the same arguments can be used. Because there are also cases where the DISM cmdlet names do not correspond directly to Dism.exe options, a table that maps the Dism.exe commands to DISM cmdlets is provided here:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Dism.exe command</th>
<th align="left">DISM cmdlet</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Dism.exe /Add-Capability</p></td>
<td align="left"><p>Add-WindowsCapability</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Append-Image</p></td>
<td align="left"><p>Add-WindowsImage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Apply-Image</p></td>
<td align="left"><p>Expand-WindowsImage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Capture-Image</p></td>
<td align="left"><p>New-WindowsImage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Cleanup-MountPoints</p></td>
<td align="left"><p>Clear-WindowsCorruptMountPoint</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Commit-Image</p></td>
<td align="left"><p>Save-WindowsImage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Export-Image</p></td>
<td align="left"><p>Export-WindowsImage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Get-Capabilities</p></td>
<td align="left"><p>Get-WindowsCapability</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Get-ImageInfo</p></td>
<td align="left"><p>Get-WindowsImage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Get-MountedImageInfo</p></td>
<td align="left"><p>Get-WindowsImage -Mounted</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Get-WimBootEntry</p></td>
<td align="left"><p>Get-WIMBootEntry</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /List-Image</p></td>
<td align="left"><p>Get-WindowsImageContent</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Mount-Image</p></td>
<td align="left"><p>Mount-WindowsImage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Split-Image</p></td>
<td align="left"><p>Split-WindowsImage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Remove-Capability</p></td>
<td align="left"><p>Remove-WindowsCapability</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Remove-Image</p></td>
<td align="left"><p>Remove-WindowsImage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Remount-Image</p></td>
<td align="left"><p>Mount-WindowsImage -Remount</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Unmount-Image</p></td>
<td align="left"><p>Dismount-WindowsImage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Update-WimBootEntry</p></td>
<td align="left"><p>Update-WIMBootEntry</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;…&gt; /Add-Driver</p></td>
<td align="left"><p>Add-WindowsDriver</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Add-Package</p></td>
<td align="left"><p>Add-WindowsPackage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Add-ProvisionedAppxPackage</p></td>
<td align="left"><p>Add-AppxProvisionedPackage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Apply-Unattend</p></td>
<td align="left"><p>Apply-WindowsUnattend</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Cleanup-Image /CheckHealth</p></td>
<td align="left"><p>Repair-WindowsImage -CheckHealth</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Cleanup-Image /ScanHealth</p></td>
<td align="left"><p>Repair-WindowsImage -ScanHealth</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Cleanup-Image /RestoreHealth</p></td>
<td align="left"><p>Repair-WindowsImage -RestoreHealth</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Disable-Feature</p></td>
<td align="left"><p>Disable-WindowsOptionalFeature</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Enable-Feature</p></td>
<td align="left"><p>Enable-WindowsOptionalFeature</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Export-Driver</p></td>
<td align="left"><p>Export-WindowsDriver</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-CurrentEdition</p></td>
<td align="left"><p>Get-WindowsEdition -Current</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-Driverinfo</p></td>
<td align="left"><p>Get-WindowsDriver -Driver</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-Drivers</p></td>
<td align="left"><p>Get-WindowsDriver</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-Featureinfo</p></td>
<td align="left"><p>Get-WindowsOptionalFeature -FeatureName</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-Features</p></td>
<td align="left"><p>Get-WindowsOptionalFeature</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-Packageinfo</p></td>
<td align="left"><p>Get-WindowsPackage -PackagePath | -PackageName</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-Packages</p></td>
<td align="left"><p>Get-WindowsPackage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-ProvisionedAppxPackages</p></td>
<td align="left"><p>Get-AppxProvisionedPackage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Get-TargetEditions</p></td>
<td align="left"><p>Get-WindowsEdition -Target</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Optimize-Image</p></td>
<td align="left"><p>Optimize-WindowsImage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Remove-Driver</p></td>
<td align="left"><p>Remove-WindowsDriver</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Remove-Package</p></td>
<td align="left"><p>Remove-WindowsPackage</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Remove-ProvisionedAppxPackage</p></td>
<td align="left"><p>Remove-AppxProvisionedPackage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Set-Edition</p></td>
<td align="left"><p>Set-WindowsEdition</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Set-ProductKey</p></td>
<td align="left"><p>Set-WindowsProductKey</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dism.exe /Image:&lt;...&gt; /Set-ProvisionedAppxDataFile</p></td>
<td align="left"><p>Set-AppXProvisionedDataFile</p></td>
</tr>
</tbody>
</table>

 

**Install the Windows Assessment and Deployment Kit (Optional)**

-   The DISM PowerShell module is included in Windows 10 and Windows Server 2016 Technical Preview. On other supported operating systems, you can install the Windows Assessment and Deployment Kit (ADK) which includes the DISM PowerShell module.

**Install Windows PowerShell 5.0**

-   For Windows 10 and Windows Server 2016 Technical Preview, Windows Powershell 5.0 is included in the installation. For other older supported versions of Windows and Windows Server, you must install Windows Management Framework 5.0. You can download and install [Windows Management Framework 5.0](https://www.microsoft.com/en-us/download/details.aspx?id=50395) from the Microsoft Download Center.

**To prepare the DISM PowerShell Environment**

1.  To open PowerShell with administrator privileges, on the **Start** screen, type **PowerShell**, right-click the **Windows PowerShell** app tile, and then, in the app bar, click **Run as administrator**.

2.  Import the DISM PowerShell module.

    The DISM PowerShell module is included in Windows 10 and Windows Server 2016 Technical Preview and does not need to be imported.

    On other supported operating systems, you can use the DISM PowerShell module included in the Windows ADK. By default, the module is installed with the Windows ADK in the DISM folder at *&lt;x86 or amd64&gt;*\\DISM\\ under the path: C:\\Program Files (x86)\\Windows Kits\\10.0\\Assessment and Deployment Kit\\Deployment Tools\\ in Windows 10. To import this module, at the command prompt, type:

    ``` syntax
    import-module <path to DISM folder>
    ```

    For example, using the Windows 10 version of the Windows ADK on a 64-bit PC type:

    ``` syntax
    import-module "C:\Program Files (x86)\Windows Kits\10.0\Assessment and Deployment Kit\Deployment Tools\amd64\DISM"
    ```

    **Note**  
    **Import-Module** imports a module only into the current session. To import the module into all sessions, add an **Import-Module** command to your PowerShell profile. For more information about profiles, type `get-help about_profiles`.

     

3.  Set the `%path%` environment variable to the location of the DISM folder in the Windows ADK installation. At the command prompt, type:

    ``` syntax
    $env:path = <path to DISM folder>
    ```

    When you change environment variables in PowerShell, the change affects only the current session. To make a persistent change to an environment variable that stores the change in the registry, use System in Control Panel. For more information, see [To add or change the values of environment variables](http://go.microsoft.com/fwlink/?LinkId=223710).

**To get Help for DISM PowerShell cmdlets**

-   To get the syntax to use with a cmdlet, at a command prompt, type:

    ``` syntax
    get-help <cmdlet name>
    ```

    For example, type:

    ``` syntax
    get-help get-WindowsImage
    ```

## <span id="related_topics"></span>Related topics


[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[DISM Supported Platforms](dism-supported-platforms.md)

 

 






