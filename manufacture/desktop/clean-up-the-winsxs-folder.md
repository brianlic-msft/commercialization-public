---
author: Justinha
Description: Clean Up the WinSxS Folder
ms.assetid: 67fe462d-cda1-4f2e-9652-62c374a6be97
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Clean Up the WinSxS Folder
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Clean Up the WinSxS Folder


One commonly asked question is can I delete the WinSxS folder to regain some disk space? The short answer is no. However, there are ways to reduce the size of the WinSxS folder. For more information about the WinSxS folder, see [Manage the Component Store](manage-the-component-store.md). This topic was written to provide information about the different ways to reduce the size of the WinSxS folder on a running version of Windows 10.

Windows 10 and Windows Server 2016 automatically reduces the size of the WinSxS by using methods similar to the ones described in this topic, however these methods also include internal processes, such as uninstalling and deleting packages with components that have been replaced by other components with newer versions. Previous versions of some components are kept on the system for a period of time, allowing you to rollback if necessary. After a period of time, these components are removed from the installation.

You can also reduce the size of a Windows image using some of the same techniques, as discussed in [Reduce the Size of the Component Store in an Offline Windows Image](reduce-the-size-of-the-component-store-in-an-offline-windows-image.md).

**Warning**  
Deleting files from the WinSxS folder or deleting the entire WinSxS folder may severely damage your system so that your PC might not boot and make it impossible to update.

 

In Windows 10 and Windows Server 2016, you have a number of ways to start the cleanup of the component store, which use a combination of package deletion and component compression to clean up the WinSxS folder:

## <span id="Task_Scheduler"></span><span id="task_scheduler"></span><span id="TASK_SCHEDULER"></span>Task Scheduler


The **StartComponentCleanup** task was created in Windows 8 to regularly clean up components automatically when the system is not in use. This task is set to run automatically when triggered by the operating system. When run automatically, the task will wait at least 30 days after an updated component has been installed before uninstalling the previous versions of the component.

If you choose to run this task, the task will have a 1 hour timeout and may not completely clean up all files.

**Run the StartComponentCleanup task in Task Scheduler to clean up and compress components**

1.  If **Task Scheduler** is not open, start the **Task Scheduler**. For more information, see [Start Task Scheduler](http://technet.microsoft.com/library/cc721931.aspx).

2.  Expand the console tree and navigate to **Task Scheduler Library\\Microsoft\\Windows\\Servicing\\StartComponentCleanup**.

3.  Under **Selected Item**, click **Run**

**Note**  
The StartComponentCleanup task can also be started from the command line:

**schtasks.exe /Run /TN "\\Microsoft\\Windows\\Servicing\\StartComponentCleanup"**

 

## <span id="dism.exe"></span><span id="DISM.EXE"></span>Dism.exe


Deployment Image Servicing and Management (DISM) is a command-line tool that allows you to install, uninstall, configure, and update Windows features, packages, drivers, and international settings. The **/Cleanup-Image** parameter of **Dism.exe** provides advanced users more options to further reduce the size of the WinSxS folder. For more information, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

**Use the /StartComponentCleanup parameter**

-   Using the **/StartComponentCleanup** parameter of Dism.exe on a running version of Windows 10 gives you similar results to running the **StartComponentCleanup** task in **Task Scheduler**, except previous versions of updated components will be immediately deleted (without a 30 day grace period) and you will not have a 1-hour timeout limitation.

    From an elevated command prompt, type the following:

    ``` syntax
    Dism.exe /online /Cleanup-Image /StartComponentCleanup
    ```

**Use the /ResetBase switch with the /StartComponentCleanup parameter**

-   Using the **/ResetBase** switch with the **/StartComponentCleanup** parameter of DISM.exe on a running version of Windows 10 removes all superseded versions of every component in the component store.

    From an elevated command prompt, type the following:

    ``` syntax
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
    ```

    **Warning**  
    All existing service packs and updates cannot be uninstalled after this command is completed. This will not block the uninstallation of future service packs or updates.

     

**Use the /SPSuperseded parameter**

-   To reduce the amount of space used by a Service Pack, use the **/SPSuperseded** parameter of Dism.exe on a running version of Windows 10 to remove any backup components needed for uninstallation of the service pack. A service pack is a collection of cumulative updates for a particular release of Windows.

    From an elevated command prompt, type the following:

    ``` syntax
    Dism.exe /online /Cleanup-Image /SPSuperseded
    ```

    **Warning**  
    The service pack cannot be uninstalled after this command is completed.

     

## <span id="Disk_Cleanup"></span><span id="disk_cleanup"></span><span id="DISK_CLEANUP"></span>Disk Cleanup


You can use Disk Cleanup to reduce the number of unnecessary files on your drives, which can help your PC run faster. It can delete temporary files and system files, empty the Recycle Bin, and remove a variety of other items that you might no longer need. The option to cleanup updates helps reduce the size of the component store.

**Run Disk Cleanup to delete system files**

-   To delete system files run the steps as provided in [Delete files using Disk Cleanup](http://go.microsoft.com/fwlink/p/?LinkId=698648).

## <span id="related_topics"></span>Related topics


[Manage the Component Store](manage-the-component-store.md)

[Determine the Actual Size of the WinSxS Folder](determine-the-actual-size-of-the-winsxs-folder.md)

[Reduce the Size of the Component Store in an Offline Windows Image](reduce-the-size-of-the-component-store-in-an-offline-windows-image.md)

[Uninstall-WindowsFeature](http://technet.microsoft.com/library/jj205471.aspx)

[How to Reduce the Size of the Winsxs directory and Free Up Disk Space on Windows Server 2012 Using Features on Demand](http://blogs.technet.com/b/askpfeplat/archive/2013/02/24/how-to-reduce-the-size-of-the-winsxs-directory-and-free-up-disk-space-on-windows-server-2012-using-features-on-demand.aspx)

[How to address disk space issues that are caused by a large Windows component store (WinSxS) directory](http://support.microsoft.com/kb/2795190)

 

 






