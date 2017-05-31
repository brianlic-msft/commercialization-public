---
author: Justinha
Description: Add Language Packs to Windows
ms.assetid: 0734452f-aa09-4ec9-bbbf-fbc995dd803f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add Language Packs to Windows
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add Language Packs to Windows


OEMs can add language packs to localize PCs and devices for customers in different regions.

For Windows 10 for desktop editions (Home, Pro, Enterprise, and Education), language packs have been split into language components and [Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md). This reduction in image size can be helpful when creating images for lower-cost devices with small storage. It can also reduce the time required to create and deploy images.

## <span id="LangPackTypes"></span><span id="langpacktypes"></span><span id="LANGPACKTYPES"></span>Language Pack Types


You can install multiple languages onto the same Windows 10 image. For each language, where available:

-   Add the language pack and the **Basic** components.
-   To preload Cortana features, also add the **Text-to-speech**, and **Speech recognition**.
-   Add **Fonts** and **Optical character recognition** for the most popular languages within a region to improve your user’s first experience (strongly recommended). If they’re not already installed, Windows downloads and installs them in the background when the user chooses that language for the first time.
-   Add **handwriting recognition** for devices with pen inputs.
-   Add Windows Recovery Environment (WinRE) components so that end users can more easily recover their PCs.

Other customizations that can be preset:

-   Currency, time zone, or calendar formats
-   [Keyboard Identifiers and Input Method Editors for Windows](windows-language-pack-default-values.md)

Not all capabilities are available for every language.

Use care to limit the amount and types of language packs included with each image. While the Windows 10 language packs are smaller, having too many can still affect disk space, and can affect performance, especially while updating and servicing Windows.

Some capabilities have additional dependencies, as shown in the following table.

