---
author: KPacquer
Description: 'Lab 1: Customize and install Windows using the Windows Imaging and Configuration Designer (ICD)'
ms.assetid: 97f2cc2b-ae4b-4117-a73b-42e508fe7a03
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 1: Customize and install Windows using the Windows Imaging and Configuration Designer (ICD)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 1: Customize and install Windows using the Windows Imaging and Configuration Designer (ICD)


The fastest way to deploy customized Windows devices is by creating bootable USB keys using Windows Imaging and Configuration Designer (ICD). This tool helps you install device drivers, set system settings, and add languages so you can quickly install Windows onto test or retail devices.

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
| Office 2013                  | No           | Yes                 | Yes                               |
| Compact OS                   | Yes          | Yes                 | No                                |

 
,## <span id="loadImage"></span><span id="loadimage"></span><span id="LOADIMAGE"></span>Step 1: Create a new project in Windows ICD


1.  Click **Start**, type **icd**, and then click **Windows Imaging and Configuration Designer**.

    If the **User Account Control** window appears, click **Yes**.

2.  Click **New Windows image customization**.
3.  On the **Enter project details** page, use the following information, and then click **Next**:
    -   In the **Name** box, type **Fabrikam\_Notebook\_1**.
    -   Leave the **Project folder** box as-is.
    -   In the **Description** box, type **Base hardware design for the Fabrikam Notebook PC Series 1**.

4.  On the **Select imaging source format** page, click **The Windows image is based on a Windows image (WIM) file** &gt; **Next**.
5.  On the **Select Image** page, click **Browse**.
    -   Browse to **C:\\Images\\Win10\_x64\\sources**, click **install.wim**, and then click **Open**.
    -   If working with design 1, select Windows 10 Home. If working with design 1b, select Windows 10 Pro.
    -   Click **Next**.

6.  On the **Import a Provisioning Package (Optional)** page, if you have a provisioning package (similar to the one you create in Lab 1b), you can add it now, and then click **Finish**. Otherwise, you can leave this step blank and click **Finish**.

The project is created and the main editing windows appear.

