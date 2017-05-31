---
title: Create baseline results
description: Create baseline results
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4aa70366-047d-4381-b592-fe6e66696a9f
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create baseline results


This topic describes how to assess a computer that has an unmodified Windows image installed and then save the results to a share or an external drive. This topic then describes how to assess a computer that has a customized Windows image (or third-party software and hardware) and compare the results to other results from the same computer or a different computer.

We recommend this scenario for Original Equipment Manufacturers (OEMs) and system builders who want to establish baseline assessment results to determine how customizations affect system performance for a specific hardware configuration.

For general information about how to use the Windows Assessment Console to assess a computer, see the [Windows Assessment Console step-by-step guide](windows-assessment-console-step-by-step-guide.md).

**To create baseline results**

1.  Install a clean (or uncustomized) version of Windows 8 or Windows 10 on a bare-metal reference computer. A bare-metal reference computer doesn't have an operating system or software installed, and the hardware is a computer model that represents the specific type of computer that you manufacture or sell.

2.  When Windows Setup finishes, download and install the Windows Assessment Toolkit from the Windows Assessment and Deployment Kit (Windows ADK).

3.  Click **Start**, type **assessment console**, and then click **Windows Assessment Console**. The Windows Assessment Console opens.

4.  In the Windows Assessment Console, select a job from the **Home** page, select a single assessment, or create a new job. For example, you can create a new job and use the Manufacturing and Deployment template to identify issues with drivers and devices, including logo requirements, and to identify delays in the end user's first boot experience.

5.  In the upper-right corner of the Windows Assessment Console, click **Options**, and then click **Configure Results**.

6.  In the **Assessment Results Library Locations** dialog box, click **Add**. The **Include Folder in Assessment Results** dialog box opens.

7.  Select a location where you can store assessment results for later comparison, such as a network share, and then click **Include folder**.

    **Important**  
    You must save the results to a network share if you plan to reinstall Windows on this reference computer. If you reimage the referenced computer, the results are overwritten and won't be available for comparison if they're stored locally.

     

8.  Select the default result location (**%UserProfile%\\Documents\\Assessment Results**), and then click **Remove**.

9.  Verify that the new save location appears in the list as the default save location, and then click **OK**.

10. Click **Run** to start assessing the computer.

11. When the job finishes, the results appear in the Windows Assessment Console on the **View Results** page.

12. On the **View Results** page, click **Configure job**.

13. On the **Configure job** page, in the lower-right corner, click **Package**.

14. In the **Package Job** dialog box, enter notes that will help you identify your job when you select results to open and view.

15. In the **Package path** box, type the location where you want to store the job package. This location should be on removable media such as a USB flash drive.

16. In the **Results path** box, type the location where you want to store the results. By default, this is the relative path of a \\Results folder in the same location where the job is run.

17. Click **OK**.

**To run the same job on a customized Windows image**

1.  Customize your Windows image and install it on the same reference computer. For more information about Windows customization and deployment, see [Deployment and Imaging Tools Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214548).

2.  When Windows Setup finishes, open the folder where you stored the packaged job, copy the folder to the local computer, and then double-click the **RunJob.cmd** file to run the same job that you ran in the previous procedure.

    **Important**  
    A packaged job can run from a network share, but for best results run the job from the local computer to reduce run-time failures, or performance issues caused by the network

     

3.  When the job finishes, the results appear in the Windows Assessment Console.

**To compare the results**

1.  In the Windows Assessment Console, click **Options**, and then click **Open Results**.

2.  In the **Select Results** window, click **Browse**.

3.  In File Explorer, browse to the location where you stored the results files, select the .xml files that you want, and then click **Open** to see the results in the Windows Assessment Console.

    When you select more than one result file, the results appear side by side in the Windows Assessment Console so that you can easily compare the baseline results to any subsequent results.

Based on the comparison of results, you can make improvements to the customized image. You can continue the run, review, and revise process until you obtain the results that you want.

## Related topics


[Assessments](assessments.md)

[Windows Assessment Console](windows-assessment-console.md)

[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

 

 







