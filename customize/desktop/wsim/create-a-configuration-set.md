---
title: Create a Configuration Set
description: Create a Configuration Set
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9f785225-1e42-4900-bd82-6ca3899b7ab0
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a Configuration Set


The following procedure describes how to create a configuration set by using Windows® System Image Manager (Windows SIM).

A configuration set is a smaller version of a distribution share and is more easily copied to removable media or a network share. It is a collection of files that have been converted to binary form. These files are a self-contained alternative to referencing a distribution share.

Because a configuration set contains only internal references, it can be used for both online and offline installations. It can also be duplicated and changed for different types of installations.

**To create a configuration set**

1.  Open Windows SIM.

2.  Open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

3.  On the **Tools** menu, click **Create Configuration Set**.

    The **Create Configuration Set** window opens.

4.  Browse to the destination folder for the configuration set, or enter a folder name.

5.  Select a folder that you want to copy to your **$OEM$ Folders** folder (optional), and then click **OK**.

    **Important**  
    If a configuration set is used during Windows Setup, all of the contents at the root of the media where the answer file exists are copied to the Windows installation. If there are many files and folders at the same level as the answer file, Windows Setup copies all of the files and folders to the Windows installation. Note that this might slow down installation. In some cases, you might run out of disk space.

     

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Manage Files and Folders in a Distribution Share](manage-files-and-folders-in-a-distribution-share.md)

[Add Packages to a Distribution Share](add-packages-to-a-distribution-share.md)

[Create or Open a Distribution Share](create-or-open-a-distribution-share.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Create%20a%20Configuration%20Set%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





