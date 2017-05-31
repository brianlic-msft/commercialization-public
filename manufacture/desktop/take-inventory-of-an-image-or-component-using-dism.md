---
author: Justinha
Description: Take Inventory of an Image or Component Using DISM
ms.assetid: cab41da0-3155-4170-8377-b6335de47a38
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Take Inventory of an Image or Component Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Take Inventory of an Image or Component Using DISM


You can take an inventory of what drivers, packages, and other files and settings are included in a Windows image. To do so, use Deployment Image Servicing and Management (DISM) servicing commands.

You must mount an offline image from a WIM or VHD file before you can take inventory of or service a specific Windows image. For more information, see [Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md).

In this section:

[Get Windows Image Information](#getwiminformatio)

[Get Windows PE Information](#getwindowspeinformation)

[Get Driver Information](#getdriverinformation)

[Get Package and Feature Information](#getpackageinformation)

[Get App Package (.appx) Servicing Information](#getapppackage)

[Get International Settings and Languages](#getinternationalsettingslang)

[Get Windows Edition Information](#getwindowseditioninformation)

[Get Application Patch Information](#getapplicationinformation)

## <span id="GetWIMInformatio"></span><span id="getwiminformatio"></span><span id="GETWIMINFORMATIO"></span>Get Windows Image Information


You can use image commands to list the information about a specific Windows image in a (WIM) file or virtual hard disk (VHD) file, about the images contained in a specific WIM or VHD file, and about mounted WIM or VHD files. This information can help you identify mount locations, image names, or verify the architecture of the image that you are mounting.

You can gather information about all of the images in a WIM or VHD file by using the **/Get-ImageInfo** servicing command in DISM. You can also gather information about a specific image in a WIM or VHD file, such as operating system, architecture, and settings, by specifying the name or index number of the image. To specify the image in a VHD file, you must use **/Index:1** .

You can identify the images that are currently mounted on your computer, and you can list information about the mounted image such as read/write permissions, mount location, mounted file path, and mounted image index by using the **/Get-MountedImageInfo** servicing command.

For more information about image commands available in DISM, see [DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md).

**To list images that are contained in a WIM or VHD file**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about all of the images in a WIM or VHD file, at the elevated command prompt, type:

    ``` syntax
    Dism /Get-ImageInfo /imagefile:C:\test\images\install.wim
    ```

    When used with the **/Index** or **/Name** options, more detailed information about the specified image is displayed. To specify the image in a VHD file, you must use `/Index:1`.

The report that is generated includes the following information.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Index</p></td>
<td align="left"><p>The index value of the image in the WIM or VHD file.</p></td>
<td align="left"><p>1</p></td>
</tr>
<tr class="even">
<td align="left"><p>Name</p></td>
<td align="left"><p>The Windows edition name of the image in the WIM or VHD file.</p></td>
<td align="left"><p>Windows 8 Pro</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Description</p></td>
<td align="left"><p>The description of the image in the WIM or VHD file.</p></td>
<td align="left"><p>Windows 8 Pro</p></td>
</tr>
<tr class="even">
<td align="left"><p>Size</p></td>
<td align="left"><p>The size of the image.</p></td>
<td align="left"><p>8,045,951,502 bytes</p></td>
</tr>
</tbody>
</table>

 

**To list mounted images**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  At the elevated command prompt, type:

    ``` syntax
    Dism /Get-MountedImageInfo 
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Mount Dir</p></td>
<td align="left"><p>The location where the image is mounted.</p></td>
<td align="left"><p><strong>C:\Test\Mount</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Image File</p></td>
<td align="left"><p>The full path to the WIM or VHD file.</p></td>
<td align="left"><p><strong>C:\Test\Images\install.wim</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Image Index</p></td>
<td align="left"><p>The index number of the mounted image that is enclosed in WIM or VHD file.</p></td>
<td align="left"><p>1</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mounted Read/Write</p></td>
<td align="left"><p><strong>Yes</strong> if the mounted image allows for both read and write access or <strong>No</strong> if the mounted image allows for read-only access only.</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Status</p></td>
<td align="left"><p>The mount status of the image. The possible values include the following:</p>
<p><strong>OK.</strong> The image is mounted. There are no problems.</p>
<p><strong>Needs Remount.</strong> The image must be remounted. This can be caused by rebooting the host system when the image is mounted.</p>
<p><strong>Invalid.</strong>: the image is in an invalid state. You might have to use <strong>/Cleanup-Mountpoints</strong> on the image.</p></td>
<td align="left"><p>OK</p></td>
</tr>
</tbody>
</table>

 

## <span id="GetWindowsPEInformation"></span><span id="getwindowspeinformation"></span><span id="GETWINDOWSPEINFORMATION"></span>Get Windows PE Information


You can mount a Windows Preinstallation Environment (Windows PE) image for servicing in the same way you would any Windows image. There are also Windows PE servicing commands that are specific to a Windows PE image. These commands can be used to list Windows PE settings such as scratchspace, targetpath, and profiling information. For more information about Windows PE servicing commands available in DISM, see [DISM Windows PE Servicing Command-Line Options](dism-windows-pe-servicing-command-line-options.md).

**To list all settings in the mounted Windows PE image.**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about all of the Windows PE settings in the mounted Windows PE image, at the elevated command prompt, type:

    ``` syntax
    Dism /image:C:\test\offline /Get-PESettings
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Profiling</p></td>
<td align="left"><p>Reports whether Windows PE profiling is enabled or disabled.</p></td>
<td align="left"><p>Disabled</p></td>
</tr>
<tr class="even">
<td align="left"><p>Scratch Space</p></td>
<td align="left"><p>The amount of writeable space available on the Windows PE system volume when booted in ramdisk mode.</p></td>
<td align="left"><p>32MB</p></td>
</tr>
<tr class="odd">
<td align="left"><p>TargetPath</p></td>
<td align="left"><p>The path to the root of the Windows PE image at boot time.</p></td>
<td align="left"><p>X:\</p></td>
</tr>
</tbody>
</table>

 

## <span id="GetDriverInformation"></span><span id="getdriverinformation"></span><span id="GETDRIVERINFORMATION"></span>Get Driver Information


The driver-servicing commands can be used to enumerate driver packages in the driver store based on their .inf files. You can use the **/Get** commands to display basic information about third-party driver packages or all driver packages in the offline image. When you point to an offline image or a running operating system, you can determine what driver packages are in the image, and get information about the drivers.

You can display detailed information about a specific installed .inf file, or one that is not yet installed. Installed drivers in the driver store will be named Oem0.inf, Oem1.inf, and so on.

For more information about driver-servicing commands available in DISM, see [DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md).

**To list driver packages in the offline image**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  Use one of the following commands to list information about all of the driver packages in a mounted offline Windows image:

    ``` syntax
    Dism /image:C:\test\offline /Get-Drivers
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-Drivers /all
    ```

    For a running operating system, type one of the following commands:

    ``` syntax
    Dism /online /Get-Drivers
    ```

    ``` syntax
    Dism /online /Get-Drivers /all
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Published Name</p></td>
<td align="left"><p>The name of the driver package after it is added to the driver store.</p></td>
<td align="left"><p>Oem0.inf</p></td>
</tr>
<tr class="even">
<td align="left"><p>Original File Name</p></td>
<td align="left"><p>The original .inf file name of the driver package.</p></td>
<td align="left"><p>Toaster.inf</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Inbox</p></td>
<td align="left"><p><strong>Yes</strong> for a default driver (inbox driver) or <strong>No</strong> for third-party driver packages.</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Class Name</p></td>
<td align="left"><p>The friendly name of the device class the driver is a member of.</p></td>
<td align="left"><p>Printer</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Provider Name</p></td>
<td align="left"><p>The provider or digital signature for the driver package.</p></td>
<td align="left"><p>Microsoft</p></td>
</tr>
<tr class="even">
<td align="left"><p>Date</p></td>
<td align="left"><p>The date associated with the driver, as it is specified in the .inf file. The date will be formatted appropriately for your locale.</p></td>
<td align="left"><p>10/31/2006</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Version</p></td>
<td align="left"><p>The version number that is specified in the INF driverVer directive.</p></td>
<td align="left"><p>6.1.6801.0</p></td>
</tr>
</tbody>
</table>

 

**To get information about a specific driver**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  List information about a specific driver package in the offline Windows image. For example, type:

    ``` syntax
    Dism /image:C:\test\offline /Get-DriverInfo /driver:oem1.inf
    ```

    For a running operating system, type:

    ``` syntax
    Dism /online /Get-DriverInfo /driver:oem1.inf
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Published Name</p></td>
<td align="left"><p>The name of the driver package after it is added to the driver store.</p></td>
<td align="left"><p>Oem0.inf</p></td>
</tr>
<tr class="even">
<td align="left"><p>Driver Store Path</p></td>
<td align="left"><p>The path to the driver location. If the driver is installed, the path to the driver store is listed. If the driver is not installed yet, the path to the driver on the servicing host is listed.</p></td>
<td align="left"><p><strong>E:\Images\Mount_depset\Windows\System32\DriverStore\FileRepository\Fasttx2k.inf_x86_neutral_0328f62e\Fasttx2k.inf</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Class Name</p></td>
<td align="left"><p>The friendly name of the device class the driver is a member of.</p></td>
<td align="left"><p>Printer</p></td>
</tr>
<tr class="even">
<td align="left"><p>Class Description</p></td>
<td align="left"><p>The description of the device class the driver is a member of.</p></td>
<td align="left"><p>Printers</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Class GUID</p></td>
<td align="left"><p>The GUID of the device class that the driver is a member of.</p></td>
<td align="left"><p><strong>{4D36E97B-E325-11CE-BFC1-08002BE10318}</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Date</p></td>
<td align="left"><p>The date associated with the driver, as it is specified in the .inf file. The date will be formatted appropriately for your locale.</p></td>
<td align="left"><p>8/6/2003</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Version</p></td>
<td align="left"><p>The driver version number that is specified in the INF driverVer directive.</p></td>
<td align="left"><p>1.0.1.37</p></td>
</tr>
<tr class="even">
<td align="left"><p>Boot Critical</p></td>
<td align="left"><p><strong>Yes</strong> if the driver is boot critical or <strong>No</strong> if it is not.</p></td>
<td align="left"><p><strong>No</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Drivers for architecture</p></td>
<td align="left"><p>The architecture of the image that it is installed on. If the driver is not installed yet, the field is reported repeatedly for each supported operating system architecture.</p></td>
<td align="left"><p>x86</p></td>
</tr>
<tr class="even">
<td align="left"><p>Manufacturer</p></td>
<td align="left"><p>The manufacturer of the supported device.</p></td>
<td align="left"><p>Adventure Works</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Description</p></td>
<td align="left"><p>A description of the supported device.</p></td>
<td align="left"><p><strong>Windows XP Adventure Works 376 Controller</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Architecture</p></td>
<td align="left"><p>The architecture of the driver.</p></td>
<td align="left"><p>x86</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hardware ID</p></td>
<td align="left"><p>The hardware ID of the supported device.</p></td>
<td align="left"><p><strong>ABC_3376</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Service Name</p></td>
<td align="left"><p>The service name of the driver.</p></td>
<td align="left"><p><strong>C1232k</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Compatible IDs</p></td>
<td align="left"><p>Alternate Plug and Play (PnP) IDs for the device, if any apply.</p></td>
<td align="left"><p><strong>*12ABC</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Exclude IDs</p></td>
<td align="left"><p>PnP IDs that will not match the device, any apply.</p></td>
<td align="left"><p><strong>*A_123</strong></p></td>
</tr>
</tbody>
</table>

 

**Note**  
If you point to a driver that is not yet installed, the report will be slightly different.

 

## <span id="GetPackageInformation"></span><span id="getpackageinformation"></span><span id="GETPACKAGEINFORMATION"></span>Get Package and Feature Information


You can use operating system package-servicing commands to obtain information about Windows packages. You can also use DISM and package-servicing commands to obtain information about Windows features, either offline or on a running Windows installation.

You can use the **/PackagePath** option to specify a .cab file or a folder where the .cab file is extracted. You cannot use this command to obtain package information for .msu files. Alternately, you can use **/Get-Packages** to find the name of a package, and then use **/PackageName** to specify the name of the package.

You can display detailed information about a feature. You must use the **/FeatureName** option with the **/Get** command. Use the **/Get-Features** option to find the name of the feature in the image. Feature names are case sensitive if you are servicing a Windows image other than Windows 8.

For more information about operating system package-servicing commands available in DISM, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

**To list all packages in the image**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about all of the packages in the offline Windows image, type the following command:

    ``` syntax
    Dism /image:C:\test\offline /Get-Packages
    ```

    For a running operating system, type the following command:

    ``` syntax
    Dism /online /Get-Packages
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Package Identity</p></td>
<td align="left"><p>The name of the package as it appears in the image.</p></td>
<td align="left"><p><strong>Microsoft-Windows-NetFx3-OC-Package~31bf3856ad364e35~x86~en-US~6.1.6772.0</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>State</p></td>
<td align="left"><p>The current state of the package. Such as:</p>
<p><strong>Installed.</strong> The package is installed.</p>
<p><strong>Install Pending.</strong> The package is installed but requires a reboot to complete the pending online actions.</p>
<p><strong>Staged.</strong> The package is staged for installation.</p></td>
<td align="left"><p><strong>Installed</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Release Type</p></td>
<td align="left"><p>The type of package that it is. Such as:</p>
<p><strong>Feature Pack.</strong> A Windows operating system feature.</p>
<p><strong>Language Pack.</strong> A Windows operating system Language pack or Language Interface Pack (LIP).</p>
<p><strong>Foundation.</strong> Core operating system components including optional features.</p></td>
<td align="left"><p>Feature Pack</p></td>
</tr>
<tr class="even">
<td align="left"><p>Install Time</p></td>
<td align="left"><p>The UTC date and time when the installation occurred. If the package is not installed yet, the Install Time field is left blank.</p></td>
<td align="left"><p>8/18/2008 7:58:00 PM</p></td>
</tr>
</tbody>
</table>

 

**To list information about a specific package**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about a specific package in the offline Windows image, type one of the following commands:

    ``` syntax
    Dism /image:C:\test\offline /Get-PackageInfo /PackagePath:C:\packages\package.cab
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-PackageInfo /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
    ```

    For a running operating system, type one of the following commands:

    ``` syntax
    Dism /online /Get-PackageInfo /PackagePath:C:\packages\package.cab
    ```

    ``` syntax
    Dism /online /Get-PackageInfo /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Package Identity</p></td>
<td align="left"><p>The name of the package as it appears in the image.</p></td>
<td align="left"><p><strong>Microsoft-Windows-NetFx3-OC-Package~31bf3856ad364e35~x86~en-US~6.1.6772.0</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Applicable</p></td>
<td align="left"><p>Indicates if the package applies to the image.</p></td>
<td align="left"><p><strong>No</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Copyright</p></td>
<td align="left"><p>Copyright information for the package.</p></td>
<td align="left"><p>Copyright© Microsoft Corporation. All Rights Reserved.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Company</p></td>
<td align="left"><p>The company that provided the package, if available.</p></td>
<td align="left"><p>Microsoft Corporation</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Creation Time</p></td>
<td align="left"><p>The date and time the package was created, if available.</p></td>
<td align="left"><p>8/18/2008 7:58:00 PM</p></td>
</tr>
<tr class="even">
<td align="left"><p>Description</p></td>
<td align="left"><p>A brief description of the package.</p></td>
<td align="left"><p>Fix for KB300106</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Install Client</p></td>
<td align="left"><p>The client tool that installed the package.</p></td>
<td align="left"><p>DISM Package Manager Provider</p></td>
</tr>
<tr class="even">
<td align="left"><p>Install Package Name</p></td>
<td align="left"><p>The installed package.mum file name.</p></td>
<td align="left"><p><strong>Microsoft-Windows-NetFx3-OC-Package~31bf3856ad364e35~x86~en-US~6.1.6772.0.mum</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Install Time</p></td>
<td align="left"><p>The date and time the package was installed. If the package is not installed yet, the <strong>Install Time</strong> field is left blank.</p></td>
<td align="left"><p>8/18/2008 7:58:00 PM</p></td>
</tr>
<tr class="even">
<td align="left"><p>Last Update Time</p></td>
<td align="left"><p>The date the package was last updated, if available.</p></td>
<td align="left"><p>8/18/2008 7:58:00 PM</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Name</p></td>
<td align="left"><p>The display name of the package, localized if available.</p>
<p>Generally, &quot;default&quot; will be displayed for all servicing packages.</p></td>
<td align="left"><p>ActiveX® Installer Service</p></td>
</tr>
<tr class="even">
<td align="left"><p>Product Name</p></td>
<td align="left"><p>The name of the product that the package belongs to, if available.</p></td>
<td align="left"><p><strong>Microsoft-Windows-NetFx3-OC-Package</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Product Version</p></td>
<td align="left"><p>The version of the product that the package belongs to, if available.</p></td>
<td align="left"><p>123.01.0000</p></td>
</tr>
<tr class="even">
<td align="left"><p>Release Type</p></td>
<td align="left"><p>The type of package that it is. Such as:</p>
<p><strong>Feature Pack.</strong> A Windows operating system feature.</p>
<p><strong>Language Pack.</strong> A Windows operating system Language pack or Language Interface Pack (LIP).</p>
<p><strong>Foundation.</strong> Core operating system components including optional features.</p></td>
<td align="left"><p>Feature Pack</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Restart Required</p></td>
<td align="left"><p>Indicates if a reboot is required when you install or uninstall the package online.</p></td>
<td align="left"><p>Possible</p></td>
</tr>
<tr class="even">
<td align="left"><p>Support Information</p></td>
<td align="left"><p>Where to find support information, if available.</p></td>
<td align="left"><p>http://support.microsoft.com/?kbid=300106</p></td>
</tr>
<tr class="odd">
<td align="left"><p>State</p></td>
<td align="left"><p>Indicates if the package is installed in the operating system. Possible values include the following:</p>
<p><strong>Not Present.</strong> The package is not installed.</p>
<p><strong>Installed.</strong> The package is installed.</p>
<p><strong>Install Pending.</strong> The package will be installed but requires a reboot to complete pending online actions.</p>
<p><strong>Staged.</strong> The package is staged for installation.</p></td>
<td align="left"><p>Installed</p></td>
</tr>
<tr class="even">
<td align="left"><p>Completely offline capable</p></td>
<td align="left"><p><strong>Yes.</strong> The package can be installed offline without booting the image.</p>
<p><strong>No.</strong> You must boot into the image in order to complete installation of this package.</p>
<p><strong>Undetermined.</strong> You may have to boot into the image in order to complete the installation of this package. Many packages can be installed offline entirely. If you attempt to install a package offline and a reboot is required, it will be reported in the log file. You can check the status of a package using the Get-PackageInfo command.</p>
<p>This field is only applicable to Windows 8, Windows Server® 2012, and Windows Preinstallation Environment (Windows PE) 4.0 target images.</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Custom Properties</p></td>
<td align="left"><p>A list of custom properties defined in the package manifest file. If there are no custom properties, (No custom properties found) will be displayed.</p></td>
<td align="left"><p>Dependency: Language Pack</p></td>
</tr>
<tr class="even">
<td align="left"><p>Features listing for package</p></td>
<td align="left"><p>A list of the features found in the package.</p>
<p>If there is no feature in the package, the package identity will be displayed followed by (No features found for this package).</p></td>
<td align="left"><p><strong>Microsoft-Windows-NetFx3-OC-Package~31bf3856ad364e35~x86~en-US~6.1.6772.0 (No features found for this package)</strong></p></td>
</tr>
</tbody>
</table>

 

**To list all features in the image**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the features in the offline Windows image, type one of the following commands:

    ``` syntax
    Dism /image:C:\test\offline /Get-Features
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-Features /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-Features /PackagePath:C:\packages\package.cab
    ```

    For a running operating system, type one of the following commands:

    ``` syntax
    Dism /online /Get-Features
    ```

    ``` syntax
    Dism /online /Get-Features /PackageName:Microsoft.Windows.Calc.Demo~6595b6144ccf1df~x86~en~1.0.0.0
    ```

    ``` syntax
    Dism /online /Get-Features /PackagePath:C:\packages\package.cab
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Feature Name</p></td>
<td align="left"><p>The name of the feature as it appears in the image.</p></td>
<td align="left"><p><strong>InboxGames</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>State</p></td>
<td align="left"><p>The current state of the feature. Possible values include the following:</p>
<ul>
<li><p><strong>Enabled.</strong> The feature is enabled.</p></li>
<li><p><strong>Disabled.</strong> The feature is disabled.</p></li>
<li><p><strong>Enable Pending.</strong> The feature will be enabled but requires a reboot to complete pending online actions.</p></li>
<li><p><strong>Disable Pending.</strong> The feature will be disabled but requires a reboot to complete pending online actions.</p></li>
<li><p><strong>Disabled with Payload Removed.</strong> The feature is disabled and its payload has been removed. Only the package metadata is present in the image. The payload can be restored and the feature can be enabled on demand after the image is deployed. For more information about features on demand, see [Configure a Windows Repair Source](configure-a-windows-repair-source.md).</p></li>
</ul></td>
<td align="left"><p><strong>Disabled</strong></p></td>
</tr>
</tbody>
</table>

 

**To list information about a specific feature**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about a specific feature in the offline Windows image, type one of the following commands:

    ``` syntax
    Dism /image:C:\test\offline /Get-FeatureInfo /FeatureName:Hearts
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-FeatureInfo /FeatureName:LocalPack-GB /PackageName:Microsoft-Windows-LocalPack-GB-Package~6595b6144ccf1df~x86~~1.0.0.0
    ```

    For a running operating system, type the following command:

    ``` syntax
    Dism /online /Get-FeatureInfo /FeatureName:Hearts 
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Feature Name</p></td>
<td align="left"><p>Name of the feature.</p></td>
<td align="left"><p><strong>InboxGames</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Display Name</p></td>
<td align="left"><p>The name of the feature as it appears in the user interface.</p></td>
<td align="left"><p><strong>Games</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Description</p></td>
<td align="left"><p>A brief description of the feature.</p></td>
<td align="left"><p>Standard inbox games.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Restart Required</p></td>
<td align="left"><p>Indicates if a restart is required when you enable or disable this feature.</p></td>
<td align="left"><p><strong>Yes</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>State</p></td>
<td align="left"><p>The current state of the feature. Possible values include the following:</p>
<p><strong>Enabled.</strong> The feature is enabled.</p>
<p><strong>Disabled.</strong> The feature is disabled.</p>
<p><strong>Enable Pending.</strong> The feature will be enabled but requires a reboot to complete pending online actions.</p>
<p><strong>Disable Pending.</strong> The feature will be disabled but requires a reboot to complete pending online actions.</p>
<p><strong>Disabled with Payload Removed.</strong> The feature is disabled and its payload has been removed. Only the package metadata is present in the image. The payload can be restored and the feature can be enabled on demand after the image is deployed. For more information about features on demand, see [Configure a Windows Repair Source](configure-a-windows-repair-source.md).</p></td>
<td align="left"><p><strong>Disabled</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Custom Properties</p></td>
<td align="left"><p>A list of custom properties defined in the package manifest file. If there are no custom properties, (No custom properties found) will be displayed.</p></td>
<td align="left"><p>Dependency: Language Pack</p></td>
</tr>
</tbody>
</table>

 

## <span id="GetAppPackage"></span><span id="getapppackage"></span><span id="GETAPPPACKAGE"></span>Get App Package (.appx) Servicing Information


You can use the app package (.appx) servicing commands to list the provisioned apps in a Windows image. Provisioned apps will be registered for every user profile that is created for the Windows image.

For more information about app package servicing commands available in DISM, see [DISM App Package (.appx or .appxbundle) Servicing Command-Line Options](dism-app-package--appx-or-appxbundle--servicing-command-line-options.md).

**To list provisioned apps in the Windows image**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list provisioned apps in a mounted offline Windows image, type:

    ``` syntax
    Dism /image:c:\test\offline /Get-ProvisionedAppxPackages
    ```

    For a running operating system, type:

    ``` syntax
    Dism /online /Get-ProvisionedAppxPackages
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>DisplayName</p></td>
<td align="left"><p>The name of the app.</p></td>
<td align="left"><p>Fabrikam.Sample.CS</p></td>
</tr>
<tr class="even">
<td align="left"><p>Version</p></td>
<td align="left"><p>The version number of the app package.</p></td>
<td align="left"><p>1.0.0.0</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Architecture</p></td>
<td align="left"><p>The architecture of the app.</p></td>
<td align="left"><p>neutral</p></td>
</tr>
<tr class="even">
<td align="left"><p>ResourceID</p></td>
<td align="left"><p>For more information, see [App packaging glossary](http://go.microsoft.com/fwlink/p/?linkid=252145).</p></td>
<td align="left"><p></p></td>
</tr>
<tr class="odd">
<td align="left"><p>PackageName</p></td>
<td align="left"><p>The full name of the app package.</p></td>
<td align="left"><p>Fabrikam.Sample.CS_1.0.0.0_neutral_s9y1p3hwd5qda</p></td>
</tr>
</tbody>
</table>

 

## <span id="GetInternationalSettingsLang"></span><span id="getinternationalsettingslang"></span><span id="GETINTERNATIONALSETTINGSLANG"></span>Get International Settings and Languages


The international servicing commands can be used to query existing international settings in Windows and Windows PE images. For more information about operating system package-servicing commands available in DISM, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

**Important**  
International servicing commands cannot be used on a Windows Vista or Windows Server 2008 image.

 

Use the **/online** option to display information about international settings and languages in the running operating system. Use **/image:** &lt;*path\_to\_offline\_image\_directory*&gt; to display information about international settings and languages in the offline image. When used with the **/image** and **/distribution** options, information about international settings and languages in the distribution is displayed.

**To list all international settings and languages**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about all of the international settings in the offline Windows image, type one of the following commands:

    ``` syntax
    Dism /image:C:\test\offline /Get-Intl
    ```

    ``` syntax
    Dism /image:C:\test\offline /distribution:C:\windows_distribution\langpacks /Get-Intl
    ```

    For a running operating system, type the following command:

    ``` syntax
    Dism /online /Get-Intl
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Default system UI language</p></td>
<td align="left"><p>The language that is currently set as the default system UI language.</p></td>
<td align="left"><p><strong>en-US</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>System locale</p></td>
<td align="left"><p>The language for non-Unicode programs (also referred to as system locale) and font settings.</p></td>
<td align="left"><p><strong>en-US</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Default timezone</p></td>
<td align="left"><p>The time zone that is currently set as the default.</p></td>
<td align="left"><p>Pacific Standard Time</p></td>
</tr>
<tr class="even">
<td align="left"><p>User locale for default user</p></td>
<td align="left"><p>The &quot;standards and formats&quot; language (also referred to as user locale) that is set for the default user.</p></td>
<td align="left"><p><strong>en-US</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Location</p></td>
<td align="left"><p>The geographical location that is currently set for the operating system. For more information about geographical locations, see [Table of Geographical Locations](http://go.microsoft.com/fwlink/?LinkId=131360).</p></td>
<td align="left"><p>United States</p></td>
</tr>
<tr class="even">
<td align="left"><p>Active keyboards</p></td>
<td align="left"><p>The value pair for the active keyboard. In the example provided, 0409 is the language identifier and 00000409 is the keyboard identifier.</p></td>
<td align="left"><p><strong>0409:00000409</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Default keyboards</p></td>
<td align="left"><p>The value pair for the default keyboard. In the example provided, 0409 is the language identifier and 00000409 is the keyboard identifier.</p></td>
<td align="left"><p><strong>0409:00000409</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Installed language(s)</p></td>
<td align="left"><p>A list of all installed language packs.</p></td>
<td align="left"><p><strong>en-US</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Type</p></td>
<td align="left"><p>The type of each installed language pack. For more information, see [Add Language Packs to Windows](add-language-packs-to-windows.md).</p></td>
<td align="left"><p><strong>en-US</strong></p>
<p>Type: Fully localized language</p>
<p><strong></strong>ar-SA</p>
<p>Type: Partially localized language, MUI type</p>
<p>Fallback Languages <strong>en-US</strong>, <strong>fr-FR</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Distribution languages</p></td>
<td align="left"><p>A list of the languages that are available in the distribution share.</p>
<div class="alert">
<strong>Note</strong>  
<p>This list includes the name of the folder in the distribution share. The language of the actual LP.cab file in the folder is not validated. For example, if the path to the distribution is …\Langpacks\bg-BG\Lp.cab, the value of bg-BG will be reported as the language in the distribution share even if the LP.cab file is not the correct .cab file for bg-BG.</p>
</div>
<div>
 
</div></td>
<td align="left"><p>The default language in the distribution is: <strong>ja-JP</strong></p>
<p>The other available languages in the distribution are: <strong>bg-BG</strong>, <strong>nl-NL</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Keyboard layered driver</p></td>
<td align="left"><p>A list of the keyboard drivers for Japanese or Korean keyboards, if any are installed.</p></td>
<td align="left"><p>Japanese Keyboard (106/109 Key)</p></td>
</tr>
</tbody>
</table>

 

## <span id="GetWindowsEditionInformation"></span><span id="getwindowseditioninformation"></span><span id="GETWINDOWSEDITIONINFORMATION"></span>Get Windows Edition Information


You can use the edition-servicing commands to obtain information about which editions of Windows are available for upgrade.

Target editions are the editions of Windows that you can upgrade to. You can display information about the current edition or the target edition of an offline Windows image or a running operating system.

For more information about Windows edition servicing commands available in DISM, see [DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md).

**To get information about the current Windows editions**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the current edition of the offline Windows image, type the following command:

    ``` syntax
    Dism /image:C:\test\offline /Get-CurrentEdition
    ```

    For a running operating system, type the following command:

    ``` syntax
    Dism /online /Get-CurrentEdition
    ```

**To get information about target editions of Windows**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the target edition of the offline Windows image, type the following command:

    ``` syntax
    Dism /image:C:\test\offline /Get-TargetEditions
    ```

    For a running operating system, type the following command:

    ``` syntax
    Dism /online /Get-TargetEditions
    ```

## <span id="GetApplicationInformation"></span><span id="getapplicationinformation"></span><span id="GETAPPLICATIONINFORMATION"></span>Get Application Patch Information


Application servicing command-line options can be used on a offline image to check the applicability of Microsoft® Windows® Installer application patches (.msp files) and to query your offline image for information about installed Windows Installer applications (.msi files) and application patches (.msp files).

You can display detailed information about installed MSP patches filtered by patch and application. If the **/PatchCode** option is specified, detailed information is displayed for all Windows Installer applications that the patch is applied to. If the **/ProductCode** option is specified, information about all MSP patches in the specified application is displayed.

If the **/PatchCode** and **/ProductCode** options are both specified, information is displayed only if that specific patch is applied to the specified Windows Installer application. If the **/PatchCode** and **/ProductCode** options are not specified, all installed Windows Installer packages and MSP patches are displayed.

For more information about application servicing commands available in DISM, see [DISM Application Servicing Command-Line Options](dism-application-servicing-command-line-options.md).

**To list information about installed MSP patches**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the MSP patches, type one of the following commands:

    ``` syntax
    Dism /image:C:\test\offline /Get-AppPatchInfo
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-AppPatchInfo /PatchCode:{B0B9997C-GUID-GUID-GUID-74D866BBDFFF}
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-AppPatchInfo /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-AppPatchInfo /PatchCode:{B0B9997C-GUID-GUID-GUID-74D866BBDFFF} /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Patch Code</p></td>
<td align="left"><p>A GUID identifying a specific Windows Installer package. The package code associates an .msi file together with an application or product and can also be used for the verification of sources.</p></td>
<td align="left"><p><strong>{8ACD2816-595D-48AA-A43B-3523CAA4F692}</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Product Code</p></td>
<td align="left"><p>A GUID that is the principal identification of an application or product.</p></td>
<td align="left"><p>{7764DEFC-C5D1-413C-8428-2AA903BF6DAA}</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Patch Name</p></td>
<td align="left"><p>The registered display name for the patch. For patches that do not include the <strong>DisplayName</strong> property in the MsiPatchMetadata table, the returned display name is an empty string.</p></td>
<td align="left"><p>QFE9 - Non Removable</p></td>
</tr>
<tr class="even">
<td align="left"><p>Patch State</p></td>
<td align="left"><p>1 if this patch is currently applied to the product.</p>
<p>2 if this patch has been superseded by another patch.</p>
<p>4 if this patch has been made obsolete by another patch.</p></td>
<td align="left"><p>1 (Applied)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Patch Uninstallable</p></td>
<td align="left"><p>1 if the patch is marked as possible to uninstall from the product. In this case, the installer can still block the uninstallation if this patch is required by another patch that cannot be uninstalled. Otherwise 0 is reported.</p></td>
<td align="left"><p>0</p></td>
</tr>
<tr class="even">
<td align="left"><p>Help Link</p></td>
<td align="left"><p>Where to find support information, if available.</p></td>
<td align="left"><p>http://www.microsoft.com</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Transforms</p></td>
<td align="left"><p>The set of patch transforms applied to the product by the last patch installation. This value may not be available for per-user unmanaged applications if the user is not logged on to the computer.</p></td>
<td align="left"><p><strong>:App1RTMToApp1QFE9;:#App1RTMToApp1QFE9</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Local Package</p></td>
<td align="left"><p>The location of the local cached patch file that is used by the product.</p></td>
<td align="left"><p><strong>C:\Windows\Installer\132f5c.msp</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Install Date</p></td>
<td align="left"><p>The date when the patch was applied to the product.</p></td>
<td align="left"><p>20080912</p></td>
</tr>
</tbody>
</table>

 

**To list information about MSP patches applied to an application**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the MSP patches, type one of the following commands:

    ``` syntax
    Dism /image:C:\test\offline /Get-AppPatches
    ```

    ``` syntax
    Dism /image:C:\test\offline /Get-AppPatches /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Patch Code</p></td>
<td align="left"><p>A GUID identifying a particular Windows Installer package. The package code associates an .msi file together with an application or product and can also be used for the verification of sources.</p></td>
<td align="left"><p><strong>{8ACD2816-595D-48AA-A43B-3523CAA4F692}</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Product Code</p></td>
<td align="left"><p>A GUID that is the principal identification of an application or product.</p></td>
<td align="left"><p><strong>{7764DEFC-C5D1-413C-8428-2AA903BF6DAA}</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Patch Name</p></td>
<td align="left"><p>The registered display name for the patch. For patches that do not include the <strong>DisplayName</strong> property in the MsiPatchMetadata table, the returned display name is an empty string.</p></td>
<td align="left"><p>QFE9 - Non Removable</p></td>
</tr>
</tbody>
</table>

 

**To list information about all Windows Installer applications**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the MSP patches, type the following command:

    ``` syntax
    Dism /image:C:\test\offline /Get-Apps
    ```

The report generated lists the product code and product name for applications that are installed in the offline image. For example:

Product Code : **{DB935363-5A68-47AF-A55A-CFC90F2E83BC}**

Product Name : MsiTestApplication2

**To list information about a specific Windows Installer application**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  To list information about the MSP patches, type the following command:

    ``` syntax
    Dism /image:C:\test\offline /Get-AppInfo /ProductCode:{B0F9497C-GUID-GUID-GUID-74D866BBDF59}
    ```

The report generated includes the following information:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Field</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Product Code</p></td>
<td align="left"><p>A GUID that is the principal identification of an application or product.</p></td>
<td align="left"><p><strong>{DB935363-5A68-47AF-A55A-CFC90F2E83BC}</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Product Name</p></td>
<td align="left"><p>The name of the application.</p></td>
<td align="left"><p>MsiTestApplication2</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Product State</p></td>
<td align="left"><p>The installation state for the product at initialization.</p>
<p>-1 if the product is neither advertised nor installed.</p>
<p>1 if the product is advertised but not installed.</p>
<p>2 if the product is installed for a different user.</p>
<p>5 if the product is installed for the current user.</p></td>
<td align="left"><p>5 (Installed)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Package Code</p></td>
<td align="left"><p>A GUID identifying a particular Windows Installer package. The package code associates an .msi file together with an application or product and can also be used for the verification of sources.</p></td>
<td align="left"><p><strong>{C67CA1AE-6074-4810-BD74-F6BBB609744A}</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Product Version</p></td>
<td align="left"><p>The version of the product in string format.</p></td>
<td align="left"><p>1.0.0</p></td>
</tr>
<tr class="even">
<td align="left"><p>Assignment Type</p></td>
<td align="left"><p>0 if the product is advertised or installed per-user.</p>
<p>1 if the product is advertised or installed per-computer for all users.</p></td>
<td align="left"><p>1 (Per-Machine)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Publisher</p></td>
<td align="left"><p>The name of the manufacturer for the product.</p></td>
<td align="left"><p>Microsoft MSI Test</p></td>
</tr>
<tr class="even">
<td align="left"><p>Language</p></td>
<td align="left"><p>The decimal identifier for the product language.</p></td>
<td align="left"><p>1033</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Install Source</p></td>
<td align="left"><p>The directory that contains the source .cab file or the source file tree of the installation package.</p></td>
<td align="left"><p><strong>E:\Testpkg\App2_RTM\</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Package Name</p></td>
<td align="left"><p>The name of the original installation package.</p></td>
<td align="left"><p>MsiTestApplication2.msi</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Help Link</p></td>
<td align="left"><p>Where to find support information, if available.</p></td>
<td align="left"><p>http://www.microsoft.com/management</p></td>
</tr>
<tr class="even">
<td align="left"><p>Transforms</p></td>
<td align="left"><p>The set of patch transforms applied to the product by the last patch installation. This value may not be available for per-user unmanaged applications if the user is not logged on to the computer.</p></td>
<td align="left"><p><strong>C:\Windows\Installer\{BDB20E90-3ACD-450B-BBDE-61E39687C6B1}\ACBlueT02.mst</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p>Local Package</p></td>
<td align="left"><p>The location of the local cached package.</p></td>
<td align="left"><p><strong>C:\Windows\Installer\132f3b.msi</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>Install Date</p></td>
<td align="left"><p>The date the application was installed.</p></td>
<td align="left"><p><strong>20080912</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

[Service a Windows PE Image with DISM](service-a-windows-pe-image-with-dism.md)

[Deployment Image Servicing and Management (DISM) Best Practices](deployment-image-servicing-and-management--dism--best-practices.md)

 

 






