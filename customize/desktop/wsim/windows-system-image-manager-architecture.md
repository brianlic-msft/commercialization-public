---
title: Windows System Image Manager Architecture
description: Windows System Image Manager Architecture
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e070daa9-f196-495c-90e0-78c311feb99a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows System Image Manager Architecture


You use Windows® System Image Manager (Windows SIM) to create an XML-based answer file that is required to automate Windows installations.

Windows SIM uses the Component Platform Interface (CPI API) to create and manage answer files. The components and settings in a specific Windows image are used to create a catalog file. This catalog file is used in Windows SIM to create answer files. For more information, see [Windows Image Files and Catalog Files Overview](windows-image-files-and-catalog-files-overview.md).

An optional set of folders, called a distribution share, can be created to store files that you use to further customize your Windows installation. For more information, see [Distribution Shares and Configuration Sets Overview](distribution-shares-and-configuration-sets-overview.md).

Windows SIM can create a smaller, more portable version of a distribution share called a configuration set. These smaller files can be easier to manage.

You can also use the CPI API to create your own customized applications that can automate the creation and management of unattended Windows Setup answer files. For more information, see the ***Component Platform Interface (CPI) Reference* (CPIAPI.chm)**.

The following diagram shows how Windows SIM works.

![windows sim architecture](images/dep-win8-l-wsim-arch.jpg)

## Related topics


[Windows System Image Manager Reference Topics](windows-system-image-manager-technical-reference.md)

[Windows System Image Manager Overview Topics](windows-system-image-manager-overview-topics.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Windows%20System%20Image%20Manager%20Architecture%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





