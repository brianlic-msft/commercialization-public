---
title: Create or Open a Distribution Share
description: Create or Open a Distribution Share
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 45bf648a-305b-43da-a22e-fd0cadddbf06
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create or Open a Distribution Share


A distribution share is an optional storage folder for third-party drivers, applications, and packages that Microsoft issues (such as updates).

You can create a distribution-share folder by using Windows® System Image Manager (Windows SIM) or by using a manual technique. The procedures in this topic describe how to create, open, and explore a distribution-share folder.

**Note**  
You must use Windows SIM to add packages. For more information, see [Add Packages to a Distribution Share](add-packages-to-a-distribution-share.md).

 

**To create a distribution share by using Windows SIM**

1.  Create a new folder where you want to place the distribution share. This folder can be on a network share (example: **\\\\server\\share\\MyDistributionShare**) or on your local computer (example: **C:\\MyDistributionShare**).

2.  In the **Distribution Share** pane, right-click **Select a Distribution Share**, and then click **Create Distribution Share**.

    The **Create a Distribution Share** window appears.

3.  Browse to the folder that you created, and then click **Open**.

    In the **Distribution Share** pane, the distribution-share folder opens. Windows SIM automatically creates a folder structure for the distribution share.

**To create a distribution share manually**

1.  In Windows Explorer, create a new folder where you want to place the distribution share. This folder can be on a network share (example: **\\\\server\\share\\MyDistributionShare**) or on your local computer (example: **C:\\MyDistributionShare**).

2.  In this folder, create the following subfolders:

    -   **$OEM$ Folders**

    -   **Packages**

    -   **Out-of-Box Drivers**

    -   **LangPacks**

    **Note**  
    Windows SIM recognizes only these subfolder names. For the distribution share to be valid, at least one of the four folders must be present. To enable Windows SIM to read the subfolder contents, the subfolder names must match this list exactly.

     

**To open a distribution share in Windows SIM**

1.  In the **Distribution Share** pane, click the top node of the currently open distribution share.

    - or -

    Right-click **Select a Distribution Share**, and then click **Select Distribution Share**.

    The **Select a Distribution Share** dialog box opens.

2.  Browse to the distribution share that you want to open. The distribution share can be opened only if the following folder structure exists:

    -   **$OEM$ Folders**

    -   **Packages**

    -   **Out-of-Box Drivers**

    -   **LangPacks**

3.  Select the distribution share that you want to open, and then click **OK**.

    The distribution share opens in the **Distribution Share** pane.

**To explore a distribution share from Windows SIM**

-   In Windows SIM, right-click the top node in the **Distribution Share** pane, and then click **Explore Distribution Share**.

    The distribution-share folder opens in Windows Explorer.

    In Windows Explorer, you can modify files or move files between folders.

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Manage Files and Folders in a Distribution Share](manage-files-and-folders-in-a-distribution-share.md)

[Add Packages to a Distribution Share](add-packages-to-a-distribution-share.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Create%20or%20Open%20a%20Distribution%20Share%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





