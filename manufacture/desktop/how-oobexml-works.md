---
author: Justinha
Description: 'How Oobe.xml Works'
ms.assetid: 6df5c611-96f3-4268-9208-8455aa293954
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'How Oobe.xml Works'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# How Oobe.xml Works


**Oobe.xml** is a content file that you can use to organize text and images and to specify and preset settings for customizing the Windows first experience. You can use multiple **Oobe.xml** files for language- and region-specific license terms and settings so that users see appropriate information as soon as they start their PCs. By specifying information in the **Oobe.xml** file, OEMs direct users to perform only the core tasks that are required to set up their PCs.

Windows checks for and loads **Oobe.xml** in the following locations, in the following order:

1.  **%WINDIR%\\System32\\Oobe\\Info\\Oobe.xml**

2.  **%WINDIR%\\System32\\Oobe\\Info\\Default\\Oobe.xml**

3.  **%WINDIR%\\System32\\Oobe\\Info\\Default\\**&lt;*language*&gt;\\**Oobe.xml**

4.  **%WINDIR%\\System32\\Oobe\\Info\\&lt;***country/region*&gt;**\\Oobe.xml**

5.  **%WINDIR%\\System32\\Oobe\\Info\\&lt;***country/region*&gt;\\&lt;*language*&gt;\\**Oobe.xml**

If you have customizations that span all countries/regions and languages, the Oobe.xml files can be placed in Location 1.

If you're shipping a single-region, single-language system, your custom **Oobe.xml** file should be placed in the \\Info (Location 1) or \\Default (Location 2) directory. Those locations are functionally equivalent.

If you're shipping to multiple countries/regions and your OOBE settings require customizations for individual countries/regions, each with a single language, all of your **Oobe.xml** files should be placed in Locations 4 and 5.

If you're shipping to multiple countries/regions with multiple languages, the following guidelines apply:

-   Place country/region-specific information in Location 4.

-   Place language-specific information for each respective country/region in Location 5.

## <span id="Single-language_deployments"></span><span id="single-language_deployments"></span><span id="SINGLE-LANGUAGE_DEPLOYMENTS"></span>Single-language deployments


If you're delivering PCs to one country/region in a single language, you should place a single **Oobe.xml** file in **\\%WINDIR%\\System32\\Oobe\\Info**. This file can contain all of your customizations to the Windows first experience.

For example, an English version of Windows that's delivered to the United States can have the following directory structure:

**\\%WINDIR%\\System32\\Oobe\\Info\\Oobe.xml**

If you're delivering PCs to more than one country/region in a single language, and you plan to vary your customizations in different locations, place an **Oobe.xml** file in **\\%WINDIR%\\System32\\Oobe\\Info.**

This file can contain the default regional settings that you plan to show to the user. You should also include a default set of customizations, in case the user selects a country/region that you haven't made specific customizations for. The **Oobe.xml** file should also contain the &lt;*eulafilename*&gt; node with the name of the customized license terms that you plan to use.

Place an **Oobe.xml** file for each country/region that contains unique customized content in **\\%WINDIR%\\System32\\**&lt;*country/region that you're deploying to*&gt;\\&lt;*language that you're deploying in*&gt;. After the user has chosen a country/region, these files are used to display additional customizations.

For example, an English version of Windows delivered to the United States and Canada can have the following directory structure:

**\\%WINDIR%\\System32\\Oobe\\Info\\Oobe.xml** (EULA file name and regional settings)

**\\%WINDIR%System32\\Oobe\\Info\\244\\1033\\Oobe.xml** (United States custom content)

**\\%WINDIR%\\System32\\Oobe\\Info\\39\\1033\\Oobe.xml (Canada custom content)**

## <span id="Multiple-language_or_region_deployments"></span><span id="multiple-language_or_region_deployments"></span><span id="MULTIPLE-LANGUAGE_OR_REGION_DEPLOYMENTS"></span>Multiple-language or region deployments


If you're delivering PCs to one or more countries/regions and are delivering PCs running Windows with additional language packs, place an **Oobe.xml** file in **\\%WINDIR%\\System32\\Oobe\\Info**. This file can contain the default regional settings that you plan to show to the user. You should also include a default set of customizations, in case the user selects a country/region that you haven't made specific customizations for. This **Oobe.xml** should also contain the &lt;*eulafilename*&gt; node with the name of the custom license terms that you plan to use.

