---
title: Windows System Image Manager Scenarios Overview
description: Windows System Image Manager Scenarios Overview
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3029526b-2ae4-4e50-abf5-ab324f93d86e
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows System Image Manager Scenarios Overview


Windows® System Image Manager (Windows SIM) creates and manages unattended Windows Setup answer files in a GUI.

Answer files are .xml files that are used during Windows Setup to configure and customize the default Windows installation.

For example, you can use Windows SIM to create an answer file that partitions and formats a disk before installing Windows. Windows SIM also changes the default setting for the Windows Internet Explorer® home page, and it configures Windows to boot to audit mode after installation. By modifying settings in the answer file, Windows SIM can also be used to install third-party applications, device drivers, language packs, and other updates.

**Note**  
Windows SIM does not modify the Windows image itself. You use Windows SIM only to create an answer file. During Windows Setup, the answer file applies the settings to the Windows installation. Windows SIM does not modify the settings in a Windows image (.wim) file.

 

## <a href="" id="commonwindowssimscenarios"></a>Common Windows SIM Scenarios


### Create a Catalog File for a Windows Image

Before you can create an answer file, you must create a catalog (.clg) file. Catalog files contain all of the configurable settings in a single Windows image and the current values of each setting.

We recommend that you use the 32-bit version of Windows SIM when you create your catalog files. The following table shows the architectures of Windows SIM and the supported Windows image architectures.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Windows SIM architecture</th>
<th>Can create catalogs for Windows images of the following architecture types</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>x86 version of SIM</p></td>
<td><p>x86-based systems, x64-based systems, and Windows® RT ARM-based systems</p></td>
</tr>
<tr class="even">
<td><p>x64 version of SIM</p></td>
<td><p>x64-based systems only</p></td>
</tr>
</tbody>
</table>

 

### Create a New Answer File for a Windows Image

You can use Windows SIM to create an answer file to be used during Windows Setup. You can view all of the components that are available in a Windows image, add component settings to your answer file, and choose when to apply a component setting by adding it to a particular configuration pass.

After you add component settings to an unattended answer file, you can view and customize the available settings for each component. For more information, see [Answer Files Overview](answer-files-overview.md).

### Edit an Existing Answer File

You can use Windows SIM to add components, packages, or other updates to an existing answer file. You can also validate an existing answer file against a Windows image to ensure that the settings in that answer file can be applied to a specific Windows image. An answer file is typically associated with a specific Windows image. By using Windows SIM, you can open the Windows image, open an existing answer file, and then make changes to the answer file.

Windows SIM validates the component settings in the answer file against the settings that are available in the Windows image. For more information, see [How to Validate an Answer File](http://go.microsoft.com/fwlink/?LinkId=224973).

### Add Device Drivers to an Answer File

You can add device drivers during Windows Setup by using Windows SIM. Windows Setup uses the following types of drivers:

-   **In-box drivers**

    Windows Setup handles in-box drivers the same way that it handles packages.

-   **Out-of-box drivers**

    By using Windows SIM, you can add out-of-box drivers (INF-based) during Windows Setup. Typically, these out-of-box drivers are processed during the **auditSystem** configuration pass. Your .inf-based out-of-box drivers must be in a distribution share subfolder that is called Out-of-Box Drivers. For more information, see [How to Manage Files and Folders in a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=224963).

-   **In-box drivers that are installed with a Windows Installer file.**

    In-box drivers that require a Windows Installer file are added the same way that applications are added.

    **Note**  
    By using the **Microsoft-Windows-PnpCustomizationsWinPE** component, you must add boot-critical device drivers that are required for installation during the **windowsPE** configuration pass. For more information, see [How to Add Device Drivers by Using Windows Setup](http://go.microsoft.com/fwlink/?LinkId=224975). You can also use Deployment Image Servicing and Management (**DISM**) to add device drivers to an offline image. For more information, see [How to Add and Remove Drivers Offline](http://go.microsoft.com/fwlink/?LinkId=224967).

     

### Add Applications or Drivers to an Answer File

You can use Windows SIM to add applications or drivers to be installed during Windows Setup by using a distribution share. You use a distribution share to store all applications, device drivers, scripts, or other resources that you make available during Windows Setup.

You can add more applications, scripts, and other binary files by using a data image. A data image is packaged in a way that is similar to a Windows image. By using the **DISM** tool (**DISM.exe**), you can capture a folder structure that contains the resources that you must add to Windows (or another partition on the computer) during Windows Setup. You can specify where the data image is applied by using the **DataImage** setting in the **Microsoft-Windows-Setup** component. For more information, see [How to Create a Data Image](http://go.microsoft.com/fwlink/?LinkId=224962).

You can also use **$OEM$ Folders** folder structures to place binary files and other applications in specific locations during Windows Setup. Applications are added from distribution shares through subfolders in **$OEM$ Folders**. You must also add a **RunSynchronous** setting to the answer file to open the Windows Installer file or the .exe file that installs the application. For more information, see [How to Manage Files and Folders in a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=224963).

### Add Updates to a Windows Image Offline

Windows SIM enables the addition of offline updates to a Windows image. These updates include software updates, device drivers, language packs, and other packages, which Microsoft provides.

**DISM.exe** is the tool that you use, with or without an answer file, to apply packages to Windows. Any package installation, removal, or modification in the answer file is applied to the Windows image. For more information, see [How to Add or Remove Packages Offline](http://go.microsoft.com/fwlink/?LinkId=225114).

Packages that exist in the **offlineServicing** configuration pass are applied to the offline Windows image. For more information, see [Windows Image Files and Catalog Files Overview](http://go.microsoft.com/fwlink/?LinkId=225115).

### Create a Configuration Set

A configuration set is a subset of files that are available in a distribution share that is explicitly called in an answer file. When you create a configuration set, any files in a distribution share that are referenced in the answer file are saved to a specific folder. Paths to these files are updated in the answer file to point to the specific folder.

Configuration sets are smaller, more portable versions of a distribution share. A configuration set is ideal for installations that cannot access a distribution share. For more information, see [Distribution Shares and Configuration Sets Overview](http://go.microsoft.com/fwlink/?LinkId=224977).

### Import Packages to a Distribution Share

Windows SIM imports packages that are not part of a Windows image file to an optional set of folders called a distribution share. You can then add packages to an answer file from the distribution share. To import a package to a distribution share, you must use the Windows SIM tool or the Component Platform Interface (CPI) APIs. For more information, see [Distribution Shares and Configuration Sets Overview](http://go.microsoft.com/fwlink/?LinkId=224977).

You can also import a package directly into an answer file. The answer file includes a pointer to the path of the package.

## Related topics


[Windows Setup Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214572)

[Deployment Image Servicing and Management (DISM) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214571)

[System Preparation (Sysprep) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214573)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Windows%20System%20Image%20Manager%20Scenarios%20Overview%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





