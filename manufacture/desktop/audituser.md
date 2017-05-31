---
author: Justinha
Description: auditUser
ms.assetid: 34da792a-51fa-4a4d-a67e-6390cb5be2a1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: auditUser
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# auditUser


The **auditUser** configuration pass processes unattended Windows® Setup settings in user context in audit mode. The **auditUser** configuration pass always runs after the [auditSystem](auditsystem.md) pass, which is used to apply settings in system context. Typically, the **auditUser** configuration pass is used to execute **RunSynchronous** or **RunAsynchronous** commands. These commands are used to run scripts, applications, or other executables during audit mode. When Windows boots to audit mode, the auditSystem and **auditUser** settings for unattended Windows Setup are processed.

Audit mode enables OEMs and corporations to install additional device drivers, applications, and other updates to a master Windows® image. By using audit mode, you can maintain fewer images because you can create a reference image with a minimal set of drivers and applications. The reference image can then be updated with additional drivers during audit mode. Additionally, you can test and resolve any issues related to malfunctioning or incorrectly installed devices on the Windows image before shipping the computer to a customer. Audit mode is optional.

The following diagram illustrates when the **auditUser** configuration pass is processed in audit mode.

![auditmode configuration pass](images/dep-win8-l-auditmode.jpg)

The **auditUser** configuration pass runs only when you configure Windows Setup to boot into audit mode. You can boot to audit mode by using the **sysprep /audit** or **sysprep /generalize /audit** commands, or you can specify the **Reseal** setting in the Microsoft-Windows-Deployment component. For more information about audit mode, see [Audit Mode Overview](audit-mode-overview.md) and [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

## <span id="related_topics"></span>Related topics


[How Configuration Passes Work](how-configuration-passes-work.md)

[auditSystem](auditsystem.md)

[generalize](generalize.md)

[offlineServicing](offlineservicing.md)

[oobeSystem](oobesystem.md)

[specialize](specialize.md)

[windowsPE](windowspe.md)

 

 






