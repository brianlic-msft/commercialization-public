---
title: Streaming media assessment set up a remote server
description: Streaming media assessment set up a remote server
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7cc47476-f2c3-4f82-8430-731fc035266a
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Streaming media assessment: set up a remote server


The Streaming Media Performance assessment includes an option to run the assessment on 2 computers. In this scenario, an HTTP streaming server application that's installed on a second or remote computer streams content to the computer that's running the assessment. This topic describes how to set up the streaming server.

**Note**  
Any computer that has the Windows Assessment Toolkit installed can act as a streaming server and can provide the media files that were installed via the Windows Assessment Toolkit to any requesting client. For this assessment, a workload is a .mp4 file and a corresponding .html file that the assessment uses together as streaming media. For example, 720p.mp4 and 720p.html together form a 720p workload. To use those media workloads in your 2-computer assessment scenario, complete the following steps.

 

**To set up a server for the Streaming Media Performance assessment**

1.  On the remote server, install the Windows Assessment Toolkit. For instructions, see [Windows Assessment Console step-by-step guide](windows-assessment-console-step-by-step-guide.md) or [Windows Assessment Services step-by-step guide](windows-assessment-services-step-by-step-guide-was.md).

2.  Open a command prompt.

3.  Depending on the computer type, browse to the StreamingMediaAssessmentServer.exe file:

    **Note**  
    The preceding paths assume that you have installed the Windows Assessment Toolkit in its default location.

     

    -   For an x86-based computer, type this:

        ``` syntax
        C:\Program Files\Windows Kits\10\Assessment and Deployment Kit\Windows Assessment Toolkit\Content Based Assessments\x86
        ```

    -   For an x64-based computer, type this:

        ``` syntax
        C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Assessment Toolkit\Content Based Assessments\amd64
        ```

4.  At the command prompt, type this:

    ``` syntax
    StreamingMediaAssessmentServer.exe -ContentPath <path_to_streaming_content>  [-PopulateCache <file_name_list>] [-Port <number>]
    ```

    The following table describes the parameters in the preceding command-line text.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><em>ContentPath&lt;path_to_streaming_content&gt;</em></p></td>
    <td><p>Type the path that contains the media and corresponding HTML pages that the server will stream. By default, this path is:</p>
    <pre class="syntax" space="preserve"><code>%PROGRAMFILES%\Windows Kits\10\Assessment and Deployment Kit\Windows Assessment Toolkit\Content based Assessments\Content\Streaming Media Assessment</code></pre>
    <p>You can specify an absolute path for the media and corresponding HTML pages.</p></td>
    </tr>
    <tr class="even">
    <td><p><em>PopulateCache&lt;file_name_list&gt;</em></p></td>
    <td><p>Type the file names that the server will cache into memory. List all files, separated by commas. This example contains the media files that the assessment uses by default:</p>
    <pre class="syntax" space="preserve"><code>-populatecache 360p.mp4,360p.html,480p.mp4,480p.html,720p.mp4,720p.html,1080p.mp4,1080p.html,1080p60.mp4,1080p60.html</code></pre>
    <p>The assessment searches for all these file names in the path that the <code>ContentPath</code> setting has specified. If any of the files aren't present, the assessment logs a <em>missing file</em> event, but the assessment continues to run the normal process by using files that it finds in the path.</p></td>
    </tr>
    <tr class="odd">
    <td><p><em>Port&lt;number&gt;</em></p></td>
    <td><p>Specify a port if you don't want to use the default of port 80. The default port may or may not be specified on the client. If you must use a different port number, make sure that you specify it on both the remote server and the client.</p>
    <div class="alert">
    <strong>Important</strong>  
    <p>Before specifying which port to use, verify that Windows Firewall is not blocking communication. For more information, see [Windows Firewall from start to finish](http://go.microsoft.com/fwlink/?LinkId=246551).</p>
    </div>
    <div>
     
    </div></td>
    </tr>
    </tbody>
    </table>

     

The *PopulateCache* list of files shown previously is the default set of files that the assessment uses as workloads. The local computer where you run the Streaming Media Performance assessment requests these files from the remote server during the assessment process. The remote server caches any file that the *PopulateCache* parameter has specified and provides them to the local computer for performance measurement.

## Related topics


[Streaming Media Performance](streaming-media-performance.md)

[Assessments](assessments.md)

[Windows Assessment Console](windows-assessment-console.md)

 

 







