---
author: Justinha
Description: 'Lab 2, Classic-style deployment, uses command line tools in the Windows ADK to customize and deploy a Windows image.'
ms.assetid: 31ec67f4-8a6b-4bc3-a8b8-12e6c537d6a6
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 2: Classic-style imaging and deployment'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="part_2__classic-style_deployment"></span>Lab 2: Classic-style imaging and deployment

Lab 2, Classic-style deployment, uses command line tools in the Windows ADK to customize and deploy a Windows image.

## <span id="Design_your_images"></span><span id="design_your_images"></span><span id="DESIGN_YOUR_IMAGES"></span>Design your images

Here’s a sample set of hardware configurations that you might design.

|                              |              |                     |                                   |
|------------------------------|--------------|---------------------|-----------------------------------|
| Hardware Configuration:      | 1            | 1B                  | 2                                 |
| Form factor                  | Small tablet | 2-in-1              | Notebook                          |
| RAM                          | 1 GB         | 2 GB                | 4 GB                              |
| Disk capacity and type       | 16 GB eMMC   | 32 GB eMMC          | 500 GB HDD                        |
| Display size                 | 8”           | 10”                 | 14”                               |
| Windows SKU                  | Core         | Pro                 | Core                              |
| Language(s)                  | EN-US        | EN-US, FR-FR, ES-ES | EN-GB, DE-DE, FR-FR, ES-ES, ZH-CN |
| Cortana                      | Yes          | Yes                 | Yes                               |
| Inbox apps (Universal)       | Yes          | Yes                 | Yes                               |
| Pen                          | No           | Yes                 | No                                |
| Office (Universal)           | Yes          | Yes                 | Yes                               |
| Windows desktop applications | No           | Yes                 | Yes                               |
| Office 2016                  | No           | Yes                 | Yes                               |
| Compact OS                   | Yes          | Yes                 | No                                |

 

Lab 2 covers all the steps to customize and deploy a Windows image with optional steps for hardware configuration 1B and 2. Lab 2a shows you how to continue customizing your image by adding Windows desktop applications. Lab 2b shows you how to service your custom image with Windows updates.

## <span id="prepimages"></span><span id="PREPIMAGES"></span>Customize and deploy a Windows image


In this lab, you modify your images by adding and removing languages, drivers, and packages. You can add a language, language components, and boot-critical drivers (such as storage drivers or video drivers) to the Windows image and the built-in recovery tools, as well as upgrade the edition, and set it to boot automatically to audit mode for factory-floor servicing.

![image: copying image files and deployment scripts](images/dep-win8-sxs-createmodelspecificfiles.jpg)

**Step 1: Copy the base Windows image file**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.
2.  Create a copy of the image that you want to modify. For the purposes of this lab, use the base Windows 10 image file for either x64 or x86:

    ``` syntax
    copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\WindowsWithOffice.wim
    ```

    This can take several minutes.

**Step 2: Mount the Windows image file**

-   Mount the Windows image. The mounting process maps the contents of an image file to a location where you can view and modify the mounted image.

    ``` syntax
    md C:\mount\windows
    Dism /Mount-Image /ImageFile:"C:\Images\WindowsWithOffice.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize
    ```

    Where *C* is the drive letter of the drive that contains the image and *1* is the index of the image that you want to use.

    This step can take several minutes.

    **Troubleshooting**

    If this command fails, make sure that you are using the Windows 10 version of DISM that is installed with the Windows ADK.

    If your technician PC uses Windows 8.1, Windows 8, or Windows 7, use the **Deployment and Imaging Tools Environment** to access the tools that are installed together with the Windows 10 version of the Windows ADK.

    Don’t mount images to protected folders, such as your User\\Documents folder.

    If DISM processes are interrupted, consider temporarily disconnecting from the public network and disabling virus protection.

    If DISM processes are interrupted, consider running the commands from the Windows PE environment.

**Step 3: Mount the Windows RE image file**

