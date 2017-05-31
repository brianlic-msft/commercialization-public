---
title: heap
description: heap
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5a8b4c32-9a36-4668-831a-8dc6fa9e2c5d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# heap


Writes a text file containing the following information in tabular form based on the output file specified by `-o`:

-   Alloc number

-   Alloc size, in KB

-   Out number

-   Out size, in KB

-   Realloc number

-   Extents size, in KB

-   Out Ext size, in KB

-   Heap handle

``` syntax
-a heap [-pid <processId>] [-stacks] [-frames] [-images] [-range T1 T2] [-lifetime T1 T2] [-size S1 S2] [-cullframes Frame1 Frame2 ... FrameN] [-requireframes Frame1 Frame2 ... FrameN] [-cullLists cullfuncs.txt] [-top <n>] [-totals]
```

## Options


<a href="" id="-pid-processid-"></a>**-pid***&lt;processId&gt;*  
Shows statistics only for the specified process identifier. If not specified, shows statistics for all processes.

<a href="" id="-stacks-s--o-oc-t-tc-rc--"></a>**-stacks***\[s \[o|oc|t|tc|rc\]\]*  
Displays the allocations, aggregated by stacks. This is the default behavior.

Sorts by outstanding size (*so*), outstanding count (*soc*, total size (*st*), reallocation count (*src*, and total count (*stc*). The default is *so*.

<a href="" id="-frames-s--o-oc-t-tc-rc--"></a>**-frames***\[s \[o|oc|t|tc|rc\]\]*  
Similar to `-stacks`, but the aggregation is by top stack frame, instead of by the entire stack.

<a href="" id="-images"></a>**-images**  
Similar to `-stacks` and `-frames`, but the aggregation is by image name of the top stack frame.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Use event data from times *T1* through *T2*, both in microseconds.

<a href="" id="-lifetimet1-t2"></a>**-lifetime***T1 T2*  
Include only allocations with a lifetime, in microseconds, greater than or equal to *T1* and less than *T2*.

<a href="" id="-sizes1-s2"></a>**-size***S1 S2*  
Include only allocations of sizes greater than or equal to *S1* and less than *S2*, in bytes.

<a href="" id="-cullframesframe1-frame2---framen"></a>**-cullframes***Frame1 Frame2 … FrameN*  
Removes any top stack frames from the report that match any of the specified frames. The parameter format is `[image!][symbol]`. The names are not case-sensitive.

<a href="" id="-requireframesframe1-frame2---framen"></a>**-requireframes***Frame1 Frame2 … FrameN*  
Requires that each stack have at least one frame that matches at least one of the specified frames. This test occurs before any explicit frame culling with `-cullframes`.

<a href="" id="-culllists-filename-"></a>**-cullLists***&lt;fileName&gt;*  
Frames in the specified file are to be excluded from the result. If a stack does not include such a frame, the stack is excluded. Frames have the same format as for `-cullFrames`. The names are not case-sensitive.

<a href="" id="-top-n-"></a>**-top***&lt;n&gt;*  
Limits the number of allocations displayed.

<a href="" id="-totals"></a>**-totals**  
Displays only the totals of the allocation events.

## Remarks


This action can take several minutes to complete on a large trace due to the heavy sorting and matching performed.

For information on how to capture heap data, see [Enabling Heap Data Capture](enabling-heap-data-capture.md)

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







