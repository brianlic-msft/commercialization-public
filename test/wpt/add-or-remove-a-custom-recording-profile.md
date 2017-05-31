---
title: Add or Remove a Custom Recording Profile
description: Add or Remove a Custom Recording Profile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0fc967f2-9acb-42ac-b4dc-463c6971fd13
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add or Remove a Custom Recording Profile


This procedure describes how to add a custom recording profile in the Windows Performance Recorder (WPR) user interface (UI). For information about how to start a recording from the command line, see [WPR Command-Line Options](wpr-command-line-options.md).

**To add a recording profile**

1.  On the WPR screen, if the options are hidden, click **More options**.

2.  Click **Add Profiles**.

3.  Navigate to the location that contains the profile files, select the .wprp file, and then click **Open**. WPR will validate the schema of the .wprp file before it is added to the profile.

4.  Repeat steps 2 and 3 to add additional profiles. You can use up to 64 profiles for a single recording.

The profiles that you added will display under **Custom measurements**.

**To remove a recording profile**

1.  On the WPR screen, if the options are hidden, click **More options**.

2.  Right-click the custom profile that you want to remove and then click **Remove Profile**.

The **Remove Profile** button is visible only if custom profiles are present. You can only remove custom profiles: you cannot remove built-in profiles.

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Authoring Recording Profiles](authoring-recording-profiles.md)

 

 







