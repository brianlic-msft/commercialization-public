---
title: Troubleshooting Windows Assessment Services
description: Troubleshooting Windows Assessment Services
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f0a1c2cb-9566-4451-a201-5dab89c7a0b9
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Troubleshooting Windows Assessment Services


The following information can help you troubleshoot common problems.

This topic includes:

-   [Log files](#bkmk-ts-logfiles)

-   [Set up a symbol server](#bkmk-ts-symbolserver)

-   [Unable to connect to server](#bkmk-ts-unableconnect)

-   [Computer already exists in inventory](#bkmk-ts-computerexists)

-   [Run button is unavailable](#bkmk-ts-runbuttondimmed)

-   [Inventorying test machine fails with WS\_E\_OPERATION\_TIMED\_OUT](#bkmk-ts-inventoryfails)

-   [Image deployment failures don’t have enough information on the monitoring page](#bkmk-ts-deploymentfails)

-   [DISM error during computer inventory](#bkmk-ts-dismerr)

-   [Test computers must be reimaged if you change the Server name](#bkmk-ts-reimagetestcomp)

-   [“Machine not reachable” errors](#bkmk-ts-machinereach)

-   [Running Windows Assessment Services - Client from a server other than the Windows Assessment Services server](#bkmk-ts-msmq)

-   [The dumps folder does not contain any dump files](#bkmk-ts-dumps)

## <a href="" id="bkmk-ts-logfiles"></a>Log files


-   Log files are copied to the server when you add computers to the server inventory. They are stored at **C:\\relax\\logs**.

-   A server log captures events of the Windows Assessment Services. This log file can be found at **C:\\Windows\\Temp\\relaxservice.tracelistener.Tracing**.

-   Errors coming from the UI can be viewed in the Event Viewer on the client computer under **Applications and Services Logs** - **Windows Assessment Services Client**. The log file is an ETL file located at **%systemroot%\\system32\\Winevt\\Logs\\Windows Assessment Services Client.evtx**.

-   Image deployment logs (Windows PE) are copied from the test computers to **%SystemDrive%\\relax\\logs**

-   On Windows Server 2012, Windows Deployment Services (Windows DS) issues can be found in the Event Viewer under **Applications and Services Logs** -**Microsoft** -**Windows** - **Windows Deployment Services Diagnostics**.

-   On Windows Server 2008 R2 you must enable Windows DS logging by setting the following:

    -   **HKLM\\System\\CurrentControlSet\\Services\\WDSServer\\Providers\\WDSPXE!TracingDisabled to 0**

    -   **HKLM\\Software\\Microsoft\\Tracing\\WDSServer!EnableFileTracing to 1**

    The WDS log will be generated at **%SystemRoot%\\tracing\\wdsserver.log**.

-   The WinRM log can be found in the Event Viewer under **Applications and Services Logs** -**Microsoft** -**Windows** -**Windows Remote Management**.

-   If results are not copied to the server, you can locate them on the test computer. The log file at %SystemDrive%\\relax\\&lt;GUID&gt;\\job\\results.log points to the results folder where the results were saved.

## <a href="" id="bkmk-ts-symbolserver"></a>Set up a Symbol Server


Some assessments require access to symbols. In some cases the information in the assessment results can be incorrect or have missing information if a symbol server is not available. In many cases this dependency is satisfied by Internet connectivity and access to the Microsoft public symbols server. In other cases where connectivity to the Internet is not available such as a lab environment, you can set up a private symbols server or install the symbols on the local computer to get the full benefits of the assessments.

**To set the symbols environment variable on a test computer**

1.  Open File Explorer, right-click **Computer**, and select **Properties**.

2.  In the Properties window click **Advanced System Settings**.

3.  In the Systems Properties window, on the **Advanced** tab, click **Environment Variables**.

4.  Under System variables, click **New** to set the symbols environment variable by using one of the following paths:

    1.  Use the public symbols server (requires Internet connection)

        Connect the computer to the Internet so that it can access the Microsoft symbols server, and then configure the \_NT\_SYMBOL\_PATH environment variable to use the Microsoft symbols server at **http://msdl.microsoft.com/downloads/symbols**.

    2.  Use a network connected symbols path (requires local network connection)

        Connect the computer to the local intranet and then configure the \_NT\_SYMBOL\_PATH environment variable to use an intranet symbols path.

    3.  Use a local symbols path

        Download the symbols to the Windows Assessment Services server computer, and point the test computer to this location by setting the \_NT\_SYMBOL\_PATH environment variable to use a path to the symbols on the server, such as \\\\WASServer\\relax\\symbols.

**To set up internal symbols**

1.  Install the ADK, and initialize WAS.

2.  Get an IPsec boundary exception for the WAS server machine. This will ensure that WAS test machines are able to access the Relax share.

3.  Join the WAS server machine to the domain.

4.  Add a domain user to the WAS server machine into the Administrators group that has access to internal symbol server.

5.  Stop the WAS service by running the following command from an elevated command prompt:

    **net stop WASSVC**

6.  Change the service logon account to the new domain account.

7.  Run the following command from an elevated command prompt, replacing &lt;*path to internal symbols*&gt; with the appropriate path:

    **SETX\_NT\_SYMBOL\_PATH \\\\&lt;path to internal symbols&gt; /M**

8.  Restart the machine.

For more information about how to set the symbols path and download symbols, see [MSDN: Symbols Support](http://go.microsoft.com/fwlink/?LinkId=235359). For information about how to troubleshoot missing symbols, see [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md#missingsymbols).

## <a href="" id="bkmk-ts-unableconnect"></a>Unable to connect to server


If the Windows Assessment Services - Client (Windows ASC) cannot connect to the server, you might receive the following error message:

*Unable to connect to the remote server: A connection attempt failed because the connected party did not properly respond after a period of time, or an established connection failed because the connected host has failed to respond.*

Check the server status by using the **sc query wassvc** command. If the server is not running, start the service by using the **net start wassvc** command.

**Warning**  
The sc query command only works if it is run on the Windows Assessment Services server.

 

## <a href="" id="bkmk-ts-computerexists"></a>Computer already exists in inventory


If you receive the following message, the test computer already exists in the Windows Assessment Services inventory:

*Execute any scenario manually. Hit Exit to Reboot*

If you do not see the computer entry in the Server Inventory window, close and then re-open that window to refresh the content.

## <a href="" id="bkmk-ts-runbuttondimmed"></a>Run button is unavailable


If the **Run** button is unavailable, make sure that you have selected specific computers and images in the **Assets** details. If you have selected specific computers and images, but you do not see any assessments on the **Results** page, close and then re-create the current job.

## <a href="" id="bkmk-ts-inventoryfails"></a>Inventorying test machine fails with WS\_E\_OPERATION\_TIMED\_OUT


If you receive the following error:

``` syntax
Error updating machine configuration in RelaxServer. Please check that the server is available and try again later. (ErrorCode:-2143485946)
```

Check the error log at **C:\\Relax\\CompleteDeployment.log** for additional error details and rerun **CompleteDeployment.cmd**.

## <a href="" id="bkmk-ts-deploymentfails"></a>Image deployment failures don’t have enough information on the monitoring page


**Error code: Exiting Scenario Deploy: ErrorId=2**

Either you are using an image of unsupported format, the unattend answer file is missing or the image file is missing.

**Error code: Exiting Scenario Deploy: ErrorId=38**

The image file is corrupted.

**Error code: Exiting Scenario Deploy: ErrorId=87**

Bcdboot failed to update the BCD store. This is specific to some UEFI computer prototypes. No workaround is available at this time.

**Error code: Exiting Scenario Deploy: ErrorId=193**

Bcdboot failed to update the BCD store. An image of incompatible architecture was applied to a test computer.

**Error code: Exiting Scenario Deploy: ErrorId=-2147024809**

Diskpart failed to find any hard disk drive that could be used to apply an image to.

## <a href="" id="bkmk-ts-dismerr"></a>DISM Error During Computer Inventory


If you receive the following error while taking inventory of a computer, you must use the x86 Windows PE image for the bootable USB drive that you created for inventory.

``` syntax
An error occurred. You cannot service an x86-based image from an x64-based host that does not support WOW64. Try the operation again from a host environment that supports WOW64. 
Error running Driver Scavenge. ErrorCode 193.
```

When you inventory a computer, driver information is gathered and stored at **&lt;%systemdrive%\\relax\\driver** using DISM. DISM cannot run the driver servicing command on an X86 Windows image, from a Windows PE X64 environment. For more information, see DISM Supported Platforms.

**Resolution**

Use (or create) a bootable USB drive created for X86 architecture. For more information, see [Windows Assessment Services Setup and Configuration](windows-assessment-services-setup-and-configuration-wastechref.md).

## <a href="" id="bkmk-ts-reimagetestcomp"></a>Test computers must be reimaged if you change the Server name


If you rename the Windows Assessment Services server and re-initialize it, you must redeploy Windows on the test computer before you run additional assessments.

## <a href="" id="bkmk-ts-machinereach"></a>“Machine not reachable” errors


When running assessments remotely, Windows Assessment Services relies on DNS to resolve the test computer names. If DNS has duplicate entries for the same computer name, one from a domain joined computer and another from a workgroup computer, Windows and WinRM will pick the computer that DNS resolves to.

If you receive an error that includes "Machine Not Reachable", check the DNS entries for duplicates.

**Note**  
The computer name must contain only alphanumeric characters and dashes. If the computer name contains an underscore or other extended characters, the computer may not be discoverable via Domain Name System (DNS).

 

## <a href="" id="bkmk-ts-msmq"></a>Running Windows ASC from a server other than the Windows Assessment Services server


If you are running Windows ASC on a Windows server and you do not have Windows Assessment Services installed on that server, push notifications will fail to enable in Windows ASC when you launch it.

**Workaround**

On the server where Windows ASC is installed, enable the optional component MSMQ-Server using the following DISM command from an elevated command prompt.

``` syntax
Dism /Online /Enable-Feature:MSMQ-Server
```

Or run Windows ASC on a client computer, or the same server where Windows Assessment Services is installed.

## <a href="" id="bkmk-ts-dumps"></a>The dumps folder does not contain any dump files


By default, dump files are not copied to the server after assessment runs. If you want to collect dumps for assessment runs, edit &lt;Relax directory&gt;\\Scripts\\Harnesses\\Axe\\CompleteAssessment.cmd, and change the value for set\_copydumpstoserver to true. By default, this value is false.

## Related topics


[Windows Assessment Services](windows-assessment-services-technical-reference.md)

 

 







