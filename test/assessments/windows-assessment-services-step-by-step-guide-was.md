---
title: Windows Assessment Services step-by-step guide
description: Windows Assessment Services step-by-step guide
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 42b89aeb-e92b-4571-a609-87f22941193c
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Assessment Services step-by-step guide


Windows Assessment Services is a test framework that is used to automate quality measurements, such as performance, reliability and functionality, in a lab environment on multiple computers. The Windows Assessment Services - Client (Windows ASC) is the graphical user interface that is used to manage settings and assets, such as which lab computers to test, which images should be applied to those computers, and which assessments should be used to test the computers. Windows ASC is also used to monitor the progress of a running job, and to view the results that were produced. To assess computer or image quality, Windows Assessment Services test framework does the following:

-   Automates image deployment to test computers by using Windows Deployment Services (WDS) and a customized Windows Preinstallation Environment (Windows PE) image

-   Automates the running of assessments by using Windows Remote Management (WinRM)

-   Automates the collection of results from test computers by using WinRM to copy results to the Windows Assessment Services server.

The following illustration outlines the Windows Assessment Services topology:

![windows assessment services topology](images/dep-was-sxs-topology.jpg)

This guide provides step-by-step guidance for installing the Windows Assessment Toolkit, configuring Windows Assessment Services and the Windows ASC, assessing multiple computers, and then reviewing results.

In this topic:

