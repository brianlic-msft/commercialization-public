---
title: Sharing and collaboration
description: Sharing and collaboration
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A75836F3-237B-4283-9948-08AB22966A7D
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sharing and collaboration


You can package a trace in a zip file along with the corresponding session, annotations, and (optionally) loaded symbols with WPA. This allows you to share this package with other developers and replaces [WPA sessions](save-state-at-the-end-of-a-wpa-session.md). A WPA package ("trace package) captures the entire analysis session:

-   Trace
-   Tabs
-   Graph configurations
-   Filters
-   Annotations
-   Symbols
    **Note**  WPA only packages symbols if they are loaded; if they are, WPA embeds them in the package. WPA does not preserve stack expansions.

     

## Benefits of sharing a trace package


Aside from being able to share a trace package with other developers, trace packages offer several other benefits:

-   Less space since trace packages are zipped
-   Support for and ability to open zipped-up trace files in WPA
-   Ability to open a trace package multiple times without needing to extract the same trace multiple times
-   Plugin verification and warnings if plugins aren't present when WPA opens your trace package.

**Note**  This process zips up your trace in the package. If your trace has an issue and contains sensitive material and you send it to us for further investigation, make sure to protect any sensitive material as you would any trace. Due to zipping, the package will likely have a file size smaller compared to a trace; this does not mean the zipping process removed any sensitive information.

 

## Sharing a trace package


To create a profile, first configure your view layout as you want it to appear, and then do the following:

1.  In the menu, choose **File** then **Export Package**. A Save As dialog opens.

2.  Navigate to the desired location.

3.  Name your export package, make sure the Save as type reads **WPA Package (\*.wpapk)**and click **Save**. A Wpapk progress bar displays, indicating packaging process. You may close the window, as the process will continue running in the background until complete.

## Related topics


[WPA Common Scenarios](windows-performance-analyzer-common-scenarios.md)

 

 







