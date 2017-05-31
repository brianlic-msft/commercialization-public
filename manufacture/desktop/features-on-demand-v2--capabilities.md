---
author: Justinha
Description: 'Features on Demand v2 (Capabilities), introduced in Windows 10, are Windows feature packages that can be added at any time. Common features include language resources like handwriting recognition or the .NET Framework (.NetFx3).'
ms.assetid: 6390f427-a201-487e-928f-964e7b84327c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Features On Demand V2 (Capabilities)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Features On Demand V2 (Capabilities)


Features on Demand v2 (Capabilities), introduced in Windows 10, are Windows feature packages that can be added at any time. Common features include language resources like handwriting recognition or the .NET Framework (.NetFx3).

When the PC needs a new feature, it can request the feature package from Windows Update.

Unlike previous feature packs, Features on Demand V2 can be applicable to multiple Windows builds, and can be added using DISM without knowing the build number. Always use Features on Demand that match the architecture of the operating system. Adding Features on Demand of the wrong architecture might not return an error immediately, but will likely cause functionality issues in the operating system. 

## <span id="Adding_or_removing_features_capabilities"></span><span id="adding_or_removing_features_capabilities"></span><span id="ADDING_OR_REMOVING_FEATURES_CAPABILITIES"></span>Adding or removing features/capabilities


Use DISM to add or remove capabilities:

-   Use the /Online option to add the capability to your PC.

-   Use the /Image:&lt;mount path&gt; option to add the capability to a Windows image file (.wim).
 

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Command</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">/Add-Capability</td>
<td align="left"><p>Adds a capability to an image.</p>
<p>For packages with dependencies this also pulls dependent packages. For example, if you add the Speech package, you'll also get the Text-to-speech and Basic packages in addition to Speech.</p></td>
<td align="left">DISM.exe /Online /Add-Capability /CapabilityName:Language.Basic~\~\~en-US~0.0.1.0</td>
</tr>
<tr class="even">
<td align="left">/Get-Capabilities</td>
<td align="left">Get capabilities in the image.</td>
<td align="left">DISM /Online /Get-Capabilities</td>
</tr>
<tr class="odd">
<td align="left">/Get-CapabilityInfo</td>
<td align="left">Get information of a capability in the image.</td>
<td align="left">DISM /Online /Get-CapabilityInfo /CapabilityName:Language.Basic~\~\~en-US~0.0.1.0</td>
</tr>
<tr class="even">
<td align="left">/Remove-Capability</td>
<td align="left"><p>Removes a capability from an image.</p>
<p>Note: You cannot remove a capability that other packages depend on. For example, if you have the French handwriting and basic capabilities installed, you can't remove the basic capability. This will fail.</p></td>
<td align="left">DISM.exe /Online /Remove-Capability /CapabilityName:Language.Basic~~~en-US~0.0.1.0</td>
</tr>
</tbody>
</table>

 

## <span id="Capabilities_reference"></span><span id="capabilities_reference"></span><span id="CAPABILITIES_REFERENCE"></span>Capabilities reference


### <span id="DOTNET"></span><span id="dotnet"></span> .NET Framework  

| Component | Description                                                             |
|-----------|-------------------------------------------------------------------------|
| NetFx3    | .NET 3.x Framework, a software framework required by many applications. |

 

### <span id="language_capabilities"></span><span id="Language_capabilities"></span> Language capabilities

Not all capabilities are available for every language.

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
<p>Required for some regions to render text that appears in documents. Example, th-TH requires the Thai font pack. </p></td>
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
<td align="left">Basic, Text-To-Speech</td>
<td align="left">Recognizes voice input, used by Cortana and Windows Speech Recognition.</td>
</tr>
</tbody>
</table>

### <span id="Fonts"></span><span id="fonts"></span> Font capabilities

When adding languages for some regions, you'll need to add font capabilities.

