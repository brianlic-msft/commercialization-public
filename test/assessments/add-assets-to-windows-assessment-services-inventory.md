---
title: Add assets to Windows Assessment Services inventory
description: Add assets to Windows Assessment Services inventory
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bddc94de-3531-4de9-a1bc-5ae359d1f6c6
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add assets to Windows Assessment Services inventory


This topic describes how to add assets such as computers, Windows images, and unattended answer files to the Windows Assessment Services inventory. You can then use the assessment tools for the deployment and the assessment of various computers and Windows images that are in the inventory. Drivers are added to the Windows Deployment Services driver store so that they can be injected into the Windows image during deployment.

In this topic:

-   [Adding test computers to your inventory](#addcomps)

-   [Adding drivers to the driver store](#adddrivers-was)

-   [Adding images and unattended answer files](#addimages-was)

## <a href="" id="addcomps"></a>Adding test computers to your inventory


You can add bare metal computers (computers that don't have a running operating system) and computers that have a running operating system to the Windows Assessment Services inventory. You can then use the assessment tools to assess these computers. When the test computer has a running operating system, use the Windows Assessment Services script to add it to the inventory. When the test computer doesn't have a running operating system, use the USB flash drive to boot the computer and add it to the inventory. For more information about how to add bare metal computers to inventory, see [Prepare to deploy and assess a bare metal computer](prepare-to-deploy-and-assess-a-bare-metal-computer.md).

**Warning**  
You shouldn't include a test computer in multiple Windows Assessment Services server inventories at the same time. When a test computer appears in multiple Windows Assessment Services server inventories, it causes a race condition between the Windows Deployment Services instances on each server. If you must move a test computer from one inventory to another, in the Windows Assessment Services - Client (Windows ASC), delete the computer asset from the first Windows Assessment Services inventory, and then add it to the inventory on the new Windows Assessment Services server.

 

**To add running computers to the inventory**

1.  On a running test computer, log on to the Windows Assessment Services server. For example, at a command prompt, type:

    ``` syntax
    Net use \\<servername>\relax /u:localadmin Pass.word
    ```

    **Note**  
    This account and password are set up during the Windows Assessment Services installation and initialization. This isn't an administrator account.

     

2.  On the test computer, delete the C:\\relax folder, if it exists.

3.  At an elevated command prompt, run CompleteDeployment.cmd. The full path of the command is \\\\*&lt;servername&gt;*\\relax\\scripts\\TestMachine\\ CompleteDeployment.cmd.

    A description of what the script does appears in the Command Prompt window.

4.  Press Enter to continue. The computer will reboot when it is added to the inventory.

    **Warning**  
    If the computer name contains an underscore, it might not be reachable through DNS, in compliance with RFC requirements. In that case, the computer won't be added to the inventory. Out-of-box experience (OOBE) allows computer names with an underscore, but Windows Assessment Services inventory doesn't.

     

5.  Open the Windows ASC from the **Start** menu. On the **Getting Started** page, verify that the correct number of computers have been added to your server inventory.

## <a href="" id="adddrivers-was"></a>Adding drivers to the driver store


When you add running computers to your inventory, the out-of-box drivers from the computer are collected and stored on the Windows Assessment Services server at %systemdrive%\\relax\\drivers\\%computername%. This happens only when you're adding a computer to the inventory that has a running operating system. It doesn't happen on bare metal computers that you add to the inventory by using the USB Windows PE drive. In the following procedure, you add those drivers to the Windows Deployment Services driver store so that they're available for driver injection during image deployment.

**Warning**  
The following steps apply only to Windows Server 2012. If you're using Windows Server 2008 R2, you must inject the drivers into the image before deployment, because Dynamic Driver Provisioning in Windows Deployment Services isn't supported on Windows Server 2008 R2.

 

**To import drivers into the driver store**

1.  Click **Start**, click **Administrative Tools**, and then click **Windows Deployment Services**.

2.  Expand the **Servers** node, and then expand your server name.

3.  Right-click **Drivers**, and then click **Add Driver Package**.

4.  In the Add Driver Package wizard, click **Select all driver packages from a folder**, and then click **Browse**.

5.  Browse to the C:\\relax\\drivers folder, and then click **OK**.

6.  In the Add Driver Package wizard, click **Next**.

7.  On the **Available Driver Packages** page, click **Next**.

8.  On the **Summary** page, click **Next**.

9.  When the drivers are copied to the driver store, click **Next**.

10. On the **Driver Groups** page, click **Select an existing driver group**, verify that **DriverGroup1** is selected, and then click **Next**.

11. Click **Finish**.

## <a href="" id="addimages-was"></a>Adding images and unattended answer files


You must copy the Windows imaging (.wim) files to the image share before you import them to the inventory database and use them for deployment.

**To add images to the image share and inventory**

1.  On the Windows Assessment Services server, copy your .wim files to C:\\relax\\images.

    **Note**  
    The image path cannot contain spaces.

     

2.  These images are in the Windows Assessment Services server image share, but they haven't been imported into the inventory database. To import the images into the inventory database, use one of these methods:

    -   On the **Getting Started** page, click **Import images now**, and select the images. Click **Import**, and then click **OK**.

    -   In the Windows ASC, on the **Server** menu, click **Manager inventory**, click the **Images** tab, and then click **Add**.

**To add answer files to a share**

1.  A default Unattend.xml answer file for each supported architecture is provided at %systemdrive%\\relax\\scripts\\templates. You can use the default answer file, or you can copy the template Unattend.xml and modify it in Windows System Image Manager. For more information about how to modify an answer file, see the [Windows System Image Manager (Windows SIM) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214570).

2.  Copy Unattend.xml answer files to %systemdrive%\\relax\\unattendfiles. If you provide separate unattended answer files for specific images, give a unique name to each new answer file before you copy it to %systemdrive%\\relax\\unattendfiles.

3.  When you add images to a project in the Windows ASC, specify the path of the answer file that you want to use with that image.

    **Important**  
    When deploying an image to an OEM Activation 3.0 (OA 3.0) system, use a custom unattend.xml answer file with a product key that is associated with the image.

     

**To associate answer files with images**

1.  On the **Server** menu, click **Manage inventory**.

2.  In the **Asset Inventory** window, click the **Images** tab, and then use the filter text box to add filter criteria so that you can find the image that you're looking for.

3.  Right-click the column heading, and then click **Unattend path** to show this field as a column.

4.  Use the vertical scroll bar to find the **Unattend path** column. By default, the field is blank. Double-click the field and enter the UNC path for the answer file that you want to use with the selected image, such as %systemdrive%\\relax\\unattendfiles\\*&lt;my\_answer\_file&gt;*.xml.

## Related topics


[Windows Assessment Services common scenarios](windows-assessment-services-how-to-topics--wastechref.md)

 

 







