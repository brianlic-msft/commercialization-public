---
title: Xperf Built-in Profiles
description: Xperf Built-in Profiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5628e0c0-5882-4b83-b8c1-058e5a125c68
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Xperf Built-in Profiles


To display all the built-in Xperf profiles, run the following command.

``` syntax
xperf -profiles
```

The following table describes available profiles.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Profile</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>perf!FileIOProfiles.InSequentialFile</p></td>
<td><p>File I/O tracing profile in a sequential file.</p></td>
</tr>
<tr class="even">
<td><p>perf!FileIOProfiles.InBuffer</p></td>
<td><p>File I/O tracing profile in a buffer.</p></td>
</tr>
<tr class="odd">
<td><p>perf!GeneralProfiles.InSequentialFile</p></td>
<td><p>Common system metrics tracing profile in a sequential file.</p></td>
</tr>
<tr class="even">
<td><p>perf!GeneralProfiles.InBuffer</p></td>
<td><p>Common system metrics tracing profile in a buffer.</p></td>
</tr>
<tr class="odd">
<td><p>perf!PerfCoreProfiles.InSequentialFile</p></td>
<td><p>Basic system metrics tracing profile (included with all built-in profiles) in a sequential file.</p></td>
</tr>
<tr class="even">
<td><p>perf!PerfCoreProfiles.InBuffer</p></td>
<td><p>Basic system metrics tracing profile (included with all built-in profiles) in a buffer.</p></td>
</tr>
<tr class="odd">
<td><p>perf!RegistryProfiles.InSequentialFile</p></td>
<td><p>Registry tracing profile in a sequential file.</p></td>
</tr>
<tr class="even">
<td><p>perf!RegistryProfiles.InBuffer</p></td>
<td><p>Registry tracing profile in a buffer.</p></td>
</tr>
<tr class="odd">
<td><p>perf!StdProfile</p></td>
<td><p>Common definitions used in built-in profiles (not startable).</p></td>
</tr>
</tbody>
</table>

 

## Examples


The following examples turn on several ETW sessions and merge them into a single trace file as needed.

**Memory-based trace profile**

For an in-memory repeated snapshots trace profile, run the following command.

``` syntax
xperf -start perf!GeneralProfiles.InBuffer
```

Run some scenario, and then run the following command.

``` syntax
xperf -save perf!GeneralProfiles.InBuffer snapshot1.etl
```

You can optionally continue saving additional snapshots, and then stop the trace capturing by running the following command.

``` syntax
xperf -cancel perf!GeneralProfiles.InBuffer
```

**File-based trace profile**

To start a file-based trace profile, run following command.

``` syntax
xperf -start perf!RegistryProfiles.InSequentialFile
```

Run some scenario, and then run the following command to stop trace capturing.

``` syntax
xperf -stop perf!RegistryProfiles.InSequentialFile trace.etl
```

**Extending profile definitions**

Profile definitions can be extended and composed using the command line. For example, to add **ReadyThread** stacks to the **perf!FileIOProfiles.InSequentialFile** profile, run the following command.

``` syntax
xperf -start perf!FileIOProfiles.InSequentialFile -stackwalk ReadyThread
```

## Related topics


[Xperf Profiles](xperf-profiles.md)

 

 







