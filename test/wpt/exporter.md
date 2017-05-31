---
title: Exporter
description: Exporter
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3b6b8ff1-b1c6-4117-a44a-010629b6b981
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Exporter


The WPA Exporter is a command-line tool that provides WPA functionality for automated analysis scenarios. By batching WPA Exporter commands together, you can perform trace analysis on a much larger scale than through the UI.

You can use the WPA Exporter to export tables from a single trace and profile, optionally filtered to a specific time range, to a .csv (comma-separated values) file. These time ranges can be defined by one of the following:

-   Numeric timestamp values

-   Named markers

-   [Regions of Interest](regions-of-interest.md)

If you do not specify a time range, data from the entire trace duration is exported.

You cannot currently export tables from [Comparative Analysis Views](comparative-analysis-views.md).

## Syntax


To use the WPA Exporter, you must provide an existing trace file along with a profile.

`wpaexporter.exe [-i] traceFile.etl -profile profile.wpaProfile [-delimiter <char>] [-prefix <prefix>] [-outputfolder <folder>] [-range <start> <end>] [-marks <M1> <M2>] [-regionsxml <manifest> ...] [-region <region_name>] [-symbols] [-tti] [-h | /?]`

## Parameters


<a href="" id="--i--tracefile-etl"></a>*\[-i\] traceFile.etl*  
A trace file that contains the data to export. The `–i` flag is optional.

<a href="" id="-profile"></a>*-profile*  
A WPA profile (.wpaProfile) that contains the tables to export.

<a href="" id="-delimiter"></a>*-delimiter*  
(Optional) The character to use as the separator between values in the CSV. The default separator is a comma.

<a href="" id="-prefix"></a>*-prefix*  
(Optional) A string to prepend to each of the output filenames.

<a href="" id="-outputfolder"></a>*-outputfolder*  
(Optional) The folder to which the tables will be exported.

<a href="" id="-range"></a>*-range*  
(Optional) The time span, from &lt;start&gt; to &lt;end&gt;, to be exported. The default unit is nanoseconds, but you can also specify seconds (s), milliseconds (ms), or microseconds (us).

**Examples:**`1s`, `100ms`, `500us`

<a href="" id="-marks"></a>*-marks*  
(Optional) The range to be exported, as specified by two named markers.

<a href="" id="-regionsxml"></a>*-regionsxml*  
(Optional) One or more manifest files that contain regions of interest. You can specify this flag without the `–region` flag to export the entire **Regions of Interest** table.

**Example:**`-regionsxml regionsxml1.xml regionsxml2.xml`

<a href="" id="-region"></a>*-region*  
(Optional) The name of a specific region in the trace. Use this flag to export data only for the duration of the region. If you use this flag, you must also specify at least one regions of interest manifest file.

<a href="" id="-symbols"></a>*-symbols*  
(Optional) Include this flag to enable symbol loading.

<a href="" id="-tti"></a>*-tti*  
(Optional) Process the trace even in the presence of time inversions.

## Remarks


The output file names are automatically generated based on the table and preset names. The user may optionally specify a prefix (`-prefix`) and directory (`-outputfolder`).

## Related topics


[WPA Features](wpa-features.md)

[View Profiles](view-profiles.md)

 

 







