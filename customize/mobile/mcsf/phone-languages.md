---
title: Mobile device languages
description: Partners must select the set of available languages to include on the mobile device. Partners must also specify one of the included languages as the default device language.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f2212446-efe0-45b6-b4ec-9419a1dc9258
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mobile device languages


Partners must select the set of available languages to include on the mobile device. Partners must also specify one of the included languages as the default device language.

Windows 10 Mobile provides support for many languages. See the detailed list in this topic for more information.

**Limitations and restrictions**:

-   Partners must include at least one device language.

-   Microsoft recommends that OEMs include all of the supported device languages, but the OEM must abide by the space limitations for the partition layout.

-   Partners cannot modify existing languages or add support for their own.

For more information about language customizations, see the overview [Set languages and locales](set-languages-and-locales.md).

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
To modify the list of device languages, you must edit the **UserInterface** section in the OEMInput.xml file before building the device image.

The following device languages are supported.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Device language</th>
<th>Value to use in the OEMInput.xml file</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Afrikaans</p></td>
<td><p>af-ZA</p></td>
</tr>
<tr class="even">
<td><p>Albanian</p></td>
<td><p>sq-AL</p></td>
</tr>
<tr class="odd">
<td><p>Amharic</p></td>
<td><p>am-ET</p></td>
</tr>
<tr class="even">
<td><p>Arabic</p></td>
<td><p>ar-SA</p></td>
</tr>
<tr class="odd">
<td><p>Azerbaijani (Latin)</p></td>
<td><p>az-Latn-AZ</p></td>
</tr>
<tr class="even">
<td><p>Bangla</p></td>
<td><p>bn-BD</p></td>
</tr>
<tr class="odd">
<td><p>Basque (Basque)</p></td>
<td><p>eu-ES</p></td>
</tr>
<tr class="even">
<td><p>Belarusian</p></td>
<td><p>be-BY</p></td>
</tr>
<tr class="odd">
<td><p>Bulgarian</p></td>
<td><p>bg-BG</p></td>
</tr>
<tr class="even">
<td><p>Catalan</p></td>
<td><p>ca-ES</p></td>
</tr>
<tr class="odd">
<td><p>Chinese (Simplified)</p></td>
<td><p>zh-CN</p></td>
</tr>
<tr class="even">
<td><p>Chinese (Traditional)</p></td>
<td><p>zh-TW</p></td>
</tr>
<tr class="odd">
<td><p>Croatian</p></td>
<td><p>hr-HR</p></td>
</tr>
<tr class="even">
<td><p>Czech</p></td>
<td><p>cs-CZ</p></td>
</tr>
<tr class="odd">
<td><p>Danish</p></td>
<td><p>da-DK</p></td>
</tr>
<tr class="even">
<td><p>Dutch</p></td>
<td><p>nl-NL</p></td>
</tr>
<tr class="odd">
<td><p>English (United Kingdom)</p></td>
<td><p>en-GB</p></td>
</tr>
<tr class="even">
<td><p>English (United States)</p></td>
<td><p>en-US</p></td>
</tr>
<tr class="odd">
<td><p>Estonian</p></td>
<td><p>et-EE</p></td>
</tr>
<tr class="even">
<td><p>Filipino</p></td>
<td><p>fil-PH</p></td>
</tr>
<tr class="odd">
<td><p>Finnish</p></td>
<td><p>fi-FI</p></td>
</tr>
<tr class="even">
<td><p>French (Canada)</p></td>
<td><p>fr-CA</p></td>
</tr>
<tr class="odd">
<td><p>French (France)</p></td>
<td><p>fr-FR</p></td>
</tr>
<tr class="even">
<td><p>Galician</p></td>
<td><p>gl-ES</p></td>
</tr>
<tr class="odd">
<td><p>German</p></td>
<td><p>de-DE</p></td>
</tr>
<tr class="even">
<td><p>Greek</p></td>
<td><p>el-GR</p></td>
</tr>
<tr class="odd">
<td><p>Hausa (Latin)</p></td>
<td><p>ha-Latn-NG</p></td>
</tr>
<tr class="even">
<td><p>Hebrew</p></td>
<td><p>he-IL</p></td>
</tr>
<tr class="odd">
<td><p>Hindi</p></td>
<td><p>hi-IN</p></td>
</tr>
<tr class="even">
<td><p>Hungarian</p></td>
<td><p>hu-HU</p></td>
</tr>
<tr class="odd">
<td><p>Icelandic</p></td>
<td><p>is-IS</p></td>
</tr>
<tr class="even">
<td><p>Indonesian</p></td>
<td><p>id-ID</p></td>
</tr>
<tr class="odd">
<td><p>Italian</p></td>
<td><p>it-IT</p></td>
</tr>
<tr class="even">
<td><p>Japanese</p></td>
<td><p>ja-JP</p></td>
</tr>
<tr class="odd">
<td><p>Kannada</p></td>
<td><p>kn-IN</p></td>
</tr>
<tr class="even">
<td><p>Kazakh</p></td>
<td><p>kk-KZ</p></td>
</tr>
<tr class="odd">
<td><p>Khmer</p></td>
<td><p>km-KH</p></td>
</tr>
<tr class="even">
<td><p>Korean</p></td>
<td><p>ko-KR</p></td>
</tr>
<tr class="odd">
<td><p>Lao</p></td>
<td><p>lo-LA</p></td>
</tr>
<tr class="even">
<td><p>Latvian</p></td>
<td><p>lv-LV</p></td>
</tr>
<tr class="odd">
<td><p>Lithuanian</p></td>
<td><p>lt-LT</p></td>
</tr>
<tr class="even">
<td><p>Macedonian</p></td>
<td><p>mk-MK</p></td>
</tr>
<tr class="odd">
<td><p>Malay</p></td>
<td><p>ms-MY</p></td>
</tr>
<tr class="even">
<td><p>Malayalam</p></td>
<td><p>ml-IN</p></td>
</tr>
<tr class="odd">
<td><p>Norwegian (Bokmål)</p></td>
<td><p>nb-NO</p></td>
</tr>
<tr class="even">
<td><p>Persian</p></td>
<td><p>fa-IR</p></td>
</tr>
<tr class="odd">
<td><p>Polish</p></td>
<td><p>pl-PL</p></td>
</tr>
<tr class="even">
<td><p>Portuguese (Brazil)</p></td>
<td><p>pt-BR</p></td>
</tr>
<tr class="odd">
<td><p>Portuguese (Portugal)</p></td>
<td><p>pt-PT</p></td>
</tr>
<tr class="even">
<td><p>Romanian</p></td>
<td><p>ro-RO</p></td>
</tr>
<tr class="odd">
<td><p>Russian</p></td>
<td><p>ru-RU</p></td>
</tr>
<tr class="even">
<td><p>Serbian (Latin)</p></td>
<td><p>sr-Latn-RS</p></td>
</tr>
<tr class="odd">
<td><p>Slovak</p></td>
<td><p>sk-SK</p></td>
</tr>
<tr class="even">
<td><p>Slovenian</p></td>
<td><p>sl-SI</p></td>
</tr>
<tr class="odd">
<td><p>Spanish (Mexico)</p></td>
<td><p>es-MX</p></td>
</tr>
<tr class="even">
<td><p>Spanish (Spain)</p></td>
<td><p>es-ES</p></td>
</tr>
<tr class="odd">
<td><p>Swahili</p></td>
<td><p>sw-KE</p></td>
</tr>
<tr class="even">
<td><p>Swedish</p></td>
<td><p>sv-SE</p></td>
</tr>
<tr class="odd">
<td><p>Tamil</p></td>
<td><p>ta-IN</p></td>
</tr>
<tr class="even">
<td><p>Telugu</p></td>
<td><p>te-IN</p></td>
</tr>
<tr class="odd">
<td><p>Thai</p></td>
<td><p>th-TH</p></td>
</tr>
<tr class="even">
<td><p>Turkish</p></td>
<td><p>tr-TR</p></td>
</tr>
<tr class="odd">
<td><p>Ukrainian</p></td>
<td><p>uk-UA</p></td>
</tr>
<tr class="even">
<td><p>Uzbek (Latin)</p></td>
<td><p>uz-Latn-UZ</p></td>
</tr>
<tr class="odd">
<td><p>Vietnamese</p></td>
<td><p>vi-VN</p></td>
</tr>
</tbody>
</table>

 

