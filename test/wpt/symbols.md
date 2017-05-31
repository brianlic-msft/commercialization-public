---
title: symbols
description: symbols
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7d34c86b-3b0c-40b1-a71d-b23978f97edf
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# symbols


Enables and configures symbol decoding support.

``` syntax
xperf -i <trace file>… [-o output] -symbols [cacheonly] [verbose] [dbghelplog]
```

## Parameters


<a href="" id="cacheonly"></a>*cacheonly*  
Use SymCache, but not DbgHelp. This option speeds symbol decoding for traces with many binary images that lack symbol files after all interesting symbol files have been transcoded.

<a href="" id="verbose"></a>*verbose*  
Verbose mode. Prints symbol paths and version information. For more information, see [Loading Symbols](loading-symbols.md).

<a href="" id="dbghelplog"></a>*dbghelplog*  
Enable DbgHelp debug log about **stderr**.

Symbol decoding support uses the environment variables in the following table for further configuration of DbgHelp and SymCache.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>_NT_SYMBOL_PATH</p></td>
<td><p>Specifies the DbgHelp path to search to locate symbols files (with the file name extension of .pdb) corresponding to binary images files used in the trace. See the note below regarding this variable.</p></td>
</tr>
<tr class="even">
<td><p>_NT_SYMCACHE_PATH</p></td>
<td><p>Specifies the path to the local SymCache directory. By default, \SymCache is used.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
For symbol decoding, the trace must be a kernel trace (or a user trace processed in conjunction with a kernel trace) that has the PROC\_THREAD+LOADER kernel flags enabled and that has been stopped and merged with `-d` or with `-merge` on the computer on which it was taken. Xperf performs a special image identification process during its custom trace merge that enables symbol decoding.

 

## Remarks


If this action is not specified on the command line, symbol decoding is disabled.

## Related topics


[Xperf Options](xperf-options.md)

[Loading Symbols](loading-symbols.md)

[Common In-Depth Analysis Issues](../assessments/common-in-depth-analysis-issues.md)

 

 







