---
author: Justinha
Description: 'Lab 7: Change settings, enter product keys, and run scripts with an answer file (unattend.xml)'
ms.assetid: a29101dc-4922-44ee-a758-d555e6cf39fa
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 7: Change settings, enter product keys, and run scripts with an answer file (unattend.xml)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="Add_settings"></span>Lab 7: Change settings, enter product keys, and run scripts with an answer file (unattend.xml)

Answer files (or Unattend files) can be used to modify Windows settings in your images during Setup. You can also create settings that trigger scripts in your images that run after the first user creates their account and picks their default language.

To learn about Windows customizations, see the Windows 10, version 1703 OEM Policy Document (OPD).

As an example, we'll add a setting that shows you how to automatically boot to a maintenance mode called audit mode. This mode allows you to perform additional tests, and capture changes. We'll use audit mode in the next few labs.

![diagram of creating a new answer file](images/dep-win8-sxs-createanswerfile.jpg)

## <span id="overview"></span><span id="OVERVIEW"></span>Windows settings overview

While you can set many Windows settings in audit mode, some settings can only be set by using an answer file or Windows Configuration Designer, such as adding manufacturer’s support information. A full list of answer file settings (also known as Unattend settings) is in the [Unattended Windows Setup Reference](https://msdn.microsoft.com/library/windows/hardware/dn923277).

Enterprises can control other settings by using Group Policy. For more info, see [Group Policy](http://go.microsoft.com/fwlink/p/?linkid=268543).

We'll show you more ways to add settings later in [Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md#Capture_a_setting).

## <span id="Unattend_overview"></span>Answer file settings

You can specify which configuration pass to add new settings:

-   **1 windowsPE**: These settings are used by the Windows Setup installation program. If you’re modifying existing images, you can usually ignore these settings.

-   **4 specialize**: Most settings should be added here. These settings are triggered both at the beginning of audit mode and at the beginning of OOBE. If you need to make multiple updates or test settings, generalize the device again and add another batch of settings in the Specialize Configuration pass.

-   **6 auditUser**: Runs as soon as you start audit mode.

    This is a great time to run a system test script - we'll add [Microsoft-Windows-Deployment\\RunAsynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915797) as our example. To learn more, see [Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md).

-   **7 oobeSystem**: Use sparingly. Most of these settings run after the user completes OOBE. The exception is the Microsoft-Windows-Deployment\\Reseal\\[Mode](https://msdn.microsoft.com/library/windows/hardware/dn923110) = Audit setting, which we’ll use to bypass OOBE and boot the PC into audit mode.

    If your script relies on knowing which language the user selects during OOBE, you’d add it to the oobeSystem pass.

-   To learn more, see [Windows Setup Configuration Passes](windows-setup-configuration-passes.md).

**Note**  These settings could be lost if the user resets their PC with the built-in recovery tools. To see how to make sure these settings stay on the device during a reset, see [Sample scripts: Keeping Windows settings through a recovery](windows-deployment-sample-scripts-sxs.md#Keeping_Windows_settings_through_a_recovery).

## <span id="createanswer"></span><span id="CREATEANSWER"></span>Create and modify an answer file

**Step 1: Create a catalog file**

1.  Start **Windows System Image Manager**.

2.  Click **File** > **Select Windows Image**.

3.  In **Select a Windows Image**, browse to and select the image file (D:\install.wim). Next, select an edition of Windows, for example, Windows 10 Pro, and click **OK**. Click **Yes** to create the catalog file. Windows SIM creates the file based on the image file, and saves it to the same folder as the image file. This process can take several minutes.

    The catalog file appears in the **Windows Image** pane. Windows SIM lists the configurable components and packages in that image.

    **Troubleshooting:** If Windows SIM does not create the catalog file, try the following steps:

    -   To create a catalog file for either 32-bit or ARM-based devices, use a 32-bit device.

    -   Make sure the Windows base-image file **(\\Sources\\Install.wim**) is in a folder that has read-write privileges, such as a USB flash drive or on your hard drive.

**Step 2: Create an answer file**

-   Click **File** > **New Answer File**.

    The new answer file appears in the **Answer File** pane.

    **Note**   If you open an existing answer file, you might be prompted to associate the answer file with the image. Click **Yes**.

**Step 3: Add new answer file settings**

1.  Add OEM info:

    In the **Windows Image** pane, expand **Components**, right-click **amd64\_Microsoft-Windows-Shell-Setup\_(version)**, and then select **Add Setting to Pass 4 specialize**.

    In the **Answer File** pane, select **Components\\4 specialize\\amd64\_Microsoft-Windows-Shell-Setup\_neutral\\OEMInformation**.

    In the **OEMInformation Properties** pane, in the **Settings** section, select:
    
    -   Manufacturer=`Fabrikam`
    -   Model=`Notebook Model 1`
    -   Logo=`C:\Fabrikam\Fabrikam.bmp`
        
    Create a 32-bit color with a maximum size of 120x120 pixels, save it as C:\\AnswerFiles\\Fabrikam.bmp file on your local PC, or use the sample from the USB-B key: `C:\USB-B\ConfigSet\$OEM$\$$\System32\OEM\Fabrikam.bmp`. 
    
    We'll copy the logo into the Windows image in a few steps.

2.  Set the device to automatically [boot to audit mode](https://msdn.microsoft.com/library/windows/hardware/dn923110.aspx):

    In the **Windows Image** pane, expand **Components**, right-click **amd64\_Microsoft-Windows-Deployment\_(version)**, and then select **Add Setting to Pass 7 oobeSystem**.

    In the **Answer File** pane, select **Components\\7 oobeSystem\\amd64\_Microsoft-Windows-Deployment\_neutral\\Reseal**.

    In the **Reseal Properties** pane, in the **Settings** section, select Mode=`Audit`.

3.  Prepare a [script](https://msdn.microsoft.com/library/windows/hardware/dn915797.aspx) to run after Audit mode begins.

    In the **Windows Image** pane, right-click **amd64\_ Microsoft-Windows-Deployment\_(version)** and then click **Add Setting to Pass 6 auditUser**.

    In the **Answer File** pane, expand **Components\\6 auditUser\\amd64\_Microsoft-Windows-Deployment\_neutral\\RunAsynchronous**. Right-click **RunAsynchronousCommand Properties** and click **Insert New AsynchronousCommand**.

    In the **AsynchronousCommand Properties** pane, in the **Settings** section, add the following values:

    `Path = C:\Fabrikam\SampleCommand.cmd`

    `Description = Sample command to run a system diagnostic check.`

    `Order = 1`  (Determines the order that commands are run, starting with 1.)

4.  Add a registry key. In this example, we add keys for the OEM Windows Store program. Use the same process as adding a script, using `CMD /c REG ADD`. 

    For Windows 10 Customer Systems, you may use the OEM Store ID alone or in combination with a Store Content Modifier (SCM) to identify an OEM brand for the OEM Store. By adding a SCM, you can target Customer Systems at a more granular level.  For example, you may choose to target commercial devices separately from consumer devices by inserting unique SCMs for consumer and commercial brands into those devices.

    Add RunAsynchronousCommands for each registry key to add. (Right-click **RunAsynchronousCommand Properties** and click **Insert New AsynchronousCommand**).
    
    ```syntax
    Path = CMD /c REG ADD HKEY_LOCAL_MACHINE\Software\OEM /v Value /t REG_SZ ABCD
    Description = Adds a OEM registry key
    Order = 2
    RequiredUserInput = false
    ```

## <span id="Common_Windows_settings"></span> More common Windows settings: 

*  Activate Windows by [adding a product key](https://msdn.microsoft.com/library/windows/hardware/dn915735.aspx): `Microsoft-Windows-Shell-Setup\ProductKey`. Please refer to the Kit Guide Win 10 Default Manufacturing Key OEM PDF to find default product keys for OA3.0 and Non-OA3.0 keys: 

   `OPK X21-08790 Win Home 10 1607 32 64 English OPK\Print  Content\X20-09791 Kit Guide Win 10 Default Manufacturing Key OEM\X2009791GDE.pdf`.

*  Speed up first boot by [maintaining driver configurations when capturing an image](maintain-driver-configurations-when-capturing-a-windows-image.md): `Microsoft-Windows-PnpSysprep/DoNotCleanUpNonPresentDevices`, `Microsoft-Windows-PnpSysprep/PersistAllDeviceInstalls`.

*  Set the Internet Explorer default search engine: Create a [RunAsynchronous](https://msdn.microsoft.com/library/windows/hardware/dn915799) command as shown above to add a registry key:

   ```syntax
   Path = `CMD /c REG.exe add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Configuration m /v PartnerSearchCode /t REG_DWORD /d "https://search.fabrikam.com/search?p={searchTerms}" /f`   
   Description = Changes the Internet Explorer default browser to Fabrikam Search
   Order = 3
   RequiredUserInput = false
   ```

*  Set the Internet Explorer search scopes: See [Scope](https://msdn.microsoft.com/en-us/library/windows/hardware/dn923228(v=vs.85).aspx)

   Example:

   ```syntax
   <component name="Microsoft-Windows-IE-InternetExplorer" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   <SearchScopes>
     <Scope wcm:action="add">             <SuggestionsURL>http://api.bing.com/qsml.aspx?query={searchTerms}&amp;src={referrer:source?}&amp;maxwidth={ie:maxWidth}&amp;rowheight={ie:rowHeight}&amp;sectionHeight={ie:sectionHeight}&amp;FORM=IE8SSC&amp;market={Language}</SuggestionsURL>
       <FaviconURL>http://www.bing.com/favicon.ico</FaviconURL>
       <ScopeKey>Bing</ScopeKey>
       <ScopeDefault>true</ScopeDefault>
       <ScopeDisplayName>Bing</ScopeDisplayName>
       <ScopeUrl>http://www.bing.com/search?q={searchTerms}&amp;form=&PRNAM1&amp;src=PRNAM1&amp;pc=NMTE</ScopeUrl>
     </Scope>
   </SearchScopes>
   <Home_Page>http://oem17WIN10.msn.com/?pc=NMTE</Home_Page>
   ``` 

*  Save drive space by reducing or turning off the hiberfile. The hiberfile helps speed up the time after the system powers up or recovers from low-power states. Create a [RunAsynchronous](https://msdn.microsoft.com/library/windows/hardware/dn915799) command as shown below. To learn more, see [Compact OS, single-instancing, and image optimization: RAM, Pagefile.sys, and Hiberfil.sys](compact-os.md#RAM)

   ```syntax
   Path = `powercfg /h /type reduced`   
   Description = Saves drive space by reducing hiberfile by 30%.
   Order = 4
   RequiredUserInput = false
   ```

   or

   ```syntax   
   Path = `powercfg /h /off`   
   Description = Turns off the hiberfile.
   Order = 4
   RequiredUserInput = false
   ```
     

**Step 4: Save the answer file**

-   Save the answer file, for example: **C:\\AnswerFiles\\BootToAudit-x64.xml**.

    **Note**   Windows SIM will not allow you to save the answer file into the mounted image folders.
     
**Step 5: Create a script**

-   Copy the following sample script into Notepad, and save it as **C:\\AnswerFiles\\SampleCommand.cmd**.

    ``` syntax
    @rem Scan the integrity of system files 
    @rem (Required after removing the base English language from an image)
    sfc.exe /scannow

    @rem Check to see if your drivers are digitally signed, and send output to a log file.
    md C:\Fabrikam
    C:\Windows\System32\dxdiag /t C:\Fabrikam\DxDiag-TestLogFiles.txt
    ```

## <span id="Add_the_answer_file_and_script_to_the_image"></span><span id="add_the_answer_file_and_script_to_the_image"></span><span id="ADD_THE_ANSWER_FILE_AND_SCRIPT_TO_THE_IMAGE"></span>Add the answer file and script to the image

### <span id="Mount_the_image"></span>Mount the image

**Step 6: Mount the images**

Use the steps from [Lab 3: Add device drivers (.inf-style)](add-device-drivers.md) to mount the image. The short version:

1.  Open the command line as an administrator (**Start** > type **deployment** > right-click **Deployment and Imaging Tools Environment** > **Run as administrator**.)

2.  Make a backup of the file (`copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\install-backup.wim`)

3.  Mount the image (`md C:\mount\windows`, then `Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize`)

### <span id="Add_the_answer_file"></span>Add the answer file
**Step 7: Add the answer file**
2.  Copy the answer file into the image into the **\\Windows\\Panther** folder, and name it unattend.xml. Create the folder if it doesn’t exist. If there’s an existing answer file, replace it or use Windows System Image Manager to edit/combine settings if necessary.

    ``` syntax
    MkDir c:\mount\windows\Windows\Panther
    Copy C:\AnswerFiles\BootToAudit-x64.xml  C:\mount\windows\Windows\Panther\unattend.xml
    MkDir c:\mount\windows\Fabrikam
    Copy C:\AnswerFiles\Fabrikam.bmp    C:\mount\windows\Fabrikam\Fabrikam.bmp
    Copy C:\AnswerFiles\SampleCommand.cmd    C:\mount\windows\Fabrikam\SampleCommand.cmd
    ```
## <span id="Unmount_the_images"></span> Unmount the images

**Step 8: Unmount the images**

1.  Close all applications that might access files from the image.

2.  Commit the changes and unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

    where *C* is the drive letter of the drive that contains the image.

    This process may take several minutes.

## <span id="Try_it_out"></span>Try it out

**Step 9: Apply the image to a new PC**
Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the Windows image and the recovery image, and boot it up. The short version:

1.  Copy the image file to the storage drive.
2.  [Boot the reference device to Windows PE using the Windows PE USB key](install-windows-pe-sxs.md).
3.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).
4.  Apply the image: `D:\ApplyImage.bat D:\Images\install.wim`.
5.  Disconnect the drives, then reboot (`exit`).
	
**Step 10: Verify settings and scripts**

If your audit mode setting worked, the PC should boot to audit mode automatically.  When audit mode starts, your script should start automatically.

1.  In File Explorer, check to see if the file: **C:\\Fabrikam\\DxDiag-TestLogFiles.txt** exists. If so, the SampleCommand.cmd sample script ran correctly.

Leave the PC booted into audit mode to continue to the following lab:

Next steps: [Lab 8: Add branding and license agreements (OOBE.xml)](add-a-license-agreement.md)