| Region      | Description                            | Font capability required                              |
|-------------|----------------------------------------|-------------------------------------------------------|
| am-ET       | Amharic                                | Microsoft-Windows-LanguageFeatures-Fonts-Ethi-Package |
| ar-SA       | Arabic (Saudi Arabia)                  | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| ar-SY       | Arabic (Syria)                         | Microsoft-Windows-LanguageFeatures-Fonts-Syrc-Package |
| as-IN       | Assamese                               | Microsoft-Windows-LanguageFeatures-Fonts-Beng-Package |
| bn-BD       | Bangla (Bangladesh)                    | Microsoft-Windows-LanguageFeatures-Fonts-Beng-Package |
| bn-IN       | Bangla (India)                         | Microsoft-Windows-LanguageFeatures-Fonts-Beng-Package |
| chr-Cher-US | Cherokee (Cherokee)                    | Microsoft-Windows-LanguageFeatures-Fonts-Cher-Package |
| fa-IR       | Persian                                | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| gu-IN       | Gujarati                               | Microsoft-Windows-LanguageFeatures-Fonts-Gujr-Package |
| he-IL       | Hebrew                                 | Microsoft-Windows-LanguageFeatures-Fonts-Hebr-Package |
| hi-IN       | Hindi                                  | Microsoft-Windows-LanguageFeatures-Fonts-Deva-Package |
| ja-JP       | Japanese                               | Microsoft-Windows-LanguageFeatures-Fonts-Jpan-Package |
| km-KH       | Khmer                                  | Microsoft-Windows-LanguageFeatures-Fonts-Khmr-Package |
| kn-IN       | Kannada                                | Microsoft-Windows-LanguageFeatures-Fonts-Knda-Package |
| kok-IN      | Konkani                                | Microsoft-Windows-LanguageFeatures-Fonts-Deva-Package |
| ko-KR       | Korean                                 | Microsoft-Windows-LanguageFeatures-Fonts-Kore-Package |
| ku-Arab-IQ  | Central Kurdish (Arabic)               | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| lo-LA       | Lao                                    | Microsoft-Windows-LanguageFeatures-Fonts-Laoo-Package |
| ml-IN       | Malayalam                              | Microsoft-Windows-LanguageFeatures-Fonts-Mlym-Package |
| mr-IN       | Marathi                                | Microsoft-Windows-LanguageFeatures-Fonts-Deva-Package |
| ne-NP       | Nepali                                 | Microsoft-Windows-LanguageFeatures-Fonts-Deva-Package |
| or-IN       | Odia                                   | Microsoft-Windows-LanguageFeatures-Fonts-Orya-Package |
| pa-Arab-PK  | Punjabi (Arabic)                       | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| pa-IN       | Punjabi                                | Microsoft-Windows-LanguageFeatures-Fonts-Guru-Package |
| prs-AF      | Dari                                   | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| sd-Arab-PK  | Sindhi (Arabic)                        | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| si-LK       | Sinhala                                | Microsoft-Windows-LanguageFeatures-Fonts-Sinh-Package |
| syr-SY      | Syriac                                 | Microsoft-Windows-LanguageFeatures-Fonts-Syrc-Package |
| ta-IN       | Tamil                                  | Microsoft-Windows-LanguageFeatures-Fonts-Taml-Package |
| te-IN       | Telugu                                 | Microsoft-Windows-LanguageFeatures-Fonts-Telu-Package |
| th-TH       | Thai                                   | Microsoft-Windows-LanguageFeatures-Fonts-Thai-Package |
| ti-ET       | Tigrinya                               | Microsoft-Windows-LanguageFeatures-Fonts-Ethi-Package |
| ug-CN       | Uyghur                                 | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| ur-PK       | Urdu                                   | Microsoft-Windows-LanguageFeatures-Fonts-Arab-Package |
| zh-CN       | Chinese (Simplified)                   | Microsoft-Windows-LanguageFeatures-Fonts-Hans-Package |
| zh-TW       | Chinese Traditional (Hong Kong, Macau and Taiwan)          | Microsoft-Windows-LanguageFeatures-Fonts-Hant-Package |

### <span id="Additional_fonts"></span><span id="additional_fonts"></span> Additional fonts available:

These fonts are optional and not required for any region.

| Name                                                                          | Description                                                                                                                                         |
|-------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Microsoft-Windows-LanguageFeatures-Fonts-PanEuropeanSupplementalFonts-Package | Pan-European Supplemental Fonts. Includes additional fonts: Arial Nova, Georgia Pro, Gill Sans Nova, Neue Haas Grotesk, Rockwell Nova, Verdana Pro. |

### <span id="Region_requirements"></span><span id="region_requirements"></span> Other region-specific requirements

| Region | Description                   | Capability                                             | Description                                                                                                            |
|--------|-------------------------------|--------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| zh-TW  | Chinese (Traditional, Taiwan) | Microsoft-Windows-InternationalFeatures-Taiwan-Package | Supplemental support for Taiwan date formatting requirements. Package will be provided to customers located in Taiwan. |

### List of all language-related features on demand
[Download the list of all available language FODs](http://download.microsoft.com/download/0/A/A/0AA4342D-3933-4216-A90D-3BA8392FB1D1/Windows 10 1703 FOD to LP Mapping Table.xlsx)

## <span id="related_topics"></span>Related topics

[Add Language Packs to Windows](add-language-packs-to-windows.md)

[DISM Capabilities Package Servicing Command-Line Options](dism-capabilities-package-servicing-command-line-options.md)