**Troubleshooting:** If you get an error while creating the project, make sure you obtained the Windows image from a dedicated download center for OEMs and System Builders. The [Windows 10 installation media](http://go.microsoft.com/fwlink/p/?LinkId=626022) that can be downloaded using the media creation tool cannot be used with Windows Imaging tools.

## <span id="step_2__add_the_universal_windows_apps_and_windows_8.1_apps__optional_"></span><span id="STEP_2__ADD_THE_UNIVERSAL_WINDOWS_APPS_AND_WINDOWS_8.1_APPS__OPTIONAL_"></span>Step 2: Add the Universal Windows apps and Windows 8.1 apps (Optional)


You can preload Universal Windows apps to your image so they are available on the PC when your customers start the PC for the first time. With Windows ICD, you add Windows 8.1 apps the same way you add Windows Universal apps to your image.

For hardware configuration 1, you can skip this step if you don’t want to add any apps to your low disk footprint device.

For this walkthrough, we'll add the Office Preview apps (Word, Excel, and PowerPoint). You can repeat these steps for any Universal Windows apps and Windows 8.1 apps you want to add to the image.

1.  In Windows ICD, under **Available customizations**, expand **Deployment assets**, and then click **Applications**.
2.  In the **Package path** box, click **Browse**. Change the view to **Application Bundle (\*.appxbundle)**, select the Word Preview app bundle package, and then click **Open.**
3.  In the **Name** box, type **Word Preview**.
4.  In the **License path** box, click **Browse**. Select the Word Preview license file, and then click **Open**.
5.  Click **Add**. The app’s name should appear in the **Selected customizations** pane.

Repeat steps 1 – 5 for the Excel Preview and PowerPoint Preview app bundle packages and any other Universal Windows apps and Windows 8.1 apps you want to add to the image. OneNote and Reader 8.1 apps are included on the event-provided USB.

## <span id="addDriver"></span><span id="adddriver"></span><span id="ADDDRIVER"></span>Step 3: Add a driver to the image


You can use Windows ICD to add your own INF-based driver to your image.

1.  In Windows ICD, under **Available Customizations**, expand **Deployment assets**, and then click **Drivers**.
2.  In the middle pane, next to **Driver folder path**, click **Browse**. Browse to your INF-based driver, and then click OK.

    The driver .inf file should show up in the **Drivers** box. If there are multiple drivers in that folder, all of the drivers in that folder will be added.

    **Note**  Some drivers are packaged as .zip or .exe files. You'll need to unzip or extract these files before adding them. Some driver files, like the sample driver given, include files for both x86 and x64 devices, this is OK.

     

3.  In the **Name** box, type *Fabrikam Video Card 100*.

    If you're testing new device designs with prototype or pre-release drivers from your hardware manufacturer, select the **Force unsigned install** check box, then click **Add**. The driver's descriptive name should appear in the **Selected customizations** pane.

## <span id="addSettings"></span><span id="addsettings"></span><span id="ADDSETTINGS"></span>Step 4: Add some customized settings to the image


1.  In Windows ICD, in the **Available Customizations** pane, expand **Image time settings**, and then click **OEM**.
2.  In the middle pane, in the *Name* box, type **Fabrikam**.
3.  In the **Available Customizations** pane, under **OEM**, click **Information.**

    Fill in the following information:

    -   In the **Manufacturer** box, type **Fabrikam**.
    -   In the **SupportHours** box, type **8 AM - 5 PM**.
    -   In the **SupportPhone** box, type **555-1212**.
    -   In the **SupportURL** box, type **http://support.fabrikam.com**.

The settings appear in the **Selected customizations** pane.

## <span id="Step_5__Customize_the_Start_layout"></span><span id="step_5__customize_the_start_layout"></span><span id="STEP_5__CUSTOMIZE_THE_START_LAYOUT"></span>Step 5: Customize the Start layout


In Windows 10, OEMs can modify the default Start layout and specify the layout of the OEM tiles by creating a **LayoutModification.xml** file and placing this file in the correct system location.

1.  Create a layoutmodification.xml file. For this lab, you can use the sample on the USB. The sample will pin Office, OneNote and Reader 8.1 to Start if they have been preloaded on the device (Step 2). To create your own layoutmodification.xml file by using an XML editor, see the [Sample scripts](windows-deployment-sample-scripts-sxs.md).
2.  In Windows ICD, in the **Available customizations** pane, expand **Runtime settings**, click **Start**, and then click **StartLayout**.
3.  In the middle pane, click **Browse.**
4.  Navigate to the location where you saved the LayoutModification.xml file.
5.  Select the file, and then click **Open**. This should set the value of StartLayout.

    The setting appears in the Selected customizations pane.

    **Note**  You cannot add .url and .lnk files directly in Windows ICD. If you have these files, follow Step 2 in lab 2 in the section ”Add the files you need to modify the Start layout”.

     

## <span id="addLang"></span><span id="addlang"></span><span id="ADDLANG"></span>Step 6: Add a language


Windows ICD provides a basic method of adding languages.

1.  In Windows ICD, in the **Available customizations** pane, expand **Deployment assets**, and then click **Language packages**.
2.  In the middle pane, next to **Cab file**, click **Browse**. Browse to the language pack file, for example: **C:\\Samples\\Languages\\fr-fr x64-client**, click **lp.cab**, and then click **Open.**
3.  In the **Name** box, type **French user interface**, and then click **Add**.

    The language pack should appear in the **Selected customizations** pane.

This method also does not update the language resources for Windows applications. Including the Windows inbox apps. While some Windows apps will be updated automatically through Windows Update, others may need to be reinstalled later.

To update the resources for Windows RE and for apps, modify the Windows install.wim image, using the instructions from [Lab 2: Classic-style deployment](part-2--classic-style-deployment.md). You can skip steps 4 and 5 (adding windows drivers and modifying the Start layout), and you can skip optional steps 11 and 12 (upgrading the Windows edition and setting the image to boot to audit mode).

## <span id="addLangComp"></span><span id="addlangcomp"></span><span id="ADDLANGCOMP"></span>Step 7: Add features on demand


Features on demand (FODs) are Windows feature packages that can be added at any time. When a user needs a new feature, they can request the feature package from Windows Update. OEMs can preinstall these features to enable them on their devices out of the box.

Common features include language resources like handwriting recognition. Some of these features are required to enable full Cortana functionality. The following table shows the types of language components available for Windows and which ones apply to Cortana.

In addition, to enable Cortana or for pen support, features need to be added in a specific order. For example, to enable Cortana, install these features in this order: **lp.cab**, then **Basic**, then **TextToSpeech**, then **Speech**. To enable pen support, install these features in this order: **lp.cab**, then **Basic**, then **Handwriting**.

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

 

1.  In Windows ICD, in the **Available customizations** pane, expand **Deployment assets**, and then click **Features on demand**.
2.  In the middle pane, next to **Features package path**, click **Browse**. Browse to the FOD file, for example: **C:\\Samples\\Languages\\fr-fr x64-client**, click **Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package.cab**, and then click **Open.**
3.  In the **Name** box, type **French basic language component**, and then click **Add**.

    The language component should appear in the **Configured customizations** pane.

4.  In the middle pane, next to **Cab File**, click **Browse**. Browse to the FOD file, for example: **C:\\Samples\\Languages\\fr-fr x64-client**, click **Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package.cab**, and then click **Open.**
5.  In the **Name** box, type **French speech language component**, and then click **Add**.

    The language components should appear in the **Selected customizations** pane.

6.  Repeat the steps to add the **Text-to-Speech** and **Speech** components. The language components should appear in the **Selected customizations** pane.
7.  For languages that require fonts, such as Chinese (Simplified), add the font pack. To learn which languages require fonts, see [Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md).

    In the middle pane, next to **Cab File**, click **Browse**. Browse to the FOD file, for example: **C:\\Samples\\Languages\\zh-cn x64-client**, click **Microsoft-Windows-LanguageFeatures-Fonts-Hans-Package.cab**, and then click **Open**.

    In the **Name** box, type **Chinese (simplified) font language component**, and then click **Add**.

    The language components should appear in the **Configured customizations** pane.

**Note**  
-   You can’t update the language in the Windows Recovery Environment from Windows ICD. By default, if there's a problem, the device will show recovery screens in English only.
-   You run Dism.exe (or a script) to remove English after you add another language. For an example, see [Lab 2: Classic-style deployment](part-2--classic-style-deployment.md), step 7.
-   After adding a language, you'll need to re-add the Universal apps (APPX). This process needs to be performed during Audit mode. For more information on how to remove and re-add these applications, please refer to [Lab 2: Classic-style deployment](part-2--classic-style-deployment.md), step 8. In Windows 10 builds after **August 18, 2015**, you can now add new Universal apps (APPX) on top of the existing ones. It is no longer necessary to remove the prior versions before re-adding them.

 

## <span id="buildUSBKey"></span><span id="buildusbkey"></span><span id="BUILDUSBKEY"></span>Step 8: Save the image


Windows ICD can store the entire image into a single .FFU file. The FFU format was developed for [faster, safer deployment](wim-vs-ffu-image-file-formats.md) by using sector-based imaging and security headers.

1.  Click **Create** &gt; **Production media**.
2.  Select **FFU** &gt; **Next**.
3.  For hardware designs 1 and 1b, select **Yes** under **Enable Compact OS**, and then click **Next**.
4.  On the **Configure Audit Mode Boot**, leave all options by default, and then click **Next**.
5.  In **Choose where the FFU file is saved**, give the file a name, such as C:\\Images\\MyFFUImage.ffu, and then click **Next**.
    **Note**  We recommend choosing a location on a hard drive rather than a USB key, as it can make the FFU creation process faster.

     

6.  Review the settings and ensure they are correct. Click **Build**. Windows ICD creates the FFU file using the name and path indicated in the previous step. This will take a few minutes. Click **Finish**.

    **Troubleshooting: If the project fails to build:**

    1.  Check to make sure there's no leading or trailing spaces in the project name. If there is, recreate the project.
    2.  **The requested operation couldn't be completed due to a file size limitation**: Check to see that the drive is formatted using the NTFS file format and has at least 5GB free.
    3.  If at any time you end up repeating this walkthrough, if you want to use the same project, delete the existing project folder from **Documents\\Windows Imaging and Configuration Designer (WICD)** before starting again.

7.  Copy the FFU file to a removable storage device, like a separate USB key or an external USB drive. You may need to reformat the drive using the NTFS format so that it can accept very large files - depending on how many languages, drivers, and apps you add, the .FFU file can easily be 5GB or larger. You probably won't be able to use the Windows PE key for this - it's formatted using FAT32, which only accepts files that are 4GB or smaller.

## <span id="bootReferencePC"></span><span id="bootreferencepc"></span><span id="BOOTREFERENCEPC"></span>Step 9: Install Windows on the reference device


1.  Insert the **WinPE** USB drive into your reference device.
2.  Boot up the reference device to the boot device selection menu. You usually do this by powering on the device and quickly pressing a specific key or button (for example, the **Esc** key or the **Volume down** button), and selecting the USB key.
3.  Insert the **FFU** USB drive into your reference device. Determine which driver letter is assigned to this drive by doing the following:

    1.  From the WinPE command prompt, type: **diskpart** and press Enter.
    2.  At the diskpart prompt, type**list volume** and press Enter.

    This lists all of the volumes present in the system. Determine the driver letter that corresponds to the FFU USB key, for example, G.

4.  From the WinPE command prompt, type the following:

    ``` syntax
    Dism.exe /apply-image /imagefile=G:\MyFFUImage.ffu /applydrive=\\.\physicaldrive0 /skipplatformcheck /logpath:G:\dism.applyffu.log
    ```

    Where G:\\MyFFUImage.ffu is the file location of the FFU file.

**Repeat Step 9: Use your new Windows installation key to set up more devices**. At the **Get going fast** screen, turn off the device by pressing and holding the power button. Do not complete the OOBE for your customer.

There's a known bug where if your PC is set to automatically boot to a USB key, it will get caught in a loop during the install process: after Windows installs, it reinstalls again and again. To avoid this loop:

**Workaround: Prepare the reference device**

1.  On your reference device, open the device's boot menus. You usually do this by powering on the device and quickly pressing a specific key or button (for example, the **Esc** key or the **Volume up** button).
2.  Find the boot order menu (this menu has different names and locations) and make sure that the **hard drive** is set up to be first in the boot sequence, not the USB drive.
3.  If your device doesn't appear to have a way to change the boot order on during the boot sequence, the option may be disabled. Look for a option like "Enable Boot Options on Startup" or "F12 Boot Menu", and enable the menu.

## <span id="Troubleshooting"></span><span id="troubleshooting"></span><span id="TROUBLESHOOTING"></span>Troubleshooting


If Windows doesn't install on the reference device, try each of these steps:

-   **USB key doesn't appear in the boot menus**: Try using different USB ports on the computer. Avoid using USB hubs or cables.

    Restart the PC and open the device's boot menus. Look for an option to enable a boot device selection menu on startup (example: "F12 Boot menu"). If you find one, enable it!

-   **UEFI or BIOS**: If your boot menus give you a choice between booting in UEFI mode or BIOS mode, choose UEFI mode.
-   If the device boots up to the **Drive Selection** menu, select the primary hard drive, this is usually the **C** drive. If you're not sure which drive is which, press **Shift-F10** to open the Command Prompt. Type **diskpart** and press Enter. At the Diskpart prompt, type **list volume** to show the partitions. Type **exit**. Press **Alt-Tab** to try again.
-   If the device gets through 6% of the installation and then fails, you may need to prepare the drive:

    1.  Plug the USB key.
    2.  Select **Troubleshoot &gt; Advanced Options &gt; Command Prompt**.
    3.  Type **diskpart** and press Enter. At the Diskpart prompt, type **list volume** to list the drives. Type **exit** to leave the Diskpart prompt.
    4.  Type **diskpart /s D:\\Samples\\CreatePartitions-UEFI.txt**

        where D is the drive letter of the USB key.

        For BIOS-based PCs, use CreatePartitions-BIOS.txt instead.

    5.  Type **exit** to leave the Command prompt.
    6.  Select **Turn off your PC**.
    7.  Turn on the device and open the boot device selection. If you have a choice between booting in BIOS or UEFI mode, select UEFI mode. Windows ICD should install correctly.

-   If the device boots up to the **Choose an option: Troubleshoot / Turn off your PC** menu, you may be seeing a known bug with USB 3.0 and Windows ICD images. Try again using a **USB 2.0** key or port.
-   Make sure your device and the Windows image match. If they don't match, try creating the image again using the correct architecture.

## <span id="verify"></span><span id="VERIFY"></span>Test the customizations


Do these steps to test an image. Note, this requires completing the First User Experience and creating a user account. After performing these steps, you'd typically need to reinstall Windows onto the device before sending it to a customer.

1.  Make sure the device is not plugged into the network, and turn it on.
2.  After the device boots, if the **Languages** screen appears and shows the French language, then the language pack has been added correctly. Choose the language you're most familiar with, choose your keyboard, and then click **Next**.
3.  Complete the Out of Box Experience (OOBE): these steps may vary based on language.
4.  On the **Hi there** screen, click **Accept**.
5.  If it asks you for a product key, click **Do this later**. If you're plugged into a network connection, you may be asked to provide a product key. To avoid using a product key, disconnect the device and try again.
6.  Click **Accept** , click **Skip this step**, and then click **Use express settings**.
7.  On the **Who owns this PC?** page, click **I do**, and then click **Next**.
8.  On the **Make it yours** page, click **Skip this step**.
9.  Add a user name (example: "Terry"), and then click **Next**.
10. The device finalizes setup and reboots to the desktop.
11. When the desktop appears, in **Settings** under **System &gt; About**, you should see the technical support info that you entered earlier appear (company name, support phone number, and support website).

 

 





