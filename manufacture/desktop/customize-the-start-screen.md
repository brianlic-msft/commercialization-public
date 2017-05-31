---
author: Justinha
Description: Customize the Start Screen
ms.assetid: b28584ec-487e-4b59-a7f6-deb797d464a8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Customize the Start Screen
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customize the Start Screen


You can add your business apps to a Windows image and customize the **Start** screen to include them. You can customize the **Start** screen for Windows 10 Enterprise, Windows Server 2016, or a domain-joined PC running Windows 10 Pro.

Line-of-business (LOB) Windows Store apps do not have to be certified or installed through the Windows Store. Adding apps that do not come from the Windows Store is called *sideloading*. Sideloaded apps must be signed with a certificate that is chained to a trusted root certificate. For more information about sideloading Windows Store apps, including requirements, see [Sideload Apps with DISM](sideload-apps-with-dism-s14.md).

To install Windows Store apps that are not part of your business line, you must use the Windows Store.

## <span id="BKMK_CopyProfile"></span><span id="bkmk_copyprofile"></span><span id="BKMK_COPYPROFILE"></span>Use CopyProfile to preserve Start screen layout


The CopyProfile method allows you to remove tiles from the **Start** screen, add tiles, resize tiles, and label tile groups. CopyProfile also lets you customize **Start** screen color, **Start** screen accent, and desktop background.

You can add provisioned app packages (.appx) and customize the **Start** screen for your Windows image before you deploy the image. Windows apps that are added to the Windows image are called *provisioned* apps. Provisioned apps are staged in the image and are scheduled to be installed for every user of the Windows image at first logon.