Place an **Oobe.xml** file for each country/region that contains unique customized content in \\%WINDIR%\\System32\\&lt;*country/region that you're deploying to*&gt;\\&lt;*language that you're deploying in*&gt;. After the user has chosen a country/region, this file is used to display additional customizations.

For example, an English version of Windows that's delivered to the United States and Canada would use the following directory structure:

**\\%WINDIR%\\System32\\Oobe\\Info\\Oobe.xml** (logo, EULA file name, and regional settings)

**\\%WINDIR%\\System32\\Oobe\\Info\\244\\1033\\Oobe.xml** (United States custom content)

\\%WINDIR%\\System32\\Oobe\\Info\\39\\1033\\**Oobe.xml** (Canada custom content)

If you're delivering PCs to one or more countries/regions and are delivering PCs running Windows with additional language packs, place an **Oobe.xml** file in **\\%WINDIR%\\System32\\Oobe\\Info**. This **Oobe.xml** file should contain the *&lt;eulafilename&gt;* node with the name of the customized EULA that you plan to use.

Place an **Oobe.xml** for each Windows language that you're including in **\\%WINDIR%\\System32\\Default\\**&lt;*language that you're deploying in*&gt;. These files should contain the default regional settings that you plan to show for a given language, as well as a default set of customizations, in case the user selects a country/region that you haven't made specific customizations for.

Place an **Oobe.xml** file for each country/region that contains customized content in **\\%WINDIR%\\System32\\&lt;***country/region that you're deploying to*&gt;\\&lt;*language that you're deploying in*&gt;. After the user has chosen a country/region, this file is used to display your additional customizations.

For example, a version of Windows with English and French language packs that's delivered to the United States and Canada would use the following directory structure:

-   Logo and EULA:

    **\\%WINDIR%\\System32\\Oobe\\Info\\Oobe.xml** (logo and EULA file name)

-   Regional settings and fallback for content that's not localized for the specific country/region:

    **\\%WINDIR%\\System32\\Oobe\\Info\\Default\\1033\\Oobe.xml** (default regional settings and English content if the user chooses a country/region other than the United States or Canada)

    **\\%WINDIR%\\System32\\Oobe\\Info\\Default\\1036\\Oobe.xml** (default regional settings and French content if the user chooses a country/region other than United States or Canada)

-   Country-specific or region-specific content in the appropriate languages

    **\\%WINDIR%\\System32\\Oobe\\Info\\244\\1033\\Oobe.xml** (United States custom content in English)

    **\\%WINDIR%\\System32\\Oobe\\Info\\244\\1036\\Oobe.xml** (United States custom content in French)

    **\\%WINDIR%\\System32\\Oobe\\Info\\39\\1033\\Oobe.xml** (Canada custom content in English)

    **\\%WINDIR%\\System32\\Oobe\\Info\\39\\1036\\Oobe.xml** (Canada custom content in French)

### <span id="Country_region_folder_format"></span><span id="country_region_folder_format"></span><span id="COUNTRY_REGION_FOLDER_FORMAT"></span>Country/region folder format

To identify the country/region:

1.  Look up the country/region GeoID identifier using the [Table of Geographical Locations](http://go.microsoft.com/fwlink/?LinkId=131360) on **MSDN**. These values are presented in hexadecimal.

2.  Convert the value from hexadecimal to decimal, and use that value for the folder name. For example, to create a folder for Chile (GeoID 0x2E), name the folder "46".

    ``` syntax
    \%WINDIR%\System32\Oobe\Info\46\Oobe.xml
    ```

### <span id="Language_folder_format"></span><span id="language_folder_format"></span><span id="LANGUAGE_FOLDER_FORMAT"></span>Language folder format

To identify the language, use the decimal version of the Locale ID (LCID) value. For example, to create a Spanish folder, name the folder "3082".

``` syntax
%WINDIR%\System32\Oobe\Info\Default\3082\Oobe.xml
```

There are many more LCIDs than languages. A few LCIDs correlate to the languages that can be released with Windows. For more information about which languages release with Windows, at what level of localization, and their decimal identifiers, see [Available Language Packs](http://go.microsoft.com/fwlink/?LinkId=206620) on **TechNet**.

 

 





