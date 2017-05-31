---
title: stop
description: stop
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ebde3a43-c6c9-47d4-b6f1-8b1dae313af3
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# stop


Displays trace stop options.

``` syntax
xperf [-stop [LoggerNames]|[ProfileFileName!ProfileName|SessionName merged.etl]]|[-stopall]|[-cancel rofileFileName!ProfileName|SessionName [NoDelete]] [-d merged.etl] [-heap|-critsec]
```

## Parameters


<a href="" id="-stoploggernames-profilefilename-profilename-sessionname-merged-etl"></a>**-stop***LoggerNames|ProfileFileName!ProfileName|SessionName merged.etl*  
Turns off loggers specified in *LoggerNames*, turns off loggers in profile *ProfileName* defined in the *ProfileFileName* file and merges the ETL files to merged.etl, or turns off logger *SessionName* defined in the *ProfileFileName* file and merges the ETL file to Merged.etl.

<a href="" id="-stopall"></a>**-stopall**  
Turns off all logging sessions.

<a href="" id="-cancelprofilefilename-profilename-sessionname--nodelete-"></a>**-cancel***ProfileFileName!ProfileName|SessionName \[NoDelete\]*  
Turns off loggers in profile *ProfileName* defined in the *ProfileFileName* file and deletes the trace files, or turns off logger *SessionName* defined in the *ProfileFileName* file, and merges the ETL file to Merged.etl. If *NoDelete* is specified, trace files are not deleted.

<a href="" id="-dmerged-etl"></a>**-d***merged.etl*  
Merges the ETL files of stopped logging sessions merged.etl. If no session is stopped explicitly, the NT kernel logger is stopped implicitly.

<a href="" id="-boottraceoff"></a>**-boottrace***off*  
Turns off a boot trace.

<a href="" id="-heap"></a>**-heap**  
Stops heap tracing.

<a href="" id="-critsec"></a>**-critsec**  
Stops critical section tracing.

## Remarks


Currently, only one heap trace or critical section trace can be active at a time. Therefore, **-heap** and **-critsec** are mutually exclusive. If *LoggerNames* is not specified or **-d** is specified with neither **-stop** nor **-stopall** present, the kernel logger is stopped.

## Related topics


[Xperf Options](xperf-options.md)

 

 







