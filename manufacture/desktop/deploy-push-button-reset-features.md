---
author: Justinha
Description: 'Push-button reset features are included with Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), though you''ll need to perform additional steps to deploy PCs with the following customizations.'
ms.assetid: f23d7e3f-0254-4fe8-9d61-5a58856c74be
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Deploy push-button reset features'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deploy push-button reset features


Push-button reset features are included with Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), though you'll need to perform additional steps to deploy PCs with the following customizations.

-   Windows desktop applications
-   Windows settings, such as customized OOBE screens or Start Menus.
-   Customized partition layouts.

These steps also show you how to add your own scripts during a reset to capture logs or perform other cleanup tasks.

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


To complete these procedures, you'll need a technician PC which has Windows 10 and the following Windows Assessment and Deployment Kit (ADK) for Windows 10 components installed:

-   Deployment Tools
-   Windows Preinstallation Environment (Windows PE)
-   Imaging and Configuration Designer (ICD)
-   User State Migration Tool (USMT)

You'll also need:

-   A destination PC with drive size of 100 GB or larger
-   A Windows 10 for desktop editions image (install.wim)
-   A Windows RE boot image (Winre.wim) (You'll extract this from a Windows 10 image).

For an overview of the entire deployment process, see the [Desktop manufacturing guide](http://go.microsoft.com/fwlink/p/?LinkId=526101).

Use the follow steps to prepare the ScanState tool to capture Windows desktop applications after they have been installed:

**Step 1: Prepare the ScanState tool**

1.  On the technician PC, copy the Windows ADK files from Windows User State Migration Tool (USMT) and Windows Setup to a working folder. You'll need to match the architecture of the destination device. You don't need to copy the subfolders.

    ``` syntax
    md C:\ScanState_amd64
    xcopy /E "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\User State Migration Tool\amd64" C:\ScanState_amd64
    xcopy /E /Y "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Setup\amd64\Sources" C:\ScanState_amd64
    ```

2.  Copy the contents of the working folder to a network location or USB flash drive.

Use the following steps to customize your Windows RE boot image if additional drivers and language packs are needed.

**Step 2: Extract and customize the Windows RE boot image (optional)**

1.  On the technician PC, click **Start**, and type deployment. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.
2.  In **Deployment and Imaging Tools Environment**, create the folder structure to store the Windows image and its mount point.

    ``` syntax
    Mkdir C:\OS_image\mount
    ```

3.  Create the folder structure to store the Windows RE boot image and its mount point.

    ``` syntax
    Mkdir C:\winre_amd64\mount
    ```

4.  Mount the Windows image (install.wim) to the folder \\OS\_image\\mount by using DISM.

    ``` syntax
    Dism /mount-image /imagefile:C:\OS_image\install.wim /index:1 /mountdir:C:\OS_image\mount
    ```

    where `Index:1` is the index of the selected image in the Install.wim file.

5.  Copy the Windows RE image from the mounted Windows image to the new folder.

    ``` syntax
    xcopy /H C:\OS_image\mount\windows\system32\recovery\winre.wim C:\winre_amd64 
    ```

6.  Unmount the Windows image. Tip: If you haven't made any other changes in the Windows image, you can unmount the image faster by using the `/discard` option.

    ``` syntax
    Dism /unmount-image /mountdir:C:\OS_image\mount /discard
    ```

7.  Mount the Windows RE boot image for editing.

    ``` syntax
    Dism /mount-image /imagefile:C:\winre_amd64\winre.wim /index:1 /mountdir:C:\winre_amd64\mount
    ```

    where `Index:1` is the number of the selected image in the Winre.wim file.

    Once the Winre.wim file is extracted from the Install.wim file, you can customize the Windows RE boot image.

8.  Add language packs, boot-critical device drivers, and input device drivers to the Windows RE boot image. To learn more, see [Customize Windows RE](customize-windows-re.md).
9.  Commit your customizations and unmount the image.

    ``` syntax
    Dism /unmount-image /mountdir:C:\winre_amd64\mount /commit 
    ```

If you are planning to customize only the settings common to all editions of Windows 10 (including Windows 10 Mobile), use the following steps to create a provisioning package which specifies settings to be restored during recovery:

**Step 3: Create a provisioning package with settings to be restored (optional)**

1.  On the technician PC, start Windows Imaging and Configuration Designer (ICD).
2.  Click **File** &gt; **New Project**.
3.  Enter a project name and description, and then click **Next**
4.  In the **Select project workflow** step, select the **Provisioning Package** option, and then click **Next**.
5.  In the **Choose which settings to view and configure** step, select the **Common to all Windows editions** option, and then click **Next**.
6.  In the **Import a provisioning package (optional)** step, click **Finish** to create the new project.
7.  Use the **Available customizations** pane to add settings and specify the defaults which should be restored during recovery. The settings will appear in the **Selected customizations** pane.
8.  Click **Export** &gt; **Provisioning package**.
9.  In the **Describe the provisioning package** step, click **Next**.
10. In the **Select the security details for the provisioning package** step, click **Next**.
11. In the **Select where to save the provisioning package** step, enter a location to save the package (such as a network share) and then click **Next**.
12. Click **Build** to create the provisioning package.
13. After the provisioning package is created, click **Finish**.

If your customizations include settings specific to editions of Windows 10 for desktop editions, use the following steps to create an unattend.xml which specifies the settings to be restored during recovery:

**Step 4: Create an unattend file to restore settings (optional)**

1.  On the technician PC, start **Windows System Image Manager**.
2.  Click **File** &gt; **Select Windows image**.
3.  When prompted to create a catalog file, click **Yes**.
4.  Use the **Windows Image** and **Answer File** panes to add settings to the Specialize or oobeSystem phase (or both), and specify the defaults which should be restored during recovery.
5.  Click **Tool** &gt; **Validate Answer File** to check for errors. Correct any problem identified.
6.  Click **File** &gt; **Save Answer File**. Enter a location to save the answer file (such as a network share) and then click **Save**.

If you plan to use Push-button reset’s extensibility points, use the following steps to prepare your extensibility scripts and register them using a Push-button reset configuration file.

**Important**  If you have created an unattend file, you must also create a script to reapply it using the BasicReset\_AfterImageApply and FactoryReset\_AfterImageApply extensibility points.

 

**Step 5: Prepare push-button reset extensibility scripts (optional)**

1.  Create scripts (.cmd) or executables (.exe) to run at the available extensibility points when the Refresh your PC feature runs:

    A: At BasicReset\_BeforeImageApply

    B: At BasicReset\_AfterImageApply

2.  Create scripts (.cmd) or executables (.exe) to run at the available extensibility points when the Reset your PC feature runs:

    C: At FactoryReset\_AfterDiskFormat

    D: At FactoryReset\_AfterImageApply

3.  Save the scripts to a network location, or USB flash drive.
4.  Create a ResetConfig.xml file that specifies the location of the scripts that you created for the four extensibility points. For example:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <Reset>
        <Run Phase="BasicReset_BeforeImageApply">
            <Path>Fabrikam\SampleScript_A.cmd</Path>
            <Duration>2</Duration>
        </Run>
        <Run Phase="BasicReset_AfterImageApply">
            <Path>Fabrikam\SampleScript_B.cmd</Path>
            <Param></Param>
            <Duration>2</Duration>
        </Run>
        <Run Phase="FactoryReset_AfterDiskFormat">
            <Path>Fabrikam\SampleScript_C.cmd</Path>
            <Duration>2</Duration>
        </Run>
        <Run Phase="FactoryReset_AfterImageApply">
            <Path>Fabrikam\SampleScript_D.cmd</Path>
            <Param></Param>
            <Duration>2</Duration>
        </Run>
    </Reset>
    ```

    **Important**  If you use a text editor to author the ResetConfig.xml file, save the document with an .xml file name extension and use **UTF-8 encoding**. Do not use Unicode or ANSI.

     

5.  Save the ResetConfig.xml file together with the extensibility scripts that you created.

**Step 6: Create bare-metal recovery configuration (optional)**

-   To specify the partition layout to be used when users perform bare metal recovery using recovery media created from their PCs, modify resetconfig.xml to include the following elements:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <Reset>
                <SystemDisk>
            <MinSize>160000</MinSize>
            <DiskpartScriptPath>ReCreatePartitions.txt</DiskpartScriptPath>
            <OSPartition>3</OSPartition>
            <WindowsREPartition>4</WindowsREPartition>
            <WindowsREPath>Recovery\WindowsRE</WindowsREPath>
            <Compact>False</Compact>
    </SystemDisk>
    </Reset>
    ```

    -   **MinSize** - Specifies the minimum size of the system disk in megabytes (MB). Recovery process will not proceed if the system disk does not meet this minimum size.
    -   **DiskpartScriptPath** - Path to Diskpart script relative to install.wim location. The script should assume that all existing partitions have been deleted, and the system disk has focus in Diskpart.
    -   **OSPartition** - The partition to which the recovery image should be applied must be specified. The ESP or active partition must be on the same disk as the OS.
    -   **WindowsREPartition**; **WindowsREPath –** (Optional) The location in which WinRE should be staged. The WinRE boot image on the media will be copied and registered with the OS. (Same as running “reagentc.exe /setreimage”)

    If partitioning information is not specified in resetconfig.xml, users can still perform bare metal recovery using media they have created. However, the default/recommended partition layout for Windows 10 will be used instead.

**Step 7: Create a diskpart script for initial deployment**

1.  Create a disk partitioning script for initial deployment.

    **UEFI example**:

    ``` syntax
    rem These commands are used with DiskPart tool.
    rem Erase the drive and create four partitions
    rem for a UEFI/GPT-based PC.
    select disk 0
    clean
    convert gpt
    rem == 1. System Partition =======================
    create partition efi size=100
    rem ***NOTE: For 4KB-per-sector drives, change 
    rem this value to size=260.***
    format quick fs=fat32 label="System"
    assign letter="S"
    rem == 2. Microsoft Reserved (MSR) Partition =====
    create partition msr size=16
    rem == 3. Windows Partition ======================
    rem ==    a. Create Windows Partition ============
    create partition primary
    rem ==    b. Create space for Windows RE tools partition
    shrink minimum=450
    rem ==    c. Prepare the Windows partition
    format quick fs=ntfs label="Windows"
    assign letter="W"
    rem == 4. Windows RE Tools Partition =============
    create partition primary
    format quick fs=ntfs label="Windows RE tools"
    set id=de94bba4-06d1-4d40-a16a-bfd50179d6ac
    assign letter="T"
    exit
    ```

    **BIOS example**:

    ``` syntax
    rem These commands are used with DiskPart to 
    rem erase the drive and create three partitions 
    rem for a BIOS/MBR-based PC. 
    rem Adjust the partition sizes to fill the drive.
    select disk 0
    clean
    rem === 1. System Partition =====================
    create partition primary size=100
    format quick fs=ntfs label="System"
    assign letter="S" 
    active 
    rem === 2. Windows Partition ====================
    rem ==    a. Create Windows partition ===========
    create partition primary 
    rem ==    b. Create space for Windows RE tools partition ====
    shrink minimum=450
    rem ==    c. Prepare the Windows partition ======
    format quick fs=ntfs label="Windows" 
    assign letter="W" 
    rem === 3. Windows RE Tools Partition =============
    create partition primary
    format quick fs=ntfs label="Windows RE tools"
    set id=27
    assign letter="R" 
    exit
    ```

2.  Name the script CreatePartitions-UEFI or CreatePartitions-BIOS.txt, and save it to a network location, or USB flash drive. Note: In these Diskpart examples, the partitions are assigned the letters S:\\, W:\\, and T:\\ to simplify partition identification. After the PC reboots, Windows PE automatically assigns the letter C:\\ to the Windows partition. The other partitions do not receive drive letters.

**Step 8: Create a diskpart script for bare-metal recovery (optional)**

1.  Create a diskpart script for bare-metal recovery.

    **Important** The diskpart script used for bare metal recovery should not include a `select disk` or `clean` command. The system disk will be selected automatically before the diskpart script is processed.

    **UEFI example**:

    ``` syntax
    rem These commands are used with DiskPart tool.
    rem Erase the drive and create five partitions
    rem for a UEFI/GPT-based PC.
    convert gpt
    rem == 1. System Partition =======================
    create partition efi size=100
    rem ***NOTE: For 4KB-per-sector drives, change 
    rem this value to size=260.***
    format quick fs=fat32 label="System"
    assign letter="S"
    rem == 2. Microsoft Reserved (MSR) Partition =====
    create partition msr size=16
    rem == 3. Windows Partition ======================
    rem ==    a. Create Windows Partition ============
    create partition primary
    rem ==    b. Create space for Windows RE tools partition
    shrink minimum=450
    rem ==    c. Prepare the Windows partition
    format quick fs=ntfs label="Windows"
    assign letter="W"
    rem == 4. Windows RE Tools Partition =============
    create partition primary
    format quick fs=ntfs label="Windows RE tools"
    set id=de94bba4-06d1-4d40-a16a-bfd50179d6ac
    assign letter="T"
    exit
    ```
    
    **BIOS example**:

    ``` syntax
    rem These commands are used with DiskPart to 
    rem erase the drive and create three partitions 
    rem for a BIOS/MBR-based PC. 
    rem Adjust the partition sizes to fill the drive.
    rem === 1. System Partition =====================
    create partition primary size=100
    format quick fs=ntfs label="System"
    assign letter="S" 
    active 
    rem === 2. Windows Partition ====================
    rem ==    a. Create Windows partition ===========
    create partition primary 
    rem ==    b. Create space for Windows RE tools partition ====
    shrink minimum=450
    rem ==    c. Prepare the Windows partition ======
    format quick fs=ntfs label="Windows" 
    assign letter="W" 
    rem === 3. Windows RE Tools Partition =============
    create partition primary
    format quick fs=ntfs label="Windows RE tools"
    set id=27
    assign letter="R" 
    exit
    ```

2.  Name the script RecreatePartitions-UEFI.txt or RecreatePartitions-BIOS.txt, and save it to the same network location, or USB flash drive as create partitions.

**Step 9: Deploy and customize Windows**

1.  On the destination PC, boot to Windows PE.
2.  At the Windows PE command prompt, run the script to create the recommended hard drive partitions.

    ``` syntax
    Diskpart /s N:\CreatePartitions.txt
    ```

    where N:\\CreatePartition is the location of the file.

3.  Apply the Windows reference image to the Windows partition.

    ``` syntax
    Dism /Apply-Image /ImageFile:N:\Install.wim /Index:1 /ApplyDir:W:\
    ```

    Optional: You can also specify the /compact option so that the files written to disk are compressed. For example:

    ``` syntax
    Dism /Apply-Image /ImageFile:N:\Install.wim /Index:1 /ApplyDir:W:\ /Compact:on
    ```

    This is useful if you are deploying Windows onto PCs with limited storage capacity, but is not recommended on PCs with rotational storage devices.

4.  Configure the system partition by using BCDboot.

    ``` syntax
    W:\Windows\System32\Bcdboot W:\Windows
    ```

5.  Create a folder in the Windows RE tools partition, and copy your custom Windows RE boot image to it.

    ``` syntax
    Mkdir T:\Recovery\WindowsRE
    xcopy /H N:\Winre.wim T:\Recovery\WindowsRE
    ```

    where T:\\ is the Windows RE tools partition.

    **Important**  You must store Winre.wim in \\Recovery\\WindowsRE.

     

6.  Register the Windows RE boot image together with the Windows image.

    ``` syntax
    W:\Windows\System32\Reagentc /setreimage /path T:\Recovery\WindowsRE /target W:\Windows
    ```

7.  Use Diskpart to conceal the Windows RE tools (T:\\) partition from Windows Explorer.

    **For UEFI-based PCs:**

    ``` syntax
    select disk 0
    select partition 4
    remove
    set id=de94bba4-06d1-4d40-a16a-bfd50179d6ac
    gpt attributes=0x8000000000000001
    exit
    ```

    **For BIOS-based PCs:**

    ``` syntax
    select disk 0
    select partition 3
    remove
    set id=27
    exit
    ```

8.  Customize the Windows image on the destination PC:
    1.  Perform offline customizations to the Windows image, such as installing INF-based driver packages specific to the destination PC, installing OS updates and language packs, or provisioning additional Windows apps.
    2.  Boot the destination PC to audit mode. This can be accomplished by using an answer file with the Microsoft-Windows-Deployment | Reseal | Mode = audit setting, or by first booting the PC to OOBE, and then pressing CTRL+SHIFT+F3.
    3.  Perform any remaining customizations such as installing applications and device software packages that are specific to the destination PC.

9.  If you have installed OS updates, clean up the superseded components and mark the updates as permanent so that they will be restored during recovery:

    ``` syntax
    DISM.exe /Cleanup-Image /StartComponentCleanup /ResetBase
    ```

**Step 10: Capture and deploy customizations for recovery**

1.  Use the ScanState tool to capture the installed customizations into a provisioning package. Use the /config option to specify one of the default configuration files included with the ADK, and save the .ppkg file in the folder C:\\Recovery\\Customizations.

    ``` syntax
    N:\ScanState_amd64\scanstate.exe /apps /config:<path_to_config_file> /ppkg C:\Recovery\Customizations\apps.ppkg /o /c /v:13 /l:C:\ScanState.log
    ```

    where N:\\ is the location of the ScanState tool installed in Step 1.

2.  If you have used Windows ICD to create additional provisioning packages with customizations which should be restored during recovery, copy the packages to the destination PC. For example:

    ``` syntax
    xcopy N:\RecoveryPPKG\*.ppkg C:\Recovery\Customizations
    ```

    where N:\\ is the location where the additional provisioning packages are located.

3.  Copy any Push-button reset configuration file (resetconfig.xml) and extensibility scripts to the destination PC, and then configure permissions to write/modify them. For example:

    ``` syntax
    mkdir C:\Recovery\OEM
    xcopy /E N:\RecoveryScripts\* C:\Recovery\OEM
    ```

    where N:\\ is the location where the configuration file and scripts are located.

4.  Restrict the Write/Modify permissions of the customizations, and hide the root folder. For example:

    ``` syntax
    icacls C:\Recovery\Customizations /inheritance:r /T
    icacls C:\Recovery\Customizations /grant:r SYSTEM:(F) /T
    icacls C:\Recovery\Customizations / grant:r *S-1-5-32-544:(F) /T
    icacls C:\Recovery\OEM /inheritance:r /T
    icacls C:\Recovery\OEM /grant:r SYSTEM:(F) /T
    icacls C:\Recovery\OEM / grant:r *S-1-5-32-544:(F) /T
    attrib +H C:\Recovery
    ```

5.  Use the Sysprep tool to reseal the Windows image without using the /generalize option.

    ``` syntax
    Sysprep /oobe /exit
    ```

    **Note**  Important: You must configure the image that you are shipping to the customer to boot to OOBE.

     

6.  (Optional) To save space, you can also convert your installed Windows desktop applications into file pointers referencing the customizations package. To do so, boot the destination PC to Windows PE and run the following:

    ``` syntax
    DISM /Apply-CustomDataImage /CustomDataImage:C:\Recovery\Customizations\USMT.ppkg /ImagePath:C:\ /SingleInstance
    ```

7.  Shut down the destination PC for packaging and shipment. When the user starts the PC for the first time, it will boot to OOBE.

**Step 11: Verify your customizations**

1.  Verify that your customizations are restored after recovery, and that they continue to function by running the Refresh your PC and Reset your PC features from the following entry points:

    **Settings :** From the Start Menu, click **Settings &gt; Update & security &gt; Recovery**. Click the **Get Started** button under **Reset this PC** and follow the on-screen instructions.

    **Windows RE**: From the Choose an option screen in Windows RE, click **Troubleshoot &gt; Reset this PC** and then follow the on-screen instructions

2.  **Verify that recovery media can be created, and verify its functionality by running the bare metal recovery feature:**

    1.  Launch Create a recovery drive from Control Panel.
    2.  Follow the on-screen instructions to create the USB recovery drive.
    3.  Boot the PC from the USB recovery drive
    4.  From the Choose an option screen, click **Troubleshoot**
    5.  Click **Recover from a drive** and then follow the on-screen instructions

    **Note**  The Push-button reset UI has been redesigned in Windows 10. The **Keep my files** option in the UI now corresponds to the **Refresh your PC** feature, whereas the **Remove everything** option corresponds to the **Reset your PC** feature.

     

## <span id="related_topics"></span>Related topics


[ScanState Syntax](http://go.microsoft.com/fwlink/p/?linkid=615076)

[Bare metal reset/recovery: Create recovery media while deploying new devices](create-media-to-run-push-button-reset-features-s14.md)

[Deploy push-button reset features using ScanState](http://go.microsoft.com/fwlink/?LinkId=615126)

 

 






