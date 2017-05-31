---
title: Manage Files and Folders in a Distribution Share
description: Manage Files and Folders in a Distribution Share
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cb8681fd-e1cf-4c2c-9108-12c73ee49cc7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Manage Files and Folders in a Distribution Share


After a distribution-share folder is created, you can add files to the **$OEM$ Folders** or **Out-of-Box Drivers** folders. You cannot add packages directly to the Packages folder. You must use Windows® System Image Manager (Windows SIM) to add packages to a distribution share. For more information, see [Add Packages to a Distribution Share](add-packages-to-a-distribution-share.md).

You can make out-of-box device drivers (also called third-party drivers) available in Windows SIM by copying device drivers to the **Out-of-Box Drivers** folder in a distribution share. You can use subfolders to organize out-of-box drivers. When you add an **Out-of-Box Drivers** folder to an answer file, all drivers in the folder and subfolders are also added. After drivers are copied to the appropriate folder, they are available through Windows SIM and can be added to an answer file.

When you create a configuration set, you can use the **$OEM$ Folders** folder to copy scripts, binaries, and other files to Windows during installation. An answer file can reference files and folders stored in subfolders of **\\$OEM$ Folders** can be referenced in an answer file. For more information, see [Create a Configuration Set](create-a-configuration-set.md).

**Important**  
Do not overwrite existing files carried and serviced by the operating system. Overwriting system files can cause the operating system to behave unpredictably and cause serious issues.

 

**To manage files and folders in a distribution share**

1.  Open a distribution share. For more information, see [Create or Open a Distribution Share](create-or-open-a-distribution-share.md).

2.  Right-click the distribution share, and then click **Explore Distribution Share**.

3.  Double-click either the **$OEM$ Folders** folder or the **Out-of-Box Drivers** folder.

    The folder opens.

4.  Manage files and folders in the following ways:

    -   Create subfolders by right-clicking in the folder, clicking **New**, and then clicking **Folder**.

    -   Add files to the distribution share by copying files and pasting them in the folder.

    -   Delete distribution-share contents by right-clicking a file or folder and then clicking **Delete**.

    -   Add out-of-box drivers by copying the device-driver files to the **Out-of-Box Drivers** folder.

    -   Add applications, scripts, or other files to the **$OEM$ Folders** subfolders.

        The **$OEM$ Folders** subfolders are organized in a specific structure. Copy files to the **$OEM$ Folders** subfolders as described in [Distribution Shares and Configuration Sets Overview](distribution-shares-and-configuration-sets-overview.md). For example, if you add files to **$OEM$ Folders\\$1\\Program Files\\Application1**, Windows Setup will copy them to **C:\\Program Files\\Application1** on the Windows installation.

5.  Close the distribution-share folder.

6.  The changes appear in the **Distribution Share** pane.

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Create or Open a Distribution Share](create-or-open-a-distribution-share.md)

[Add Packages to a Distribution Share](add-packages-to-a-distribution-share.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Manage%20Files%20and%20Folders%20in%20a%20Distribution%20Share%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





