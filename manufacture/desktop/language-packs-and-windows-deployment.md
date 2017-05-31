---
author: Justinha
Description: 'Language Packs'
ms.assetid: 051a9952-c160-4f51-8575-bde6e4868b03
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Language Packs'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Language Packs 


To design PCs that work better for customers in different regions, you can set up Windows with the right set of local languages, settings, and keyboards or other input devices.

## <span id="What_s_new_with_Language_Packs_for_Windows_10_"></span><span id="what_s_new_with_language_packs_for_windows_10_"></span><span id="WHAT_S_NEW_WITH_LANGUAGE_PACKS_FOR_WINDOWS_10_"></span>What's new with Language Packs for Windows 10?


To help you reduce the size of your image, language packs have now been split into the following language components and [Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md):

-   UI Text (the language pack .cab file)
-   Basic (spell check, typing)
-   Fonts
-   Handwriting
-   Optical character recognition
-   Text-to-speech
-   Speech
-   Retail Demo experience

You can now choose to add only core language pack UI resources to your image, significantly reducing image size.

To preload Cortana features, add the following features on demand: UI text, the Basic, Text-to-Speech, and Speech language components. 

Not all components and features on demand are available for every language.

To learn more, see [Add Language Packs to Windows](add-language-packs-to-windows.md).

## <span id="Language_packs_for_Windows"></span><span id="language_packs_for_windows"></span><span id="LANGUAGE_PACKS_FOR_WINDOWS"></span>Language packs for Windows


Language packs contain the text for the dialog boxes, menu items, and helpfiles that you see in Windows.

For some regions, language interface packs (LIPs) can provide additional translations for the most widely-used dialog boxes, menu items, and helpfile content. LIPs rely on a parent language pack to provide the remainder of the content.

### <span id="Get_language_packs_and_LIPs"></span><span id="get_language_packs_and_lips"></span><span id="GET_LANGUAGE_PACKS_AND_LIPS"></span>Get language packs and LIPs

-   OEMs and System Builders with Microsoft Software License Terms can download language packs and LIPs from the [Microsoft OEM site](http://go.microsoft.com/fwlink/?LinkId=131359) or the [OEM Partner Center](http://go.microsoft.com/fwlink/?LinkId=131358).
-   IT Professionals can download language packs from the [Microsoft Volume Licensing Site](http://go.microsoft.com/fwlink/?LinkId=125893).
-   After Windows is installed, end users can download and install additional language packs in **Settings** > **Time & language** > **Region and language** > **Add a language**. 

Related information:

-   [Available Language Packs for Windows](available-language-packs-for-windows.md). Lists all of the supported language packs and LIPs for multiple versions of Windows, and their identifier codes.

### <span id="Add_languages_to_Windows"></span><span id="add_languages_to_windows"></span><span id="ADD_LANGUAGES_TO_WINDOWS"></span>Add languages to Windows

When you include more than one language or a LIP to Windows, your customers will be able to choose the language that best meets their needs during Windows OOBE.

There's a few different ways to install language packs:

-   You can add a language pack to Windows by using the **Dism /Add-Package** tool. See [Add and Remove Language Packs on a Running Windows Installation](add-and-remove-language-packs-on-a-running-windows-installation.md) or [Add and Remove Language Packs Offline Using DISM](add-and-remove-language-packs-offline-using-dism.md).
-   To deploy a multilingual version of Windows by using Windows Setup (for example, a corporate image Windows DVD or a set of images available on a corporate network), you can add language resources to the installation program. See [Add Multilingual Support to a Windows Distribution](add-multilingual-support-to-a-windows-distribution.md).

    For corporate or network-based deployments, you may also need to update the Windows Preinstallation Environment (Windows PE) that users see when they choose how and where to install Windows to their PC. For more information, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

-   After Windows is installed, end users can download and install additional language packs and LIPs from the **Language** Control Panel. For more information, see the [Local Language Program](http://go.microsoft.com/fwlink/?LinkId=262343).

## <span id="Language_packs_for_recovery_tools"></span><span id="language_packs_for_recovery_tools"></span><span id="LANGUAGE_PACKS_FOR_RECOVERY_TOOLS"></span>Language packs for recovery tools


When things go wrong, the Windows Recovery Environment (Windows RE) can help recover the system and data. When you update the available languages for Windows, update the available languages in the recovery tools: [Customize Windows RE](customize-windows-re.md).

## <span id="Prepare_keyboards__time_zones__and_other_regional_settings_"></span><span id="prepare_keyboards__time_zones__and_other_regional_settings_"></span><span id="PREPARE_KEYBOARDS__TIME_ZONES__AND_OTHER_REGIONAL_SETTINGS_"></span>Prepare keyboards, time zones, and other regional settings


You can specify the default keyboard layout, language, or locale, either during deployment or after Windows is installed.

-   [Configure International Settings in Windows](configure-international-settings-in-windows.md)
-   [Default Input Profiles (Input Locales) in Windows](default-input-locales-for-windows-language-packs.md): Lists the default input profiles (language and keyboard pairs) used for each region.
-   [Default Time Zones](default-time-zones.md): Lists the default time zone used for each region.
-   [Keyboard identifiers for Windows](windows-language-pack-default-values.md): Lists the keyboard hexadecimal values used when configuring input profiles.

## <span id="Languages_for_apps"></span><span id="languages_for_apps"></span><span id="LANGUAGES_FOR_APPS"></span>Languages for apps


Many apps include support for multiple languages, though some require separate installation of language packs to work properly. Consult with the app developer.

In general, install all of your languages onto Windows before installing apps. This helps make sure that the language resource files are available for each of the available apps.

For more information, see [Multilingual User Interface (Windows)](http://go.microsoft.com/fwlink/p/?LinkId=698642).

## <span id="related_topics"></span>Related topics


[Add Language Packs to Windows](add-language-packs-to-windows.md)

[Features On Demand V2 (Capabilities)](features-on-demand-v2--capabilities.md)

 

 






