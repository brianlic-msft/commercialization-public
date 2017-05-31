---
title: WPR Command-Line Options
description: WPR Command-Line Options
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3c69c8df-6ce3-49a0-b17f-e2b60016b72a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WPR Command-Line Options


Windows Performance Recorder (WPR) offers a simple command line interface. The full complexity of WPR is embedded in the recording profiles.

WPR requires Windows 7 or later version operating system.

**Syntax:**

**wpr** {**-profiles** \[*&lt;path&gt;* \[ …\]\] | **-start** *&lt;arguments&gt;* | **-stop** *&lt;arguments&gt;* | **-cancel** | **-status** *&lt;arguments&gt;* | **-log** *&lt;argument&gt;* | **-purgecache** | **-help** *&lt;arguments&gt;* | **-profiledetails** | **-disablepagingexecutive**}

The following sections describe the command-line options:

-   [Profiles](#profiles)

-   [Start](#start)

-   [Stop](#stop)

-   [Cancel](#cancel)

-   [Status](#status)

-   [Profiledetails](#prodet)

-   [Providers](#prodet)

-   [Disablepagingexecutive](#disablepagingexec)

-   [Log](#log)

-   [Purgecache](#purge)

-   [Remarks](#rem)

**Note**  
If you start WPR from the command line while another application is recording (such as Xperf or an application that uses NT Kernel Logger, such as logman or PerfTrace), WPR fails to start recording and returns the following error:

`The event collector was already running.`

In this case, you must cancel the other recording before you can start a new recording by using WPR.

 

## Profiles


Use this option to list the WPR profiles that the recording uses.

**Syntax:**

**wpr** **-profiles** \[*&lt;path&gt;*\]

The following table describes the available arguments that you can apply to this option.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>&lt;path&gt;</em></p></td>
<td><p>To see built-in profiles, omit the argument.</p>
<p>To list the profiles that are defined in a profile definition file, specify the path and name of that file.</p>
<p>Example:</p>
<p><code>wpr -profiles</code></p>
<p><code>wpr -profiles “c:\Users\User1\Documents\WPR Files\Custom Profiles\CustomProfile1.wprp”</code></p></td>
</tr>
</tbody>
</table>

 

## Start


Use this option to start a recording by using one or more profiles.

**Syntax:**

**wpr -start** *&lt;profile&gt;*\] **\[-start** &lt;*profilen*&gt;\] \[**-filemode**\] \[**-recordtempto** &lt;*temp folder path*&gt;\]\[**-onoffscenario** &lt;*OnOff Transition Type*&gt;\] \[**-onoffresultspath** &lt;*path to which the trace files are saved*&gt;\]\[**-onoffproblemdescription** &lt;*description of the scenario*&gt;\] \[**-numiterations** &lt;*number of iterations for OnOff tracing*&gt;\]

The following table describes the available arguments that you can apply to this option.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>&lt;profile&gt;</em> or <em>&lt;profilen&gt;</em></p></td>
<td><p>Specifies either a built-in profile or the path to a user-defined profile.</p>
<p>You can specify up to 64 profiles on a single command line. Each profile is specified in the following way:</p>
<pre class="syntax" space="preserve"><code>&lt;profile&gt; :=&lt;profile_name&gt;[.{light|verbose}] </code></pre></td>
</tr>
<tr class="even">
<td><p><em>&lt;profile_name&gt;</em></p></td>
<td><p>Each profile can define either light or verbose versions, or both versions. If neither option is specified, the verbose version is used unless the profile includes only a light version. For proper syntax, see the preceding code sample for <em>&lt;profile&gt;</em> or <em>&lt;profilen&gt;</em>.</p></td>
</tr>
<tr class="odd">
<td><p><em>-filemode</em></p></td>
<td><p>Specifies that recording is done in file mode. (The default mode is memory.)</p>
<p>By using this option, the data is recorded to an unbounded file, which can grow in size until it fills the disk.</p></td>
</tr>
<tr class="even">
<td><p><em>-onoffresultspath</em></p></td>
<td><p>Path to which the trace files are saved.</p></td>
</tr>
<tr class="odd">
<td><p><em>-onoffproblemdescription</em></p></td>
<td><p>Description of the scenario.</p></td>
</tr>
<tr class="even">
<td><p><em>-onoffscenario</em></p></td>
<td><p>Specifies one of the on/off transition types. These are: Boot, FastStartup, Shutdown, RebootCycle, Standby, or Hibernate.</p></td>
</tr>
<tr class="odd">
<td><p><em>-numiterations</em></p></td>
<td><p>Sets the number of iterations for <em>OnOff</em> recording. By default, the settings from the built-in or custom profile file are used by default.</p></td>
</tr>
</tbody>
</table>

 

## Stop


Use this option to stop the current recording and save it to the file that is specified by the argument.

**Syntax:**

**wpr** **-stop** *&lt;file&gt;* *&lt;problem description*&gt;

The following table describes the available arguments that you can apply to this option.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>&lt;file&gt;</em></p></td>
<td><p>Specifies the event trace log (ETL) file to which WPR saves the recording. This argument is required.</p></td>
</tr>
<tr class="even">
<td><p><em>&lt;problem description&gt;</em></p></td>
<td><p>Specifies the problem description. Although this argument is optional, we recommended that you use it.</p></td>
</tr>
</tbody>
</table>

 

## Cancel


Use this option to cancel the current recording without saving the recorded data. If no instance is currently active, an error is returned.

**Syntax:**

**wpr** **-cancel**

This option takes no arguments.

## Status


Use this option to display status information about the current WPR recording.

**Syntax:**

**wpr** **-status** \[*profiles*\] \[*collectors* \[*details*\]\]

If no recording is currently active, a message displays that WPR is not recording. If a recording is currently active and no arguments are used, the following status information displays:

`WPR recording is in progress...`

`Time since start        : 00:04:27`

`Dropped event           : 0`

`Logging mode            : Memory`

If you supply arguments together with the **–status** option, the information listed above displays together with data that is specific to that option. The following table describes the available arguments that you can apply to this option.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description and Example Output</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>profiles</em></p></td>
<td><p>This argument lists each profile that is being used in the current WPR recording.</p>
<p><strong>Example:</strong></p>
<p><code>Recording system activity using the following set of profiles:</code></p>
<p><code>Profile                 : CPU.Verbose.Memory</code></p></td>
</tr>
<tr class="even">
<td><p><em>collectors</em></p></td>
<td><p>Lists collector information. If buffers have been lost, those buffers are listed.</p>
<p><strong>Example:</strong></p>
<pre class="syntax" space="preserve"><code>Actively recording collectors:

Collector Name          : NT Kernel Logger
Buffer Size (KB)        : 1024
Events Lost             : 0
System Keywords
        CSwitch
        ProcessThread
        SampledProfile
System Stacks
        CSwitch
        SampledProfile

Collector Name          : WPR_initiated_WPR Event Collector
Buffer Size (KB)        : 1024
Events Lost             : 0
Providers
        Microsoft-Windows-Shell-Core: 0x1000000000000: 0x04
        Microsoft-Windows-Win32k: 0x1000000402000: 0xff : Stack
CaptureState Providers on Save
        Microsoft-Windows-Win32k: 0x80000: 0xff</code></pre></td>
</tr>
<tr class="odd">
<td><p><em></em>details</p></td>
<td><p>Lists additional information about each collector.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="prodet"></a>Profiledetails


Use this option to display detailed information about a profile or set of profiles. To specify multiple profiles, use the following syntax where `profile`*n* refers to the name of each profile.

**Syntax:**

`wpr -profiledetails profile1+profile2..+profilen [-filemode] -onoffscenario <OnOff Transition Type>`

## Providers


Use this option to display detailed information about providers. Providers refer to the Event Tracing for Windows (ETW) components that expose events to Windows Performance Recorder (WPR). To display information about providers, use the following syntax where `providers`** refers to all installed/known and registered providers.

**Syntax:**

`wpr -providers`

## <a href="" id="disablepagingexec"></a>Disablepagingexecutive


Use this option to specify whether drivers and kernel-mode system code can be paged to disk. Setting this option to *on* prevents paging.
This option sets the value of [DisablePagingExecutive](https://technet.microsoft.com/en-us/library/cc959492.aspx) in the registry.

**Syntax:**

`wpr -disablepagingexecutive <on/off>`

**Note**  
To correctly capture event stacks on 64-bit systems that are running Windows 7, *disablepagingexecutive* should be set to *On*, and the system must be rebooted before you start performance recording. For 32-bit systems that are running Windows 7 and for all systems that are running Windows 8 or higher, you can operate performance recording without setting *disablepagingexecutive* to *On*.

 

## Log


Use this option to append and configure debug logging to the event log.

**Syntax:**

**wpr** **-log** {*enabled*|*disabled*|*remove*}

The following table describes the available arguments that you can apply to this option.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>enabled</em></p></td>
<td><p>Enables debug logging to the event log.</p></td>
</tr>
<tr class="even">
<td><p><em>disabled</em></p></td>
<td><p>Disables debug logging to the event log.</p></td>
</tr>
<tr class="odd">
<td><p><em>remove</em></p></td>
<td><p>Uninstalls the WPR debug logging provider manifest from the system.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="purge"></a>Purgecache


Use this option to purge the managed symbols cache.

**Syntax:**

**wpr** **-purgecache**

This option takes no arguments.

## Help


Use this option to display on-line help in the Command Prompt window.

**wpr** **-help** \[{*log*|*profiles*|*profiledetails*\\*disablepagingexecutive*\\*start*|*status*|*stop*}\]

The following table describes the available arguments that you can apply to this option.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>cancel</em></p></td>
<td><p>Describes <code>–cancel</code> command-line arguments. For more information, see [Cancel](#cancel).</p></td>
</tr>
<tr class="even">
<td><p><em>disablepagingexecutive</em></p></td>
<td><p>Describes <em>–disablepagingexecutive</em> command-line argument. For more information, see [Disablepagingexecutive](#disablepagingexec).</p></td>
</tr>
<tr class="odd">
<td><p><em>log</em></p></td>
<td><p>Describes <code>-log</code> command-line arguments. For more information, see [Log](#log).</p></td>
</tr>
<tr class="even">
<td><p><em>profiledetails</em></p></td>
<td><p>Describes <em>–profiledetails</em> command-line argument. For more information, see [Profiledetails](#prodet).</p></td>
</tr>
<tr class="odd">
<td><p><em>profiles</em></p></td>
<td><p>Describes <code>-profiles</code> command-line arguments. For more information, see [Profiles](#profiles).</p></td>
</tr>
<tr class="even">
<td><p><em>providers</em></p></td>
<td><p>Describes <code>-providers</code> command-line arguments. For more information, see [Providers](#providers).</p></td>
</tr>
<tr class="odd">
<td><p><em>purgecache</em></p></td>
<td><p>Describes <code>–purgecache</code> command-line arguments. For more information, see [Purgecache](#purge).</p></td>
</tr>
<tr class="even">
<td><p><em>start</em></p></td>
<td><p>Presents descriptions of <code>-start</code> command-line arguments. For more information, see [Start](#start).</p></td>
</tr>
<tr class="odd">
<td><p><em>status</em></p></td>
<td><p>Presents descriptions of <code>-status</code> command-line arguments. For more information, see [Status](#status).</p></td>
</tr>
<tr class="even">
<td><p><em>stop</em></p></td>
<td><p>Describes <code>-stop</code> command-line arguments. For more information, see [Stop](#stop)</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="rem"></a>Remarks


Each time that WPR saves a trace that was captured when managed applications were running on the system, WPR saves managed symbols next to the trace file. This feature enables performance analysis of managed applications.

Generating managed symbols is a resource- and time-consuming operation. WPR automatically creates a managed symbol cache to expedite the generation of managed symbols. When WPR needs managed symbols, it first checks this cache and uses any available and appropriate symbols instead of regenerating them.

The default managed symbol cache location is C:\\ProgramData\\WindowsPerformanceRecorder\\NGenPdbs\_Cache.

## Related topics


[WPR Reference](wpr-reference.md)

 

 







