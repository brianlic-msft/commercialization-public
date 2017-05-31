---
title: Author a Custom Recording Profile
description: Author a Custom Recording Profile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4f33a662-0883-48b2-aa50-eb2dffc244d9
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Author a Custom Recording Profile


This procedure describes how to author a custom recording profile in Windows Performance Recorder (WPR). You can author custom profiles in an XML file that has a .wprp extension. are available See [Recording Profile XML Reference](recording-profile-xml-reference.md) for the complete schema and reference information. are available See [Authoring Recording Profiles](authoring-recording-profiles.md) for more detailed information about authoring recording profiles.

**To author a custom recording profile**

1.  In an XML editor, create a new XML file.

2.  Enter collector definitions. For more information, see [1. Collector Definitions](1-collector-definitions.md).

3.  Enter system and event provider definitions. For more information, see [2. System and Event Provider Definitions](2-system-and-event-provider-definitions.md).

4.  Enter profile definitions. For more information, see [3. Profile Definitions](3-profile-definitions.md).

    **Note**  
    If you want the custom profile to stop and roll back if some providers do not start, set the **Strict** attribute to "true". For more information about this option, see [Strict Providers](strict-providers.md).

     

5.  Save the file with a .wprp extension.

You can define derived collectors, providers, and profiles that inherit from a base version that you define earlier in the same file or in another file. For more information about this option, see [Inheritance](inheritance.md).

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

 

 







