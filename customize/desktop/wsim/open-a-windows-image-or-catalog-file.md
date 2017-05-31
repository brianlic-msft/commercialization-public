---
title: Open a Windows Image or Catalog File
description: Open a Windows Image or Catalog File
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8e2f6834-9ed6-4507-844c-4420fc2f76b1
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Open a Windows Image or Catalog File


When you open a Windows® image (.wim) file in Windows System Image Manager (Windows SIM), a catalog (.clg) file is automatically created. If a catalog file already exists, Windows SIM re-creates the catalog file based on the contents of the Windows image that you select. When a catalog file is created, it queries the Windows image for a listing of all the settings in that image.

To create an answer file, you must first open a Windows image file or catalog file in Windows SIM. For more information about Windows image files and catalog files, see [Windows Image Files and Catalog Files Overview](windows-image-files-and-catalog-files-overview.md).

**To open a Windows image file or catalog file**

1.  Copy a previously created catalog file (.clg) to the technician computer or copy your customized Windows image file (install.wim) to the technician computer.

2.  On the technician computer, open Windows SIM.

3.  On the **File** menu, click **Select Windows Image**.

4.  In the **Select a Windows Image** dialog box, select the file type in the **Files of type** drop-down list, and then browse to a Windows image file or catalog file.

    If you open a Windows image file, Windows SIM will automatically create a catalog of that Windows image.

5.  If there is more than one type of Windows image in the file, select a specific Windows image in the **Select an Image** box.

    The Windows image file or catalog file appears in the **Windows Image** pane.

6.  Click **Open**. If you have not previously opened that Windows image file or have not refreshed the catalog file recently, Windows SIM prompts you to create or re-create the catalog file.

**To create a catalog file**

1.  Open Windows SIM.

2.  On the **Tools** menu, click **Create Catalog**.

    The **Open a Windows Image** dialog box opens.

3.  Select a Windows image file, and then click **Open**.

    If you select a Windows image file that has more than one Windows image, the **Select an Image** dialog box opens.

4.  Click to select an image type (for example, **Fabrikam Custom Image 1**), and then click **OK**.

    The catalog file is created in the same directory as the Windows image file that you selected.

    **Troubleshooting:** If Windows SIM does not create the catalog file, try the following steps:

    -   Make sure you are using the Windows 8.1 version of the Windows Assessment and Deployment Kit (Windows ADK).

    -   To create a catalog file for 32-bit or ARM-based PCs, use a 32-bit PC.

    -   Make sure the Windows base-image file (Install.wim) is in a folder that has read-write privileges, such as a USB flash drive or on your hard drive.

    **Important**  
    Windows SIM cannot create catalog files for some Windows images of different architecture types. For information about the support of cross-platform catalog creation, see [Windows Image Files and Catalog Files Overview](windows-image-files-and-catalog-files-overview.md).

     

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Open%20a%20Windows%20Image%20or%20Catalog%20File%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