-   Mount the Windows RE image file. The Windows RE image file is part of the Windows image.

    ``` syntax
    md C:\mount\winre
    ```

    ``` syntax
    Dism /Mount-Image /ImageFile:"C:\mount\windows\Windows\System32\Recovery\winre.wim" /Index:1 /MountDir:"C:\mount\winre"
    ```

    Where *C* is the drive letter of the drive that contains the image.

    This step can take several minutes.

    **Note**   We recommend that you update the Windows and Windows RE images at the same time, to help make sure that any necessary files are included in both images.

     

**Step 4: Add drivers to Windows**

1.  Add any .inf-style drivers needed for your hardware.

    ``` syntax
    Dism /Add-Driver /Image:"C:\mount\windows" /Driver:"C:\Drivers\PnP.Media.V1\media1.inf" /LogPath=C:\mount\dism.log
    ```

    where "C:\\Drivers\\PnP.Media.V1\\media1.inf" is the base .inf file in your driver package.

    **Note**  For this section we’re adding /LogPath in case things go wrong –if there’s a problem with adding your driver, open this file to quickly check for errors.
    
    To install all of the drivers from a folder and all its subfolders, point to the folder and use the /Recurse option.

    ``` syntax
    Dism /Add-Driver /Image:"C:\mount\windows" /Driver:c:\drivers /Recurse
    ```

    **Warning**  While /Recurse can be handy, it's easy to bloat your image with it. Some driver packages include multiple .inf driver packages, which often share payload files from the same folder. During installation, each .inf driver package is expanded into a separate folder, each with a copy of the payload files. We've seen cases where a popular driver in a 900MB folder added 10GB to images when added with the /Recurse option.

2.  Verify that the driver is part of the image:

    ``` syntax
    Dism /Get-Drivers /Image:"C:\mount\windows"
    ```

    Review the resulting list of packages and verify that the list contains the driver.

3.  If these drivers are critical for the hardware to boot, add them to the Windows RE image, too.

    ``` syntax
    Dism /Add-Driver /Image:"C:\mount\winre" /Driver:"C:\Drivers\PnP.Media.V1\media1.inf" /LogPath=C:\mount\dism.log
    ```

4.  Optional: You can remove any .inf drivers from previous tests:

    ``` syntax
    Dism /Remove-Driver /Image:"C:\mount\windows" /Driver:"VideoDriver-Old.inf" /LogPath=C:\mount\dism.log
    ```

5.  For any setup.exe-style drivers, you’ll need to install these later in audit mode, or use a provisioning package. Later in this section, we’ll show you how to set up the PC to boot into audit mode automatically.

In Windows 10, OEMs can modify the default Start layout and specify the layout of the OEM tiles by creating a LayoutModification.xml file and placing this file in the correct system location.

**Step 5: Add the files you need to modify the Start layout (Optional)**

1.  Create a LayoutModification.xml file. For this lab, you can use the sample from the Pre-Requesites document. The sample will pin Office, OneNote and Reader to Start if they are preloaded on the device (Step 8). To create your own LayoutModification.xml file by using an XML editor, see the [Sample scripts](windows-deployment-sample-scripts-sxs.md).
2.  Add your LayoutModification.xml file to the Windows image. You’ll need to put the file in the following specific location before first boot. If the file exists, you should replace the LayoutModification.XML that is already included in the image.

    ``` syntax
    C:\Mount\Windows\Users\Default\AppData\Local\Microsoft\Windows\Shell\
    ```

3.  If you pinned tiles that require .url or .lnk files, add the files to the following legacy Start Menu directories:
    -   %APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\
    -   %ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\

**Note**  The Start layout can be lost if the user resets their PC with the built-in recovery tools. You'll learn how to make sure these settings stay on the device in [Sample scripts](windows-deployment-sample-scripts-sxs.md).

 

## <span id="Add_or_change_languages_and_Cortana_features_on_demand__Optional_"></span><span id="add_or_change_languages_and_cortana_features_on_demand__optional_"></span><span id="ADD_OR_CHANGE_LANGUAGES_AND_CORTANA_FEATURES_ON_DEMAND__OPTIONAL_"></span>Add or change languages and Cortana features on demand (Optional)


**Note**  Skip this section for hardware configuration 1.

 

Always use language packs and Features-On-Demand (FOD) packages that match the language and platform of the Windows image.

