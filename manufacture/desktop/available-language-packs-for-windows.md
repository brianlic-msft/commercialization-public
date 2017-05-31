---
author: Justinha
Description: Available Language Packs for Windows
ms.assetid: ad33ff13-9777-4a97-a6b8-f4de0fda5a0c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Available Language Packs for Windows
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Available Language Packs for Windows


The following tables show the supported language packs and language interface packs (LIPs) for Windows. Language packs are available for Windows 10, Windows Server 2016, and Windows Server 2012 R2. LIPs are available for Windows 10, but are not available for Windows Server. For more information, see [Language packs](https://support.microsoft.com/help/14236/language-packs#lptabs=win10).

Windows Server and Windows 10 language packs are not interchangeable. Windows Server language packs cannot be used on Windows 10, and Windows 10 language packs cannot be used on Windows Server.

LIPs must be installed to the operating system that they support. Windows 10 LIPs cannot be used on Windows 8.1; similarly, Windows 8.1 LIPs cannot be used on Windows 10.

OEMs and system builders with Microsoft Software License Terms can get language packs and LIPs from the [Microsoft OEM](http://go.microsoft.com/fwlink/?LinkId=131359) site and [OEM Partner Center](http://go.microsoft.com/fwlink/?LinkId=131358).

For a complete list of supported languages and locales, see [Locale Identifier Constants and Strings](https://msdn.microsoft.com/en-us/library/dd318693(v=vs.85).aspx).

For a complete list of available language features on demand, see [Available language FODs](http://download.microsoft.com/download/8/3/0/830AC3A9-68CF-4F10-9357-F27E0A03148A/Windows 10 1607 FOD to LP Mapping Table.xlsx)

To learn more, see [Add Language Packs to Windows](add-language-packs-to-windows.md).

## <span id="Supported_Language_Packs_and_Language_Interface_Packs"></span><span id="supported_language_packs_and_language_interface_packs"></span><span id="SUPPORTED_LANGUAGE_PACKS_AND_LANGUAGE_INTERFACE_PACKS"></span>Supported Language Packs and Language Interface Packs


The following tables include these settings:

- **Language/region**. The name of the language that will be displayed in the UI. All 38 language packs are available for Windows 10 and Windows Server 2016. In Windows Server 2012 the user interface (UI) is localized only for the 18 languages listed in bold.
- **Language/region tag**. The language identifier based on the language tagging conventions of RFC 3066. This setting is used with the Deployment Image Servicing and Management (DISM) tool, or in an unattended answer file.
- **Language/region ID**. The hexadecimal representation of the language identifier. This setting is used with the keyboard identifier when specifying an input method using DISM.
- **Language/region decimal identifier**.The decimal representation of the language identifier. This setting is used in Oobe.xml.

### <span id="Language_Packs"></span><span id="language_packs"></span><span id="LANGUAGE_PACKS"></span>Language Packs

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Language/region</th>
<th align="left">Language/region tag</th>
<th align="left">Language/region ID</th>
<th align="left">Language/region decimal ID</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Arabic (Saudi Arabia)</p></td>
<td align="left"><p>ar-SA</p></td>
<td align="left"><p>0x0401</p></td>
<td align="left"><p>1025</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bulgarian (Bulgaria)</p></td>
<td align="left"><p>bg-BG</p></td>
<td align="left"><p>0x0402</p></td>
<td align="left"><p>1026</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Chinese (Hong Kong SAR)</p></td>
<td align="left"><p>zh-HK</p>
<div class="alert">
<strong>Note</strong>  No longer used. See zh-TW.
</div>
<div>
</div></td>
<td align="left"><p>0x0c04</p></td>
<td align="left"><p>3076</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Chinese (PRC)**</p></td>
<td align="left"><p>zh-CN</p></td>
<td align="left"><p>0x0804</p></td>
<td align="left"><p>2052</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Chinese (Taiwan)**</p></td>
<td align="left"><p>zh-TW</p></td>
<td align="left"><p>0x0404</p></td>
<td align="left"><p>1028</p></td>
</tr>
<tr class="even">
<td align="left"><p>Croatian (Croatia)</p></td>
<td align="left"><p>hr-HR</p></td>
<td align="left"><p>0x041a</p></td>
<td align="left"><p>1050</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Czech (Czech Republic)**</p></td>
<td align="left"><p>cs-CZ</p></td>
<td align="left"><p>0x0405</p></td>
<td align="left"><p>1029</p></td>
</tr>
<tr class="even">
<td align="left"><p>Danish (Denmark)</p></td>
<td align="left"><p>da-DK</p></td>
<td align="left"><p>0x0406</p></td>
<td align="left"><p>1030</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Dutch (Netherlands)**</p></td>
<td align="left"><p>nl-NL</p></td>
<td align="left"><p>0x0413</p></td>
<td align="left"><p>1043</p></td>
</tr>
<tr class="even">
<td align="left"><p>**English (United States)**</p></td>
<td align="left"><p>en-US</p></td>
<td align="left"><p>0x0409</p></td>
<td align="left"><p>1033</p></td>
</tr>
<tr class="odd">
<td align="left"><p>English (United Kingdom)</p></td>
<td align="left"><p>en-GB</p></td>
<td align="left"><p>0x0809</p></td>
<td align="left"><p>2057</p></td>
</tr>
<tr class="even">
<td align="left"><p>Estonian (Estonia)</p></td>
<td align="left"><p>et-EE</p></td>
<td align="left"><p>0x0425</p></td>
<td align="left"><p>1061</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Finnish (Finland)</p></td>
<td align="left"><p>fi-FI</p></td>
<td align="left"><p>0x040b</p></td>
<td align="left"><p>1035</p></td>
</tr>
<tr class="even">
<td align="left"><p>French (Canada)</p></td>
<td align="left"><p>fr-CA</p></td>
<td align="left"><p>0x0c0c</p></td>
<td align="left"><p>3084</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**French (France)**</p></td>
<td align="left"><p>fr-FR</p></td>
<td align="left"><p>0x040c</p></td>
<td align="left"><p>1036</p></td>
</tr>
<tr class="even">
<td align="left"><p>**German (Germany)**</p></td>
<td align="left"><p>de-DE</p></td>
<td align="left"><p>0x0407</p></td>
<td align="left"><p>1031</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Greek (Greece)</p></td>
<td align="left"><p>el-GR</p></td>
<td align="left"><p>0x0408</p></td>
<td align="left"><p>1032</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hebrew (Israel)</p></td>
<td align="left"><p>he-IL</p></td>
<td align="left"><p>0x040d</p></td>
<td align="left"><p>1037</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Hungarian (Hungary)**</p></td>
<td align="left"><p>hu-HU</p></td>
<td align="left"><p>0x040e</p></td>
<td align="left"><p>1038</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Italian (Italy)**</p></td>
<td align="left"><p>it-IT</p></td>
<td align="left"><p>0x0410</p></td>
<td align="left"><p>1040</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Japanese (Japan)**</p></td>
<td align="left"><p>ja-JP</p></td>
<td align="left"><p>0x0411</p></td>
<td align="left"><p>1041</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Korean (Korea)**</p></td>
<td align="left"><p>ko-KR</p></td>
<td align="left"><p>0x0412</p></td>
<td align="left"><p>1042</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Latvian (Latvia)</p></td>
<td align="left"><p>lv-LV</p></td>
<td align="left"><p>0x0426</p></td>
<td align="left"><p>1062</p></td>
</tr>
<tr class="even">
<td align="left"><p>Lithuanian (Lithuania)</p></td>
<td align="left"><p>lt-LT</p></td>
<td align="left"><p>0x0427</p></td>
<td align="left"><p>1063</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Norwegian, Bokmål (Norway)</p></td>
<td align="left"><p>nb-NO</p></td>
<td align="left"><p>0x0414</p></td>
<td align="left"><p>1044</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Polish (Poland)**</p></td>
<td align="left"><p>pl-PL</p></td>
<td align="left"><p>0x0415</p></td>
<td align="left"><p>1045</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Portuguese (Brazil)**</p></td>
<td align="left"><p>pt-BR</p></td>
<td align="left"><p>0x0416</p></td>
<td align="left"><p>1046</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Portuguese (Portugal)**</p></td>
<td align="left"><p>pt-PT</p></td>
<td align="left"><p>0x0816</p></td>
<td align="left"><p>2070</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Romanian (Romania)</p></td>
<td align="left"><p>ro-RO</p></td>
<td align="left"><p>0x0418</p></td>
<td align="left"><p>1048</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Russian (Russia)**</p></td>
<td align="left"><p>ru-RU</p></td>
<td align="left"><p>0x0419</p></td>
<td align="left"><p>1049</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian (Latin, Serbia)</p></td>
<td align="left"><p>sr-Latn-CS</p>
<div class="alert">
<strong>Note</strong>  No longer used. See sr-Latn-RS.
</div>
<div> 
</div></td>
<td align="left"><p>0x081a</p></td>
<td align="left"><p>2074</p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian (Latin, Serbia)</p></td>
<td align="left"><p>sr-Latn-RS</p></td>
<td align="left"><p>0x241A</p></td>
<td align="left"><p>9242</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Slovak (Slovakia)</p></td>
<td align="left"><p>sk-SK</p></td>
<td align="left"><p>0x041b</p></td>
<td align="left"><p>1051</p></td>
</tr>
<tr class="even">
<td align="left"><p>Slovenian (Slovenia)</p></td>
<td align="left"><p>sl-SI</p></td>
<td align="left"><p>0x0424</p></td>
<td align="left"><p>1060</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish (Mexico)</p></td>
<td align="left"><p>es-MX</p></td>
<td align="left"><p>0x080a</p></td>
<td align="left"><p>2058</p></td>
</tr>
<tr class="even">
<td align="left"><p>**Spanish (Spain)**</p></td>
<td align="left"><p>es-ES</p></td>
<td align="left"><p>0x0c0a</p></td>
<td align="left"><p>3082</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Swedish (Sweden)**</p></td>
<td align="left"><p>sv-SE</p></td>
<td align="left"><p>0x041d</p></td>
<td align="left"><p>1053</p></td>
</tr>
<tr class="even">
<td align="left"><p>Thai (Thailand)</p></td>
<td align="left"><p>th-TH</p></td>
<td align="left"><p>0x041e</p></td>
<td align="left"><p>1054</p></td>
</tr>
<tr class="odd">
<td align="left"><p>**Turkish (Turkey)**</p></td>
<td align="left"><p>tr-TR</p></td>
<td align="left"><p>0x041f</p></td>
<td align="left"><p>1055</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ukrainian (Ukraine)</p></td>
<td align="left"><p>uk-UA</p></td>
<td align="left"><p>0x0422</p></td>
<td align="left"><p>1058</p></td>
</tr>
</tbody>
</table>


### <span id="Language_Interface_Packs__LIPs_"></span><span id="language_interface_packs__lips_"></span><span id="LANGUAGE_INTERFACE_PACKS__LIPS_"></span>Language Interface Packs (LIPs)

Except where noted, the following LIPs are available for Windows 10. For Windows Server, options to change keyboard and regional settings such as currency, time zones, and time/date format are available but LIPs are not available. For more information, see [Language packs](https://support.microsoft.com/help/14236/language-packs#lptabs=win10).

 

<table>
<colgroup>
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Language/region</th>
<th align="left">Language/region tag</th>
<th align="left">Base language/region</th>
<th align="left">Language/region ID</th>
<th align="left">Language/region decimal ID</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Afrikaans (South Africa)</p></td>
<td align="left"><p>af-ZA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0436</p></td>
<td align="left"><p>1078</p></td>
</tr>
<tr class="even">
<td align="left"><p>Albanian (Albania)</p></td>
<td align="left"><p>sq-AL</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x041c</p></td>
<td align="left"><p>1052</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Amharic (Ethiopia)</p></td>
<td align="left"><p>am-ET</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x045e</p></td>
<td align="left"><p>1118</p></td>
</tr>
<tr class="even">
<td align="left"><p>Armenian (Armenia)</p></td>
<td align="left"><p>hy-AM</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, ru-RU</p></td>
<td align="left"><p>0x042b</p></td>
<td align="left"><p>1067</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Assamese (India)</p></td>
<td align="left"><p>as-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x044d</p></td>
<td align="left"><p>1101</p></td>
</tr>
<tr class="even">
<td align="left"><p>Azerbaijan</p></td>
<td align="left"><p>az-Latn-AZ</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, ru-RU</p></td>
<td align="left"><p>0x042c</p></td>
<td align="left"><p>1068</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bangla (Bangladesh)</p></td>
<td align="left"><p>bn-BD</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0845</p></td>
<td align="left"><p>2117</p></td>
</tr>
<tr class="even">
<td align="left"><p>Basque (Basque)</p></td>
<td align="left"><p>eu-ES</p></td>
<td align="left"><p>Primary: es-ES</p>
<p>Secondary: en-GB, en-US, fr-FR</p></td>
<td align="left"><p>0x042d</p></td>
<td align="left"><p>1069</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Belarusian</p></td>
<td align="left"><p>be-BY</p></td>
<td align="left"><p>Primary: ru-RU</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0423</p></td>
<td align="left"><p>1059</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bangla (India)</p></td>
<td align="left"><p>bn-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0445</p></td>
<td align="left"><p>1093</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bosnian (Latin)</p></td>
<td align="left"><p>bs-Latn-BA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, hr-HR, sr-Latn-RS</p>
<p></p></td>
<td align="left"><p>0x141a</p></td>
<td align="left"><p>5146</p></td>
</tr>
<tr class="even">
<td align="left"><p>Catalan</p></td>
<td align="left"><p>ca-ES</p></td>
<td align="left"><p>Primary: es-ES</p>
<p>Secondary: en-GB, en-US, fr-FR</p>
<p></p></td>
<td align="left"><p>0x0403</p></td>
<td align="left"><p>1027</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Central Kurdish</p></td>
<td align="left"><p>ku-ARAB-IQ</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: ar-SA, en-GB</p></td>
<td align="left"><p>0x0492</p></td>
<td align="left"><p>1170</p></td>
</tr>
<tr class="even">
<td align="left"><p>Cherokee</p></td>
<td align="left"><p>chr-CHER-US</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x045c</p></td>
<td align="left"><p>1116</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dari</p></td>
<td align="left"><p>prs-AF</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x048c</p></td>
<td align="left"><p>1164</p></td>
</tr>
<tr class="even">
<td align="left"><p>Filipino</p></td>
<td align="left"><p>fil-PH</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0464</p></td>
<td align="left"><p>1124</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Galician</p></td>
<td align="left"><p>gl-ES</p></td>
<td align="left"><p>Primary: es-ES</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0456</p></td>
<td align="left"><p>1110</p></td>
</tr>
<tr class="even">
<td align="left"><p>Georgian (Georgia)</p></td>
<td align="left"><p>ka-GE</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, ru-RU</p></td>
<td align="left"><p>0x0437</p></td>
<td align="left"><p>1079</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Gujarati (India)</p></td>
<td align="left"><p>gu-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0447</p></td>
<td align="left"><p>1095</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hausa (Latin, Nigeria)</p></td>
<td align="left"><p>ha-Latn-NG</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, fr-FR</p></td>
<td align="left"><p>0x0468</p></td>
<td align="left"><p>1128</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hindi (India)</p></td>
<td align="left"><p>hi-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0439</p></td>
<td align="left"><p>1081</p></td>
</tr>
<tr class="even">
<td align="left"><p>Icelandic (Iceland)</p></td>
<td align="left"><p>is-IS</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x040f</p></td>
<td align="left"><p>1039</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Igbo (Nigeria)</p></td>
<td align="left"><p>ig-NG</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0470</p></td>
<td align="left"><p>1136</p></td>
</tr>
<tr class="even">
<td align="left"><p>Indonesian (Indonesia)</p></td>
<td align="left"><p>id-ID</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0421</p></td>
<td align="left"><p>1057</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Inuktitut (Latin, Canada)</p></td>
<td align="left"><p>iu-Latn-CA</p>
<p>Not available in Windows 10.</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x085d</p></td>
<td align="left"><p>2141</p></td>
</tr>
<tr class="even">
<td align="left"><p>Irish (Ireland)</p></td>
<td align="left"><p>ga-IE</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x083c</p></td>
<td align="left"><p>2108</p></td>
</tr>
<tr class="odd">
<td align="left"><p>isiXhosa (South Africa)</p></td>
<td align="left"><p>xh-ZA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0434</p></td>
<td align="left"><p>1076</p></td>
</tr>
<tr class="even">
<td align="left"><p>isiZulu (South Africa)</p></td>
<td align="left"><p>zu-ZA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0435</p></td>
<td align="left"><p>1077</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Kannada (India)</p></td>
<td align="left"><p>kn-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x044b</p></td>
<td align="left"><p>1099</p></td>
</tr>
<tr class="even">
<td align="left"><p>Kazakh (Kazakhstan)</p></td>
<td align="left"><p>kk-KZ</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, ru-RU</p></td>
<td align="left"><p>0x043f</p></td>
<td align="left"><p>1087</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Khmer (Cambodia)</p></td>
<td align="left"><p>km-KH</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0453</p></td>
<td align="left"><p>1107</p></td>
</tr>
<tr class="even">
<td align="left"><p>K'iche' (Guatemala)</p></td>
<td align="left"><p>quc-Latn-GT</p></td>
<td align="left"><p>Primary: es-MX</p>
<p>Secondary: es-ES, en-US, en-GB</p></td>
<td align="left"><p>0x0486</p></td>
<td align="left"><p>1158</p></td>
</tr>
<tr class="odd">
<td align="left"><p>K'iche' (Guatemala)</p></td>
<td align="left"><p>qut-GT</p>
<p>No longer used.</p></td>
<td align="left"><p>Primary: es-MX</p>
<p>Secondary: es-ES, en-US, en-GB</p></td>
<td align="left"><p>0x0486</p></td>
<td align="left"><p>1158</p></td>
</tr>
<tr class="even">
<td align="left"><p>Kinyarwanda</p></td>
<td align="left"><p>rw-RW</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0487</p></td>
<td align="left"><p>1159</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Kiswahili (Kenya)</p></td>
<td align="left"><p>sw-KE</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0441</p></td>
<td align="left"><p>1089</p></td>
</tr>
<tr class="even">
<td align="left"><p>Konkani (India)</p></td>
<td align="left"><p>kok-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0457</p></td>
<td align="left"><p>1111</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Kyrgyz (Kyrgyzstan)</p></td>
<td align="left"><p>ky-KG</p></td>
<td align="left"><p>Primary: ru-RU</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0440</p></td>
<td align="left"><p>1088</p></td>
</tr>
<tr class="even">
<td align="left"><p>Lao (Laos)</p></td>
<td align="left"><p>lo-LA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0454</p></td>
<td align="left"><p>1108</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Luxembourgish (Luxembourg)</p></td>
<td align="left"><p>lb-LU</p></td>
<td align="left"><p>Primary: fr-FR</p>
<p>Secondary: de-DE, en-GB, en-US</p></td>
<td align="left"><p>0x046e</p></td>
<td align="left"><p>1134</p></td>
</tr>
<tr class="even">
<td align="left"><p>Macedonian (FYROM)</p></td>
<td align="left"><p>mk-MK</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x042f</p></td>
<td align="left"><p>1071</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Malay (Brunei Darussalam)</p></td>
<td align="left"><p>ms-BN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x083e</p></td>
<td align="left"><p>2110</p></td>
</tr>
<tr class="even">
<td align="left"><p>Malay (Malaysia)</p></td>
<td align="left"><p>ms-MY</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x043e</p></td>
<td align="left"><p>1086</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Malayalam (India)</p></td>
<td align="left"><p>ml-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x044c</p></td>
<td align="left"><p>1100</p></td>
</tr>
<tr class="even">
<td align="left"><p>Maltese (Malta)</p></td>
<td align="left"><p>mt-MT</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x043a</p></td>
<td align="left"><p>1082</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Maori (New Zealand)</p></td>
<td align="left"><p>mi-NZ</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0481</p></td>
<td align="left"><p>1153</p></td>
</tr>
<tr class="even">
<td align="left"><p>Marathi (India)</p></td>
<td align="left"><p>mr-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x044e</p></td>
<td align="left"><p>1102</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Mongolian (Cyrillic)</p></td>
<td align="left"><p>mn-MN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, ru-RU</p></td>
<td align="left"><p>0x0450</p></td>
<td align="left"><p>1104</p></td>
</tr>
<tr class="even">
<td align="left"><p>Nepali (Federal Democratic Republic of Nepal)</p></td>
<td align="left"><p>ne-NP</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0461</p></td>
<td align="left"><p>1121</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Norwegian, Nynorsk (Norway)</p></td>
<td align="left"><p>nn-NO</p></td>
<td align="left"><p>Primary: nb-NO</p>
<p>Secondary: en-GB, en-US</p>
<p></p></td>
<td align="left"><p>0x0814</p></td>
<td align="left"><p>2068</p></td>
</tr>
<tr class="even">
<td align="left"><p>Odia (India)</p></td>
<td align="left"><p>or-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0448</p></td>
<td align="left"><p>1096</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Persian</p></td>
<td align="left"><p>fa-IR</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0429</p></td>
<td align="left"><p>1065</p></td>
</tr>
<tr class="even">
<td align="left"><p>Punjabi (India)</p></td>
<td align="left"><p>pa-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0446</p></td>
<td align="left"><p>1094</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Punjabi (Arabic)</p></td>
<td align="left"><p>pa-Arab-PK</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0846</p></td>
<td align="left"><p>2118</p></td>
</tr>
<tr class="even">
<td align="left"><p>Quechua (Peru)</p></td>
<td align="left"><p>quz-PE</p></td>
<td align="left"><p>Primary: es-MX</p>
<p>Secondary: es-ES, en-GB, en-US</p></td>
<td align="left"><p>0x0c6b</p></td>
<td align="left"><p>3179</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Scottish Gaelic</p></td>
<td align="left"><p>gd-GB</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0491</p></td>
<td align="left"><p>1169</p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian (Cyrillic, Bosnia and Herzegovina)</p></td>
<td align="left"><p>sr-Cyrl-BA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, sr-Latn-RS</p></td>
<td align="left"><p>0x1C1A</p></td>
<td align="left"><p>7194</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian (Cyrillic, Serbia)</p></td>
<td align="left"><p>sr-Cyrl-CS</p>
<div class="alert">
<strong>Note</strong>  No longer used. See sr-Latn-RS.
</div>
<div>
 
</div></td>
<td align="left"><p>Primary: sr-Latn-CS</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0c1a</p></td>
<td align="left"><p>3098</p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian (Cyrillic, Serbia)</p></td>
<td align="left"><p>sr-Cyrl-RS</p></td>
<td align="left"><p>Primary: sr-Latn-RS</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x281A</p></td>
<td align="left"><p>10266</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sesotho sa Leboa (South Africa)</p></td>
<td align="left"><p>nso-ZA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x046c</p></td>
<td align="left"><p>1132</p></td>
</tr>
<tr class="even">
<td align="left"><p>Setswana (South Africa)</p></td>
<td align="left"><p>tn-ZA</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0432</p></td>
<td align="left"><p>1074</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sindhi (Arabic)</p></td>
<td align="left"><p>Ad-Arab-PK</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0859</p></td>
<td align="left"><p>2137</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sinhala (Sri Lanka)</p></td>
<td align="left"><p>si-LK</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x045b</p></td>
<td align="left"><p>1115</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tajik (Cyrillic)</p></td>
<td align="left"><p>tg-Cyrl-TJ</p></td>
<td align="left"><p>Primary: ru-RU</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0428</p></td>
<td align="left"><p>1064</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tamil (India)</p></td>
<td align="left"><p>ta-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0449</p></td>
<td align="left"><p>1097</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tatar (Russia)</p></td>
<td align="left"><p>tt-RU</p></td>
<td align="left"><p>Primary: ru-RU</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0444</p></td>
<td align="left"><p>1092</p></td>
</tr>
<tr class="even">
<td align="left"><p>Telugu (India)</p></td>
<td align="left"><p>te-IN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x044a</p></td>
<td align="left"><p>1098</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tigrinya</p></td>
<td align="left"><p>ti-ET</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0473</p></td>
<td align="left"><p>1139</p></td>
</tr>
<tr class="even">
<td align="left"><p>Turkmen</p></td>
<td align="left"><p>tk-TM</p></td>
<td align="left"><p>Primary: ru-RU</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0442</p></td>
<td align="left"><p>1090</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Urdu</p></td>
<td align="left"><p>ur-PK</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0420</p></td>
<td align="left"><p>1056</p></td>
</tr>
<tr class="even">
<td align="left"><p>Uyghur</p></td>
<td align="left"><p>ug-CN</p></td>
<td align="left"><p>Primary: zh-CN</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0480</p></td>
<td align="left"><p>1152</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Uzbek (Latin)</p></td>
<td align="left"><p>uz-Latn-UZ</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB, ru-RU</p></td>
<td align="left"><p>0x0443</p></td>
<td align="left"><p>1091</p></td>
</tr>
<tr class="even">
<td align="left"><p>Valencian</p></td>
<td align="left"><p>ca-ES-valencia</p></td>
<td align="left"><p>Primary: es-ES</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0803</p></td>
<td align="left"><p>2051</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Vietnamese</p></td>
<td align="left"><p>vi-VN</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x042a</p></td>
<td align="left"><p>1066</p></td>
</tr>
<tr class="even">
<td align="left"><p>Welsh (Great Britain)</p></td>
<td align="left"><p>cy-GB</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x0452</p></td>
<td align="left"><p>1106</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Wolof</p></td>
<td align="left"><p>wo-SN</p></td>
<td align="left"><p>Primary: fr-FR</p>
<p>Secondary: en-GB, en-US</p></td>
<td align="left"><p>0x0488</p></td>
<td align="left"><p>1160</p></td>
</tr>
<tr class="even">
<td align="left"><p>Yoruba (Nigeria)</p></td>
<td align="left"><p>yo-NG</p></td>
<td align="left"><p>Primary: en-US</p>
<p>Secondary: en-GB</p></td>
<td align="left"><p>0x046a</p></td>
<td align="left"><p>1130</p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Add Language Packs to Windows](add-language-packs-to-windows.md)

[Windows Language Pack Default Values](windows-language-pack-default-values.md)

[Default Input Locales for Windows Language Packs](default-input-locales-for-windows-language-packs.md)

 

 






