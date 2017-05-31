---
title: Deploy Windows using Windows Assessment Services
description: Deploy Windows using Windows Assessment Services
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e86b9140-36dc-4802-b672-ffe94f1eed6a
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deploy Windows using Windows Assessment Services


There are three ways to set up jobs and associated assets. You can set up a job to perform the following:

-   Assess computers that already have a supported, running operating system.

-   Deploy a supported operating system to a computer by using Windows Assessment Services, and then assess the computer.

-   Use other deployment tools or methods to deploy a supported operating system to a computer, and then assess the computer.

This topic describes all three of these deployment options.

**To add assets to a job and deploy an image**

1.  In the Windows ASC, create or open a job.

2.  Under **Job settings**, click **Overview**, and verify that the **Apply image** check box is selected.

3.  If you want to inject matching Plug and Play drivers from a Dynamic Driver Provisioning driver store during image deployment, select **Dynamic Driver Provisioning**.

4.  Under **Job settings**, click **Assets**, and then click **Add** to select the computers that you want run the job on.

5.  In the **Select Evaluation Assets** window, select the computers that you want to assess, click **Next**, and then click **Finish**.

6.  The computers appear on the right side of the Windows ASC under **Evaluation assets**. Select a computer, click **Change Image**, select the image that you want to apply to that computer, and then click **OK**.

    **Note**  
    The computer and the image architecture must match, except that you can select an x86-based image to deploy to an x64-based computer.

     

**To add assets to a job and use custom deployment**

1.  In the Windows ASC, create or open a job.

2.  Under **Job settings**, click **Overview**, and verify that the **Apply image** check box is selected.

3.  Clear the **Dynamic Driver Provisioning** check box.

4.  Under **Job settings**, click **Assets**, and then click **Add** to select the computers that you want run the job on.

5.  In the **Select Evaluation Assets** window, select the computers that you want to assess, and then click **Next**.

6.  Click **&lt;Use Predeployed Image&gt;**, and then click **Finish**.

    **Note**  
    When you schedule a job by using **&lt;Use Predeployed Image&gt;**, the job does not start until you deploy Windows and run **\\\\%WASServer%\\relax\\scripts\\testmachine\\completedeployment.cmd AUTO** at an elevated command prompt.

     

**To add assets to a job without deploying an image**

1.  In the Windows ASC, create or open a job.

2.  Under **Job settings**, click **Overview**, and then clear the **Apply image** check box.

3.  Under **Job settings**, click **Assets**, and then click **Add** to select the computers that you want run the job on.

4.  In the **Select Evaluation Assets** window, select the computers that you want to assess, and then click **Finish**.

## Related topics


[Windows Assessment Services common scenarios](windows-assessment-services-how-to-topics--wastechref.md)

 

 







