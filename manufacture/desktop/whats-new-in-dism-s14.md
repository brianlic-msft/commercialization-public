---
author: Justinha
Description: 'What''s New in DISM'
ms.assetid: f1b463c0-96b5-4ad2-afac-53f9baf475a3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'What''s New in DISM'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# What's New in DISM


DISM in Windows 10 supports new features:

-   [Windows Imaging and Configuration Designer](https://msdn.microsoft.com/library/windows/hardware/dn916113) and related tools.

-   **Full Flash Update (.FFU)**: DISM supports the Full Flash Update (.FFU) format, which captures an applies an entire drive, including partition information. This can make deployment faster and easier.

    To learn more, see [WIM vs FFU image file formats](wim-vs-ffu-image-file-formats.md) and **/Apply-FFU** and **/Split-FFU** in [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

-   **Capabilities**: This new Windows package type allows you to request services like .NET or languages without specifying the version. Use DISM to search multiple sources like Windows Update or your corporate servers to find and install the latest version. For more info, see [DISM Capabilities Package Servicing Command-Line Options](dism-capabilities-package-servicing-command-line-options.md).

    To learn more, see the new topic: [DISM Capabilities Package Servicing Command-Line Options](dism-capabilities-package-servicing-command-line-options.md).

-   **Compress operating system and provisioning packages**: Save space on a Windows image by running the operating system and other system files from compressed files. This replaces the WIMBoot features from Windows 8.1.

    To learn more, see **/Apply-Image***/Compact* and **/Apply-CustomDataImage** in [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

For an overview of DISM, see [What is DISM?](what-is-dism.md).

 

 