-   [Prerequisites](#bkmk-wastr-prereqs)

-   [Step 1: Installation and Configuration](#bkmk-wastr-step1)

-   [Step 2: Create a Project](#bkmk-wastr-step3)

-   [Step 3: Create a Job](#bkmk-wastr-step4)

-   [Step 4: Run the Job](#bkmk-wastr-step5)

-   [Step 5: Review the Results](#bkmk-wastr-step6)

-   [Conclusion](#bkmk-wastr-conclude)

## <a href="" id="bkmk-wastr-prereqs"></a>Prequisites


To successfully complete the steps outlined in this guide, verify that you have the following:

-   Windows Server 2012 with the following:

    -   Recommended: 1 GB NIC

    -   Recommended: Sizable storage space for trace files, results and images

        **Note**  
        You can use Windows Server 2008 R2 in this scenario. However, Windows Server 2008 R2 does not support Dynamic Driver Provisioning (DDP) as described in step 1 and step 2, where it is used to add NIC drivers and import additional drivers to the driver store. You can work around this by using Deployment Image Servicing and Management (DISM) to add drivers to your Windows image offline. For more information, see [Deployment Image Servicing and Management (DISM) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214571).

         

-   One or more test computers that have the following:

    -   USB boot support

    -   Network (PXE) boot support

    -   Network Card driver

    **Note**  
    The test computers can be bare metal computers (no operating system installed), or computers that are running Windows 8.

     

-   A Windows 8 image (if you are using bare metal computers)

-   A 512 MB USB flash drive

-   All computers must be on the same subnet

-   A DHCP server to assign IP addresses to test computers

For more information about system requirements, see [Installing Windows Assessment Services](installing-windows-assessment-services-wastechref.md).

## <a href="" id="bkmk-wastr-step1"></a>Step 1: Installation and Configuration


You must install Windows Assessment Services on a server computer, which also installs Windows ASC on the server. You can also install a stand-alone version of Windows ASC on a client computer. For more information about how to install Windows Assessment Services and Windows ASC, see [Installing Windows Assessment Services](installing-windows-assessment-services-wastechref.md).

Setup and configuration includes the following steps:

-   Initializing Windows Assessment Services

-   Configuring access to symbols

-   Adding NIC Drivers to the Windows PE image that Windows Deplyment Services uses. This step is required only when the test computers require out-of-box NIC drivers so that they have network connectivity during inventory or after the Windows image is deployed.

-   Preparing the Windows PE USB drive for test computer inventory. To inventory bare metal computers, you must create a bootable USB drive to start the computer and add it to the inventory.

-   Adding Test computers, images and unattended answer files to the inventory.

-   Adding out-of-box drivers to the Windows Deployment Services driver store so that they’re available for driver injection during image deployment.

For more information about how to do this, see [Windows Assessment Services Setup and Configuration](windows-assessment-services-setup-and-configuration-wastechref.md).

## <a href="" id="bkmk-wastr-step3"></a>Step 2: Create a Project


A project is a collection of assets that you want to assess. It identifies multiple computers and multiple images that are a subset of all the computers and images that you added to your inventory. A project provides a contextualized, manageable view of the assets of interest, and pairs up each computer with an image and answer file. A project does not contain assessments.

In this step, you create a project by selecting a set of test computers from your inventory. If the computers that you select are bare metal computers, or you want to refresh the image on the test computer, you also select the images that you want to apply to each computer. Be sure to select images that match the architecture of your test computers.

**Creating a project**

1.  On the Getting Started page, click **Create New Project**.

2.  In the **Project name** text box, type **Project1**.

3.  In the **Description** text box, type a description. For example, **This is a test run to learn how to use assessment services in my lab environment.**

4.  In the **Keywords** text box, type keywords, such as **Project1**, and then click **Next**.

5.  In the **Select machines to include in this project** window, click **Add** and select the computer that you want to include in this project. Click **OK** and then click **Next**.

6.  In the **Image Inventory** window, click **Add** and select images to add to your project. Click **OK** and then click **Finish**.

    **Note**  
    If your test computers already have a running operating system, you do not have to add images to the project.

     

The Windows ASC home page opens.

## <a href="" id="bkmk-wastr-step4"></a>Step 3: Create a Job


In this step, you create a job, adjust the settings, and store a job in your project. A job associates assets (a computer and a Windows image) with assessments. A job can contain multiple computers, the corresponding images and unattended answer files, and multiple assessments. You can select any number of assessments to run on your test computers, however, this guide demonstrates performing a single assessment on multiple test computers.

**Add an assessment to the job**

1.  On the Home page, click **Create new job**.

2.  In the New Job window, in the **Job Name** text box type **Check Drivers**.

3.  The following job types are available:

    1.  **Create a custom job**. If you select this option, you add assessments that are designed for general use in the Windows ASC when the custom job opens.

    2.  **Create a job from a Template**. If you select this option, a template window opens and you add preconfigured jobs or assessments that have preconfigured settings.

    3.  **Create an energy efficiency job**. If you select this option, you add assessments that are designed to run as workloads to test the battery life and energy efficiency on laptops.

    Click **Create a custom job**.

4.  In the new tab in Windows ASC, the job settings are highlighted by default. In the details pane on the right you can change the name, add a description, and add keywords to help you identify the job and the results.

    Adjust the following job settings:

    1.  Enter keywords to help you identify the job in Search.

    2.  Choose a **Failure behavior** from the drop down list, and then select **Stop** to stop the job if there is a failure since we are only running one assessment in this job.

    3.  Under **Configure analysis preference**, select an option for when to analyze the results.

        By default, **Complete analysis on server** is selected. This option lets you free up the target computer for other uses, take advantage of the resources on the server to save time running the analysis, and use symbols already loaded on the server.

5.  Under **Assessment**, click **Add Assessments**.

6.  In the details pane on the right, click the plus sign (**+**) next to **Driver Verification** to add the assessment to the job.

**Add test computers that don’t need deployment**

1.  In the Windows ASC, under **Job settings**, click **Overview**, and then clear the **Apply image** check box.

2.  Under **Job settings**, click **Assets**, and then click **Add** to select the computers that you want run the job on.

3.  In the **Select Evaluation Assets** window, select the computers that already have a supported operating system installed, and then click Finish.

**Add computers and images that do need deployment**

1.  In the Windows ASC, under **Job settings**, click **Overview**, and then select the **Apply image** check box.

2.  If you want to inject matching Plug and Play drivers from a Dynamic Driver Provisioning driver store during image deployment, select **Dynamic Driver Provisioning**.

3.  Under **Job settings**, click **Assets**, and then click **Add** to select the computers that you want run the job on.

4.  In the **Select Evaluation Assets** window, select the computers that you want to assess. Click **Next**, and then click **Finish**.

5.  The computers appear on the right side of the Windows ASC under **Evaluation assets**. Select a computer, click **Change Image**, select the image that you want to apply to that computer, and then click **OK**.

    **Warning**  
    The computer and the image architecture must match, except that you can select an x86-based image to deploy to an x64-based computer.

     

## <a href="" id="bkmk-wastr-step5"></a>Step 4: Run the Job


You can run a job on all the assets that you added to the project, run a job on a subset of those assets, or run different jobs on different assets that are available in the project. In this step, you set the run-time settings, run the job and view the progress of the job.

**Running the Job**

1.  In the Windows ASC, click **Run** to start the job instance.

2.  In the **Run Job** dialog, enter **Job instance tag** and **Test Pass** information, and then click **OK**.

    **Note**  
    The Job instance tag identifies the iteration, installation type, or focus of comparison. For example, OEM-Win7, Clean-Win7, OEM-Win8, Clean-Win8. You can run a job many times. Therefore, you can have multiple instances of the job. The Test Pass represents a milestone, a logical set of computers, or other differentiations, for example, Phase A, Phase B, Phase C, Phase D. These keywords help you identify the appropriate results when you search through a list of results, but they are not required fields.

    When the job finishes, the results are copied back to the server at \\\\%WAS-Server%\\relax\\results\\%Project%\\%TestPass%\\%JobName%\\%ComputerName%\\%JobInstanceTag%\_%TimeStamp%\\.

     

3.  When the Results tab opens, review the progress of the job on each computer.

4.  In the Windows ASC, in the Monitor Instances window, click **View Details**.

5.  Click the name of the computer, to see additional details about the progress of the job running on that computer.

    **Note**  
    If you are applying an image to your test machine, it might take a few minutes for the task to finish.

     

## <a href="" id="bkmk-wastr-step6"></a>Step 5: Review the Results


By default, when you open multiple results in Windows ASC, you get a summary view of the results. The summary view displays each job instance as a column. Below the overview tables, metrics for each assessment in the job instance appear as a chart. This summary contains information about the computer, the job that was run, and overall metrics that were measured. It provides a visual comparison of the same metric across several job instances, and lets you select which metrics are displayed. This view of the results can help you identify individual computers in your lab environment that need quality improvements.

In this step, you view the results for the completed job.

**Review the Results**

1.  Click the back arrow to return to the job instance view.

2.  Verify that the job is complete, select the job, and then click **View Results**.

    **Note**  
    The **View Results** button is unavailable until a job instance is complete and highlighted.

     

3.  On the **Results Overview** page, review the total number of Errors and Warnings that were reported for each computer in the **Overview: Overall issues** table.

4.  All visible metrics have bar charts under the overview tables. In one of the assessment metric rows, such as **Driver verification: Devices Missing drivers** click **Sort** to arrange the graph in an ascending or descending order.

5.  Select the first bar in the chart to highlight the corresponding column in the Overview.

6.  Click **View details** in the lower-right corner, to view detailed job results for the selected computer.

7.  Expand the metric that has the highest value, and select an individual issue to see more information in the details pane on the right.

8.  In the Issues pane, expand one of the issues to see what is recommended for remediation. For example, removing extra drivers is recommended if you have devices with multiple drivers. If extra drivers are listed, browse to the file location for that computer, specified under **Extra drivers that can be removed**, and delete extra drivers. When you run the job again, you should notice that you do not have extra drivers.

## <a href="" id="bkmk-wastr-conclude"></a>Conclusion


In this step-by-step guide, you installed and configured Windows Assessment Services, created an inventory of test computers and images, setup dynamic driver provisioning, created a project, ran a job with the Driver verification assessment and reviewed the assessment results. This is a basic scenario. More advanced scenarios include the following:

-   Running multiple assessments on test computers.

-   Running the same set of assessments on a single computer, but using different images.

-   Viewing comparison reports for assessment jobs that have different images.

-   Capturing and deploying images of other formats.

## Next Steps


Create another job and try other assessments, add more computers, or use a different image. If you ran the last job using Windows Assessment Services to deploy Windows to computers, you can save time by assessing computers that already have Windows 8 installed.

## Related topics


[Windows Assessment Services](windows-assessment-services-technical-reference.md)

[Windows Assessment Services common scenarios](windows-assessment-services-how-to-topics--wastechref.md)

[Analyze results on another device](analyze-results-on-another-device.md)

 

 







