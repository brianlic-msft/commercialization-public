---
author: kpacquer
Description: 'WinPE: Identify drive letters with a script'
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Identify drive letters with a script'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Identify drive letters with a script

WinPE drive letter assignments change each time you boot, and can change depending on which hardware is detected. 

You can use a script to figure out which drive letter is which by searching for a file or folder.

This sample script looks for a drive that has a folder titled Images, and assigns it to a system variable: %IMAGESDRIVE%. 

``` syntax
@echo Find a drive that has a folder titled Images.
@for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do @if exist %%a:\Images\ set IMAGESDRIVE=%%a
@echo The Images folder is on drive: %IMAGESDRIVE%
@dir %IMAGESDRIVE%:\Images /w
```

## <span id="Related_topics"></span>Related topics

[WinPE for Windows 10](winpe-intro.md)

[Wpeinit and Startnet.cmd: Using WinPE Startup Scripts](wpeinit-and-startnetcmd-using-winpe-startup-scripts.md) 

[WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md) 