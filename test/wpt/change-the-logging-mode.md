---
title: Change the Logging Mode
description: Change the Logging Mode
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f193105c-8d15-432b-abae-dde9e16199de
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Change the Logging Mode


This procedure shows how to change the Windows Performance Recorder (WPR) logging mode from the user interface (UI). For information about how to start a recording from the command line, see [WPR Command-Line Options](wpr-command-line-options.md).

**To change the logging mode**

1.  Click **Windows Performance Recorder** on the Windows 8 **Start** screen.

2.  Click **More options**.

3.  Select the logging mode from the **Logging mode** drop-down list. The default mode is **Memory**.

**Caution**  
For longer recordings, select **Memory**. When you select **File**, the file can grow very large because the available disk space is the only limitation to file size. If the file is too large, you might not be able to analyze it in Windows Performance Analyzer (WPA).

 

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Logging Mode](logging-mode.md)

 

 