Features on demand (FODs) are Windows feature packages that can be added at any time. When a user needs a new feature, they can request the feature package from Windows Update. OEMs can preinstall these features to enable them on their devices out of the box.

Common features include language resources like handwriting recognition. Some of these features are required to enable full Cortana functionality.

The following table shows the types of language packages and components available for Windows 10:

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Component</th>
<th align="left">Sample file name</th>
<th align="left">Dependencies</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Language pack</td>
<td align="left"><code>lp.cab</code></td>
<td align="left">None</td>
<td align="left">UI text, including basic Cortana capabilities.</td>
</tr>
<tr class="even">
<td align="left">Language interface pack</td>
<td align="left"><code>lp.cab</code></td>
<td align="left">Requires a specific fully-localized or partially-localized language pack. Example: ca-ES requires es-ES. To learn more, see [Available Language Packs for Windows](available-language-packs-for-windows.md).</td>
<td align="left"><p>UI text, including basic Cortana capabilities.</p></td>
</tr>
<tr class="odd">
<td align="left">Basic</td>
<td align="left"><code>Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package</code></td>
<td align="left">None</td>
<td align="left"><p>Spell checking, text prediction, word breaking, and hyphenation if available for the language.</p>
<p>You must add this component before adding any of the following components.</p></td>
</tr>
<tr class="even">
<td align="left">Fonts</td>
<td align="left"><code>Microsoft-Windows-LanguageFeatures-Fonts-Thai-Package</code></td>
<td align="left">None</td>
<td align="left"><p>Fonts.</p>
<p>Required for some regions to render text that appears in documents. Example, th-TH requires the Thai font pack. To learn more, see [Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md).</p></td>
</tr>
<tr class="odd">
<td align="left">Optical character recognition</td>
<td align="left"><code>Microsoft-Windows-LanguageFeatures-OCR-fr-fr-Package</code></td>
<td align="left">Basic</td>
<td align="left">Recognizes and outputs text in an image.</td>
</tr>
<tr class="even">
<td align="left">Handwriting recognition</td>
<td align="left"><code>Microsoft-Windows-LanguageFeatures-Handwriting-fr-fr-Package</code></td>
<td align="left">Basic</td>
<td align="left">Enables handwriting recognition for devices with pen input.</td>
</tr>
<tr class="odd">
<td align="left">Text-to-speech</td>
<td align="left"><code>Microsoft-Windows-LanguageFeatures-TextToSpeech-fr-fr-Package</code></td>
<td align="left">Basic</td>
<td align="left">Enables text to speech, used by Cortana and Narrator.</td>
</tr>
<tr class="even">
<td align="left">Speech recognition</td>
<td align="left"><code>Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package</code></td>
<td align="left">Basic, Text-To-Speech recognition</td>
<td align="left">Recognizes voice input, used by Cortana and Windows Speech Recognition.</td>
</tr>
</tbody>
</table>

 

**Step 6: Add or change languages**

1.  Add languages, and Features On Demand to the Windows image.

    For packages with dependencies, make sure you install the packages in order. For example, to enable Cortana, install: **lp.cab**, then **–Basic**, then **–Fonts**, then **–TextToSpeech**, and then **–Speech**, in this order. If you’re not sure of the dependencies, it’s OK to put them all in the same folder, and then add them all using the same DISM /Add-Package command. Not every region has fonts or capability packs for every feature.

    For example:

    ``` syntax
    Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\Languages\fr-fr x64\lp.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-OCR-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Handwriting-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-TextToSpeech-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package.cab" /LogPath=C:\mount\dism.log
    ```

2.  Verify that the language package is part of the image:

    ``` syntax
    Dism /Get-Packages /Image:"C:\mount\windows"
    ```

    where *C* is the drive letter of the drive that contains the image.

    Review the resulting list of packages and verify that the list contains the package. For example:

    ``` syntax
    Package Identity : Microsoft-Windows-Client-LanguagePack  ...  fr-FR~10.0.10020.0
    State : Installed
    ```

