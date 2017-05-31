---
title: Add Packages to a Distribution Share
description: Add Packages to a Distribution Share
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ebe0bdbf-1d3f-471a-8e79-d424ac0006d7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add Packages to a Distribution Share


Packages are groups of files that Microsoft provides. These groups of files include service packs, security updates, language packs, and modifications to Windows® features. You can add a package to a Windows installation by using an answer file, a configuration set, or a distribution share.

You must use Windows System Image Manager (Windows SIM) to import packages. After a package is imported and available in a distribution share, you can add the package to an answer file. For more information, see [Add a Package to an Answer File](add-a-package-to-an-answer-file.md).

**Note**  
For specific information about how to add language packs, see Add Multilingual Support to a Windows Distribution.

 

**To import a package to a distribution share**

1.  Select and open a distribution share. For more information, see [Create or Open a Distribution Share](create-or-open-a-distribution-share.md).

2.  On the **Tools** menu, click **Import Package(s)**.

    The **Select Package(s) to Import** window opens.

3.  Browse to the file or folder, select the file or folder, and then click **Open** or **Open Folder**.

    Windows SIM adds the selected package to the distribution-share folder. The newly added package is displayed under the **Packages** node in the **Distribution Share** pane.

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Manage Files and Folders in a Distribution Share](manage-files-and-folders-in-a-distribution-share.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Add%20Packages%20to%20a%20Distribution%20Share%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





