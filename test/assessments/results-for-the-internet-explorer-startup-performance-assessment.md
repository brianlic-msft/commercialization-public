---
title: Results for the Internet Explorer Startup Performance Assessment
description: Results for the Internet Explorer Startup Performance Assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c61f4af5-a8ac-4671-98ca-97aaf72bd4f0
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Internet Explorer Startup Performance Assessment


The Internet Explorer Startup Performance assessment can help you evaluate the activities that are performed during the creation of a new Internet Explorer window. The assessment measures the time that it takes to fully render a new Internet Explorer window on the desktop, with a single tab and simple content. This measurement includes the load time of the IExplore.exe process and the frame-creation and tab-creation intervals.

It also measures the performance of extensions which are loaded and initialized during startup. There are several types of extensions, including shortcut menus, toolbars, Explorer Bars, and Browser Helper Objects (BHOs). To see the types of extensions that are installed on a computer, in Internet Explorer, in the **Manage Add-ons** dialog, right-choose the column header, choose **Columns** and then choose **Type**.

This topic can help you interpret the results produced by the Internet Explorer Startup Performance assessment. It also provides guidance on how to use the results to identify and resolve common issues that negatively affect your experience while starting Internet Explorer.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-iestartupmetrics)

-   [Issues](#bkmk-iestartupissues)

For more information about system requirements and assessment settings, see [Internet Explorer Startup Performance](internet-explorer-startup-performance.md).

## <a href="" id="bkmk-goals"></a>Goals File


You can create custom goals to measure your improvements in the Results View. Goals files are a triage tool that can help you understand how a PC is performing and to compare PCs in your business.

For example, goals for a basic laptop might be different than the goals you set for a high end desktop computer, or market expectations might change in such a way that you want the flexibility to define different goals and key requirements as time passes and technology improves.

When a metric value is compared to the goal for that metric, the status is color coded in the Result View as follows:

-   Light purple means that the system has a great user experience and that there are no perceived problems.

-   Medium purple means that the user experience is tolerable and you can optimize the system. Review the recommendations and analysis to see what improvements can be made to the system. These can be software changes, configuration changes or hardware changes.

-   Dark purple means that the system has a poor user experience and that there is significant room for improvements. Review the recommendations and analysis to see the improvements that can be made to the system. These can be software changes, configuration changes or hardware changes. You might have to consider making tradeoffs to deliver a high quality Windows experience.

-   No color means that there are no goals defined for the metric.

**Note**  
In the Windows Assessment Toolkit for Windows 8, some assessments include default goals files. The first time you view results using this version of the tools, the default goals file is used. However, you can also define custom goals for Windows 8 the same way that you can for Windows 8.1 and Windows 10.

 

You can set the goals file location and add a goals file to that location before you can use the UI to apply the custom goals. Once a goals file is selected it will continue to be the goals file that is used for any results that are opened.

Only one goals file can be used at a time. Goals for all assessments are set in a single goals file. The assessment tools will search for goals in the following order:

1.  A custom goals file

2.  Goals that are defined in the results file

3.  Goals that are defined in the assessment manifest

You can use the sample goals file that is provided at %PROGRAMFILES%\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Assessment Toolkit\\SDK\\Samples\\Goals to create your own goals file.

**Note**  
You cannot package a goals file with a job, but you can store it on a share for others to use.

 

## <a href="" id="bkmk-iestartupmetrics"></a>Metrics


This section describes the metrics reported by the Internet Explorer Startup assessment, common causes of poor results for each metric and possible remediation for these issues. The metrics are aligned with the stages of Internet Explorer startup. There are six stages of Internet Explorer Startup: process creation, frame creation, tab creation, extension creation (CoCreateInstance), extension initialization (Set Site), and show docking window (for some extension types). The corresponding metrics are covered here.

**Note**  
The top-level **IE Startup Duration** metric is comprehensive and includes tasks that run after the process, frame, and tab are created.

 

-   [Create Internet Explorer Process](#bkmkl-createieprocess)

-   [Internet Explorer Frame Create](#bkmk-ieframecreate)

-   [Internet Explorer Tab Create](#bkmk-ietabcreate)

-   [Create Extensions Addon Count](#bkmk-createextension)

-   [Set Site for Extensions](#bkmk-setextension)

-   [Extension Toolbar Show Docking Window](#bkmk-extensiontoolbar)

**Note**  
If you enabled the Enable Minifilter Diagnostic Mode setting, the assessment results will include minifilter metrics. For more information about minifilter metrics and results, see [Minifilter Diagnostics](minifilter-diagnostics.md).

 

### <a href="" id="bkmkl-createieprocess"></a>Create Internet Explorer Process

**Most applicable to:** Equipment manufacturers, Anti-malware software vendors

This metric measures the time that it takes to create the Internet Explorer process. This includes the interval of time from when the operating system begins to load and execute iexplorer.exe, to when Internet Explorer signals that it has begun the Create Frame stage of initialization. Or, the interval of time from when iexplorer.exe is launched (as reported by the Windows kernel) until the Create Frame stage is started (as reported by Internet Explorer).

**Typical Influencing Factors**

-   CPU speed

-   Anti-malware

**Analysis and Remediation Steps**

If the assessment is consistently reporting that this stage is taking too long, then in-depth analysis in WPA to find the root cause is recommended.

### <a href="" id="bkmk-ieframecreate"></a>Internet Explorer Frame Create

**Most applicable to:** Equipment manufacturers, Anti-malware software vendors, Video driver developers

This metric measures the time that it takes to fully render a window frame in Internet Explorer, including the interval of time from startup before Internet Explorer creates the first tab and before it loads or initializes any extensions, including creating a top-level window (frame) and initializing Direct3D rendering within that window. The Internet Explorer frame is the parent process and UI container for the tabs in a single top-level Internet Explorer window. Tabs are hosted in a separate process, but the parent process is responsible for emitting the tracing events that are used for assessment analysis.

**Typical Influencing Factors**

-   CPU speed

-   Anti-malware

-   Video driver

**Analysis and Remediation Steps**

If the assessment is consistently reporting that the duration of Internet Explorer Frame Create is taking too long, follow the WPA further analysis link to see advanced details and find the root cause.

### <a href="" id="bkmk-ietabcreate"></a>Internet Explorer Tab Create

**Most applicable to:** Equipment manufacturers, Antimalware software vendors

This metric measures the time that it takes to create a new tab in Internet Explorer, including the interval of time for creating and initializing a tab in a frame, as well as creating and initializing all of its extensions. The tab is the process and UI container for a single tab and its content. There is always at least one tab, although multiple tabs may be hosted in the same process. Extensions are created and initialized in the tab’s process.

**Typical Influencing Factors**

-   CPU speed

-   Antimalware

-   Extensions

**Analysis and Remediation Steps**

For analysis of extension performance, we recommend that you focus on the various extension-related metrics such as Create and Set Site. However, if this stage is consistently being reported as taking too long, but the performance of individual extensions is not being flagged, follow the WPA further analysis link to see advanced details and find the root cause.

### <a href="" id="bkmk-createextension"></a>Create Extensions Addon Count

**Most applicable to:** Equipment manufacturers, Anti-malware software vendors

This metric enumerates Internet Explorer Add-ons involved in the CreateExtension action. You can expand this metric to see a list of each extension and their corresponding durations. For each, the time that it takes to instantiate an extension using CoCreateInstance() is measured. This also includes the time to load the extension’s DLL and any of its static DLL dependencies. When Internet Explorer initializes an add-on, it first calls the CoCreateInstance() function with the add-on’s CLSID, which in turn invokes the add-on module’s DllGetClassObject() function to create an object in memory. Add-ons do not typically incur a performance delay during this function call. However, it’s important to focus on this function call while optimizing startup performance because slow performance can be related to add-ons.

**Typical Influencing Factors**

-   CPU speed

-   DLL dependencies

-   Synchronous or blocking I/O operations (disk or network)

-   Antimalware

**Analysis and Remediation Steps**

An extension should not do very much during this stage, therefore any non-trivial amount of time spent here can be an issue. For equipment manufacturers, you may have to uninstall the extension. For extension authors, in-depth analysis in WPA is recommended in addition to a code review of the following areas of the code for the extension:

-   **DllMain**: It is uncommon for the DllMain method to spend a non-trivial amount of time during this stage.

-   **DllGetClassObject**: It is uncommon for the DllGetClassObject method to spend a non-trivial amount of time during this stage.

-   **Class constructor (C++) (or equivalent)**: An extension should not do much during creation, which includes the constructor for the class that is being constructed (the class identified by the CLSID).

-   **Static DLL dependencies**: These are DLLs that have at least one static import demand from the extension DLL. They must be loaded and resolved before Windows will return from the LoadLibrary() call made from Internet Explorer, regardless of whether they are actually used.

    This does not include DLLs that are delay loaded, either by using /DELAYLOAD or LoadLibrary().

    If a specific DLL is only occasionally used, or is not used at startup or during initialization, consider using /DELAYLOAD.

-   **Dynamic DLL dependencies**: If the extension calls the LoadLibrary() API, or calls into a DLL that is in the /DELAYLOAD list, then that usage should be reviewed to determine if it can be deferred until later. If a DLL is delay loaded, but is always used at startup or during initialization, consider removing it from the /DELAYLOAD list.

    **Note**  
    This should not be done for any Windows APIs that are called depending on which version of Windows is running; those should always be delay loaded. For instance, if an extension uses DirectWrite for text rendering and uses GDI as a fallback, then it should not statically link to dwrite.dll. Doing so can completely prevent it from loading on earlier versions of Windows.

     

**Additional Information**

[MSDN: /DELAYLOAD (Delay Load Import)](http://msdn.microsoft.com/library/yx9zd12s.aspx)

### <a href="" id="bkmk-setextension"></a>Set Site for Extensions

**Most applicable to:** Extension authors, Equipment manufacturers

This metric enumerates Internet Explorer Addons involved in the SetSite action. You can expand this metric to see a list of each extension and their corresponding durations. For each, the time that it takes for Internet Explorer to call into the extension’s IObjectWithSite::SetSite() method is measured. This method establishes the extension’s ability to communicate with Internet Explorer. Extensions typically perform the bulk of startup/initialization here. This establishes the add-on’s initial communication with Internet Explorer, and is exposed by the IObjectWithSite interface which all Internet Explorer add-ons must implement. Add-ons typically run their initialization routines in this function such as displaying toolbar UI or loading other modules.

**Typical Influencing Factors**

This is typically influenced only by the extension’s implementation of IObjectWithSite::SetSite(). It is important avoid synchronous/blocking disk or network I/O as much as possible during this method.

**Analysis and Remediation Steps**

For equipment manufacturers, you may have to uninstall the extension. For extension authors, in-depth analysis with WPA is recommended in addition to a code review of the IObjectWithSite::SetSite() implementation. There could be portions of this code which can be deferred until a later time, or perhaps performed asynchronously so that they can run in parallel with the initialization of other plugins.

**Additional Information**

[MSDN: IObjectWithSite Interface](http://msdn.microsoft.com/library/aa768220.aspx)

### <a href="" id="bkmk-extensiontoolbar"></a>Extension Toolbar Show Docking Window

**Most applicable to:** Extension authors (toolbars and Explorer bars only), Equipment manufacturers

This metric enumerates Internet Explorer Addons that display a separate toolbar. You can expand this metric to see a list of each extension and their corresponding durations. For each of these, the interval of time that is spent in the IDockingWindow::ShowDW() implementation is measured. If the add-on being initialized is a Toolbar or Explorer Bar, Internet Explorer calls the add-on’s IDockingWindow::ShowDW() function to make the add-on visible on the browser window. Some add-ons choose to run their UI rendering code within this function, therefore it can also affect startup performance.

**Typical Influencing Factors**

-   CPU speed

-   Complexity of the UI being shown or initialized

**Analysis and Remediation Steps**

For equipment manufacturers, you may have to uninstall the addon. For extension authors, in-depth analysis with WPA is recommended in addition to a code review of the IDockingWindow::ShowDW() implementation.

If the extension is running UI rendering code, for example WM\_PAINT, it may be possible to defer it until later, depending on how the extension has been written. If it is not possible or feasible to avoid rendering code (WM\_PAINT) during this stage, you can try to defer rendering with the following strategy or something similar.

1.  After creating and displaying the main HWND for the extension’s UI, but before you add any child windows to it, use SendMessage to send it a WM\_SETREDRAW message with wParam equal to FALSE.

    **Warning**  
    This will temporarily disable all painting for the window. This should be used carefully; if it is used incorrectly, it can cause problems that are difficult to debug.

     

2.  Next, create and add the child windows or content.

3.  Send the window another WM\_SETREDRAW message with wParam equal to TRUE.

4.  Use InvalidateRect or RedrawWindow to redraw the window.

5.  Return from IDockingWindow::ShowDW().

**Additional Information**

[MSDN: IDockingWindow::ShowDW method](http://msdn.microsoft.com/library/windows/desktop/bb762050.aspx)

[MSDN: WM\_SETREDRAW message](http://msdn.microsoft.com/library/dd145219%28v=vs.85%29.aspx)

## <a href="" id="bkmk-iestartupissues"></a>Issues


The Internet Explorer Startup Performance assessment performs advanced issue analysis and provides links to Windows® Performance Analyzer (WPA) to troubleshoot the issues that are identified. When WPA opens additional details about disk activity or CPU activity might be available depending on the type of issue identified. For more information about in-depth analysis issues and recommendations see, [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[Internet Explorer Startup Performance](internet-explorer-startup-performance.md)

[Assessments](assessments.md)

[On/Off Transition Performance](onoff-transition-performance.md)

 

 