| Component | Sample file name | Dependencies |	Description |
| --- | --- | --- | --- |
|Language pack |	`Microsoft-Windows-Client-Language-Pack_x64_es-es.cab` |	None |	UI text, including basic Cortana capabilities. |
|Language interface pack |	`Microsoft-Windows-Client-Language-Interface-Pack_x64_ca-es-valencia.cab` |	Requires a specific fully-localized or partially-localized language pack. Example: ca-es-valencia requires es-es. To learn more, see [Available Language Packs for Windows](available-language-packs-for-windows.md). | UI text, including basic Cortana capabilities.<br><br>Not all of the language resources for the UI are included in a LIP. LIPs require at least one language pack (or parent language). A parent language pack provides support for a LIP. The parts of the UI that are not translated into the LIP language are displayed in the parent language. In countries or regions where two languages are commonly used, you can provide a better user experience by applying a LIP over a language pack. |
|Basic |	`Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package` | None | Spell checking, text prediction, word breaking, and hyphenation if available for the language.<br><br>You must add this component before adding any of the following components. |
| Fonts |	`Microsoft-Windows-LanguageFeatures-Fonts-Thai-Package` |	None | Fonts.<br><br>Required for some regions to render text that appears in documents. Example, th-TH requires the Thai font pack. To learn more, see [Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md). |
| Optical character recognition |	`Microsoft-Windows-LanguageFeatures-OCR-fr-fr-Package` |	Basic |	Recognizes and outputs text in an image. |
| Handwriting recognition |	`Microsoft-Windows-LanguageFeatures-Handwriting-fr-fr-Package` |	Basic |	Enables handwriting recognition for devices with pen input. |
| Text-to-speech |	`Microsoft-Windows-LanguageFeatures-TextToSpeech-fr-fr-Package` |	Basic |	Enables text to speech, used by Cortana and Narrator. |
| Speech recognition |	`Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package` |	Basic, Text-To-Speech recognition |	Recognizes voice input, used by Cortana and Windows Speech Recognition. |
| Retail Demo experience |	`Microsoft-Windows-RetailDemo-OfflineContent-Content-fr-fr-Package` |	Basic |	[Retail Demo experience](https://msdn.microsoft.com/windows/uwp/monetize/retail-demo-experience). |
| WinRE |	Multiple, see [Customize Windows RE](customize-windows-re.md).	| None |	Used to help end users repair and recover their PCs. See [Customize Windows RE](customize-windows-re.md). |
 

## <span id="Where_do_I_download_the_language_packs_"></span><span id="where_do_i_download_the_language_packs_"></span><span id="WHERE_DO_I_DOWNLOAD_THE_LANGUAGE_PACKS_"></span>Where do I download the language packs?


OEMs and system builders can get the packages and features from dedicated download centers for OEMs and System Builders.

Users can install more languages and features by going to **Settings** &gt; **Time & language** &gt; **Region & language** &gt; **Add a language**. To learn more, see [How to add an input language to your PC](http://go.microsoft.com/fwlink/?LinkId=619289).

To see what's available, see [Available Language Packs for Windows](available-language-packs-for-windows.md).

## <span id="Other_considerations"></span><span id="other_considerations"></span><span id="OTHER_CONSIDERATIONS"></span>Other considerations


-   Some languages require more hard-disk storage space than others.
-   Although you can add a bunch of language packs at once using the commands: **DISM /Add-Package**, **DISM /Apply-Unattend**, or [LPKSetup](http://go.microsoft.com/fwlink/?LinkID=624512), don't add too many at once, because the device may not have enough memory to handle it. General recommendations: from Windows in audit mode, don't add more than 20 language packs at a time. From Windows PE, don't add more than 7. If WinPE is still running out of memory, you can [customize WinPE by adding temporary storage (scratch space)](winpe-mount-and-customize.md).
-   Cross-language upgrades are not supported. This means that during upgrades or migrations, if you upgrade or migrate an operating system that has multiple language packs installed, you can upgrade or migrate to the system default UI language only. For example, if English is the default language, you can upgrade or migrate only to English.
-   The default language cannot be removed because it is used to generate computer security identifiers (SIDs). The default UI language is the language that is selected during the Out-Of-Box-Experience (OOBE), the UI language specified in the Deployment Image Servicing and Management (DISM) command-line tool, or in the unattended answer file if you skip OOBE.
-   To add language packs using Windows PE, you may need to add pagefile support to Windows PE. For more information, see [Deployment Image Servicing and Management (DISM) Best Practices](deployment-image-servicing-and-management--dism--best-practices.md).
-	If you install an update (hotfix, general distribution release [GDR], or service pack [SP]) that contains language-dependent resources prior to installing a language pack, the language-specific changes in the update won't be applied when you add the language pack. You need to reinstall the update to apply language-specific changes. To avoid reinstalling updates, install language packs before installing updates.
-   The version of the language pack must match the version of Windows. For example, you can't add a Windows 10 language pack to Windows 8, or add Windows 8 language pack to Windows 10. The build number must also match.

## <span id="LPInstallMethods"></span><span id="lpinstallmethods"></span><span id="LPINSTALLMETHODS"></span>Installation methods


You can add a language pack to an image in the following ways:

-   [**Offline installation**](#add-offline). If you need to add a language pack or configure international settings on a custom Windows image, you can use DISM.
-   [**Using Windows Setup.**](#add-setup)
-   **On a running operating system.** If you need to boot the operating system to install an application or to test and validate the installation, you can add a language pack to the running operating system by using DISM or the language pack setup tool (Lpksetup.exe). You can use this method only for language packs that are stored outside of the Windows image. For more information, see [Add and Remove Language Packs on a Running Windows Installation](add-and-remove-language-packs-on-a-running-windows-installation.md) and [Add Language Interface Packs to Windows](add-language-interface-packs-to-windows.md).

## <span id="add-setup"></span><span id="ADD-SETUP"></span>Add or remove languages using Windows Setup


**To deploy a multilingual edition of Windows by using Windows Setup**

1.  Add or remove language packs in the **\\Langpacks** folder in a distribution share.
2.  Recreate the Lang.ini file. Windows Setup uses the Lang.ini file to identify the language packs that are inside the image and in the Windows distribution share. The Lang.ini file also identifies the language that is displayed during Windows Setup. You must also regenerate the Lang.ini file if you plan to create recovery media for images that contain multiple languages.

    You can use DISM international servicing command-line options to recreate the Lang.ini file based on any language-pack updates. Do not manually modify the Lang.ini file. To learn more, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

3.  If you deploy a multilingual image, or need to apply a specific language pack to a Windows image for a specific device, you can add the language pack by using Windows Setup and an unattended answer file. The language pack must be added to the image before international settings can be configured. For more information about how to add a language pack to an answer file, see [Add a Package to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915066). To add a language pack and configure international settings, use the **WindowsPE** configuration pass to add the language pack and other configuration passes to configure international settings. For more information, see [Configure International Settings in Windows](configure-international-settings-in-windows.md)
    
    **Note**  If language and locale settings are specified in an answer file, those settings overwrite any previous default. For example, if you first change the default `UILanguage` setting to FR-FR by using the DISM command-line tool on an offline image and then later apply an unattended answer file that specifies EN-US as the UI language, EN-US will be the default UI language.   

4.  Use Setup to install the language packs that are in the distribution share.

To learn more, see [Add Multilingual Support to a Windows Distribution](add-multilingual-support-to-a-windows-distribution.md) or [Add Multilingual Support to Windows Setup](add-multilingual-support-to-windows-setup.md).

## <span id="add-offline"></span><span id="ADD-OFFLINE"></span>Add or remove languages offline

Here's how to add and remove languages on an offline image (install.wim).

To save space, you can remove English language components when deploying to non-English regions. You'll need to uninstall them in the reverse order from how you add them.

**Mount the images**

-   Mount the Windows and Windows RE images. The Windows RE image file is part of the Windows image.

    ``` syntax
    md C:\mount\windows
    Dism /Mount-Image /ImageFile:install.wim /Index:1 /MountDir:"C:\mount\windows"
    md C:\mount\winre
    Dism /Mount-Image /ImageFile:"C:\mount\windows\Windows\System32\Recovery\winre.wim" /index:1 /MountDir:"C:\mount\winre"
    ```

**Add a language**

1.  Add the language to Windows. You can use either the /Add-Package or /Add-Capabilities commands to add the capabilities.

    For packages with dependencies, make sure you install the packages in order. For example, to enable Cortana, install: the language pack **.cab**, then **Basic**, then **TextToSpeech**, then **Speech**, in this order.

    If you’re not sure of the dependencies, it’s OK to put them all in the same folder, and then add them all at once using the same DISM /Add-Package command.

    After adding the language pack, verify that it's in the images.

    ``` syntax
    rem Remove the paragraph marks to make this into one really big, long command. 
    Dism /Add-Package /Image:"C:\mount\windows"
         /PackagePath="C:\Languages\Microsoft-Windows-Client-Language-Pack_x64_fr-fr.cab"
         /PackagePath="C:\Languages\Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package.cab"
         /PackagePath="C:\Languages\Microsoft-Windows-LanguageFeatures-OCR-fr-fr-Package.cab"
         /PackagePath="C:\Languages\Microsoft-Windows-LanguageFeatures-Handwriting-fr-fr-Package.cab"
         /PackagePath="C:\Languages\Microsoft-Windows-LanguageFeatures-TextToSpeech-fr-fr-Package.cab"
         /PackagePath="C:\Languages\Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package.cab"
    Dism /Get-Capabilities /Image:"C:\mount\windows"
    ```

2.  Add any other capabilities, such as fonts, required for that region. To learn more, see [Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md).

    ``` syntax
    rem Thai example (add th-TH first).
    Dism /Add-Package /Image:"C:\mount\windows"
         /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Fonts-Thai-Package"
    Dism /Get-Capabilities /Image:"C:\mount\windows"
    ```

3.  When you add languages to Windows, when possible, add them to WinRE to ensure a consistent language experience in recovery scenarios. This requires a matching version of Windows and the Windows ADK. Windows RE now requires the WinPE-HTA package, this is new for Windows 10.

    After adding the packages, verify that they're in the image.

    ``` syntax
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Rejuv_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-EnhancedStorage_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Scripting_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-SecureStartup_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-SRT_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WDS-Tools_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WMI_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-StorageWMI_fr-fr.cab"
    Dism /Image:C:\mount\winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-HTA_fr-fr.cab"
    Dism /Get-Packages /Image:"C:\mount\winre"
    ```

    Example output from /Get-Packages: Package Identity : Microsoft-Windows-WinPE-Rejuv\_fr-fr ... fr-FR~10.0.9926.0 State : Installed

**Add a language interface pack (LIP)**

1.  Add the LIP and desired/available capabilities to the Windows image. Some regions don't have any related capabilities, while others have partial or complete sets.

    After adding the packages, verify that they're in the image.

    ``` syntax
    Dism /Image:C:\mount\windows /Add-Package /PackagePath:C:\Languages\Microsoft-Windows-Client-Language-Pack_x64_bn-in.cab
         /PackagePath="C:\Languages\bn-in x64\Microsoft-Windows-LanguageFeatures-Basic-bn-in-Package.cab"
    ```

2.  Add any other capabilities, such as fonts, required for that region.

    ``` syntax
    Dism /Add-Package /Image:"C:\mount\windows"
         /PackagePath="C:\Languages\Microsoft-Windows-LanguageFeatures-Fonts-Beng-Package"
    ```

3.  Verify that they're in the image.

    ``` syntax
    Dism /Get-Packages /Image:"C:\mount\windows" 
    ```

**Remove a language**

1.  To save space, you can remove languages from an image.

    You'll need to uninstall them in the reverse order from how you add them.

    You can't remove a capability that other packages depend on. For example, if you have the French handwriting and basic capabilities installed, you can't remove the basic capability. This will fail.

    You can use either the DISM /Remove-Package or DISM /Remove-Capability command to remove a capability, and either /DISM /Get-Packages or DISM /Get-Capabilities to verify that they're no longer in the image.

    ``` syntax
    DISM /Remove-Capability /Image:"C:\mount\windows"
     /CapabilityName:Language.Speech~~~en-US~0.0.1.0 
    DISM /Remove-Capability /Image:"C:\mount\windows"
     /CapabilityName:Language.TextToSpeech~~~en-US~0.0.1.0
    DISM /Remove-Capability /Image:"C:\mount\windows"
     /CapabilityName:Language.Handwriting~~~en-US~0.0.1.0
    DISM /Remove-Capability /Image:"C:\mount\windows"
     /CapabilityName:Language.OCR~~~en-US~0.0.1.0
    DISM /Remove-Capability /Image:"C:\mount\windows"
     /CapabilityName:Language.Basic~~~en-US~0.0.1.0
    Dism /Remove-Package /Image:"C:\mount\windows" /PackageName:Microsoft-Windows-Client-LanguagePack-Package~31bf3856ad364e35~amd64~en-US~10.0.10120.0
    DISM /Get-Packages /Image:"C:\mount\windows"
    DISM /Get-Capabilities /Image:"C:\mount\windows"
    ```

    It's also OK to just remove the language pack without removing the language capabilities. One week after the user completes OOBE, if the user hasn't added the language to their input language list, Windows automatically cleans out the unused language capabilities.

2.  Remove the Windows RE optional components. After removing, verify that they're no longer in the image. Replace build number 10.0.10120.0 with the build you are using. 

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

3.  **Known issue**: If you've removed the English language pack, in Windows 10 Build 10240, you'll need to boot the image into audit mode, and use the command: `sfc.exe /scannow /verify` to repair issues with Windows 32-bit apps. For an example of how to do this with a script, see [Lab 2a: Answer files: Update settings and run scripts](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md).

**Reinstall apps (required whenever adding languages)**

Note:  In Windows 10, version 1607, it is no longer necessary to remove inbox apps. If you do try to do this, the DISM command may fail.

1.  Re-install the apps. The following example shows you how to reinstall the Get Started inbox app. Repeat these steps for each of the inbox apps (with the exception of AppConnector) by substituting the appropriate package.

    ``` syntax
    Dism /Image:"c:\mount\windows" /Add-ProvisionedAppxPackage /packagepath:<path to appxbundle>\2b362ab83144485d9e9629ad2889a680.appxbundle /licensepath:<path to license file> \2b362ab83144485d9e9629ad2889a680_License1.xml
    ```

2.  Windows desktop applications: You'll often need to reinstall these too, as they often include language-specific files that are chosen at installation. You won't be able to update these using offline servicing; instead you'll need to recapture the image or create a separate provisioning package for the Windows desktop application.

**For installations managed by Windows Setup or distribution shares, update the language list**

1.  This is only required if you're distributing multilingual Windows Setup media, or distributing Windows through a share.

    Recreate the lang.ini file.

    ``` syntax
    Dism /Image:C:\mount\windows /gen-langini /distribution:C:\my_distribution
    ```

    The lang.ini file in C:\\myDistribution\\sources should look similar to the following:

    ``` syntax
    [Available UI Languages]
    ca-ES = 2
    es-ES = 3
     
    [Fallback Languages]
    es-ES = en-us
    ```

2.  Review the default international settings in the Windows image by using DISM.

    ``` syntax
    Dism /Image:C:\mount\windows /get-intl
    ```

    For example, you should see output similar to the following:

    ``` syntax
    Reporting offline international settings.
     
    Default system UI language : es-ES
    System locale : ca-ES
    Default time zone : Romance Standard Time
    User locale for default user : ca-ES
    Location : Spain (GEOID = 217)
    Active keyboard(s) : 0403:0000040a
    Keyboard layered driver : PC/AT Enhanced Keyboard (101/102-Key)
     
    Installed language(s): ca-ES
      Type : Partially localized language, LIP type.
    Installed language(s): es-ES
      Type : Fully localized language.
     
    Reporting distribution languages.
     
    The default language in the distribution is:
    es-ES
    ```

**Change the default language**

-   Set the default Windows language to match the preferred language for your customers.

    ``` syntax
    Dism /Set-AllIntl:fr-fr /Image:C:\mount\windows
    ```

**Unmount the images**

-   Unmount the Windows RE and Windows images.

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\winre" /Commit
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

## <span id="LPRemovalTimer"></span><span id="lpremovaltimer"></span><span id="LPREMOVALTIMER"></span>The Language-Pack Removal Task


In Windows 10, the language pack removal task runs on all Windows editions. However, any languages that are selected by users in the language preferences section of the control panel are not removed. Users can choose to run multiple languages and any language packs that are not used by the user are removed from the computer. Also, any language pack that is installed by a user is not removed.

Running the Sysprep tool resets the language-pack removal clock. The clock will not start again until the next time OOBE runs and the computer is restarted. If you customize your Windows image, consider booting to audit mode to make your customizations. The language pack removal task will not be started when you boot to audit mode. For more information about audit mode, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md). You can also update your Windows image offline without booting the image. For more information, see [Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

Using the `SkipMachineOobe` setting in the Microsoft-Windows-Shell-Setup component does not skip the language-pack removal task.

**Note**  
The language-pack removal task does not remove LIPs.

 

## <span id="related_topics"></span>Related topics


[Language Packs](language-packs-and-windows-deployment.md)

[Available Language Packs for Windows](available-language-packs-for-windows.md)

[Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md)

[Windows Language Pack Default Values](windows-language-pack-default-values.md)

[Default Input Locales for Windows Language Packs](default-input-locales-for-windows-language-packs.md)

 

 






