---
title: Powercfg command-line options
description: You can use the powercfg.exe tool to control power schemes (also named power plans) to use the available sleep states, to control the power states of individual devices, and to analyze the system for common energy-efficiency and battery-life problems.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6A6E2E98-2B6B-4C58-B0F9-A28B650383CF
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Powercfg command-line options


You can use the powercfg.exe tool to control power schemes (also named power plans) to use the available sleep states, to control the power states of individual devices, and to analyze the system for common energy-efficiency and battery-life problems.

## Syntax


From the Windows command-line, you can run "powercfg.exe /?" to bring up the following usage information:

``` syntax
powercfg /COMMAND [ARGUMENTS] [/?]
```

## Parameters


The following command-line options are available for powercfg.

> [!IMPORTANT]
> To navigate the table horizontally, click on the table and then use the left and right scroll keys on your keyboard or use the scroll bar at the bottom of the table.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Option</th>
<th>Argument</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>-HELP, /?</strong></p></td>
<td><p></p></td>
<td><p>Displays information about command-line parameters.</p></td>
</tr>
<tr class="even">
<td><p><strong>/LIST, /L</strong></p></td>
<td><p></p></td>
<td><p>Lists all power schemes.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /LIST</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/QUERY, /Q</strong></p></td>
<td><p>[<em>&lt;SCHEME_GUID&gt;</em> [<em>&lt;SUB_GUID&gt;</em>]]</p></td>
<td><p>Displays the contents of the specified power scheme. If neither the parameter <em>SCHEME_GUID</em> or <em>SUB_GUID</em> are provided, the settings of the current active power scheme are displayed. If the parameter <em>SUB_GUID</em> is not specified, all settings in the specified power scheme are displayed.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. The <code>POWERCFG /LIST</code> command returns a power scheme GUID.</p></li>
<li><p><em>&lt;SUB_GUID&gt;</em> Specifies a power-setting subgroup GUID. A power setting subgroup GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /QUERY</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /QUERY 381b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/CHANGE, /x</strong></p></td>
<td><p><em>&lt;SETTING&gt; &lt;VALUE&gt;</em></p></td>
<td><p>Modifies a setting value in the current power scheme.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SETTING&gt;</em> Specifies one of the following options: <strong>monitor-timeout-acmonitor-timeout-dcdisk-timeout-acdisk-timeout-dcstandby-timeout-acstandby-timeout-dchibernate-timeout-achibernate-timeout-dc</strong></p></li>
<li><p><em>&lt;VALUE&gt;</em> Specifies the new value, in minutes.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /CHANGE monitor-timeout-ac 5</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/CHANGENAME</strong></p></td>
<td><p><em>&lt;SCHEME_GUID&gt; &lt;NAME&gt;</em> [<em>&lt;DESCRIPTION&gt;</em>]</p></td>
<td><p>Modifies the name of a power scheme and optionally its description.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. The <code>POWERCFG /LIST</code> command returns a power scheme GUID.</p></li>
<li><p><em>&lt;NAME&gt;</em> Specifies the power scheme's new name.</p></li>
<li><p><em>&lt;DESCRIPTION&gt;</em> Specifies the power scheme's new description. If no description is specified, only the name is changed.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /CHANGENAME 381b4222-f694-41f0-9685-ff5bb260df2e &quot;Customized Balanced&quot;</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/DUPLICATESCHEME</strong></p></td>
<td><p><em>&lt;SCHEME_GUID&gt;</em> [<em>&lt;DESTINATION_GUID&gt;</em>]</p></td>
<td><p>Duplicates the specified power scheme. The resulting GUID which represents the new scheme is displayed.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command.</p></li>
<li><p><em>&lt;DESTINATION_GUID&gt;</em> Specifies the new power scheme's GUID. If no GUID is specified, a new GUID is created.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /DUPLICATESCHEME 381b4222-f694-41f0-9685-ff5bb260df2e</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/DELETE, /D</strong></p></td>
<td><p><em>&lt;SCHEME_GUID&gt;</em></p></td>
<td><p>Deletes the power scheme with the specified GUID.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /DELETE 381b4222-f694-41f0-9685-ff5bb260df2e</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/DELETESETTING</strong></p></td>
<td><p><em>&lt;SUB_GUID&gt; &lt;SETTING_GUID&gt;</em></p></td>
<td><p>Deletes a power setting.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SUB_GUID&gt;</em> Specifies a power setting subgroup GUID. A power setting subgroup GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;SETTING_GUID&gt;</em> Specifies a power setting GUID. A power setting GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /DELETESETTING 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/SETACTIVE, /S</strong></p></td>
<td><p><em>&lt;SCHEME_GUID&gt;</em></p></td>
<td><p>Makes the specified power scheme active on the system.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /SETACTIVE 381b4222-f694-41f0-9685-ff5bb260df2e</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/GETACTIVESCHEME</strong></p></td>
<td><p></p></td>
<td><p>Retrieves the currently active power scheme.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /GETACTIVESCHEME</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/SETACVALUEINDEX</strong></p></td>
<td><p><em>&lt;SCHEME_GUID&gt; &lt;SUB_GUID&gt; &lt;SETTING_GUID&gt; &lt;SETTING_INDEX&gt;</em></p></td>
<td><p>Sets the value associated with a specified power setting while the system is powered by AC power.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command.</p></li>
<li><p><em>&lt;SUB_GUID&gt;</em> Specifies a power setting subgroup GUID. A power setting subgroup GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;SETTING_GUID&gt;</em> Specifies a power setting GUID. A power setting GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;SETTING_INDEX&gt;</em> Specifies which possible value this setting is set to. A list of possible values is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /SETACVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/SETDCVALUEINDEX</strong></p></td>
<td><p><em>&lt;SCHEME_GUID&gt; &lt;SUB_GUID&gt; &lt;SETTING_GUID&gt; &lt;SETTING_INDEX&gt;</em></p></td>
<td><p>Sets the value associated with a specified power setting while the system is powered by DC power.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;SCHEME_GUID&gt;</em> Specifies a power scheme GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command.</p></li>
<li><p><em>&lt;SUB_GUID&gt;</em> Specifies a power setting subgroup GUID. A power setting subgroup GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;SETTING_GUID&gt;</em> Specifies a power setting GUID. A power setting GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;SETTING_INDEX&gt;</em> Specifies which possible value this setting is set to. A list of possible values is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /SETDCVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 300</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/IMPORT</strong></p></td>
<td><p><em>&lt;FILENAME&gt;</em> [<em>&lt;GUID&gt;</em>]</p></td>
<td><p>Imports a power scheme from the specified file.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;FILENAME&gt;</em> Specifies a fully-qualified path to a file generated by the <code>POWERCFG /EXPORT</code> command.</p></li>
<li><p><em>&lt;GUID&gt;</em> Specifies the GUID for the imported scheme. If no GUID is specified, a new GUID is created.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /IMPORT c:\scheme.pow</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/EXPORT</strong></p></td>
<td><p><em>&lt;FILENAME&gt; &lt;GUID&gt;</em></p></td>
<td><p>Exports a power scheme, represented by the specified GUID, to the specified file.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;FILENAME&gt;</em> Specifies a fully-qualified path to a destination file.</p></li>
<li><p><em>&lt;GUID&gt;</em> Specifies a power scheme GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /EXPORT c:\scheme.pow 381b4222-f694-41f0-9685-ff5bb260df2e</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/ALIASES</strong></p></td>
<td><p></p></td>
<td><p>Displays a list of aliases and their corresponding GUIDs. These aliases may be used instead of a GUID in any command.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /ALIASES</code></pre>
<div class="alert">
<strong>Note</strong>  
<p>Some settings do not contain aliases. For a full list of GUIDs, use <code>powercfg -q</code>.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p><strong>/GETSECURITYDESCRIPTOR</strong></p></td>
<td><p><em>&lt;GUID|ACTION&gt;</em></p></td>
<td><p>Gets the security descriptor associated with the specified power setting, power scheme, or action.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;GUID&gt;</em> Specifies a power scheme or a power setting GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command. A power setting GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;ACTION&gt;</em> Specifies one of the following actions: <strong>ActionSetActive</strong>, <strong>ActionCreate</strong>, <strong>ActionDefault</strong>.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /GETSECURITYDESCRIPTOR 381b4222-f694-41f0-9685-ff5bb260df2e</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /GETSECURITYDESCRIPTOR ActionSetActive</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/SETSECURITYDESCRIPTOR</strong></p></td>
<td><p><em>&lt;GUID|ACTION&gt; &lt;SDDL&gt;</em></p></td>
<td><p>Sets a security descriptor associated with the specified power setting, power scheme, or action.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;GUID&gt;</em> Specifies a power scheme or a power setting GUID. A power scheme GUID is returned from the <code>POWERCFG /LIST</code> command. A power setting GUID is returned from the <code>POWERCFG /QUERY</code> command.</p></li>
<li><p><em>&lt;ACTION&gt;</em> Specifies one of the following actions: <strong>ActionSetActive</strong>, <strong>ActionCreate</strong>, <strong>ActionDefault</strong>.</p></li>
<li><p><em>&lt;SDDL&gt;</em> Specifies a valid security descriptor string in SDDL format. An example SDDL string can be obtained from the <code>POWERCFG /GETSECURITYDESCRIPTOR</code> command.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /SETSECURITYDESCRIPTOR 381b4222-f694-41f0-9685-ff5bb260df2e O:BAG:SYD:P(A;CI;KRKW;;;BU)(A;CI;KA;;;BA)(A;CI;KA;;;SY)(A;CI;KA;;;CO)</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /SETSECURITYDESCRIPTOR ActionSetActive O:BAG:SYD:P(A;CI;KR;;;BU)(A;CI;KA;;;BA)(A;CI;KA;;;SY)(A;CI;KA;;;CO)</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/HIBERNATE, /H</strong></p></td>
<td><p>[<strong>ON</strong> | <strong>OFF</strong>]</p>
<p>[<strong>/SIZE</strong> <em>&lt;PERCENT_SIZE&gt;</em>]</p>
<p>[<strong>/TYPE</strong> <em>&lt;REDUCED | FULL&gt;</em>]</p></td>
<td><p>Enables or disables the hibernate feature or sets the hiberfile size.</p>
<p>Arguments:</p>
<ul>
<li><p><strong>ON</strong> Enables the hibernate feature.</p></li>
<li><p><strong>OFF</strong> Disables the hibernate feature.</p></li>
<li><p><strong>/SIZE</strong> <em>&lt;PERCENT_SIZE&gt;</em> Specifies the desired hiberfile size as a percentage of the total memory size. The default size cannot be smaller than 50. This parameter also causes hibernation to be enabled.</p></li>
<li><p><strong>/TYPE</strong> <em>&lt;REDUCED | FULL&gt;</em> Specifies the desired hiberfile type. A reduced hiberfile only supports hiberboot.</p>
<div class="alert">
<strong>Note</strong>  
<p>A hiberfile that has a custom default size, or HiberFileSizePercent &gt;= 40, is considered as a full hiberfile. To change the hiberfile type to reduced, the OS has to manage the default hiberfile size. To do this, run the following commands:</p>
<p>POWERCFG /HIBERNATE /SIZE 0</p>
<p>POWERCFG /HIBERNATE /TYPE REDUCED</p>
</div>
<div>
 
