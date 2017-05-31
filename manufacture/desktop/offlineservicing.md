---
author: Justinha
Description: offlineServicing
ms.assetid: 8c921c85-c986-419c-9f93-bdacd9441abb
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: offlineServicing
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# offlineServicing


Use the **offlineServicing** configuration pass to apply unattended Setup settings to an offline Microsoft® Windows® image. During this configuration pass, you can add language packs, updates, device drivers, or other packages to the offline image.

The **offlineServicing** configuration pass runs during Windows Setup. Setup extracts and installs the Windows image, and then executes the Deployment Image Servicing and Management (Dism.exe) tool. Packages listed in the `<servicing>` section and settings in the `<offlineServicing>` section of the answer file are applied to the offline Windows image.

Additionally, you can use the Deployment Image Servicing and Management tool with an answer file to apply settings in the **offlineServicing** pass. For more information, see [Service a Windows Image Using DISM](service-a-windows-image-using-dism.md).

## <span id="related_topics"></span>Related topics


[How Configuration Passes Work](how-configuration-passes-work.md)

[auditSystem](auditsystem.md)

[auditUser](audituser.md)

[generalize](generalize.md)

[oobeSystem](oobesystem.md)

[specialize](specialize.md)

[windowsPE](windowspe.md)

 

 