**Note**  
If you use both the CopyProfile and StartTiles settings in your unattended answer file, CopyProfile will override the StartTiles settings. To use the StartTiles settings on an image generated with CopyProfile, delete the appsFolderLayout.bin file from the image. For more information about this file, see [Copy the AppsFolderLayout.Bin file to set default Start screen layout](#bkmk_appfolder).

 

**To add apps that you can pin to the Start screen**

-   Add or remove apps from the image.

    You can mount the Windows image offline and add provisioned app packages for your business line. Provisioned apps will install for every user of the Windows image at first logon. You can also remove provisioned app packages from the Windows image, including inbox apps. Use the Get-AppxProvisionedPackage cmdlet for PowerShell or the Deployment Image Servicing and Management tool (DISM.exe) to get a list of Windows Store apps that are provisioned in the image and choose the apps you want to remove.

    For more information about provisioning apps, see [Sideload Apps with DISM](sideload-apps-with-dism-s14.md).

    **Note**  
    Do not use the Windows Store before you deploy the image. If you download apps or download app updates for any provisioned apps in the image, Sysprep will fail. For more information, see [Removing or Updating Windows 8 built-in Windows Store apps causes Sysprep to fail](http://go.microsoft.com/fwlink/?LinkId=271005).

     

    For more information about mounting a Windows image, see [Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md). For more information about DISM cmdlets for PowerShell, see [Deployment Image Servicing and Management (DISM) Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=239926).

**To enable the Administrator account**

1.  Deploy the image to a test computer.

    Apply the image to a test computer. For example, at an elevated command prompt, type:

    ``` syntax
    Dism /apply-image /imagefile:F:\install.wim /index:1 /ApplyDir:C:\
    ```

    For more information about applying an image, see [Apply Images Using DISM](apply-images-using-dism.md).

2.  Create a test account.

    Complete the out-of-box experience (OOBE) screens to set up a new user profile.

3.  Enable sideloading.

    Once you have created a new user profile, you can log in to the image and enable the group policy settings for sideloading if you have not already done so. For more information, see [Sideload Apps with DISM](sideload-apps-with-dism-s14.md).

4.  Enable the Administrator account.

    You can enable the Administrator account in the Windows image. For example:

    1.  From the **Start** screen, type Computer. Right-click **Computer** in the Search results and click **Manage** from the app bar at the bottom of the screen.
    2.  In the **Computer Management** window, click **System Tools** &gt; **Local Users and Groups** &gt; **Users** &gt; **Administrator**.
    3.  In the **Administrator Properties** window, deselect **Account is disabled**.

5.  Set the FilterAdministratorToken registry key.

    You must set the FilterAdministratorToken registry key in order to allow the Administrator account to run Windows Store apps. For example, at a command prompt, type:

    ``` syntax
    cmd /c reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v FilterAdministratorToken /t REG_DWORD /d 1 /f
    ```

6.  Log in as Administrator.

    Log out of the test account, and log in as the Administrator.

Now you can configure the **Start** screen in your Administrator account that you want to copy for every new user profile.

### <span id="StartScreen"></span><span id="startscreen"></span><span id="STARTSCREEN"></span>To design the **Start** screen

You can customize the Start screen for your business in many ways. You can add tiles for your LOB apps, remove tiles, move tile groups, and label tile groups.

1.  Pin apps to the **Start** screen. From the **Start** screen, type the name of the app. When the app appears in the search results view, right-click the app and then click **Pin to start**.
2.  Drag tiles on the **Start** screen to reorder or group them.
3.  Click the magnifying glass icon in the lower-right corner of the **Start** menu to view the **Start** screen in semantic zoom.
4.  Right-click a group of apps and select **Name group**.
5.  Specify a name for each group of apps on the **Start** screen.

### <span id="To_set_CopyProfile_in_an_unattended_answer_file"></span><span id="to_set_copyprofile_in_an_unattended_answer_file"></span><span id="TO_SET_COPYPROFILE_IN_AN_UNATTENDED_ANSWER_FILE"></span>To set CopyProfile in an unattended answer file

You can use an unattended answer file to preserve the layout of the **Start** screen that you designed. In the answer file, add the CopyProfile setting to the specialize pass.

1.  Create or open an answer file in Windows System Image Manager (Windows SIM). For more information, see [Windows System Image Manager Technical Reference](https://msdn.microsoft.com/library/windows/hardware/dn922445).
2.  In the **Windows Image** pane, right-click **amd64\_Microsoft-Windows-Shell-Setup** or **x86\_Microsoft-Windows-Shell-Setup**, and then select **Add Setting to Pass 4 specialize**.
3.  In the **Answer File** pane of Windows SIM, select **Components\\4 specialize\\Microsoft-Windows-Shell-Setup\_neutral**.
4.  In the **Properties of Microsoft-Windows-Shell-Setup** pane, in the **Settings** section, set **CopyProfile** to **true**.

Example of the XML to set CopyProfile in an answer file:

``` syntax
<settings pass="specialize">
   <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
     <CopyProfile>true</CopyProfile>
   </component>
</settings>
```

This example is for a computer with an x86 architecture.

### <span id="To_generalize_and_deploy_the_image"></span><span id="to_generalize_and_deploy_the_image"></span><span id="TO_GENERALIZE_AND_DEPLOY_THE_IMAGE"></span>To generalize and deploy the image

You can clean up the image before you deploy it. You must also generalize the image before you can deploy it to additional computers. If you do not generalize the image, the image may become unusable.

**Note**   Verify that all app packages in the image are provisioned. Remove any non-provisioned app packages before running sysprep. For example, in PowerShell, you can remove all non-provisioned app packages: `Get-appxpackage | Remove-appxpackage`

 

When you generalize an image by using the Sysprep tool, hardware-specific settings are removed from the image. Specify the unattended answer file with the CopyProfile setting to preserve the customized **Start** screen layout that you created.

**To clean up the image**

1.  Delete the test account.

    You can delete the user profile you used to enable the Administrator account if you do not want to include it in the Windows image you deploy in your enterprise. For more information, see [How to Disable and Delete User Profiles](http://go.microsoft.com/fwlink/?LinkId=272330).

2.  Reset the registry key.

    You should reset the FilterAdministratorToken registry key before you deploy the image. For example, at a command prompt, type:

    ``` syntax
    cmd /c reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v FilterAdministratorToken /t REG_DWORD /d 0 /f
    ```

**To generalize the image**

-   At an elevated command prompt, run Sysprep and specify the location of the unattended answer file. For example, type:

    ``` syntax
    %windir%\system32\Sysprep\Sysprep.exe /oobe /generalize /shutdown /unattend:f:\unattend.xml
    ```

You can capture the generalized image using the DISM tool and deploy it to multiple computers. For more information, see the [DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md). When you apply the image, you must use the customized Unattend.xml file with CopyProfile set to true in order to preserve the changes to the **Start** screen.

## <span id="BKMK_AppFolder"></span><span id="bkmk_appfolder"></span><span id="BKMK_APPFOLDER"></span>Copy the AppsFolderLayout.Bin file to set default Start screen layout


You can customize the **Start** screen for Windows 10 Enterprise, Windows Server 2016, or a domain-joined PC running Windows 10 Pro by copying a customized AppsFolderLayout.bin file to the default user profile in the Windows image. In this method, you deploy your image to a test computer, create a user profile, visually design the **Start** screen, and copy that design back into your master image. You can remove app tiles from the **Start** screen, add tiles for Windows apps, resize tiles, and label tile groups.

1.  On a reference PC running Windows 10 Enterprise, Windows Server 2016, or a domain-joined PC running Windows 10 Pro, customize the **Start** screen.

2.  Run the Sysprep tool to initialize system cleanup. For example, from a command prompt type:

    ``` syntax
    %windir%\System32\Sysprep\sysprep.exe
    ```

    Select **Enter System Audit Mode** and **Reboot** and click **OK**.

3.  Copy the AppsFolderLayout.bin file from the user profile with the customized **Start** screen. For example, to copy the **Start** screen customizations for “TestProfile” to a USB flash drive, at a command prompt, type:

    ``` syntax
    xcopy C:\Users\TestProfile\AppData\Local\Microsoft\Windows\AppsFolderLayout.bin F:\ /h
    ```

4.  In the mounted or online Windows image that you want to add the **Start** screen customizations to, copy the AppsFolderLayout.bin file to the default user profile. For example, at a command prompt, type:

    ``` syntax
    xcopy F:\AppsFolderLayout.bin C:\Users\Default\AppData\Local\Microsoft\Windows
    ```

    For more information about mounting an offline Windows image for servicing, see [Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md).

The **Start** screen customizations will be applied to every new user profile that is created.

The AppsFolderLayout.bin file will be overwritten if you generalize the image. You must add the file after you have generalized the image.

## <span id="BKMK_StartTiles"></span><span id="bkmk_starttiles"></span><span id="BKMK_STARTTILES"></span>Use StartTiles settings to lay out the Start screen


You can use settings in an unattended answer file to specify how the app tiles display on the **Start** screen. You can’t remove tiles from the **Start** screen or label groups using unattend settings, but you can specify how tiles for 24 installed apps are displayed using the StartTiles settings. Each of the settings maps to a fixed position in the **Start** screen templates, and these positions vary according to the destination PC's screen size, resolution, and DPI. Each setting specifies whether the tile is a wide tile or a square tile for an app, or if it's a square tile for a desktop app.

**Note**   If you use both the CopyProfile and StartTiles settings in your unattended answer file, CopyProfile will override the StartTiles settings.

 

1.  Get the AppID of your LOB apps.

    To use the unattend settings, you need the specific AppID string that is associated with an installed app. You can create this string by using the get-AppxPackage cmdlet in Windows PowerShell. The following example shows how to get the AppID string to use in the unattend settings for every app that is already installed on the computer:

    ``` syntax
    $installedapps = get-AppxPackage
    foreach ($app in $installedapps)
    {
        foreach ($id in (Get-AppxPackageManifest $app).package.applications.application.id)
        {
            $app.packagefamilyname + "!" + $id
        }
    }
    ```

2.  Open an answer file.

    Create or open an answer file in Windows System Image Manager (Windows SIM). For more information, see [Windows System Image Manager Technical Reference](https://msdn.microsoft.com/library/windows/hardware/dn922445).

3.  Add StartTiles settings to your answer file.

    Use the Microsoft-Windows-Shell-Setup | StartTiles | &lt;tileSetting&gt; setting to specify the AppID of the app whose tile should appear in a particular position on the **Start** screen by default. The tile settings follow three naming patterns:

    -   WideTile and a number from 01 to 06.

        Each app that you specify for these settings must provide assets, in the app manifest, that provide a wide tile. Each app setting requires that you input the AppID.

    -   SquareTile and a number from 01 to 12.

        Each app setting requires that you input the AppID.

    -   DesktopOrSquareTile and a number from 01 to 06.

        For apps in any or all of the DesktopOrSquare settings, you need to specify the appID for the corresponding app, or the path to the desktop app.

    **Note**  If you put an app that supports wide tiles in a square tile spot, the tile is forced to be square instead of wide.

     

    If you skip a setting, Windows rearranges the flow of app tiles around the app tile position of that setting on the **Start** screen.

4.  Deploy your Windows image using the modified answer file.

    For more information, see [Deploy a Custom Image](deploy-a-custom-image.md).

For more information about these settings, see the StartTiles settings topics in the Microsoft-Windows-Shell-Setup component in the [Windows Unattended Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281) on TechNet.

## <span id="related_topics"></span>Related topics


[Sideload Apps with DISM](sideload-apps-with-dism-s14.md)

[Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md)

[Customize the Default User Profile by Using CopyProfile](customize-the-default-user-profile-by-using-copyprofile.md)

[Deployment Imaging Servicing Management (DISM) Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=239926)

 

 






