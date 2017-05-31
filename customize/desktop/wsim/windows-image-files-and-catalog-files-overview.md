---
title: Windows Image Files and Catalog Files Overview
description: Windows Image Files and Catalog Files Overview
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9cbc49e7-e962-4d9c-a04e-59b7ed67c278
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Image Files and Catalog Files Overview


Windows® System Image Manager (Windows SIM) uses Windows image **(.wim)** files and catalog **(.clg)** files to display the available components and packages that can be added to an answer file (**Unattend.xml**). Windows images and catalog files contain configurable settings that you can modify after the component or package is added to an answer file.

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

 

## Windows Image Files


A Windows image file contains one or more compressed Windows images. Each Windows image in a Windows image file contains a list of all of the components, settings, and packages that are available with that Windows image.

### Limitations of Windows Image Files

The following list describes some of the limitations of using Windows image files:

-   Only an account that has administrator permissions can open Windows image files.

-   Only one user at a time can open Windows image files.

-   Because Windows image files can contain one or more Windows images, they are frequently large. Some Windows image files can be several gigabytes in size.

-   Because Windows images can be modified through different settings, using a Windows image file to create your answer file might cause you to apply altered default settings and configurations to a recaptured Windows image.

Because of these limitations, Windows SIM uses catalog files to create an answer file.

## Catalog Files


A catalog file is a binary file that only includes the settings and packages in a Windows image. Catalog files (.**clg**) are only used by Windows SIM and is not used by other deployment tools, nor is it required to install Windows. When Windows SIM creates a catalog file, it queries the Windows image for a list of all the settings and state of each setting in that image. Because the contents of a Windows image can change over time, you must re-create the catalog file whenever you update a Windows image.

Because only administrators can open Windows images, you must have administrator permissions on the system to create a catalog file.

When Windows SIM opens a Windows image file or catalog file, all of the configurable components and packages inside that image are displayed in the **Windows Image** pane. You can then add components and settings to an answer file.

### Contents of a Catalog File

A catalog file contains the following information:

-   A list of component settings and current values

-   Windows features and package states

### Benefits of Catalog Files

Catalog files have several advantages over Windows image files:

-   The size of a catalog file can be less than 1 megabyte (MB), whereas the size of Windows image files can be several gigabytes. Also, catalog files are easier to copy to removable media or a network share.

-   Multiple users can create answer files for a single catalog file at the same time, whereas only one person can open and access a Windows image file at any particular time.

-   Non-administrators can create answer files for a catalog file. However, only administrators can open Windows image files.

### Troubleshooting Catalog Creation

In some scenarios, you might not be able to create a catalog for a Windows image. Common causes and workarounds include the following:

-   **Catalog creation fails when the Windows image file is in a read-only location, such as on a DVD.** The workaround for this issue is to copy the Windows image file to a location that has read and write permission for the current user.

-   **Windows SIM cannot create a catalog for a 32-bit Windows image from a 64-bit version of Windows SIM.** To work around this issue, use the 32-bit version of Windows SIM to create catalogs for your Windows images.

    Windows SIM cannot create catalog files for some Windows images of different architecture types. We recommend that you use the 32-bit version of Windows SIM to create catalog files because this version can create catalogs for all Windows image architecture types. The following table describes the Windows SIM architecture types and catalogs that can be created for each Windows image architecture type.

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

 

## Related topics


[Open a Windows Image or Catalog File](open-a-windows-image-or-catalog-file.md)

[Windows System Image Manager Overview Topics](windows-system-image-manager-overview-topics.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Windows%20Image%20Files%20and%20Catalog%20Files%20Overview%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





