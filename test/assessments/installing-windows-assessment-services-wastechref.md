---
title: Installing Windows Assessment Services
description: Installing Windows Assessment Services
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fbd2036a-8d3e-43ac-b8c9-3c499e7e8322
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Installing Windows Assessment Services


Windows Assessment Services and Windows Assessment Services - Client (Windows ASC) are available in the Windows Assessment and Deployment Kit (Windows ADK). You can install or download the Windows ADK and select which features that you want to install.

You must install Windows Assessment Services on a server computer, which also installs Windows ASC on the server. You can also install a stand-alone version of Windows ASC on a client computer and use it to connect to Windows Assessment Services.

The Windows Assessment Services server supports Preboot Execution Environment (PXE)-based image deployment by using Windows Deployment Services. The Windows Assessment Services server also maintains your inventory database, job shares, result shares, and various scripts that are used for automation. You can use Windows ASC to manage assets that are in the inventory, set up and schedule projects and jobs, monitor progress, and view results.

In this topic:

-   [System Requirements](#sysreq-was)

-   [Installing Windows Assessment Services](#installwas)

-   [Installing Windows Assessment Services-Client](#installwasc)

-   [Backing up the Windows Assessment Services Inventory Database](#installwasc-backupinventory)

-   [Next Steps](#installwasc-nextsteps)

## <a href="" id="sysreq-was"></a>System Requirements


**Server Computer**

To install Windows Assessment Services, your server must meet the following requirements:

-   Windows Server 2012 or Windows Server 2008 R2 Enterprise, Standard, or Datacenter edition. Windows Assessment Services is not supported on Server Core, Windows Server Essentials, or a server that is a Domain Controller.

    Windows ASC is installed with Windows Assessment Services by default. You must install Remote Management 3.0 to run Windows ASC on Windows Server 2008 R2.

    When you install Windows Assessment Services on a Windows Server 2012 server, Windows Deployment Services (WDS) is configured as follows:

    -   Microsoft-Windows-Deployment-Services, Microsoft-Windows-Deployment-Services-Transport-Server, and Microsoft-Windows-Deployment-Services-Deployment-Server are enabled.

    -   Windows Assessment Services is listed as the first provider in the list of providers for client boot services over the network.

    -   If WDS is not initialized, Windows Assessment Services initializes it and sets the REMINST folder to %SYSTEMDRIVE%\\REMINST.

    -   Boot .wim files that are installed with Windows Assessment Services are added to the WDS image inventory.

    When you install Windows Assessment Services on a Windows Server 2008 R2 server, Windows Deployment Services (WDS) is configured as follows:

    -   Microsoft-Windows-Deployment-Services and Microsoft-Windows-Deployment-Services-Transport-Server are enabled.

    -   The REMINST share is created at %SYSTEMDRIVE%\\REMINST, the folder is shared, and the permissions are set for the Windows ASC user (localadmin).

    -   Boot files are copied from the Windows Assessment Services installation directory …/relax/scripts, to the REMINST share.

    -   The WDS component, Wdstftp, is configured.

    -   Windows Assessment Services is listed as the first provider in the list of providers for client boot services over the network.

    -   Boot .wim files that were installed with Windows Assessment Services are added to the WDS image inventory.

    -   The WDS server is restarted.

    **Note**  
    When you install Windows Assessment Services on a server, Windows Deployment Services is enabled with these benefits and limitations:

    -   Windows Deployment Services is configured to automate PXE-based computer discovery and image deployment. When deploying an image to test computers, you must use a Windows image (.wim) file that has been generalized using the sysprep tool.

    -   Windows Assessment Services on Windows Server 2012 uses Windows Deployment Services Dynamic Driver Provisioning (DDP) to inject matching Plug and Play drivers during image deployment. Windows Assessment Services doesn't support DDP on Windows Server 2008 R2. On either server operating system, you can use DISM.exe to inject drivers into the .wim image offline before deployment.

    -   If the server is a domain member, you must set the Internet Protocol security (IPsec) exclusion policy to use Windows Deployment Services to deploy image and run assessments on test computers.

    -   You can skip Windows Deployment Services image deployment if the test computer already has a supported running operating system, or if it has an image that is deployed outside Windows Assessment Services.

    -   Internet Protocol version 4 (IPv4) is supported.

     

-   The Microsoft .NET Framework 3.5 and the .NET Framework 4

    **Note**  
    For Windows Server 2008 R2, the .NET Framework 3.5 is installed by default and the .NET Framework 4 is installed with the Assessment Toolkit.

     

    For Windows Server 2012, the .NET Framework 4 is installed by default and you must enable the .NET Framework 3.5 before you install Windows Assessment Services. To enable the .NET Framework 3.5, on the server, at the command prompt, type the following:

    ``` syntax
    DISM /Online /Enable-Feature /FeatureName:NetFx3 /All
    ```

-   Network: 1-gigabyte (GB) network adapter

-   Hard disk space: 50 GB of memory per test computer.

-   Memory: 8 GB minimum, 16 GB for servers that support more than 100 test computers.

**Technician’s computer**

By default, the Windows ASC is installed on the server where you installed Windows Assessment Services. You can also install it on a client computer. To install Windows ASC, your computer must be running one of these operating systems:

-   Windows Server 2008 R2 with Remote Management 3.0 installed

-   Windows Server 2012

-   Windows 8

-   Windows 10

**Test computers**

Test computers must meet these requirements:

-   USB boot support

-   Network (PXE) boot support

-   Network adapter driver

**Network infrastructure**

At a minimum, your network infrastructure should meet these requirements:

-   All computers must be on the same subnet. If not, the IP address of the Windows Assessment Services server and Windows Deployment Services should be in the IP Helper address list of the switches for all the test computers that you are deploying by using Windows Assessment Services.

-   A Dynamic Host Configuration Protocol (DHCP) server must be available on the same network to assign IP addresses to test computers.

**Security Note:  **

For security purposes, limit access to the Windows Assessment Services server by doing one of the following:

-   Block port 8000 for users outside the same subset by using Group Policy if computers are on a domain, or by an administrator if in a workgroup.

-   Edit a firewall rule on the server to define the scope as:

    -   A specific subnet

    -   A specific IP range

    -   A predefined set of computers

    -   Specific users or specific computers

## <a href="" id="installwas"></a>Installing Windows Assessment Services


**Important**  
You can upgrade to a newer version of Windows Assessment Services. When you upgrade, assessment results on the server will be preserved. Project, job, and job information will not be preserved.

 

1.  On the server computer, double-click **ADKSetup.exe**.

2.  Click **Download** to download the Windows ADK. Or, if the server can remain connected to the Internet during setup, click **Install**.

3.  Accept the Microsoft Software License Terms.

4.  Select the following features:

    -   Deployment Tools

    -   Windows Preinstallation Environment

    -   Windows Assessment Services

    -   Windows Performance Toolkit

5.  Click **Install**.

**Note**  
An instance of Microsoft SQL Server 2012 Express is installed together with Windows Assessment Services. The name of the instance of SQL Server is ADK. If an instance of SQL Server that is named ADK already exists, you should remove or rename it before you install Windows Assessment Services. If you don’t, the existing instance is used.

By default, Windows ASC is also installed together with Windows Assessment Services on the server.

 

## <a href="" id="installwasc"></a>Installing Windows Assessment Services - Client


By default, Windows ASC is installed on the server when you install Windows Assessment Services. However, you can also install it on a client (or technician) computer.

1.  On the technician's computer, double-click **ADKSetup.exe**.

2.  Click **Download** to download the Windows ADK. Or, if the computer can remain connected to the Internet during setup, click **Install**.

3.  Select **Deployment Tools**, **Windows Assessment Services-Client**, and **Windows Performance Toolkit**, and then click **Install**.

## <a href="" id="installwasc-backupinventory"></a>Backing up the Windows Assessment Services Inventory Database


If you are going to upgrade the server operating system where Windows Assessment Services is installed, you must back up the Windows Assessment Services inventory database and any relevant customized scripts. Although it isn't required, if you are uninstalling and re-installing Windows Assessment Services, we also recommend backing up the database and customized scripts.

**To back up the Windows Assessment Services inventory database**

1.  Install Microsoft SQL Server Management Studio Express (ENU\\x86\\SQLManagementStudio\_x86\_ENU.exe), from the [Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkId=251597).

2.  Use **net stop wassvc** to stop Windows Assessment Services.

3.  Open SQL Server Management Studio 2012 and detach the Windows Assessment Services database. For more information about how to detach a database using SQL Server Management Studio 2012, see [MSDN: Detach a Database](http://go.microsoft.com/fwlink/?LinkId=251595).

4.  Copy the database (.mdb file) and transaction logs from %SystemDrive%\\ProgramData\\Windows Assessment Services\\databases, to a secure backup location.

    **Note**  
    If you have customized scripts in the …/relax/scripts folder, also copy them to a secure backup location.

     

5.  Uninstall Windows Assessment Services, upgrade your server operating system, and then re-install Windows Assessment Services.

6.  Initialize the Windows Assessment Services server by opening Windows ASC, and connecting to the server.

7.  Use **net stop wassvc** to stop Windows Assessment Services.

8.  Open SQL Server Management Studio 2012 and detach the new Windows Assessment Services database that was created when you initialized the Windows Assessment Services server.

9.  Remove the new database from %SystemDrive%\\ProgramData\\Windows Assessment Services\\databases.

10. Copy the old database from the backup location to %SystemDrive%\\ProgramData\\Windows Assessment Services\\databases.

11. Open SQL Server Management Studio 2012 and attach the Windows Assessment Services database. For more information about how to attach a database using SQL Server Management Studio 2012, see [MSDN: Attach a Database](http://go.microsoft.com/fwlink/?LinkId=251596).

12. Put your customized scripts back in the …/relax/scripts directory.

13. Use **net start wassvc** to start Windows Assessment Services.

## <a href="" id="installwasc-nextsteps"></a>Next Steps


After installing Windows Assessment Services and the Windows ASC, initialize the server and configure communication between Windows Assessment Services and the Windows ASC computers. You can configure more than one Windows ASC computer to communicate with the Windows Assessment Services server. For more information, see [Windows Assessment Services Setup and Configuration](windows-assessment-services-setup-and-configuration-wastechref.md).

## Related topics


[Windows Assessment Services](windows-assessment-services-technical-reference.md)

 

 