-   **List of included device languages:** OEMs must include at least one device language. To include multiple device languages, add additional `Language` entries to the `UserInterface` section of the OEMInput.xml file. In the following example, English (US), Japanese, and Dutch are included as device languages.

    ``` syntax
      <SupportedLanguages>
        <UserInterface>
          <Language>en-US</Language>
          <Language>ja-JP</Language>
          <Language>nl-NL</Language>
        </UserInterface>
        <Keyboard>
          <Language>en-US</Language>
        </Keyboard>
        <Speech>
          <Language>en-US</Language>
        </Speech>
      </SupportedLanguages>
    ```

-   **Default device language:** to define the default device language that the device will use when it is first turned on by the user, OEMs must define both a default device language and a default regional format. Both values must be specified in the OEMInput.xml file before building the device image.

    To specify the default device language, edit the **BootUILanguage** entry in OEMInput.xml. This value must match one of your **Language** entries from the **UserInterface** section.

    To specify the default regional format, edit the **BootLocale** entry in OEMInput.xml.

    Expanding on the previous example, the following shows how to set Japanese as the default device language (**BootUILanguage**) and set the default regional format (**BootLocale**) to Japan.

    **Note**  
    Note that these two paired values either have to be the same or they must be associated. For more information, see the recommended values shown in the table in [Set languages and locales](set-languages-and-locales.md).

     

    ``` syntax
      <SupportedLanguages>
        <UserInterface>
          <Language>en-US</Language>
          <Language>ja-JP</Language>
          <Language>nl-NL</Language>
        </UserInterface>
        <Keyboard>
          <Language>en-US</Language>
        </Keyboard>
        <Speech>
          <Language>en-US</Language>
        </Speech>
      </SupportedLanguages>
      <BootUILanguage>ja-JP</BootUILanguage>
      <BootLocale>ja-JP</BootLocale>
    ```

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  During initial device setup, do not change the device language.

3.  Go to the **Language** screen in **Settings** &gt; **Time & language**.

4.  Look at the language list and verify that the default language is correct.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Mobile%20device%20languages%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




