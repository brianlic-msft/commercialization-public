---
author: Justinha
Description: oobeSystem
ms.assetid: afe6d754-0ca6-4252-87c7-bfc234a2cc6a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: oobeSystem
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# oobeSystem


The **oobeSystem** configuration pass configures settings that are applied during the end-user first-boot experience, also called Out-Of-Box Experience (OOBE). The **oobeSystem** configuration pass settings are processed before a user first logs on to Windows®.

Out-of-Box-Experience (OOBE) runs the first time the user starts a newly configured computer. OOBE runs before the Windows shell or any additional software runs, and it performs a small set of tasks that are required to configure and run Windows.

The following diagram illustrates the process that occurs when an end user first boots a newly configured computer. The result is OOBE, or a user's first-boot experience.

![windows welcome configuration pass](images/dep-win8-l-windowswelcomeconfigpass.jpg)

You can configure Windows to boot to OOBE by running the **sysprep** command by using the **/oobe** option. By default, after running Windows Setup, OOBE starts.

## <span id="related_topics"></span>Related topics


[How Configuration Passes Work](how-configuration-passes-work.md)

[auditSystem](auditsystem.md)

[auditUser](audituser.md)

[generalize](generalize.md)

[offlineServicing](offlineservicing.md)

[specialize](specialize.md)

[windowsPE](windowspe.md)

 

 