</div></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /HIBERNATE OFF</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /HIBERNATE /SIZE 100</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /HIBERNATE /TYPE REDUCED</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/AVAILABLESLEEPSTATES, /A</strong></p></td>
<td><p></p></td>
<td><p>Reports the sleep states available on the system. Attempts to report reasons why sleep states are unavailable.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /AVAILABLESLEEPSTATES</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/DEVICEQUERY</strong></p></td>
<td><p><em>&lt;QUERYFLAG&gt;</em></p></td>
<td><p>Returns a list of devices that meet the specified criteria.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;QUERYFLAG&gt;</em> Specifies one of the following criteria:</p>
<p><strong>wake_from_S1_supported</strong> Returns all devices that support waking the system from a light sleep state.</p>
<p><strong>wake_from_S2_supported</strong> Returns all devices that support waking the system from a deeper sleep state.</p>
<p><strong>wake_from_S3_supported</strong> Returns all devices that support waking the system from the deepest sleep state.</p>
<p><strong>wake_from_any</strong> Returns all devices that support waking the system from any sleep state.</p>
<p><strong>S1_supported</strong> Lists devices supporting light sleep.</p>
<p><strong>S2_supported</strong> Lists devices supporting deeper sleep.</p>
<p><strong>S3_supported</strong> Lists devices supporting deepest sleep. S4_supported List devices supporting hibernation.</p>
<p><strong>wake_programmable</strong> Lists devices that are user-configurable to wake the system from a sleep state.</p>
<p><strong>wake_armed</strong> Lists devices that are currently configured to wake the system from any sleep state.</p>
<p><strong>all_devices</strong> Returns all devices present in the system.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /DEVICEQUERY wake_armed</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/DEVICEENABLEWAKE</strong></p></td>
<td><p><em>&lt;DEVICENAME&gt;</em></p></td>
<td><p>Enables the specified device to wake the system from a sleep state.</p>
<p>Arguments:</p>
<ul>
<li><p>&lt;DEVICENAME&gt; Specifies a device. This device name may be retrieved using <code>POWERCFG /DEVICEQUERY wake_programmable</code>.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /DEVICEENABLEWAKE &quot;Microsoft USB IntelliMouse Optical&quot;</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/DEVICEDISABLEWAKE</strong></p></td>
<td><p><em>&lt;DEVICENAME&gt;</em></p></td>
<td><p>Disables the specified device from waking the system from a sleep state.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;DEVICENAME&gt;</em> Specifies a device. This device name may be retrieved using <code>POWERCFG /DEVICEQUERY wake_armed</code>.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /DEVICEDISABLEWAKE &quot;Microsoft USB IntelliMouse Optical&quot;</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/LASTWAKE</strong></p></td>
<td><p></p></td>
<td><p>Reports information about what woke the system from the last sleep transition.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /LASTWAKE</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/WAKETIMERS</strong></p></td>
<td><p></p></td>
<td><p>Enumerates the active wake timers. If enabled, the expiration of a wake timer wakes the system from sleep and hibernate states.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /WAKETIMERS</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/REQUESTS</strong></p></td>
<td><p></p></td>
<td><p>Enumerates application and driver Power Requests. Power Requests prevent the computer from automatically powering off the display or entering a low-power sleep mode.</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /REQUESTS</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/REQUESTSOVERRIDE</strong></p></td>
<td><p>[<em>&lt;CALLER_TYPE&gt; &lt;NAME&gt;</em> <em>&lt;REQUEST&gt;</em>]</p></td>
<td><p>Sets a Power Request override for a particular process, service, or driver. If no parameters are specified, this command displays the current list of Power Request overrides.</p>
<p>Arguments:</p>
<ul>
<li><p><em>&lt;CALLER_TYPE&gt;</em> Specifies one of the following caller types: <strong>PROCESS</strong>, <strong>SERVICE</strong>, <strong>DRIVER</strong>. This is obtained by calling the <code>POWERCFG /REQUESTS</code> command.</p></li>
<li><p><em>&lt;NAME&gt;</em> Specifies the caller name. This is the name returned from calling the <code>POWERCFG /REQUESTS</code> command.</p></li>
<li><p><em>&lt;REQUEST&gt;</em> Specifies one or more of the following Power Request types: <strong>DISPLAY</strong>, <strong>SYSTEM</strong>, <strong>AWAYMODE</strong>.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /REQUESTSOVERRIDE PROCESS wmplayer.exe DISPLAY SYSTEM</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/ENERGY</strong></p></td>
<td><p>[<strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em>] [<strong>/XML</strong>] [<strong>/DURATION</strong> <em>&lt;SECONDS&gt;</em>]</p>
<p>or</p>
<p><strong>/TRACE</strong> [<strong>/D</strong> <em>&lt;FILEPATH&gt;</em>] [<strong>/XML</strong>] [<strong>/DURATION</strong> <em>&lt;SECONDS&gt;</em>]</p></td>
<td><p>Analyzes the system for common energy-efficiency and battery-life problems. The ENERGY command should be used when the computer is idle and has no open programs or documents. The ENERGY command generates an HTML report file in the current path.</p>
<p>Arguments:</p>
<ul>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em> Specify the path and file name to store the energy report HTML or XML file.</p></li>
<li><p><strong>/XML</strong> Formats the report file as XML.</p></li>
<li><p><strong>/DURATION</strong> <em>&lt;SECONDS&gt;</em> Specifies the number of seconds to observe system behavior. Default is 60 seconds.</p></li>
<li><p><strong>/TRACE</strong> Records system behavior and does not perform analysis. Trace files are generated in the current path unless the <strong>/D</strong> parameter is specified.</p></li>
<li><p><strong>/D</strong> <em>&lt;FILEPATH&gt;</em> Specify the directory to store trace data. May only be used with the <strong>/TRACE</strong> parameter.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /ENERGY</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /ENERGY /OUTPUT &quot;longtrace.html&quot; /DURATION 120</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/BATTERYREPORT</strong></p></td>
<td><p>[<strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em>] [<strong>/XML</strong>]</p>
<p>[<strong>/DURATION</strong> <em>&lt;DAYS&gt;</em>]</p></td>
<td><p>Generates a report of battery usage characteristics over the lifetime of the system. The <strong>/BATTERYREPORT</strong> command will generate an HTML report file in the current path.</p>
<p>Arguments:</p>
<ul>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em> Specify the path and file name to store the battery report HTML.</p></li>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em><strong>/XML</strong> Formats the battery report file as XML.</p></li>
<li><p><strong>/DURATION</strong> <em>&lt;DAYS&gt;</em> Specifies the number of days to analyze for the report.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /BATTERYREPORT /OUTPUT &quot;batteryreport.html&quot;</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /BATTERYREPORT /DURATION 4</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/SLEEPSTUDY</strong></p></td>
<td><p>[<strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em>] [<strong>/XML</strong>]</p>
<p>[<strong>/DURATION</strong> <em>&lt;DAYS&gt;</em>]</p>
<p>[<strong>/TRANSFORMXML</strong> <em>&lt;FILENAME.XML&gt;</em>] [<strong>/OUTPUT</strong> <em>&lt;FILENAME.HTML&gt;</em>]</p></td>
<td><p>Generates a diagnostic report of modern standby quality over the last three days on the system. The <strong>/SLEEPSTUDY</strong> command will generate an HTML report file in the current path.</p>
<p>Arguments:</p>
<ul>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em> Specify the path and file name to store the Sleepstudy report HTML.</p></li>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em><strong>/XML</strong> Formats the Sleepstudy report file as XML.</p></li>
<li><p><strong>/DURATION</strong> <em>&lt;DAYS&gt;</em> Specifies the number of days to analyze for the report.</p></li>
<li><p><strong>/TRANSFORMXML</strong> <em>&lt;FILENAME.XML&gt;</em> <strong>/OUTPUT</strong> <em>&lt;FILENAME.HTML&gt;</em> Transforms the Sleepstudy report from XML to HTML.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /SLEEPSTUDY /OUTPUT &quot;sleepstudy.html&quot;</code></pre>
<pre class="syntax" space="preserve"><code>POWERCFG /SLEEPSTUDY /DURATION 7</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/SRUMUTIL</strong></p></td>
<td><p>[<strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em>] [<strong>/XML</strong>] [<strong>/CSV</strong>]</p></td>
<td><p>Enumerates the entire Energy Estimation data from the System Resource Usage Monitor (SRUM) in an XML or CSV file.</p>
<p>Arguments:</p>
<ul>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em> Specify the path and file name to store the SRUM data.</p></li>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em><strong>/XML</strong> Formats the file as XML.</p></li>
<li><p><strong>/OUTPUT</strong> <em>&lt;FILENAME&gt;</em><strong>/CSV</strong> Formats the file as CSV.</p></li>
</ul>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>POWERCFG /BATTERYREPORT /OUTPUT &quot;srumreport.xml&quot; /XML</code></pre></td>
</tr>
</tbody>
</table>

 

 

 






