---
title: diskidlehistogram
description: diskidlehistogram
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 16552102-b666-4c50-b530-87b31c4838be
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# diskidlehistogram


This action produces a histogram that displays all disk activity and idle time.

``` syntax
-a diskidlehistogram [-disknum <n>] [-buckets B1 B2 ... Bn] [-idletimeout T1 T2 ... Tn] [-idletheshold <t>] [-spindownOverhead [t]] [-spinupOverhead [t]] [-exc_file File1 File2 ... FileN] [-exc_filestr String1 String2 ... StringN] [-exc_filere <regex>]
```

## Options


<a href="" id="-disknum-n-"></a>**-disknum***&lt;n&gt;*  
*n* indicates the disk number (0-based disk index). The default value is to output histograms for all disks.

<a href="" id="-bucketsb1-b2---bn"></a>**-buckets***B1 B2 … Bn*  
Arguments indicate different ranges of idle length, in seconds. Default buckets are as follows:

-   \[0 s, 1 s\]

-   \[1 s, 5 s\]

-   \[5 s, 60 s\]

-   \[60 s, 180 s\]

-   \[180 s, 600 s\]

-   \[600 s, 900 s\]

-   \[900 s, 1200 s\]

-   \[1200 s, 1800 s\]

-   \[1800 s, +inf\]

A disk idle histogram displays the distribution of disk idle time and the number of idle periods over different ranges of idle period length, as illustrated by the example values in the following table.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th></th>
<th>Less than 1 second</th>
<th>1-600 seconds</th>
<th>More than 600 seconds</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Idle time</p></td>
<td><p>1000</p></td>
<td><p>1000</p></td>
<td><p>2000</p></td>
</tr>
<tr class="even">
<td><p>Percent of total idle time</p></td>
<td><p>25</p></td>
<td><p>25</p></td>
<td><p>50</p></td>
</tr>
<tr class="odd">
<td><p>Idle count</p></td>
<td><p>90</p></td>
<td><p>5</p></td>
<td><p>5</p></td>
</tr>
<tr class="even">
<td><p>Percent of total idle count</p></td>
<td><p>90</p></td>
<td><p>5</p></td>
<td><p>5</p></td>
</tr>
</tbody>
</table>

 

The first row shows the histogram’s buckets: different ranges of idle length.

The second row shows the accumulated idle time for each bucket. For example, the accumulated idle time for all idle periods shorter than 1 second is 1000 seconds.

The third row calculates the percentage of idle time for each bucket by dividing the idle time for a bucket by the total idle time.

The fourth row is the count of idle periods captured for each bucket. In this example, there are 90 idle periods lasting less than one second.

The last row calculates the percentage of idle periods for each bucket by dividing the number of idle periods for a bucket by the total number of idle periods.

The follow command would produce the buckets in the following list: **-buckets 1s 5s 60s 180s**:

-   \[0, 1 s\]

-   \[1 s, 5 s\]

-   \[5 s, 60 s\]

-   \[60 s, 180 s\]

-   \[180 s, +inf\]

<a href="" id="-idletimeoutt1-t2---tn"></a>**-idletimeout***T1 T2 … Tn*  
Arguments indicate the idle timeout, in seconds. The default values are 5, 60, 180, 600, and 1800.

<a href="" id="-idletheshold-t-"></a>**-idletheshold***&lt;t&gt;*  
Arguments indicate the idle threshold, in seconds. Idle periods shorter than this threshold are ignored.

<a href="" id="-spindownoverhead-t-"></a>**-spindownOverhead***\[t\]*  
If you do not specify an argument, the default value is 0.

Using a sequence of disk I/O timestamps and a specified idle timeout, you can compute when the disk would be spun down and how much time it can stay in spun-down state, as illustrated in the following table.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Timeout, in seconds</th>
<th>5</th>
<th>60</th>
<th>180</th>
<th>600</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Estimated spindown opportunity time, in seconds</p></td>
<td><p>3800</p></td>
<td><p>2000</p></td>
<td><p>1000</p></td>
<td><p>500</p></td>
</tr>
<tr class="even">
<td><p>Estimated spindown opportunity count</p></td>
<td><p>500</p></td>
<td><p>100</p></td>
<td><p>50</p></td>
<td><p>10</p></td>
</tr>
</tbody>
</table>

 

