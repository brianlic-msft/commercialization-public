---
title: Detail Level
description: Detail Level
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8a1de1e7-dea5-4ab2-b707-2a1ee109b0f1
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Detail Level


Windows Performance Recorder (WPR) recording profiles control all aspects of a recording. For each WPR profile, you must select a detail level. The available levels are **Light** and **Verbose**. The **Light** detail level is primarily used for timing recordings. The **Verbose** detail level provides the detailed information that you need for analysis. Built-in profiles support both **Verbose** and **Light** detail levels.

The **Verbose** level is selected by default in both the WPR user interface (UI) and in the WPR command line.

When you author custom profiles, we recommend that you define both a light version and a verbose version in the same .wprp file. These files can contain up to four profile definitions: one for each combination of detail level and logging mode.

## Related topics


[WPR Features](wpr-features.md)

[Logging Mode](logging-mode.md)

[3. Profile Definitions](3-profile-definitions.md)

[Change the Detail Level](change-the-detail-level.md)

[Authoring Recording Profiles](authoring-recording-profiles.md)

 

 







