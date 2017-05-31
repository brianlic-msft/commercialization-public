---
title: boot
description: boot
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c6bf946c-9da7-4147-a37e-c117e1ea1fff
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# boot


This action produces an XML report that summarizes the various metrics in boot.

``` syntax
-a boot [-minCPUToShow <n>] [-maxFilesToShow <n>] [-expectedProcessesFile <file name>] [-minIntervalToShow <n>] [-userShellExecutable]
```

## Options


<a href="" id="-mincputoshow-n-"></a>**-minCPUToShow***&lt;n&gt;*  
*&lt;n&gt;* indicates the minimum percentage of CPU usage to show, in the range 0-100.

<a href="" id="-maxfilestoshow-n-"></a>**-maxFilesToShow***&lt;n&gt;*  
*&lt;n&gt;* indicates the maximum number of files to show.

<a href="" id="-expectedprocessesfile-file-name-"></a>**-expectedProcessesFile***&lt;file name&gt;*  
*&lt;file name&gt;* specifies a text file that contains a list of expected process names.

<a href="" id="-minintervaltoshow-n-"></a>**-minIntervalToShow***&lt;n&gt;*  
*&lt;n&gt;* indicates the minimum interval time to show, in microseconds. The default value is 10.

<a href="" id="-usershellexecutable"></a>**-userShellExecutable**  
User shell executable to locate in the trace. The default is Explorer.exe.

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







