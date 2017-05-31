---
author: KPacquer
Description: 'Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)'
ms.assetid: 142bc507-64db-43dd-8432-4a19af3c568c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---
# Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)

Install Windows desktop applications and system settings by capturing them into siloed provisioning packages (SPPs).

SPPs are a new type of provisioning package that is available starting with Windows 10, version 1607. In previous versions of Windows 10, to capture these applications, you'd capture them all at once into a single provisioning package.  

With SPPs, you can capture individual Windows desktop applications, .exe-style drivers, and Windows settings. You can then apply these to your PCs after you've applied the Windows image. This provides more flexibility for the manufacturing process and helps reduce the time required to build PCs that run Windows.    

SPPs also support capturing add-on packs for apps that include optional components, like application language packs.

After you apply the SPPs, they'll be automatically included in the recovery tools. 

When you apply SPPs to a Compact OS system, the applications in that SPP are single-instanced automatically to save space.

**Notes**

*  To add these apps to the taskbar and start menu, you'll need to update the LayoutModification.xml and TaskbarLayoutModification.xml files, we'll show you this in [Lab 11: Add Start tiles and taskbar pins](add-start-tiles-sxs.md). New versions of these files can simply be copied into the image or to the destination device directly.

   **For Microsoft Office, this is required**: you must [add Start tiles and taskbar pins](add-start-tiles-sxs.md#AppendOfficeSuite). if you don't add it to the Start menu, Windows will remove the Office files during the OOBE boot phase.

## Best practices while capturing applications: use clean installations

We recommend that each time you capture a new Windows desktop application, you start with a clean, freshly-installed Windows image, in audit mode.

You can do this by:
*  Using the techniques you learned in the labs to quickly apply images to a device
*  Using virtual machines (VMs). With Hyper-V, you can create a clean, freshly-installed Windows image, and then create a checkpoint. You can use checkpoints to quickly bounce back to the clean, freshly-reinstalled state. 

## <span id="Prepare_a_copy_of_the_Deployment_and_Imaging_Tools"></span><span id="prepare_a_copy_of_the_deployment_and_imaging Tools"></span><span id="PREPARE_A_COPY_OF_THE_DEPLOYMENT_AND_IMAGING_TOOLS"></span>Step 1: Prepare a copy of the Deployment and Imaging Tools

You'll need the Windows 10, version 1703 version of the Deployment and Imaging Tools from the ADK. This includes the ScanState tool and the latest version of DISM.

**Important**   Don't overwrite the existing DISM files on the WinPE image.

1.  Start the Deployment and Imaging Tools Environment as an administrator.

2.  From the technician PC, copy the Deployment and Imaging Tools from the Windows ADK to the storage USB key.

    ``` syntax
    CopyDandI.cmd amd64 E:\ADKTools\amd64
	```

## <span id="Prepare_a_device_for_image_capture"></span><span id="prepare_a_device_for_image_capture"></span><span id="PREPARE_A_DEVICE_FOR_IMAGE_CAPTURE"></span>Step 2: Prepare a device for image capture

**Get into audit mode**

1.  Boot up the reference device (or VM), if it's not already booted.

2.  If the device boots to the **Languages** or the **Get going fast** screen, press **Ctrl+Shift+F3** to enter Audit mode.

3.  In audit mode, the device reboots to the Desktop, and the System Preparation Tool (Sysprep) appears. Ignore Sysprep for now.

4.  For VMs, create a checkpoint for this clean, freshly-installed Windows image.

## <span id="Capture_a_setting"></span><span id="capture_a_setting"></span>Step 3: Capture a setting 

You can add registry keys, for example, an OEM key, or a Windows Store identifier. To learn more, see the [Windows Store Program 2016 Guide](https://myoem.microsoft.com/oem/myoem/en/topics/Licensing/roylicres/ost2016/Pages/DP-WindowsStoreOEMProgramGuide2016FinalCL.aspx) and the [Apps and Store Windows Engineering Guide (WEG)](https://myoem.microsoft.com/oem/myoem/en/topics/Licensing/roylicres/ost2016/Pages/DP-WinEngnrngGdAppsStore.aspx).

1.  Add a setting. For example, add a registry key:

    a.  Start 'regedit'.

    b.  Navigate to 'HKEY_LOCAL_MACHINE\Software\OEM\Fabrikam'.

    c.  Click **Edit > New > String Value**.

    d.  Type `FabrikamID`.

    e.  Double-click OEMID, and in **Value**, type "Fabrikam-1".

2.  Capture the changes into the siloed provisioning package, and save it on the hard drive:

    ``` syntax
    E:\ADKTools\amd64\ScanState.exe /config:E:\ADKTools\amd64\Config_SettingsOnly.xml /o /v:13 /ppkg e:\SPPs\Fabrikam-ID.spp /l:C:\ScanState.log
    ```

    where *E* is the drive letter of the USB drive with ScanState.

    **Recommended**: Delete these logs to save disk space: `del C:\ScanState.log` `del c:\miglog.xml`. 
    
    ScanState creates two log files, ScanState.log and miglog.xml. The `/l` option can be used to specify where the logs are saved. The above command writes the logs to c:\. 
    
    To see more about ScanState command-line options, see [Siloed Provisioning Packages](siloed-provisioning-packages.md#capture-windows-desktop-applications).

## <span id="Install_and_capture_a_Windows_desktop_application"></span><span id="install_and_capture_a_windows_desktop_application"></span><span id="INSTALL_AND_CAPTURE_A_WINDOWS_DESKTOP_APPLICATION"></span>Step 4: Install and capture a Windows desktop application (Microsoft Office)

1.  Install a Windows desktop application. For example, to install Office 2016.

    a.  On your technician PC, mount ISO for the deployment tool from " X21-05453 Office v16.2 Deployment Tool for OEM OPK\Software - DVD\X21-05495 SW DVD5 Office 2016 v16.2 Deployment Tool for OEM\X21-05495.img"

    b.  Copy files from mounted drive to USB-B (where E:\ is driver letter for USB-B) E:\OfficeV16.2
    
    c.  Double click e:\Officev16.2\officedeploymenttool.exe


2.  Start a command prompt.

3.  Capture the changes into the siloed provisioning package, and save it on the hard drive:

    ``` syntax
    E:\ADKTools\amd64\ScanState.exe /apps:-sysdrive /o /v:13 /config:E:\ADKTools\amd64\Config_AppsOnly.xml /ppkg e:\SPPs\office16_base.spp /l:C:\ScanState.log
    ```

    where *E* is the drive letter of the USB drive with ScanState.

    **Recommended**: Delete the ScanState log files: `del C:\Scanstate.log` `del C:\miglog.xml`.

4.  To capture an add-on package, repeat the process. 
    Example: add Office 2016 language packs. Get these from the Office OPK Update image from the Office OPK Connect site.
	
    1.  Install the fr-fr language pack.
	
	2.  Capture the combined files as an add-on pack.

        ``` syntax
        E:\ADKTools\amd64\ScanState.exe /apps:-sysdrive /o /v:13 /config:E:\ADKTools\amd64\Config_AppsOnly.xml /diff:e:\SPPs\office16_base.spp /ppkg E:\SPPs\office16_fr-fr.spp /l:C:\ScanState.log
        ```

        The Sysprep tool reseals the device. This process can take several minutes. After the process completes, the device shuts down automatically.
	
	3. To capture more add-on packs:
       -  Reinstall Windows and the Office base app, and capture the next add-on pack.
          or
       -  For VMs, revert back to the checkpoint, apply the base package, then capture the next add-on pack.

       **Recommended**: Delete the ScanState log files: `del C:\ScanState.log` `del c:\miglog.xml`

5.  To capture more apps:
    -  Reinstall Windows, then capture the next app
	   or
	-  For VMs, revert back to the checkpoint, then capture the next app.

## <span id="Try_it_out"></span><span id="try_it_out"></span><span id="TRY_IT_OUT"></span>Step 5: Try it out
	
**Apply the image**

Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the image, and boot it up. 

The short version:

1.  Boot the reference PC to Windows PE.

2.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).

3.  Apply the image: `D:\ApplyImage.bat D:\Images\install-updated.wim`.

**Apply the SPPs**

1.  Copy the ADK tools to a non-removable file location, such as the primary hard drive, which is assigned to W after the ApplyImage command. 
    Copying the file to a non-removable location avoids an error associated with installing DISM from removable drives.
    ``` syntax
    xcopy D:\ADKTools\ W:\ADKTools\ /s
    ```

2.  Install the ADK Tools by using either **WimMountAdkSetupAmd64.exe /Install /q** or **WimMountAdkSetupX86.exe /Install /q**.

    ``` syntax
    W:\ADKTools\amd64\WimMountAdkSetupAmd64.exe /Install /q
    ```

3.  Apply the SPPs. This example applies the Office base pack, plus two language packs: fr-fr and de-de.
    
    ```syntax
    W:\ADKTools\amd64\DISM.exe /Apply-SiloedPackage /ImagePath:W:\ /PackagePath:"e:\SPPs\fabrikam-id.spp" /PackagePath:"D:\SPPs\office16_base.spp" /PackagePath:"D:\SPPs\office16_fr-fr.spp" /PackagePath:"D:\SPPs\office16_de-de.spp"
	```

    To learn more, see [Siloed provisioning packages](siloed-provisioning-packages.md). For syntax, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md). 

**Apply the recovery image**
1. 	Apply the recovery image after applying the SPPs: `D:\ApplyRecovery.bat`

2.  Disconnect the drives, then reboot (`exit`).
	
**Verify apps**

1.  After the PC boots, either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

2.  See if your Windows desktop applications and add-ons are installed. 

3.  Use Regedit to check to see if the registry key is installed.

**Next steps**: [Lab 11: Add Start tiles and taskbar pins](add-start-tiles-sxs.md)