---
title: Windows Assessment Console step-by-step guide
description: Windows Assessment Console step-by-step guide
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
Search.SourceType: Video
ms.assetid: 9541de45-d6ad-4a5f-9441-01fb1d8f9b2f
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Assessment Console step-by-step guide


This guide provides step-by-step guidance for installing the Windows Assessment Toolkit and using the Windows Assessment Console to assess the quality of a local computer and review the results.

The first assessment used in this guide helps you to verify performance quality for the new Windows UI. Then you create a job using a template that includes two driver assessments that verify the drivers for the targeted hardware and Windows certification requirements. You then create a third assessment that evaluates the first boot experience. In the final exercise in this guide, you package a job and run it on a different computer so that you can compare the results of the two jobs.

## Objectives


The exercises in this guide help you:

-   Learn how to use the assessments that are included in the Assessment Toolkit.

-   Learn how to navigate through the Windows Assessment Console.

In this topic:

-   [Prerequisites](#wac-sxs-prereq)

-   [Exercise 1: Run a Job with Recommended Settings](#wac-sxs-ex1)

-   [Exercise 2: Create a New Job with Custom Settings](#wac-sxs-ex2)

-   [Exercise 3: Run a Job on Another Computer and Compare the Results](#wac-sxs-ex3)

Estimated time to complete these exercises: **60 minutes**.

Each exercise also includes a 3 – 5 minute demo.

## <a href="" id="wac-sxs-prereq"></a>Prerequisites


To successfully complete the steps outlined in this guide, you must install the Windows Assessment Toolkit from the Windows Assessment and Deployment Kit (Windows ADK) on a test computer that is running Windows 8 or Windows 10.

### Install the Windows Assessment Toolkit

1.  Double-click the Windows ADK installer, ADKSetup.exe.

2.  Verify that the **Install the Assessment and Deployment Kit to this computer** option is selected, and then click **Next**.

3.  Accept the license agreement.

4.  For these exercises, you are only required to install the **Assessment Toolkit** and the **Windows Performance Toolkit**. Verify that they are selected.

5.  Click **Install**.

    If the **User Account Control** window opens, click **Yes**.

When the installation finishes, the Windows Assessment Console can be opened from the **Start** menu.

## <a href="" id="wac-sxs-ex1"></a>Exercise 1: Run a Job with Recommended Settings


The Windows Assessment Console is used to discover, create, edit, and view the results that a job produces. A job is a collection of one or more assessments and their settings that are run as a group on a single computer. When the Windows Assessment Console opens, the **Home** tab provides easy access to some predefined jobs and individual assessments that you can run immediately without any configuration steps. In addition, when you create a new job, predefined jobs are available as templates. A job that is created from a template can also be run without modification or additional configuration steps.

There are two ways to run a job with recommended settings:

-   [Run a Single Assessment with Recommended Settings](#bkmk-runsingle)

-   [Use a Template with Recommended Settings](#bkmk-usetemplate)

### <a href="" id="bkmk-runsingle"></a>Run a Single Assessment with Recommended Settings

Running an assessment with the recommended settings is quick and easy. The settings are defined by Microsoft to make sure that the results can be compared across different computer configurations or over time on the same computer. In this exercise, you run a single assessment using the predefined recommended settings.

Watch the video demonstration:

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/3f889614-b65c-4066-84ea-c523fdaabc39/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no"></iframe>

**To run a single assessment with the recommended settings**

1.  Click **Start**, type “assessment console”, and then click **Windows Assessment Console**.

    The Windows Assessment Console opens.

2.  On the **Home** page, click **Run Individual Assessments**. In the details pane on the right, click the **Windows UI performance** assessment, and then in the lower-right corner, click **Run**.

    If the User Account Control window opens, click **Yes**.

3.  Before the job starts, the job checks the computer configuration to make sure that the assessment can run successfully. The job generates error messages, warnings, and informational messages based on the computer configuration and the requirements of the assessment. The notifications appear in the Assessment Launcher dialog box as follows:

    -   Errors block the start of the job. Error messages appear when the job finds a problem with the computer hardware or configuration that must be fixed before the job can continue. The **Start** button is not available in the dialog box if an error message appears. After you fix blocking errors, you can click **Refresh** to check the computer again and continue the job.

    -   Warnings appear when the job finds a problem that does not block running the job, but may affect the results. You can review the warnings and take action, or ignore the warnings and click **Start**.

    -   Informational messages provide additional instructions or information about actions that will be taken when the job runs. After you’ve read the information, click **Start** to begin the job.

    **Important**  
    Do not interact with the computer while the job is running. You will see activities while the job is running. When the job finishes, the results will appear in the Windows Assessment Console.

     

The results of this assessment show rendering and responsiveness metrics. Search performance metrics include the time that is required for various aspects of Search to be completed and displayed. Transition performance metrics include delays, frame rates, and glitches. Responsiveness results are measured in milliseconds. Low numbers mean that the computer is faster and more responsive. For rendering, the results show the frame rate and the number of glitches that occur. A good user experience has high frame rates and few glitches.

Issues and recommendations are based on these metrics. Click **Issues**, and expand the information that appears in the **Details** pane on the right to understand the issue and the recommendations. In most cases, you can also click the **WPA in-depth analysis** link to further analyze an issue.

### <a href="" id="bkmk-usetemplate"></a>Use a Template with Recommended Settings

The **Home** tab provides easy access to some predefined jobs that you can run immediately without any configuration steps and additional predefined jobs are available as templates when you create a new job. In this exercise, you create a new job by using the Manufacturing and Deployment template.

Watch the video demonstration:

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/99837a2d-f949-4a80-8250-53898ea4d57d/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no"></iframe>

**To use a template with recommended settings**

1.  If the Windows Assessment Console is not open, click **Start**, type “assessment console”, and then click **Windows Assessment Console**.

2.  In the Windows Assessment Console, click **Options**, and then click **New Job**.

3.  In the **New Job** dialog box, select **Create a job from a template**.

4.  From the list of available templates, select **Manufacturing and Deployment**, and then click **OK**.

5.  In the new tab in the Windows Assessment Console, the job settings are selected by default. Change the name to **Manufacturing and Deployment**, type **Identify issues with drivers and first boot experience** as a description. Add text to the **Notes** box to help you identify the job and the results. The following settings are also available, but do not change them for now.

    -   **Stop this job if an error occurs**. By default, this check box is cleared. Select this check box to stop the job from completing if an error occurs. This setting is useful when a job takes a long time to run. If an error occurs and this check box is selected, this setting can prevent long wait times. For shorter jobs, it is generally not necessary to stop the job if an error occurs.

    -   **Keep all temporary files created by assessments**. By default, this check box is cleared. Select this check box if you want to later review the files that the assessment created while the assessment was running.

6.  Click the **Driver verification** assessment to see the assessment settings. Make sure that **Use recommended settings** is selected.

    Assessment settings vary for each assessment. For example, the other two assessments in this job, the **Driver certification prevalidation** assessment and the **First boot performance** assessment don’t have configurable assessment settings.

7.  To run this job, click **Run** in the lower-right corner.

    If the **User Account Control** window opens, click **Yes**.

8.  When the Microsoft Assessment Launcher window appears, click **Details** to monitor the progress of the job.

    **Important**  
    It is okay to monitor the job progress in the Assessment Launcher window, but do not interact with the computer in any other way while the job is running. You might also see a console window appear while the job is running.

     

    The assessments run in the order they are listed in the job. First the Driver Verification assessment verifies that your computer contains the correct set of drivers. Then the Driver Certification Prevalidation assessment verifies that installed drivers qualify for the Windows Certification Program. The last assessment to run is the First Boot Performance assessment which examines the Event Trace Log (ETL) files created during Windows setup and OOBE to identify issues that affect the time that is required to boot Windows and display the Start screen the first time that the end user starts the computer. When all three assessments are completed, the results open in the assessment console.

9.  The **View Results** page contains a run information table, assessment results tables, a details pane on the right, and a metric chart at the top of the page. The following information can help you find additional information on the **View Results** page.

    -   In the **Run information** table header, click **Select rows** to add run information, such as **File path**, which displays the path to the results file that you are reviewing.

    -   In the **Driver verification** results table, click the chevron (&gt;) next to **Issues** to expand the list of issues found on the computer. If there are many issues, right-click **Issues**, click **Group by**, and then select a category for grouping the issues.

    -   In the **Driver certification prevalidation** results table, click the chevron next to any issue to expand the list. Click one of the issues in the list to see more information in the details pane. In the details pane, expand an issue and review the recommendations and additional information links.

    -   In the **First boot performance** results table, click the chevron next to **Time to Start** to see additional metric data generated by the assessment.

    -   In the **First boot performance** results table, click **Issues** to see all the issues found by the assessment displayed in the details pane on the right. Expand one of the issues in the details pane to see recommendations and links to more information and additional analysis.

### Next Steps

Next, in Exercise 2 you create a customized job that contains multiple assessments and customized assessment settings.

## <a href="" id="wac-sxs-ex2"></a>Exercise 2: Create a New Job with Custom Settings


You can use the Windows Assessment Console to create a new job of your own design. This enables you to define the assessment that you want to perform and the metrics that you want to review. You can start by selecting a job type in the New Job dialog, or by selecting a job or individual assessments from the home page. In either case, you can select which assessments are included in the job, and you can modify the settings to meet your needs. In this exercise, you create a new job, add assessments, and modify the assessment settings.

Watch the video demonstration:

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/a8e78967-8469-4646-9a69-bab2a033d1df/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no"></iframe>

**To create a new customized job**

1.  If the Windows Assessment Console is not open, click **Start**, type “assessment console”, and then click **Windows Assessment Console**.

2.  On the Home tab, double-click **Browsing and Windows UI Experience** to open the job.

3.  Click **Options**, and then click **Save Browsing and Windows UI Experience As**.

4.  In the **Save Job** dialog, browse the \\Windows Assessment Console\\Jobs folder, rename the job **My Browsing Experience Job**, and then click **Save**.

    **Important**  
    The standard location for saving jobs is %USERPROFILE%\\Documents\\Windows Assessment Console\\Jobs. When you save a job to this location, the job appears on the Windows Assessment Console Home page for easy access.

     

5.  In the new tab in the Windows Assessment Console, under **Job settings**, click **Overview**, to change the **Description** to **Measure Browser Experience**, and change the **Notes** to **Measure Browser Experience and impact of minifilter drivers**.

6.  Under **Assessments**, hover over **Windows UI performance** and then click the red **X** to remove the assessment. Do the same for the **Minifilter diagnostic: Internet Explorer** assessment.

7.  Select the **Internet Explorer startup performance** assessment to see the assessment settings on the right.

8.  Under **Settings**, clear the **Use recommended settings** check box and select the **Enable Minifilter Diagnostic Mode** check box.

    This setting identifies performance issues with minifilter drivers during Internet Explorer launch.

9.  Select the **Internet Explorer browsing performance** assessment to see the assessment settings on the right.

10. Under **Settings**, clear the **Use recommended settings** check box and change the **Internet Explorer View** to **Internet Explorer on the desktop**.

    This setting enables you to assess the browsing performance of Internet Explorer when it is ran on the desktop instead of in the new Windows UI.

11. Click **Run** in the lower-right corner.

    If the **User Account Control** window opens, click **Yes**.

12. Before the job starts, the job checks the computer configuration to make sure that the assessments can run successfully. The job generates error messages, warnings, and informational messages based on the computer configuration. The notifications appear in the Assessment Launcher dialog box. The three types of messages include:

    1.  Errors block the start of the job. Error messages appear when the job finds a problem with the computer hardware or configuration that must be fixed before the job can continue. The **Start** button is not available in the dialog box if an error message appears.

    2.  Warnings appear when the job finds a problem that does not block running the job, but may affect the results. You can review the warnings, fix issues, and then click **Refresh**, or ignore the warnings and then click **Start**.

    3.  Informational messages provide additional instructions or information about actions that will be taken when the job runs. After you’ve read the information, click **Start** to begin the job.

    Click the chevron to view additional details about any message that appears in the Microsoft Assessment Launcher window.

13. The next dialog box is informational. Click **Start** after reviewing the information.

    **Important**  
    Do not interact with your computer while the job is running. You might see Internet Explorer activity on the desktop while the job is running. When the job finishes, the results will appear in the Windows Assessment Console.

     

### Next Steps

Next, in Exercise 3 you package a job and saving it to a USB flash drive, so that you can run it on another computer and compare the results.

## <a href="" id="wac-sxs-ex3"></a>Exercise 3: Run a Job on Another Computer and Compare the Results


When you create a job that you want to run on a different computer, you do not have to install the Assessment Toolkit on that computer to do this. The Windows Assessment Console provides a way to package that job so that it includes all the necessary files and tools that are required to run the job on a different computer. In this exercise you package a job, run it on a different computer, and then compare the results.

Watch the video demonstration:

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/5a58137e-3afb-4e54-bb14-eaaf56bb44f6/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no"></iframe>

**Important**  
You should complete Exercise 1 before continuing.

This step requires a removable USB flash drive to store the job, and a separate computer to run the job on.

 

**Step 1: Package the job**

1.  In the Windows Assessment Console, select the **Manufacturing and Deployment** tab. If the tab is not opened, click the **Home** page and then double-click the job to open it.

2.  Click **Package**.

3.  In the **Package a Job to Run on Another Computer** dialog box, enter notes that will help you identify this job when you select results to open and view, such as **Packaged Manufacturing and Deployment Job**.

4.  In the **Package path** box, type the location where you want to store the job package. For this exercise, the location should be on removable media such as a USB flash drive.

5.  In the **Results path** box, type the location where you want to store the results. By default, this is the relative path of a .\\Results folder in the same location where the job is run.

6.  Click **OK**.

7.  When the job is packaged, the location where you stored the job will open. Eject the USB flash drive.

**Step 2: Run the packaged job on a different computer**

1.  Take the USB flash drive that contains the packaged job to the computer where you want to run the job.

2.  Open the folder and double-click the RunJob.cmd file.

3.  In **User Account Control**, click **Yes**.

4.  In the Assessment Launcher window, add run notes to identify the computer that the job is running on.

5.  In the **Results path** text box, leave the default location to store the results on the USB flash drive.

6.  Click **Run Job on this Computer**.

7.  When the job finishes, the results appear in the Windows Assessment Console. Close the Windows Assessment Console and remove the USB flash drive from the computer.

When the job finishes successfully, you can take the results on the USB flash drive to another computer and access them for comparison purposes.

**Step 3: Compare the results**

1.  Insert the USB flash drive into the computer where the Windows Assessment Console is installed.

2.  In the Windows Assessment Console, click **Options**, and then click **Import Results**.

3.  In the **Import Results** dialog box, click **Browse** to locate the results that you stored on the USB flash drive.

4.  Locate the folder where you packaged the job on the USB flash drive, click the results folder, and then click **Select Folder**. The path of that folder appears in the **Import from** box in the **Import Results** dialog box.

5.  Click **Next**. The Windows Assessment Console imports the selected results into the default results library on the local computer.

6.  If the results for the previous **Manufacturing and Deployment** job are not open, select the job and then click **View Results**.

7.  On the **View Results** page, in the upper-right corner, click **Add results**.

8.  Select the results produced by the packaged job, and then click **Add** to open them in a side-by-side view with the results that are already opened.

9.  You can filter results to show only the differences between results set. Click **Select rows** and then click **Show differences**.

When comparing two or more results, the best metrics when applicable are highlighted in blue.

## Summary


In this step-by-step guide, you ran jobs with the recommended settings, and you created a custom job. In addition, you packaged a job and ran it on another computer and compared the results. These are basic scenarios that give you an understanding of how to use the assessments that are provided, and how to navigate through the Windows® Assessment Console.

### More things to try

Try running additional jobs on your own. For example, we recommend the following:

-   [Memory Footprint](memory-footprint.md). This assessment helps you compare a baseline installation of Windows against an installation that has been modified with additional software. The assessment identifies the specific components that affect the physical system memory footprint, such as drivers, add-in applications, software packages, and antivirus programs.

-   [Create baseline results](create-baseline-results-for-comparing-windows-images.md). This topic walks you through the steps that are required to compare a baseline installation of Windows against an installation that has been modified with additional software.

-   [Connected Standby Energy Efficiency](connected-standby-energy-efficiency.md). This job provides an automated way for you to assess energy efficiency and measure the battery life of a portable computer.

-   [Create and run an energy efficiency job](create-and-run-an-energy-efficiency-job.md). Describes how to create and run a job that assesses the battery life and energy efficiency of a portable computer.

-   [On/Off Transition Performance](onoff-transition-performance.md). These assessments help you measure the duration between transitions from different computer states, like boot, resume from standby, and hibernate. Advanced issue analysis is available for any issues that are found so that any problems can be traced back to the source using Event Trace Logging and Windows® Performance Analyzer (WPA).

## Related topics


[Assessments](assessments.md)

 

 







