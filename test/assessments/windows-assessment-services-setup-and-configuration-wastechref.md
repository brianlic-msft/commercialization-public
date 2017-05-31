---
title: Windows Assessment Services setup and configuration
description: Windows Assessment Services setup and configuration
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f624a482-23c6-4f84-b16b-9431e7259ba8
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Assessment Services setup and configuration


Before you start to use the assessment tools, you must initialize Windows Assessment Services. Multiple Windows ASC computers can communicate with the same Windows Assessment Services server. Additional configuration steps include preparing a bootable Windows PE USB drive to gather inventory on the test computers that do not have a running operating system installed. For computers that have a running operating system installed, the CompleteDeployment script is provided to add these computers to inventory. You also must add drivers and images to your inventory. The procedures in this topic walk you through this process.

In this topic:

-   [Initializing Windows Assessment Services](#configwas)

-   [Configuring Symbols](#bkmk-wasc-symbols)

-   [Adding Network Adapter Drivers to Boot.wim](#bkmk-wac-nicdrivers)

-   [Preparing the Windows PE USB Drive for Test Computer Inventory](#prepwinpe)

-   [Adding Test Computers to Your Inventory](#addcomps)

-   [Adding Drivers to the Driver Store](#adddrivers-was)

-   [Adding Images and Unattended Answer Files](#addimages-was)

## <a href="" id="configwas"></a>Initializing Windows Assessment Services


To initialize Windows Assessment Services you must run Windows ASC from the server.

**Important**  
Port 8000 must be opened on the server so that Windows ASC and the test computers can communicate. Windows Assessment Services initialization adds a firewall rule to open port 8000. The port will not be opened if it is blocked by a Group Policy setting.

 

1.  Click **Start**, and then type **Windows Assessment Services - Client** to find and open the application.

2.  In the text box, type the name of the server where Windows Assessment Services is installed, and then click **OK**.

    The first time the server is initialized it can take approximately 15 to 30 minutes. A message will appear when the server has successfully initialized.

**Warning**  
During Windows Assessment Services server configuration, Windows Deployment Services (WDS) is configured to list Windows Assessment Services as the first provider in the list of providers for client boot services over the network. The first provider to answer all clients effectively denies requests to all other providers in the list. We don’t recommend that you install Windows Assessment Services on a production server.

 

## <a href="" id="bkmk-wasc-symbols"></a>Configuring Symbols


Some assessments require access to symbols. If the symbols are not available, the assessment results can be incorrect or incomplete. Internet connectivity and access to the Microsoft public symbol server satisfy this dependency. In other cases where connectivity to the Internet is not available, like a lab environment, you can configure symbol access by using an unattended answer file during deployment, or it can be configured manually.

**To configure the symbol environment variable by using an unattended answer file**

1.  Copy the symbols for the third-party components to **%systemdrive%\\relax\\symbols\\%PROCESSOR\_ARCHITECTURE%\\** on the Windows Assessment Services server.

2.  If the test computer doesn't have access to the Internet and can't access the Microsoft public symbol server, connect the test computer to the Internet and follow the instructions in [http://support.microsoft.com/kb/311503](http://go.microsoft.com/fwlink/p/?linkid=235360) to download the matching Windows component symbols. Then, move the test computer back to the original network, and copy the downloaded symbols to **%systemdrive%\\relax\\symbols\\%PROCESSOR\_ARCHITECTURE%\\** on the Windows Assessment Services server.

3.  Change the unattended answer file template for deployment images, under **C:\\relax\\scripts\\tempate**, by adding the following in the `<FirstLogonCommands>` section. Update the order number to the last sequence of the synchronous commands.

    ``` syntax
    <SynchronousCommand>
    ```

    ``` syntax
       <Order>8</Order>
    ```

    ``` syntax
       <CommandLine>setx _NT_SYMBOL_PATH SRV*%systemdrive%\relax\symbols\%PROCESSOR_ARCHITECTURE%;%systemdrive%\relax\symbols\%PROCESSOR_ARCHITECTURE% /M</CommandLine>
    ```

    ``` syntax
       <Description>"Setting _NT_SYMBOL_PATH"</Description>
    ```

    ``` syntax
    </SynchronousCommand>
    ```

4.  Before taking inventory or deploying images to the test computers, configure the symbol path in the file: \\\\&lt;server&gt;\\relax\\scripts\\testmachine\\setenvironment.cmd.

5.  After you deploy Windows and take inventory of your test computers, you must set the correct symbol path in &lt;systemdrive&gt;:\\relax\\setenvironment.cmd.

After Windows Assessment Services deploys the image to the test computer, the test computer will have the \_NT\_SYMBOL\_PATH environment variable.

For more information about how to set the symbol path and download symbols, see [MSDN: Symbols Support](http://go.microsoft.com/fwlink/?LinkId=235359).

**To configure the symbol environment variable manually**

1.  Open File Explorer, right-click **Computer**, and then click **Properties**.

2.  In the **Properties** window, click **Advanced System Settings**.

3.  In the **Systems Properties** window, on the **Advanced** tab, click **Environment Variables**.

4.  Under **System variables**, click **New** to set the symbol environment variable by using one of the following paths:

    -   **Use the public symbol server (requires an Internet connection)**

        Connect the computer to the Internet so that it can access the Microsoft symbol server, and then configure the \_NT\_SYMBOL\_PATH environment variable to use the Microsoft symbol server at http://msdl.microsoft.com/downloads/symbols.

    -   **Use a network-connected symbol path (requires a local network connection)**

        Connect the computer to the local intranet and then configure the \_NT\_SYMBOL\_PATH environment variable to use an intranet symbol path.

    -   **Use a local symbol path**

        Download the symbols to the Windows Assessment Services server computer, and point the test computer to this location by setting the \_NT\_SYMBOL\_PATH environment variable to use a path to the symbols on the server, like **\\\\WASServer\\relax\\symbols**.

For more information about how to set the symbol path and download symbols, see [MSDN: Symbols Support](http://go.microsoft.com/fwlink/?LinkId=235359).

## <a href="" id="bkmk-wac-nicdrivers"></a>Adding Network Adapter Drivers to Boot.wim


Add network adapter (NIC) drivers to the Windows PE images that Windows Deployment Services uses. This step is required only when the test computers require out-of-box NIC drivers so that they have network connectivity during inventory or after the Windows image is deployed. You need the NIC drivers when you boot a bare metal computer (a computer that doesn’t have an operating system installed) in Windows PE.

**To add NIC drivers to the boot.wim**

1.  On the server, create a folder for the NIC drivers and copy them to the folder. For example, if your drivers are stored on a share, you can use a command such as the following:

    ``` syntax
    robocopy \\Server\share\drivers  C:\Drivers\amd64NIC /MIR
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

14. In the **Add Driver Package to Boot Image** Wizard, on the **Before You Begin** page, click **Next**.

15. On the **Select Driver Packages** page, click **Package Class**, and then click **Edit**.

16. Delete everything except **Net**, and then click **OK**.

17. In the **Add Driver Package to Boot Image** Wizard, click **Search for Packages**, click **Next**, and then click **Next** again.

18. When the drivers are added, click **Finish**.

Your boot image now has out-of-box NIC drivers. Repeat these steps for each Windows Deployment Services boot.wim architecture.

## <a href="" id="prepwinpe"></a>Preparing the Windows PE USB Drive for Test Computer Inventory


To inventory bare metal computers (a computer without an operating system installed), you must create a bootable USB drive to start the computer and add it to the inventory. For more information about how to prepare a bootable Windows PE USB drive, see [Walkthrough: Install Windows PE to CD, USB Flash Drive, or USB Hard Drive](http://go.microsoft.com/fwlink/p/?linkid=219488). The walkthrough creates bootable media by using the default Windows PE image (WinPE.wim) without customizing it. Before you use the bootable USB drive for inventory, you must copy the RelaxWinPE.wim file to the source folder on the USB drive.

**Important**  
To inventory x86-based test computers, you must use an x86-based Windows PE image. To inventory AMD64-based test computers, you must use an AMD64-based Windows PE image. This procedure uses an x86-based image. If your test computers are both x86 and AMD64 based, create a USB drive for each architecture.

 

**To replace the boot.wim file with the Windows AS WinPE.wim file**

1.  On the technician computer where you created the Windows PE build environment, type this command:

    ``` syntax
    xcopy %SystemDrive%\REMINST\Boot\x86\Images\RelaxWinPE.wim c:\winpe_x86\media\sources\boot.wim
    ```

    ``` syntax
    xcopy %SystemDrive%\REMINST\Boot\x64\Images\RelaxWinPE.wim c:\winpe_x64\media\sources\boot.wim
    ```

2.  Repeat the previous step to create a USB drive for each architecture that you need for your test computers.

    **Important**  
    To inventory x86-based test computers, you must use an x86-based Windows PE image. To inventory AMD64-based test computers, you must use an AMD64-based Windows PE image.

     

Now that the bootable Windows PE USB drive is prepared and NIC drivers are in place, you can add inventory to your server and then include it in your projects and jobs.

## <a href="" id="addcomps"></a>Adding Test Computers to Your Inventory


You can add bare-metal computers (computers without a running operating system) and also computers that have a running operating system to the Windows Assessment Services inventory so that you can use the assessment tools to assess these computers. When the test computer doesn't have a running operating system, use the USB drive to boot the computer and add it to the Windows Assessment Services inventory. When the test computer has a running operating system, use the Windows Assessment Services script to add it to the Windows Assessment Services inventory.

**Warning**  
You shouldn't include a test computer in multiple Windows Assessment Services server inventories at the same time. When a test computer appears in multiple Windows Assessment Services server inventories, it causes a race condition between the Windows Deployment Services instances on each server. If you must move a test computer from one inventory to another, in the Windows Assessment Services - Client (Windows ASC), delete the computer asset from the first Windows Assessment Services inventory, and then add it to the inventory on the new Windows Assessment Services server.

 

**To add bare-metal computers to inventory**

1.  Insert the USB drive into the test computer.

2.  Turn on the computer, and press the key that opens the boot-device selection menu for the computer, such as Esc.

3.  Select the USB drive as the boot device.

    When the computer reboots, provide the following information:

    -   Computer name. The computer name must contain only alphanumeric characters and dashes. If the computer name contains an underscore or other extended characters, the computer may not be discoverable via Domain Name System (DNS). The computer name must be 15 characters or less.

    -   Computer location. The computer location must be 78 characters or less.

    -   Whether you want to perform Driver Scavenge. This copies drivers found on the computer to the Windows Assessment Services driver store.

4.  Remove the USB drive from the test computer. The computer will reboot.

    **Note**  
    If you deploy images by using Windows Assessment Services, we recommend setting the boot order in BIOS so that Preboot Execution Environment (PXE) is first in the boot order. This way, you don't have to manually press the boot-order keyboard shortcut and select network boot before a job starts.

     

5.  Open the Windows ASC from the **Start** menu. On the **Getting Started** page, verify that the correct number of computers have been added to your server inventory.

**To add running computers to inventory**

1.  On a running test computer, log on to the Windows Assessment Services server. For example, at the command prompt, type:

    ``` syntax
    Net use \\<servername>\relax /u:localadmin Pass.word
    ```

    **Note**  
    This account and password are set up during the Windows Assessment Services installation and initialization. This is not an administrator account.

     

2.  On the test computer, delete the C:\\relax folder, if it exists.

3.  From an elevated command prompt, run CompleteDeployment.cmd. The full path to the command is \\\\&lt;servername&gt;\\relax\\scripts\\TestMachine\\CompleteDeployment.cmd.

    A description of what the script does appears in the Command Prompt window.

4.  Press Enter to continue. The computer will reboot when it is added to the inventory.

    **Warning**  
    If the computer name contains an underscore, it might not be reachable through DNS, in compliance with RFC requirements. In that case, the computer won't be added to the inventory. Out-of-box experience (OOBE) allows computer names with an underscore, but Windows Assessment Services inventory doesn't.

     

5.  Open the Windows ASC from the **Start** menu. On the **Getting Started** page, verify that the correct number of computers have been added to your server inventory.

## <a href="" id="adddrivers-was"></a>Adding Drivers to the Driver Store


When you add running computers to your inventory, the out-of-box drivers from the computer are collected and stored on the Windows Assessment Services server at %systemdrive%\\relax\\drivers\\%computername%. This happens only when you're adding a computer to the inventoty that has a running operating system. It doesn't happen on bare metal computers that you add to the inventory by using the USB Windows PE drive. In the following procedure, you add those drivers to the Windows Deployment Services driver store so that they're available for driver injection during image deployment.

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

## <a href="" id="addimages-was"></a>Adding Images and Unattended Answer Files


You must copy the Windows imaging (.wim) files to the image share before you import them to the inventory database and use them for deployment.

**To add images to the image share and inventory**

1.  On the Windows Assessment Services server, copy your .wim files to C:\\relax\\images.

    **Note**  
    The image path cannot contain spaces.

     

2.  These images are in the Windows Assessment Services server image share, but they haven't been imported into the inventory database. To import the images into the inventory database, use one of these methods:

    -   On the **Getting Started** page, click **Import images now**, select the images, click **Import**, and then click **OK**.

    -   In the Windows ASC, on the **Server** menu, click **Manager inventory**, click the **Images** tab, and then click **Add**.

**To add answer files to a share**

1.  A default Unattend.xml answer file for each supported architecture is provided at %systemdrive%\\relax\\scripts\\templates. You can use the default answer file, or you can copy the template Unattend.xml and modify it in Windows System Image Manager. For more information about how to modify an answer file, see the [Windows System Image Manager (Windows SIM) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214570).

2.  Copy the Unattend.xml answer files to %systemdrive%\\relax\\unattendfiles. If you provide separate unattended answer files for specific images, give a unique name to each new answer file before you copy it to %systemdrive%\\relax\\unattendfiles.

3.  After you add images to a project in the Windows ASC, you can specify the path of the answer file that you want to use with that image. On the **Server** menu, click **Manage inventory**. On the **Image** tab, change the **Unattend path**.

## Related topics


[Windows Assessment Services](windows-assessment-services-technical-reference.md)

[Installing Windows Assessment Services](installing-windows-assessment-services-wastechref.md)

 

 







