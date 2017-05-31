---
author: KPacquer
Description: 'Lab 11: Add Start tiles and taskbar pins'
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 11: Add Start tiles and taskbar pins'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="Add_apps"></span>Lab 11: Add Start tiles and taskbar pins

Add Start tiles and taskbar pins. 

Notes:
* **Start menu** : If you don’t create a LayoutModification.xml file and you continue to use the Start Unattend settings, the OS will use the Unattend answer file and take the first 12 SquareTiles or DesktoporSquareTiles settings specified in the Unattend file. The system then places these tiles automatically within the newly-created groups at the end of Start—the first six tiles are placed in the first OEM group and the second set of six tiles are placed in the second OEM group. If OEMName is specified in the Unattend file, the value for this element is used to name the OEM groups that will be created.

* **The Start layout and taskbar pins can be lost** if the user resets their PC with the built-in recovery tools. To make sure these settings stay on the device, see [Lab 12: Update the recovery image](update-the-recovery-image.md).

* **When adding 3rd party apps, follow the [Windows Store OEM Program Guide](https://myoem.microsoft.com/oem/myoem/en/topics/Licensing/roylicres/ost2016/Pages/DP-WindowsStoreOEMProgramGuide2016FinalCL.aspx)**. You must comply with all Store Program terms and conditions, and related documents. 

## <span id="Mount_the_image"></span>Step 1: Mount the image

Use the steps from [Lab 3: Add device drivers (.inf-style)](add-device-drivers.md) to mount the image. The short version:

1.  Open the command line as an administrator (**Start** > type **deployment** > right-click **Deployment and Imaging Tools Environment** > **Run as administrator**.)

2.  Make a backup of the file (`copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\install-backup.wim`)

3.  Mount the image (`md C:\mount\windows`, then `Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize`)


## <span id="Create_the_start_layout"></span>Step 2: Create the Start layout

1.  If you don’t already have one, create a file called **LayoutModification.xml**. You can start by editing a sample from USB-B or [sample LayoutModification.xml](windows-deployment-sample-scripts-sxs.md). 

2.  To use different layouts for different regions, use the optional **Region** attribute in the **RequiredStartGroups** element. The Region value must be equal to two-letter country/region codes. Use a pipe “|” delimiter if you need to specify multiple countries/regions.

    ``` syntax
    <RequiredStartGroups
          Region="DE|ES|FR|GB|IT|US">
    ```

3.  Specify the tiles you want to add within an **AppendGroup**. OEMs can add a maximum of two **AppendGroup**. The following example shows two groups called “Fabrikam Group 1” and “Fabrikam Group 2”, which contain tiles that will be applied if the device country/region matches what’s specified in **Region** (in this case, the regions are Germany, Spain, France, United Kingdom, Italy, and United States). Each group contains three tiles and the various elements you need to use depending on the tile that you want to pin to Start.

    ``` syntax
    <RequiredStartGroups
          Region="DE|ES|FR|GB|IT|US">
          
          <!-- OEMs can add a maximum of two AppendGroup. Each AppendGroup specifies a group of
               tiles that will be appended to Start. -->
          <AppendGroup
            Name="Fabrikam Group 1">
            <!-- Add the News Universal Windows app to Start -->
            <start:Tile
              AppUserModelID="Microsoft.Office.Word_8wekyb3d8bbwe!microsoft.word"
              Size="2x2"
              Row="0"
              Column="0"/>
            <!-- Add a Windows desktop application with a known AppUserModelID  -->
            <start:DesktopApplicationTile
              DesktopApplicationID="Microsoft.Windows.Explorer"
              Size="2x2"
              Row="0"
              Column="2"/>
            <!-- Add the Excel Preview Universal Windows app -->
            <start:Tile
              AppUserModelID="Microsoft.Office.Excel_8wekyb3d8bbwe!microsoft.excel"
              Size="2x2"
              Row="0"
              Column="4"/>
          </AppendGroup>
          
          <AppendGroup
            Name="Fabrikam Group 2">
            <!-- Add a Windows 8.1 app -->
            <start:Tile
              AppUserModelID="Microsoft.Reader_8wekyb3d8bbwe!Microsoft.Reader"
              Size="2x2"
              Row="0"
              Column="0"/>
            <!-- Web link tile with associated .url file is in legacy Start Menu folder. This requires
                 a shortcut or .url file to be added in one of several legacy Start Menu directories, such as
                 "%APPDATA%\Microsoft\Windows\Start Menu\Programs\" 
                 or the all users profile "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\" -->
            <start:DesktopApplicationTile
              DesktopApplicationID="http://www.bing.com/"
              Size="2x2"
              Row="0"
              Column="2"/>
            <!-- Add a Windows desktop application link in a legacy Start Menu folder. You must add the .lnk file 
                 in the specified location when the device first boots. -->
            <start:DesktopApplicationTile
              DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Paint.lnk"
              Size="2x2"
              Row="0"
              Column="4"/>
          </AppendGroup>
        </RequiredStartGroups>
    ```

    The following example shows one group called “Fabrikam Group 1”, which will be applied if the device country/region doesn’t match any of the ones specified in the previous RequiredStartGroups.

    ``` syntax
        <!-- Non-region specific group -->
        <RequiredStartGroups>
          <AppendGroup
            Name="Fabrikam Group 1">
            <!-- Add the Word Preview Universal Windows app -->
            <start:Tile
              AppUserModelID="Microsoft.Office.Word_8wekyb3d8bbwe!microsoft.word"
              Size="2x2"
              Row="0"
              Column="0"/>
            <!-- Add the Excel Preview Universal Windows app -->
            <start:Tile
              AppUserModelID="Microsoft.Office.Excel_8wekyb3d8bbwe!microsoft.excel"
              Size="2x2"
              Row="0"
              Column="2"/>
          </AppendGroup>    
        </RequiredStartGroups>
    ```

4.  Desktop apps: use the start:DesktopApplicationTile tag.

    If you know the application user model ID for the app, use that to identify it.

    Otherwise, if you pinned tiles that require .url or .lnk files, add the files to the following legacy Start Menu directories:
    -   %APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\
    -   %ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\

    Example: 
    
    ```syntax
    Copy E:\StartLayout\Bing.url  "C:\mount\Windows\ProgramData\Microsoft\Windows\Start Menu\Programs"
    Copy E:\StartLayout\Paint.lnk "C:\mount\Windows\ProgramData\Microsoft\Windows\Start Menu\Programs"
    Copy E:\StartLayout\Bing.url  "C:\mount\Windows\Users\All Users\Microsoft\Windows\Start Menu\Programs"
    Copy E:\StartLayout\Paint.lnk "C:\mount\Windows\Users\All Users\Microsoft\Windows\Start Menu\Programs"
    ```


5.  Optionally, you can add up to 3 apps to the frequently used section of the system area. The following example shows how to add the calculator app to the frequently used system area.

    ``` syntax
      <!-- Add the calculator app to the frequently used system area -->
      <TopMFUApps>
        <Tile AppUserModelID="Microsoft.WindowsCalculator_8wekyb3d8bbwe!App" />
      </TopMFUApps>
    ```

6.  Save the LayoutModification.xml file.

## <span id="AppendOfficeSuite"></span>Step 3: Microsoft Office: Add choice to AppendOfficeSuite

You must pin the Office tiles to the Start menu. Not doing so Windows will remove the Office files during OOBE boot phase.
Note: You must be using at least version 10.0.10586.0 of Windows 10. The following steps don’t work with earlier versions of Windows 10.

Note: The Choice attribute is new. This allows different versions of Office to be pinned to the Start menu at the same time. For now, Desktop2016 is the only valid value. Other values will be available in the future.

In **layoutmodification.xml**:

1.	Add <AppendOfficeSuiteChoice Choice="Desktop2016" /> to the tile:

    ```syntax
    <LayoutModificationTemplate	xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification" xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
    <AppendOfficeSuite/>
    <AppendOfficeSuiteChoice Choice="Desktop2016" /> 
</LayoutModificationTemplate>
    ```

2.  Save the LayoutModification.xml file.

## <span id="Add_layout_to_image"></span>Step 4: Add the layout to the image

1.  Add your LayoutModification.xml file to the Windows image. You’ll need to put the file in the following specific location before first boot. If the file already exists in the image, replace it with your new file.

    ``` syntax
    C:\Mount\Windows\Users\Default\AppData\Local\Microsoft\Windows\Shell\
    ```

2.  To add a taskbar layout in Windows 10, version 1607, you can either add a similar [taskbar layout modification file (see additional steps here)](https://msdn.microsoft.com/library/windows/hardware/mt736838.aspx), or use [traditional unattend settings](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md). 

## <span id="Add_or_change_languages_and_Cortana_features_on_demand__Optional_"></span><span id="add_or_change_languages_and_cortana_features_on_demand__optional_"></span><span id="ADD_OR_CHANGE_LANGUAGES_AND_CORTANA_FEATURES_ON_DEMAND__OPTIONAL_"></span>Add or change languages and Cortana features on demand (Optional)


## <span id="Unmount_the_images"></span>Step 5: Unmount the images

1.  Close all applications that might access files from the image.

2.  Commit the changes and unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

    where *C* is the drive letter of the drive that contains the image.

    This process may take several minutes.

## <span id="Try_it_out"></span>Step 6: Try it out

**Apply the image to a new PC**

Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the Windows image and the recovery image, and boot it up. The short version:

1.  Copy the image file to the storage drive.
2.  [Boot the reference device to Windows PE using the Windows PE USB key](install-windows-pe-sxs.md).
3.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).
4.  Apply the image: `D:\ApplyImage.bat D:\Images\install.wim`.
5.  Disconnect the drives, then reboot (`exit`).
	
**Verify apps**

1.  After the PC boots, either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

2.  Check the Start Menu to make sure the apps are available.

3.  Check the Start Menu and taskbar and make sure the apps you selected are pinned correctly.
	
Next steps: [Lab 12: Update the recovery image](update-the-recovery-image.md)