The first row shows the idle timeout values of interest for estimating spun-down time. The second row shows the estimated total spun-down time corresponding to each timeout. In this example, a timeout of 5 seconds yielded the total spun-down time of 3800 seconds. The third row shows the estimated number of times the disk is spun down for each timeout value.

<a href="" id="-spinupoverheadt"></a>**-spinupOverhead***T*  
If you do not specify an argument, the default value is 0 seconds.

<a href="" id="-exc-filefile1-file1---filen"></a>**-exc\_file***File1 File1 … FileN*  
Files matching the provided full file paths are excluded. You must specify the full file path for each file you want to exclude.

<a href="" id="-exc-filestrstring1-string2---stringn"></a>**-exc\_filestr***String1 String2 … StringN*  
Files containing one or more of the provided strings are excluded.

<a href="" id="-exc-filere-regx-"></a>**-exc\_filere***&lt;regx&gt;*  
Files matching the provided ATL regular expression are excluded. For example, you can ignore all files ending with .dll by specifying the expression ".\*\\.dll".

**Note**   When defining a new line, you must include a return character. Instead of using **\\n**, use **\\r\\n**. By including both characters (carriage return = r; line feed = n), you create a line terminator. This is helpful when creating a [regions of interest](regions-of-interest.md) file.

 

## Remarks


There are a few system files whose disk I/Os are in response to disk I/Os to other files. These system files include the following:

-   $LogFiles

-   $Mft

-   $Bitmap

-   lastalive0.dat

-   lastalive1.dat

-   $UsnJrnl:$J

It can be difficult to differentiate which disk I/Os to other files cause a particular disk I/O to the above system files. Consequently, if you want to see the impact of the files that you have excluded, you must also exclude these system files. Because these system files’ disk I/Os are in response to or "piggyback" on other disk I/Os, ignoring only these system files themselves is not expected to change the disk idle histogram significantly.

Output from this action can be imported into a spreadsheet for sorting and analysis. Two additional metrics are provided for the output:

<a href="" id="avgiointerval"></a>**AvgIOInterval**  
For a particular file, this is the average interval between two subsequent I/Os to this file. This metric can be misleading if a file has tiny I/O intervals, such as intervals of less than 1 second. Even if this file also has large I/O intervals, such as 30 minutes, the average IO interval may look much worse than another file with medium short I/O intervals, such as 10 minutes. In this case, you could use `-idlethreshold T` to remove idle periods of less than 1 second from the analysis.

<a href="" id="maxiointerval"></a>**MaxIOInterval**  
For each file, this is the maximum interval between two subsequent I/Os to this file. The output is sorted based on this metric by default. A file with one large I/O interval can still have frequent I/Os on average.

**Note**  
Use both of these metrics and per-file histograms for a comprehensive picture of disk activity.

 

Avoid perturbing the disk(s) under study by using a different physical disk (or device such as a USB flash drive) to collect the trace.

## Example


The following example shows a typical use of this action with default parameters

``` syntax
Xperf -i Trace.etl -a diskidlehistogram > output.csv
```

Collect information on disk I/Os as well as related information, such as registry/cswitch/stacks, in case deeper analysis is needed. `Compact_cswitch` can be used to reduce trace file size. The following example shows a set of recommended Xperf flags.

``` syntax
xperf -on dispatcher+PROC_THREAD+LOADER+CSWITCH+COMPACT_CSWITCH +registry+DISK_IO+DISK_IO_INIT+FILEIO -stackwalk cswitch+readythread+DiskReadInit+DiskWriteInit+DiskFlushInit -buffersize 1024
sleep <desired trace time in seconds> or run scenario
xperf -d trace.etl
```

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