3.  Verify that the language components are part of the image:

    ``` syntax
    Dism /Get-Capabilities /Image:"C:\mount\windows"
    ```

    where *C* is the drive letter of the drive that contains the image.

    Review the resulting list of packages and verify that the list contains the packages. For example:

    ``` syntax
    Capability Identity : Language.Basic~~~fr-fr~0.0.1.0
    State : Installed
    ...
    Capability Identity : Language.Handwriting~~~fr-fr~0.0.1.0
    State : Installed
    ```

4.  Change the default language to match the preferred language for your customers.

    ``` syntax
    Dism /Set-AllIntl:fr-fr /Image:C:\mount\windows
    ```

**Step 7: Remove the base language (only needed for non-English regions)**

1.  To save space, you can remove English language components when deploying to non-English regions. You'll need to uninstall them in the reverse order from how you add them.

    ``` syntax
    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-us-Package~31bf3856ad364e35~amd64~~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log

    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-us-Package~31bf3856ad364e35~amd64~~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log

    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-us-Package~31bf3856ad364e35~amd64~~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log

    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-us-Package~31bf3856ad364e35~amd64~~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log

    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-LanguageFeatures-Basic-en-us-Package~31bf3856ad364e35~amd64~~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log

    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-Client-LanguagePack-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    ```

    where *C* is the drive letter of the drive.

2.  Verify that the language package is no longer part of the image:

    ``` syntax
    Dism /Get-Packages /Image:"C:\mount\windows"
    ```

    where *C* is the drive letter of the drive that contains the image.

3.  Verify that the language components are no longer part of the image:

    ``` syntax
    Dism /Get-Capabilities /Image:"C:\mount\windows"
    ```

    where *C* is the drive letter of the drive that contains the image.

4.  Remove the Windows RE optional components. After removing, verify that they're no longer in the image.

    ``` syntax
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-Rejuv-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-HTA-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-StorageWMI-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-WMI-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-WDS-Tools-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-SRT-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-SecureStartup-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-Scripting-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-EnhancedStorage-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:Microsoft-Windows-WinPE-LanguagePack-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0
    Dism /Get-Packages /Image:"C:\mount\winre"
    ```

5.  **Known issue**: If you've removed the English language pack, in Windows 10 Build 10240, you'll need to boot the image into audit mode, and use the command: `sfc.exe /scannow /verify` to repair issues with Windows 32-bit apps. For an example of how to do this with a script, see [Lab 2a: Answer files: Update settings and run scripts](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md).

**Step 8: Reinstall inbox apps (required whenever adding languages)**

