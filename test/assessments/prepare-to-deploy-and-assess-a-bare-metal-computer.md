---
title: Prepare to deploy and assess a bare metal computer
description: Prepare to deploy and assess a bare metal computer
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a1e0a35c-c074-4833-86a0-046aa6d4baf5
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Prepare to deploy and assess a bare metal computer


This topic walks you through the steps that are required to prepare and add a bare metal computer to your Windows Assessment Services inventory. You will then create a project and job that includes the computer, and also the image and answer file that are used to deploy an image to that computer before it is assessed.

In this topic:

-   [Step1: Add network adapter drivers to the Boot.wim](#bkmk-addnicdrivers)

-   [Step 2: Prepare the Windows PE USB Drive for test computer inventory](#bkmk-prepwinpe)

-   [Step 3: Add test computers to your inventory](#bkmk-addcomps)

-   [Step 4: Add images and unattended answer files](#bkmk-addimages)

-   [Step 5: Add the assets to a project](#bkmk-assetproject)

-   [Step 6: Add the assets to a job](#bkmk-assetjob)

## <a href="" id="bkmk-addnicdrivers"></a>Adding network adapter drivers to the Boot.wim


Add network adapter (NIC) drivers to the Windows PE images that Windows Deployment Services uses. This step is required only when the test computers require out-of-box NIC drivers so that they have network connectivity during inventory or after the Windows image is deployed. You need the NIC drivers when you boot a bare metal computer (a computer that doesn’t have an operating system installed) in Windows PE.

**To add NIC drivers to the boot.wim**

1.  On the server, create a folder for the NIC drivers and copy them to the folder. For example, if your drivers are stored on a share, you can use a command such as the following:

    ``` syntax
    robocopy \\Server\share\drivers C:\Drivers\amd64NIC /MIR
    ```

2.  Click **Start**, click **Administrative Tools**, and then click **Windows Deployment Services**.

3.  Expand the **Servers** node and expand your server name.

4.  Right-click **Drivers**, and then click **Add Driver Package**.

5.  In the Add Driver Package wizard, click **Select all driver packages from a folder**, and then click **Browse**.

6.  Browse to the folder that contains the out-of-box NIC drivers, and then click **OK**.

7.  In the Add Driver Package wizard, click **Next**.

8.  On the **Available Driver Packages** page, click **Next**.

9.  On the **Summary** page, click **Next**.

10. When the drivers are copied to the driver store, click **Next**.

11. On the **Driver Groups** page, click **Select an existing driver group**, verify that **DriverGroup1** is selected, and then click **Next**.

12. Click **Finish**.

13. On the **Servers** node, click **Boot Images**, right-click the boot image where you want to inject the driver, and then click **Add Driver Packages to Image**.

14. In the Add Driver Package to Boot Image Wizard, on the **Before You Begin** page, click **Next**.

15. On the **Select Driver Packages** page, click **Package Class**, and then click **Edit**.

16. Delete everything except **Net**, and then click **OK**.

17. In the Add Driver Package to Boot Image Wizard, click **Search for Packages**, click **Next**, and then click **Next** again.

18. When the drivers are added, click **Finish**.

Your boot image now has out-of-box NIC drivers. Repeat these steps for each Windows Deployment Services boot.wim architecture.

## <a href="" id="bkmk-prepwinpe"></a>Preparing the Windows PE USB drive for test computer inventory


To inventory bare metal computers, you must create a bootable USB drive to start the computer and add it to the inventory. For more information about how to prepare a bootable Windows PE USB flash drive, see [Walkthrough: Install Windows PE to CD, USB Flash Drive, or USB Hard Drive](http://go.microsoft.com/fwlink/p/?linkid=219488). The walkthrough creates bootable media by using the default Windows PE image (WinPE.wim) without customizing it. Before you use the bootable USB flash drive for inventory, you must copy the RelaxWinPE.wim file to the source folder on the USB flash drive, as shown in the procedure in the following section.

**Important**  
To inventory x86-based test computers, you must use an x86-based Windows PE image. To inventory AMD64-based test computers, you must use an AMD64-based Windows PE image. This procedure uses an x86-based image. If your test computers are both x86 and AMD64 based, create a USB flash drive for each architecture.

 

**To replace the boot.wim file with the Windows AS WinPE.wim file**

1.  On the technician computer where you created the Windows PE build environment, type the following command:

    ``` syntax
    xcopy %SystemDrive%\REMINST\Boot\x86\Images\RelaxWinPE.wim c:\winpe_x86\media\sources\boot.wim
    ```

    ``` syntax
    xcopy %SystemDrive%\REMINST\Boot\x64\Images\RelaxWinPE.wim c:\winpe_x64\media\sources\boot.wim
    ```

2.  Repeat the previous step to create a USB flash drive for each architecture that you need for your test computers.

    **Important**  
    To inventory x86-based test computers, you must use an x86-based Windows PE image. To inventory AMD64-based test computers, you must use an AMD64-based Windows PE image.

     

Now that the bootable Windows PE USB flash drive is prepared and NIC drivers are in place, you can add assets such as computers, images and answer files to the Windows Assessment Services inventory and then include the assets in your projects and jobs.

## <a href="" id="bkmk-addcomps"></a>Adding test computers to your inventory


You can add bare-metal computers (computers without a running operating system) in addition to computers that have a running operating system to the Windows Assessment Services inventory so that you can use the assessment tools to assess these computers. When the test computer doesn't have a running operating system, use the USB flash drive to boot and inventory the computer, as shown in procedure in the following section.

**Warning**  
You shouldn't include a test computer in multiple Windows Assessment Services server inventories at the same time. When a test computer appears in multiple Windows Assessment Services server inventories, it causes a race condition between the Windows Deployment Services instances on each server. If you must move a test computer from one inventory to another, in the Windows Assessment Services - Client (Windows ASC), delete the computer asset from the first Windows Assessment Services inventory, and then add it to the inventory on the new Windows Assessment Services server.

 

**To add bare-metal computers to your inventory**

1.  Insert the USB flash drive into the test computer.

2.  Turn on the computer, and press the key that opens the boot-device selection menu for the computer, such as Esc.

3.  Select the USB flash drive as the boot device.

    When the computer reboots, provide the following information:

    -   Computer name. The computer name must contain only alphanumeric characters and dashes. If the computer name contains an underscore or other extended characters, the computer may not be discoverable via Domain Name System (DNS). The computer name must be 15 characters or less.

    -   Computer location. The computer location must be 78 characters or less.

    -   Whether you want to perform Driver Scavenge. Driver Scavenge copies drivers found on the computer to the Windows Assessment Services driver store.

4.  Remove the USB flash drive from the test computer. The computer will reboot.

    **Note**  
    If you deploy images by using Windows Assessment Services, we recommend setting the boot order in BIOS so that Preboot Execution Environment (PXE) is first in the boot order. This way, you don't have to manually press the boot-order keyboard shortcut and select network boot before a job starts.

     

5.  Open the Windows ASC from the **Start** menu. On the **Getting Started** page, verify that the correct number of computers have been added to your server inventory.

## <a href="" id="bkmk-addimages"></a>Adding images and unattended answer Files


You must copy the Windows imaging (.wim) files to the image share before you import them to the Windows Assessment Services inventory and use them for deployment. The answer files that you want to use for deployment must also be available in the appropriate server share.

**To add images to the image share and inventory**

1.  On the Windows Assessment Services server, copy your .wim files to C:\\relax\\images.

    **Note**  
    The image path cannot contain spaces.

     

2.  These images are in the Windows Assessment Services server image share, but they haven't been imported into the inventory database. To import the images into the inventory database, use one of these methods:

    -   On the **Getting Started** page, click **Import images now**, select the images, click **Import**, and then click **OK**.

    -   In the Windows ASC, on the **Server** menu, click **Manager inventory**, click the **Images** tab, and then click **Add**.

**To add answer files to a share**

1.  A default Unattend.xml answer file for each supported architecture is provided at %systemdrive%\\relax\\scripts\\templates. You can use the default answer file, or you can copy the template Unattend.xml and modify it in Windows System Image Manager. For more information about how to modify an answer file, see the [Windows System Image Manager (Windows SIM) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214570).

2.  Copy Unattend.xml answer files to %systemdrive%\\relax\\unattendfiles. If you provide separate unattended answer files for specific images, give each new answer file a unique name before you copy it to %systemdrive%\\relax\\unattendfiles.

3.  When you add images to a project in the Windows ASC, specify the path of the answer file that you want to use with that image.

    **Important**  
    When deploying an image to an OEM Activation 3.0 (OA 3.0) system, use a custom unattend.xml answer file with a product key that is associated with the image.

     

## <a href="" id="bkmk-assetproject"></a>Adding assets to a project


A project is a collection of assets that you want to assess. It identifies multiple computers and multiple images that are a subset of all the computers and images that you added to your inventory. If the computers that you add to the project are bare metal computers, or if you want to refresh the image on the test computer, you also select the images that you want to apply to each computer.

When multiple people are working with different test computers and images in the same server inventory, you can use projects to partition an individual's workspace.

**To add assets to a new project**

1.  In the Windows ASC, on the **Getting Started** page, click **Create New Project**.

2.  In the **Project name** box, type a name for your project.

3.  In the **Description** box, type a description.

4.  In the **Keywords** box, enter keywords, and then click **Next**.

5.  In the **Select machines to include in this project** window, click **Add** and select the computer that you want to include in this project, click **OK**, and then click **Next**.

6.  In the **Image Inventory** window, click **Add** and select images to add to your project, click **OK**, and then click **Finish**.

    **Note**  
    If your test computers already have a running operating system, you don't have to add images to the project.

     

## <a href="" id="bkmk-assetjob"></a>Adding assets to a job


A job associates assets (a computer and a Windows image) with assessments. A job can contain multiple computers, the corresponding images and unattended answer files, and multiple assessments. You can use all the assets that were added to the project, use only a subset of those assets, or run different jobs on different assets that are available in the project.

**To add assets to a job and deploy an image**

1.  In the Windows ASC, create or open a job.

2.  Under **Job settings**, click **Overview**, and verify that the **Apply image** check box is selected.

3.  If you want to inject matching Plug and Play drivers from a Dynamic Driver Provisioning driver store during image deployment, select **Dynamic Driver Provisioning**.

4.  Under **Job settings**, click **Assets**, and then click **Add** to select the computers that you want run the job on.

5.  In the **Select Evaluation Assets** window, select the computers that you want to assess, click **Next**, and then click **Finish**.

6.  The computers appear on the right side of the Windows ASC under **Evaluation assets**. Select a computer, click **Change Image**, select the image that you want to apply to that computer, and then click **OK**.

    **Note**  
    The computer and the image architecture must match, except that you can select an x86-based image to deploy to an x64-based computer.

     

## Next steps


In these steps, you prepared the Windows PE boot environment, booted a bare metal computer and added it to the Windows Assessment Services inventory. Then you added the computers, images, and answer files to the server inventory and created a project and a job that included these assets. The next step is to add assessments to the job, configure the job and assessment settings, and then click Run. When you run the job, the Windows image is deployed to the computer before the assessments that are included in the job are run.

## Related topics


[Windows Assessment Services common scenarios](windows-assessment-services-how-to-topics--wastechref.md)

 

 







