---
title: Assessment Platform Command-Line Syntax
description: Assessment Platform Command-Line Syntax
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 34286b79-1867-4d0d-8b65-6a0c6a7e5df8
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Assessment Platform Command-Line Syntax


**AXE.exe** is a command-line tool that's installed with the Windows Assessment Toolkit. You can use this set of command-line options to automate jobs from a script and minimize resource usage. A job is one or more assessments run at one time on a computer. You can't use the command-line options to compose a job. You should create, modify, and save a job by using the Windows Assessment Console. By default, jobs are saved to the %USERPROFILE%\\Documents\\Windows Assessment Console\\Jobs folder.

By default, AXE.exe is installed to:

%PROGRAMFILES%\\Windows Kits\\10\\ Assessment and Deployment Kit\\Windows Assessment Toolkit\\*&lt;architecture&gt;*

Where *&lt;architecture&gt;* is either x86 or amd64.

## Command-Line Options


The base syntax for using the Assessment Platform from the command line is:

``` syntax
AXE.exe jobfile [AXE_options]
```

The following table provides a description for how you can use each option. These options aren't case-sensitive.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Option</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Help</strong> or <strong>/?</strong></p></td>
<td><p>Displays information about available <strong>AXE.exe</strong> command-line options.</p></td>
</tr>
<tr class="even">
<td><p><strong>JobFile</strong></p></td>
<td><p>Specifies the job file that you want to run.</p>
<p>The path of the job file can be a relative path. If the job is in the directory that you're running <strong>AXE.exe</strong> from, no path is required. By default, when you create a job in the Windows Assessment Console, it's saved in the %USERPROFILE%\Documents\Windows Assessment Console\Jobs folder.</p>
<div class="alert">
<strong>Note</strong>  
<p>This option is required if no other parameter that performs an action is specified.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\MyJobs\Job1.jobx</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/Timeout</strong><em>&lt;seconds&gt;</em></p></td>
<td><p>Specifies the amount of time, in seconds, that the job will wait for another job to finish before it exits with an error. The default is zero, which means that the job will exit immediately if another job is already running. This is an optional parameter.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\myJobs\Job1.jobx /Timeout 30</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/NoPublish</strong></p></td>
<td><p>Specifies not to publish the results file to the location that's specified in the job file. When you use this option, the results are saved to the default location, %LOCALAPPDATA%\Microsoft\Axe\Results.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\myJobs\Job1.jobx /NoPublish</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/PublishPath</strong><em>&lt;Directory&gt;</em></p></td>
<td><p>Specifies the path of a folder to publish the results file to. This overrides the publication path, &lt;ResultsPublishPath&gt;, that's specified in the job file. This parameter is ignored if it's combined with <strong>/NoPublish</strong>.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\myJobs\Job1.jobx /PublishPath C:\Assessments\myResults</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/RemoveRestart</strong></p></td>
<td><p>Specifies that any existing, pending job-restart task should be removed.</p>
<div class="alert">
<strong>Note</strong>  
<p>The <strong>/JobFile</strong> option isn't needed when you use this option.</p>
</div>
<div>
 
</div>
<p>When you run a job, the assessment creates a task to restart the job if there's a system failure, like a loss of power. When you use this option, the task is removed from the Task Scheduler. If no job-restart task is pending, the assessment will return an error to inform you that the task doesn't exist.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE /RemoveRestart</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/NoWarnings</strong></p></td>
<td><p>Suppresses warning messages. This is an optional parameter.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\myJobs\Job1.jobx /NoWarnings</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/Pause</strong></p></td>
<td><p>Pauses AXE.exe after the job finishes, to wait for you to press a key. You can then see any errors or other information in the console before AXE.exe exits and the console closes.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\myJobs\Job1.jobx /Pause</code></pre></td>
</tr>
<tr class="odd">
<td><p><strong>/JobParameter Param=</strong><em>&lt;value&gt;</em></p></td>
<td><p>Specifies a value to override a job parameter that may exist in the job manifest. This is an optional parameter. You can use it up to 100 times to specify multiple job parameters. If duplicate job parameter names appear, the assessment uses the last one. The <strong>/PublishPath</strong> option takes precedence over setting the &lt;ResultsPublishPath&gt; job parameter with this option.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE C:\Assessments\myJobs\Job1.jobx /JobParameter iterations=1</code></pre></td>
</tr>
<tr class="even">
<td><p><strong>/DisplayLog</strong><em>&lt;path_to_AXE_ETL_log_file&gt;</em></p></td>
<td><p>Displays the content of the Event Trace Log (ETL) files that <strong>AXE.exe</strong> uses for logging. You must specify the path of the <strong>AXE.exe</strong> ETL files. The location of the log files appears in the console when a job runs. The file name may contain wildcard characters.</p>
<p>The default location of the log file is %LOCALAPPDATA%\Microsoft\Axe\Logs\<em>&lt;GUID&gt;</em>, where <em>&lt;GUID&gt;</em> is the GUID that's generated randomly for each new job. The job results file in the &lt;SessionLogFiles&gt; node also contains the full location. This node specifies all of the log files.</p>
<div class="alert">
<strong>Note</strong>  
<p>All of the ETL files are automatically converted into a single AxeLog.txt file that's saved in the results directory. You can open this file by using Notepad.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>AXE /DisplayLog &lt;path_to_file&gt;</code></pre></td>
</tr>
</tbody>
</table>

 

**Benefits:**

-   Running a job at the command prompt uses fewer resources and has less impact on performance metrics.

-   You can use command-line options to automate a job.

-   Command-line options provide additional parameters that aren't available in the Windows Assessment Console.

**Limitations:**

-   The job that you run can't be one of the preconfigured jobs or one of the single assessments that the Windows Assessment Toolkit provides.

-   You can't create or modify a job by using **AXE.exe**. You must use the Windows Assessment Console.

## Related topics


[Windows Assessment Console Overview](windows-assessment-console-overview.md)

 

 