1.  Remove the existing inbox apps. **(This step is not required if you're using Universal apps obtained after August 18, 2015)**. The following example shows you how to remove the Get Started inbox app. Repeat these steps for each of the inbox apps (with the exception of AppConnector) by substituting the appropriate package.

    ``` syntax
    Dism /Image:"c:\mount\windows" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2015.522.28.1146_neutral_~_8wekyb3d8bbwe
    ```

    **Note**  To remove all of the apps at once, open a command prompt as an Administrator, navigate to the image folder, and run the sample script: “Remove\_apps\_in\_offline\_image.cmd” from the [Sample scripts](windows-deployment-sample-scripts-sxs.md).

     

2.  Re-install the apps. The following example shows you how to reinstall the Get Started inbox app. Repeat these steps for each of the inbox apps (with the exception of AppConnector) by substituting the appropriate package.

    ``` syntax
    Dism /Image:"c:\mount\windows" /Add-ProvisionedAppxPackage /packagepath:<path to appxbundle>\2b362ab83144485d9e9629ad2889a680.appxbundle /licensepath:<path to license file>\2b362ab83144485d9e9629ad2889a680_License1.xml
    ```

**Step 9: Add Windows Universal apps or Windows 8.1 Store apps (Optional)**

1.  You can add Windows Universal apps and Windows 8.1 Store apps to your image by using DISM. In this example, you will preinstall Office, OneNote, and Windows Reader 8.1.

    Skip this step for hardware configuration 1.

    Add the AppX package.

    ``` syntax
    Dism /Image:c:\mount\windows /Add-ProvisionedAppxPackage /PackagePath:c:\samples\excelpreview\excel.appxbundle /LicensePath:c:\samples\excelpreview\excel_license.xml
    ```

    Where the PackagePath points to the app bundle package.

2.  Repeat the DISM command for the OneNote, Reader, Word and PowerPoint preview app bundle packages.

If the PC runs into trouble, your users may not be able to read/understand the recovery screens unless you add the appropriate language resources into the Windows Recovery Environment (Windows RE).

Whenever possible, try to add and remove languages in Windows RE at the same time that you add and remove them in your Windows image to ensure a consistent recovery experience. (This isn’t always possible, as not all languages have Windows RE equivalents.)

**Step 10: Add languages to the recovery environment (highly recommended when adding languages)**

1.  Add languages. These languages are included with the Windows ADK. You must use a matching version of the Windows ADK to service the Windows RE image.

    **Note**  Windows RE now requires the WinPE-HTA package, this is new for Windows 10.

    **Note**  The WinPE-WiFi-Package is not language-specific and does not need to be added when adding other languages. This is new for Windows 10.

    ``` syntax
    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Rejuv_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-EnhancedStorage_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Scripting_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-SecureStartup_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-SRT_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WDS-Tools_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WMI_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-StorageWMI_fr-fr.cab"

    Dism /image:C:\mount\winre /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-HTA_fr-fr.cab"
    ```

2.  Set the default recovery language to match the preferred language for your customers.

    ``` syntax
    Dism /Set-AllIntl:fr-fr /Image:C:\mount\winre
    ```

3.  Optional: Remove languages from Windows RE (only needed for non-English regions)

    When you remove languages from Windows, remove them from Windows RE to save space.

    You can either use the /PackagePath switch (which requires a matching version of Windows and the Windows ADK) or the /PackageName switch (which requires identifying the package including the version number).

    Example:

    ``` syntax
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-Rejuv-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-HTA-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-StorageWMI-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-WMI-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-WDS-Tools-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-SRT-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-SecureStartup-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-Scripting-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:WinPE-EnhancedStorage-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    Dism /Remove-Package /Image:"C:\mount\winre" /PackageName:Microsoft-Windows-WinPE-LanguagePack-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0 /LogPath=C:\mount\dism.fod2.log
    ```

4.  Verify that the language packages are part of the image:

    ``` syntax
    Dism /Get-Packages /Image:"C:\mount\winre"
    ```

    where *C* is the drive letter of the drive that contains the image.

5.  Review the resulting list of packages and verify that the list contains the package. For example:

    ``` syntax
    Package Identity : Microsoft-Windows-WinPE-Rejuv_fr-fr ...  fr-FR~10.0.9926.0
    State : Installed
    ```

## <span id="modify"></span><span id="MODIFY"></span>Other modifications


**Step 11: Upgrade the edition from Core to Pro (Optional)**

1.  Use this procedure to upgrade the edition. You cannot set a Windows image to a lower edition. You should not use this procedure on an image that has already been changed to a higher edition.

    Determine what images you can upgrade the image to: Note the edition IDs available.

    ``` syntax
    Dism /Get-TargetEditions /Image:C:\mount\windows
    ```

2.  Upgrade the edition.

    ``` syntax
    Dism /Set-Edition:Professional /Image:C:\mount\windows
    ```

## <span id="unmount"></span><span id="UNMOUNT"></span>


**Step 12: Unmount the images**

1.  Close all applications that might access files from the image.
2.  Commit the changes and unmount the Windows RE image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\winre" /Commit
    ```

    where *C* is the drive letter of the drive that contains the image.

    This process can take a few minutes.

3.  Make a backup copy of the updated Windows RE image (optional). This can help you save your work in case the Windows image gets corrupted.

    ``` syntax
    xcopy C:\mount\windows\Windows\System32\Recovery\winre.wim C:\Images\winre_with_drivers_for_fabrikam_model_1.wim /ah
    ```

    When prompted, specify **F** for file.

    **Note**  This lab assumes you’d rather keep winre.wim inside of install.wim to keep your languages and drivers in sync. If you’d like to save a bit of time on the factory floor, and if you’re OK managing these images separately, you may prefer to remove winre.wim from the image and apply it separately.

     

4.  Check the new size of the Windows RE image.

    ``` syntax
    Dir "C:\mount\windows\Windows\System32\Recovery\winre.wim"
    ```

    If the size of the partition is greater than 524,288,000 bytes, convert the file size into megabytes, add free space, and modify the deployment script: CreatePartitions-&lt;Firmware&gt;.txt with the new value. To learn more about free space recommendations, see [UEFI/GPT-based hard drive partitions](http://go.microsoft.com/fwlink/?LinkId=526950). Example:

    ``` syntax
    rem == 3. Windows RE tools partition ===============
    create partition primary size=600
    ```

5.  Commit the changes and unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

    where *C* is the drive letter of the drive that contains the image.

    This process may take several minutes.

**Step 13: Copy the image and deployment scripts to a USB key**

1.  Plug in the Windows PE USB key and note the drive location, for example, **D:**.
2.  Copy the image and the premade deployment scripts to a USB key, for example:

    ``` syntax
    copy C:\Images\WindowsWithOffice.wim D:

    copy C:\Samples\Scripts\* D:
    ```

    **Note**  If the Windows PE key doesn't have enough space, copy both the image and scripts to another USB key.

    **Note**  If your image is greater than 4GB, you may need to preformat the USB key using the NTFS file format.

     
**Step 14: Apply Windows images using a script**

-   Use deployment scripts to apply a newly-captured image onto a test device. These scripts set up the hard drive partitions and add the files from the Windows image to the partitions.

    **Note**  In Windows 10, we've changed the partition layout. While we still use a separate recovery tools image, Windows no longer needs a separate full-system recovery image to use push-button reset features. This can save several GB of drive space. We're also using a smaller MSR partition (down from 128MB to 16MB).
    
    **Note**  You can use the [sample scripts](windows-deployment-sample-scripts-sxs.md) for different device firmware types (the newer UEFI-based BIOS, or the legacy BIOS). Some UEFI-based devices include support for the older legacy BIOS. For more info, see [UEFI Firmware](http://go.microsoft.com/fwlink/?LinkId=526945).

    ![Image shows that to create a reference computer with customizations, you need a new Computer, an image file, and a deployment script.](images/dep-win8-sxs-createdeploymentscript.jpg)

**Step 15: Format and set up the hard drive partitions on the reference device**

1.  Boot the reference device to Windows PE using the Windows PE USB key.
2.  Find the drive letter of the USB key by using diskpart:

    ``` syntax
    diskpart
    DISKPART> list volume
    DISKPART> exit
    ```

    For example, the drives can be lettered like this: C = Windows; D = USB flash drive.

3.  Format the primary hard drive, create the partitions, and apply the image by using the pre-made [sample scripts](windows-deployment-sample-scripts-sxs.md). The script **ApplyImage.bat** relies on these other scripts to be placed in the same folder:

    -   **CreatePartitions-UEFI.txt**
    -   **CreatePartitions-BIOS.txt**
    -   **HideRecoveryPartitions-UEFI.txt**
    -   **HideRecoveryPartitions-BIOS.txt:**

    You can download the scripts from the [Microsoft Download Center](http://go.microsoft.com/fwlink/p/?LinkId=800657). 

    ``` syntax
    D:
    D:ApplyImage.bat D:\WindowswithOffice.wim
    ```

    where *D* is the drive letter of the USB flash drive.

    When prompted by the script: 
    
    -  Press Y to format the drive 
    -  Press Y to select Compact OS, or N to select a non-compacted OS:
        -   **Y**: Applies the image using Compact OS. This is best for devices with solid-state drives and drives with limited free space. Use this for hardware configuration 1 and 2.
        -   **N**: Applies the image as a fully-uncompressed image. This is best for high-performance devices or devices that use traditional hard drives with rotational media. Use this for hardware configuration 3.
    -  Press N to indicate the image does not include extended attributes (EA).

    The scripts apply the image to the drive, and then finish.

**Step 16: Restart the device**

-   Disconnect the USB flash drive and the external USB hard drive and type `exit`.

    While you’re waiting for the preparation phase to complete, go back to your technician PC and continue with the lab.

    **Warning**  **Troubleshooting**: If the device does not boot, turn on the device, and press the key that opens the boot-device selection menu (for example, the **Esc** key).

     

 

 





