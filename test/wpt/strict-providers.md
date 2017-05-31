---
title: Strict Providers
description: Strict Providers
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b75d08cc-eaa5-42b8-9bac-d9b6aa35f31a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Strict Providers


Windows Performance Recorder (WPR) recording profiles are stored in an XML file that has a .wprp extension. *Profile definitions* bring together the collector and provider definitions in the .wprp file. The **Strict** attribute in provider definitions controls the behavior of a recording profile when the provider does not start at the same time that the recording starts.

Providers might not start for many reasons, such as a bug in the provider implementation or an incorrectly configured system. When a provider does not start and its **Strict** attribute is set to "true", the start operation fails and rolls back. All collectors and providers that started successfully are canceled. The error log provides error information about the provider that did not start. If the **Strict** attribute is set to "false", as many collectors and providers start as is possible, and the start operation succeeds. Information about providers that did not start appears as warnings instead of errors.

## Related topics


[Authoring Recording Profiles](authoring-recording-profiles.md)

[2. System and Event Provider Definitions](2-system-and-event-provider-definitions.md)

 

 







