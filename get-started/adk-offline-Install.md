---
author: themar
Description: Instructions on how to build an offline installer for the Windows ADK
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Install the ADK offline
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---


# Install the Windows ADK offline

To install the Windows ADK on a PC that does not have Internet access, first download the installer files on a PC that has internet access. Next, copy the installer files to a location that is accessible to the offline computer. Then run ADKSetup.exe using either the GUI or the command line.

## To install the Windows ADK on an offline computer using the GUI
1. On a PC that has Internet access, run Windows ADK Setup from this [Microsoft website](https://developer.microsoft.com/en-us/windows/hardware/windows-assessment-deployment-kit).
2. Select **Download the Assessment and Deployment Kit for installation on a separate computer.**
3. In the **Download Path** box, specify the location where you want to download the files, and then click **Next**.
4. Select whether you want to participate in the Customer Experience Improvement Program (CEIP), and then click **Download**. 
5. After the download is finished, click **Close**.
6. Copy the downloaded files to a location that the offline computer can access.
    For example, copy the files to removable media or to a file server that the computer can access.

7. On the offline computer, change directory to the location of the copied files.
8. Run ADKSetup.exe, and then select the Windows ADK features that you want to install.

## To install the Windows ADK on an offline computer using the command line
1. On a PC that has Internet access, save a copy of the Adksetup.exe.
2. Open a Command Prompt window as administrator.
3. Change to the directory that stores the Adksetup.exe file.
        
    ```
    cd %userprofile%\downloads
    ```

4. Run adksetup.exe. Use /quiet to run the installer silently. Use /layout to specify where the offline install files will be copied to.

    ```
    adksetup /quiet /layout c:\temp\ADKoffline
    ```

5. Copy the downloaded files to a location that the offline computer can access.
    For example, copy the files to removable media or to a file server that the offline computer can access.
6. On the offline computer, open a Command Prompt window as an administrator.
7. Change to the directory that contains adksetup.exe.
8. Run adksetup.exe. Use /quiet for a silent installation, /installpath to specify where to install the ADK, and /features to specify features. For example, install Deployment Tools and Windows PE to c:\ADK silently: 

    ```
    adksetup.exe /quiet /installpath c:\ADK /features OptionId.DeploymentTools OptionId.WindowsPreinstallationEnvironment
    ```
    
[ADKSetup Command-Line Syntax](https://technet.microsoft.com/en-us/library/dn621910.aspx).