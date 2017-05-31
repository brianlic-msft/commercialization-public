---
author: Justinha
Description: 'Use keyboard identifiers and Input Method Editors (IMEs) identify the keyboard type.'
ms.assetid: 8a5739fa-36a6-4b21-8cdb-5d18843633a2
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Keyboard Identifiers and Input Method Editors for Windows
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

#  Keyboard Identifiers and Input Method Editors for Windows


Use keyboard identifiers and Input Method Editors (IMEs) identify the keyboard type.

## <span id="Keyboard_identifiers"></span><span id="keyboard_identifiers"></span><span id="KEYBOARD_IDENTIFIERS"></span>Keyboard identifiers


The following table lists keyboard identifiers that are available for Windows. You can also install support for additional keyboard types. The valid keyboards that can be configured for your device are listed in the registry key: **HKEY\_LOCAL\_MACHINE\\SYSTEM\\ControlSet001\\Control\\Keyboard Layouts**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Keyboard</th>
<th align="left">Keyboard identifier (hexadecimal)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Albanian</p></td>
<td align="left"><p>0x0000041c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic (101)</p></td>
<td align="left"><p>0x00000401</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Arabic (102)</p></td>
<td align="left"><p>0x00010401</p></td>
</tr>
<tr class="even">
<td align="left"><p>Arabic (102) AZERTY</p></td>
<td align="left"><p>0x00020401</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Armenian Eastern</p></td>
<td align="left"><p>0x0000042b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Armenian Phonetic</p></td>
<td align="left"><p>0x0002042b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Armenian Typewriter</p></td>
<td align="left"><p>0x0003042b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Armenian Western</p></td>
<td align="left"><p>0x0001042b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Assamese - Inscript</p></td>
<td align="left"><p>0x0000044d</p></td>
</tr>
<tr class="even">
<td align="left"><p>Azerbaijani (Standard)</p></td>
<td align="left"><p>0x0001042c</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Azerbaijani Cyrillic</p></td>
<td align="left"><p>0x0000082c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Azerbaijani Latin</p></td>
<td align="left"><p>0x0000042c</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bashkir</p></td>
<td align="left"><p>0x0000046d</p></td>
</tr>
<tr class="even">
<td align="left"><p>Belarusian</p></td>
<td align="left"><p>0x00000423</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Belgian (Comma)</p></td>
<td align="left"><p>0x0001080c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Belgian (Period)</p></td>
<td align="left"><p>0x00000813</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Belgian French</p></td>
<td align="left"><p>0x0000080c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bangla (Bangladesh)</p></td>
<td align="left"><p>0x00000445</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bangla (India)</p></td>
<td align="left"><p>0x00020445</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bangla (India - Legacy)</p></td>
<td align="left"><p>0x00010445</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bosnian (Cyrillic)</p></td>
<td align="left"><p>0x0000201a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Buginese</p></td>
<td align="left"><p>0x000b0c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bulgarian</p></td>
<td align="left"><p>0x0030402</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bulgarian (Latin)</p></td>
<td align="left"><p>0x00010402</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bulgarian (phonetic layout)</p></td>
<td align="left"><p>0x00020402</p></td>
</tr>
<tr class="even">
<td align="left"><p>Bulgarian (phonetic traditional)</p></td>
<td align="left"><p>0x00040402</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Bulgarian (Typewriter)</p></td>
<td align="left"><p>0x00000402</p></td>
</tr>
<tr class="even">
<td align="left"><p>Canadian French</p></td>
<td align="left"><p>0x00001009</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Canadian French (Legacy)</p></td>
<td align="left"><p>0x00000c0c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Canadian Multilingual Standard</p></td>
<td align="left"><p>0x00011009</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Central Atlas Tamazight</p></td>
<td align="left"><p>0x0000085f</p></td>
</tr>
<tr class="even">
<td align="left"><p>Central Kurdish</p></td>
<td align="left"><p>0x00000429</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Cherokee Nation</p></td>
<td align="left"><p>0x0000045c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Cherokee Nation Phonetic</p></td>
<td align="left"><p>0x0001045c</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Chinese (Simplified) - US Keyboard</p></td>
<td align="left"><p>0x00000804</p></td>
</tr>
<tr class="even">
<td align="left"><p>Chinese (Traditional) - US Keyboard</p></td>
<td align="left"><p>0x00000404</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Chinese (Traditional, Hong Kong S.A.R.)</p></td>
<td align="left"><p>0x00000c04</p></td>
</tr>
<tr class="even">
<td align="left"><p>Chinese (Traditional Macao S.A.R.) US Keyboard</p></td>
<td align="left"><p>0x00001404</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Chinese (Simplified, Singapore) - US keyboard</p></td>
<td align="left"><p>0x00001004</p></td>
</tr>
<tr class="even">
<td align="left"><p>Croatian</p></td>
<td align="left"><p>0x0000041a</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Czech</p></td>
<td align="left"><p>0x00000405</p></td>
</tr>
<tr class="even">
<td align="left"><p>Czech (QWERTY)</p></td>
<td align="left"><p>0x00010405</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Czech Programmers</p></td>
<td align="left"><p>0x00020405</p></td>
</tr>
<tr class="even">
<td align="left"><p>Danish</p></td>
<td align="left"><p>0x00000406</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Devanagari-INSCRIPT</p></td>
<td align="left"><p>0x00000439</p></td>
</tr>
<tr class="even">
<td align="left"><p>Divehi Phonetic</p></td>
<td align="left"><p>0x00000465</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Divehi Typewriter</p></td>
<td align="left"><p>0x00010465</p></td>
</tr>
<tr class="even">
<td align="left"><p>Dutch</p></td>
<td align="left"><p>0x00000413</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dzongkha</p></td>
<td align="left"><p>0x00000C51</p></td>
</tr>
<tr class="even">
<td align="left"><p>Estonian</p></td>
<td align="left"><p>0x00000425</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Faeroese</p></td>
<td align="left"><p>0x00000438</p></td>
</tr>
<tr class="even">
<td align="left"><p>Finnish</p></td>
<td align="left"><p>0x0000040b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Finnish with Sami</p></td>
<td align="left"><p>0x0001083b</p></td>
</tr>
<tr class="even">
<td align="left"><p>French</p></td>
<td align="left"><p>0x0000040c</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Futhark</p></td>
<td align="left"><p>0x00120c00</p></td>
</tr>
<tr class="even">
<td align="left"><p>Georgian</p></td>
<td align="left"><p>0x00000437</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Georgian (Ergonomic)</p></td>
<td align="left"><p>0x00020437</p></td>
</tr>
<tr class="even">
<td align="left"><p>Georgian (QWERTY)</p></td>
<td align="left"><p>0x00010437</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Georgian Ministry of Education and Science Schools</p></td>
<td align="left"><p>0x00030437</p></td>
</tr>
<tr class="even">
<td align="left"><p>Georgian (Old Alphabets)</p></td>
<td align="left"><p>0x00040437</p></td>
</tr>
<tr class="odd">
<td align="left"><p>German</p></td>
<td align="left"><p>0x00000407</p></td>
</tr>
<tr class="even">
<td align="left"><p>German (IBM)</p></td>
<td align="left"><p>0x00010407</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Gothic</p></td>
<td align="left"><p>0x000c0c00</p></td>
</tr>
<tr class="even">
<td align="left"><p>Greek</p></td>
<td align="left"><p>0x00000408</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Greek (220)</p></td>
<td align="left"><p>0x00010408</p></td>
</tr>
<tr class="even">
<td align="left"><p>Greek (220) Latin</p></td>
<td align="left"><p>0x00030408</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Greek (319)</p></td>
<td align="left"><p>0x00020408</p></td>
</tr>
<tr class="even">
<td align="left"><p>Greek (319) Latin</p></td>
<td align="left"><p>0x00040408</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Greek Latin</p></td>
<td align="left"><p>0x00050408</p></td>
</tr>
<tr class="even">
<td align="left"><p>Greek Polytonic</p></td>
<td align="left"><p>0x00060408</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Greenlandic</p></td>
<td align="left"><p>0x0000046f</p></td>
</tr>
<tr class="even">
<td align="left"><p>Guarani</p></td>
<td align="left"><p>0x00000474</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Gujarati</p></td>
<td align="left"><p>0x00000447</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hausa</p></td>
<td align="left"><p>0x00000468</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hebrew</p></td>
<td align="left"><p>0x0000040d</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hindi Traditional</p></td>
<td align="left"><p>0x00010439</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hungarian</p></td>
<td align="left"><p>0x0000040e</p></td>
</tr>
<tr class="even">
<td align="left"><p>Hungarian 101-key</p></td>
<td align="left"><p>0x0001040e</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Icelandic</p></td>
<td align="left"><p>0x0000040f</p></td>
</tr>
<tr class="even">
<td align="left"><p>Igbo</p></td>
<td align="left"><p>0x00000470</p></td>
</tr>
<tr class="odd">
<td align="left"><p>India</p></td>
<td align="left"><p>0x000004009</p></td>
</tr>
<tr class="even">
<td align="left"><p>Inuktitut - Latin</p></td>
<td align="left"><p>0x0000085d</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Inuktitut - Naqittaut</p></td>
<td align="left"><p>0x0001045d</p></td>
</tr>
<tr class="even">
<td align="left"><p>Irish</p></td>
<td align="left"><p>0x00001809</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Italian</p></td>
<td align="left"><p>0x00000410</p></td>
</tr>
<tr class="even">
<td align="left"><p>Italian (142)</p></td>
<td align="left"><p>0x00010410</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Japanese</p></td>
<td align="left"><p>0x00000411</p></td>
</tr>
<tr class="even">
<td align="left"><p>Javanese</p></td>
<td align="left"><p>0x00110c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Kannada</p></td>
<td align="left"><p>0x0000044b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Kazakh</p></td>
<td align="left"><p>0x0000043f</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Khmer</p></td>
<td align="left"><p>0x00000453</p></td>
</tr>
<tr class="even">
<td align="left"><p>Khmer (NIDA)</p></td>
<td align="left"><p>0x00010453</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Korean</p></td>
<td align="left"><p>0x00000412</p></td>
</tr>
<tr class="even">
<td align="left"><p>Kyrgyz Cyrillic</p></td>
<td align="left"><p>0x00000440</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Lao</p></td>
<td align="left"><p>0x00000454</p></td>
</tr>
<tr class="even">
<td align="left"><p>Latin American</p></td>
<td align="left"><p>0x0000080a</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Latvian (Standard)</p></td>
<td align="left"><p>0x00020426</p></td>
</tr>
<tr class="even">
<td align="left"><p>Latvian (Legacy)</p></td>
<td align="left"><p>0x00010426</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Lisu (Basic)</p></td>
<td align="left"><p>0x00070c00</p></td>
</tr>
<tr class="even">
<td align="left"><p>Lisu (Standard)</p></td>
<td align="left"><p>0x00080c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Lithuanian</p></td>
<td align="left"><p>0x00010427</p></td>
</tr>
<tr class="even">
<td align="left"><p>Lithuanian IBM</p></td>
<td align="left"><p>0x00000427</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Lithuanian Standard</p></td>
<td align="left"><p>0x00020427</p></td>
</tr>
<tr class="even">
<td align="left"><p>Luxembourgish</p></td>
<td align="left"><p>0x0000046e</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Macedonia (FYROM)</p></td>
<td align="left"><p>0x0000042f</p></td>
</tr>
<tr class="even">
<td align="left"><p>Macedonia (FYROM) - Standard</p></td>
<td align="left"><p>0x0001042f</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Malayalam</p></td>
<td align="left"><p>0x0000044c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Maltese 47-Key</p></td>
<td align="left"><p>0x0000043a</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Maltese 48-key</p></td>
<td align="left"><p>0x0001043a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Maori</p></td>
<td align="left"><p>0x00000481</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Marathi</p></td>
<td align="left"><p>0x0000044e</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mongolian (Mongolian Script - Legacy)</p></td>
<td align="left"><p>0x00000850</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Mongolian (Mongolian Script - Standard)</p></td>
<td align="left"><p>0x00020850</p></td>
</tr>
<tr class="even">
<td align="left"><p>Mongolian Cyrillic</p></td>
<td align="left"><p>0x00000450</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Myanmar</p></td>
<td align="left"><p>0x00010c00</p></td>
</tr>
<tr class="even">
<td align="left"><p>N'ko</p></td>
<td align="left"><p>0x00090c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Nepali</p></td>
<td align="left"><p>0x00000461</p></td>
</tr>
<tr class="even">
<td align="left"><p>New Tai Lue</p></td>
<td align="left"><p>0x00020c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Norwegian</p></td>
<td align="left"><p>0x00000414</p></td>
</tr>
<tr class="even">
<td align="left"><p>Norwegian with Sami</p></td>
<td align="left"><p>0x0000043b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Odia</p></td>
<td align="left"><p>0x00000448</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ol Chiki</p></td>
<td align="left"><p>0x000d0c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Old Italic</p></td>
<td align="left"><p>0x000f0c00</p></td>
</tr>
<tr class="even">
<td align="left"><p>Osmanya</p></td>
<td align="left"><p>0x000e0c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Pashto (Afghanistan)</p></td>
<td align="left"><p>0x00000463</p></td>
</tr>
<tr class="even">
<td align="left"><p>Persian</p></td>
<td align="left"><p>0x00000429</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Persian (Standard)</p></td>
<td align="left"><p>0x00050429</p></td>
</tr>
<tr class="even">
<td align="left"><p>Phags-pa</p></td>
<td align="left"><p>0x000a0c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Polish (214)</p></td>
<td align="left"><p>0x00010415</p></td>
</tr>
<tr class="even">
<td align="left"><p>Polish (Programmers)</p></td>
<td align="left"><p>0x00000415</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Portuguese</p></td>
<td align="left"><p>0x00000816</p></td>
</tr>
<tr class="even">
<td align="left"><p>Portuguese (Brazilian ABNT)</p></td>
<td align="left"><p>0x00000416</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Portuguese (Brazilian ABNT2)</p></td>
<td align="left"><p>0x00010416</p></td>
</tr>
<tr class="even">
<td align="left"><p>Punjabi</p></td>
<td align="left"><p>0x00000446</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Romanian (Legacy)</p></td>
<td align="left"><p>0x00000418</p></td>
</tr>
<tr class="even">
<td align="left"><p>Romanian (Programmers)</p></td>
<td align="left"><p>0x00020418</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Romanian (Standard)</p></td>
<td align="left"><p>0x00010418</p></td>
</tr>
<tr class="even">
<td align="left"><p>Russian</p></td>
<td align="left"><p>0x00000419</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Russian - Mnemonic</p></td>
<td align="left"><p>0x00020419</p></td>
</tr>
<tr class="even">
<td align="left"><p>Russian (Typewriter)</p></td>
<td align="left"><p>0x00010419</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sakha</p></td>
<td align="left"><p>0x00000485</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sami Extended Finland-Sweden</p></td>
<td align="left"><p>0x0002083b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sami Extended Norway</p></td>
<td align="left"><p>0x0001043b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Scottish Gaelic</p></td>
<td align="left"><p>0x00011809</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Serbian (Cyrillic)</p></td>
<td align="left"><p>0x00000c1a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Serbian (Latin)</p></td>
<td align="left"><p>0x0000081a</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sesotho sa Leboa</p></td>
<td align="left"><p>0x0000046c</p></td>
</tr>
<tr class="even">
<td align="left"><p>Setswana</p></td>
<td align="left"><p>0x00000432</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sinhala</p></td>
<td align="left"><p>0x0000045b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sinhala - wij 9</p></td>
<td align="left"><p>0x0001045b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Slovak</p></td>
<td align="left"><p>0x0000041b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Slovak (QWERTY)</p></td>
<td align="left"><p>0x0001041b</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Slovenian</p></td>
<td align="left"><p>0x00000424</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sora</p></td>
<td align="left"><p>0x00100c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sorbian Extended</p></td>
<td align="left"><p>0x0001042e</p></td>
</tr>
<tr class="even">
<td align="left"><p>Sorbian Standard</p></td>
<td align="left"><p>0x0002042e</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Sorbian Standard (Legacy)</p></td>
<td align="left"><p>0x0000042e</p></td>
</tr>
<tr class="even">
<td align="left"><p>Spanish</p></td>
<td align="left"><p>0x0000040a</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Spanish Variation</p></td>
<td align="left"><p>0x0001040a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Swedish</p></td>
<td align="left"><p>0x0000041d</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Swedish with Sami</p></td>
<td align="left"><p>0x0000083b</p></td>
</tr>
<tr class="even">
<td align="left"><p>Swiss French</p></td>
<td align="left"><p>0x0000100c</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Swiss German</p></td>
<td align="left"><p>0x00000807</p></td>
</tr>
<tr class="even">
<td align="left"><p>Syriac</p></td>
<td align="left"><p>0x0000045a</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Syriac Phonetic</p></td>
<td align="left"><p>0x0001045a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tai Le</p></td>
<td align="left"><p>0x00030c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tajik</p></td>
<td align="left"><p>0x00000428</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tamil</p></td>
<td align="left"><p>0x00000449</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tatar</p></td>
<td align="left"><p>0x00010444</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tatar (Legacy)</p></td>
<td align="left"><p>0x00000444</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Telugu</p></td>
<td align="left"><p>0x0000044a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Thai Kedmanee</p></td>
<td align="left"><p>0x0000041e</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Thai Kedmanee (non-ShiftLock)</p></td>
<td align="left"><p>0x0002041e</p></td>
</tr>
<tr class="even">
<td align="left"><p>Thai Pattachote</p></td>
<td align="left"><p>0x0001041e</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Thai Pattachote (non-ShiftLock)</p></td>
<td align="left"><p>0x0003041e</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tibetan (PRC - Standard)</p></td>
<td align="left"><p>0x00010451</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tibetan (PRC - Legacy)</p></td>
<td align="left"><p>0x00000451</p></td>
</tr>
<tr class="even">
<td align="left"><p>Tifinagh (Basic)</p></td>
<td align="left"><p>0x00050c00</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Tifinagh (Full)</p></td>
<td align="left"><p>0x00060c00</p></td>
</tr>
<tr class="even">
<td align="left"><p>Turkish F</p></td>
<td align="left"><p>0x0001041f</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Turkish Q</p></td>
<td align="left"><p>0x0000041f</p></td>
</tr>
<tr class="even">
<td align="left"><p>Turkmen</p></td>
<td align="left"><p>0x00000442</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Uyghur</p></td>
<td align="left"><p>0x00010408</p></td>
</tr>
<tr class="even">
<td align="left"><p>Uyghur (Legacy)</p></td>
<td align="left"><p>0x00000480</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ukrainian</p></td>
<td align="left"><p>0x00000422</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ukrainian (Enhanced)</p></td>
<td align="left"><p>0x00020422</p></td>
</tr>
<tr class="odd">
<td align="left"><p>United Kingdom</p></td>
<td align="left"><p>0x00000809</p></td>
</tr>
<tr class="even">
<td align="left"><p>United Kingdom Extended</p></td>
<td align="left"><p>0x00000452</p></td>
</tr>
<tr class="odd">
<td align="left"><p>United States - Dvorak</p></td>
<td align="left"><p>0x00010409</p></td>
</tr>
<tr class="even">
<td align="left"><p>United States - International</p></td>
<td align="left"><p>0x00020409</p></td>
</tr>
<tr class="odd">
<td align="left"><p>United States-Dvorak for left hand</p></td>
<td align="left"><p>0x00030409</p></td>
</tr>
<tr class="even">
<td align="left"><p>United States-Dvorak for right hand</p></td>
<td align="left"><p>0x00040409</p></td>
</tr>
<tr class="odd">
<td align="left"><p>United States - English</p></td>
<td align="left"><p>0x00000409</p></td>
</tr>
<tr class="even">
<td align="left"><p>Urdu</p></td>
<td align="left"><p>0x00000420</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Uyghur</p></td>
<td align="left"><p>0x00010480</p></td>
</tr>
<tr class="even">
<td align="left"><p>Uzbek Cyrillic</p></td>
<td align="left"><p>0x00000843</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Vietnamese</p></td>
<td align="left"><p>0x0000042a</p></td>
</tr>
<tr class="even">
<td align="left"><p>Wolof</p></td>
<td align="left"><p>0x00000488</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Yakut</p></td>
<td align="left"><p>0x00000485</p></td>
</tr>
<tr class="even">
<td align="left"><p>Yoruba</p></td>
<td align="left"><p>0x0000046a</p></td>
</tr>
</tbody>
</table>

 

## <span id="Input_Method_Editors"></span><span id="input_method_editors"></span><span id="INPUT_METHOD_EDITORS"></span>Input Method Editors


| Language/Region            | Input profile (Language and keyboard pair)                                                                                      |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Amharic - (Ethiopia)       | am-ET: Amharic Input Method (045e:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{8F96574E-C86C-4bd6-9666-3F7327D4CBE8})                 |
| Chinese (PRC)              | zh-CN: Microsoft Pinyin - Simple Fast (0804:{81D4E9C9-1D3B-41BC-9E6C-4B40BF79E35E}{FA550B04-5AD7-411f-A5AC-CA038EC515D7})       |
| Chinese (Taiwan)           | zh-TW: Chinese (Traditional) - New Phonetic (0404:{B115690A-EA02-48D5-A231-E3578D2FDF80}{B2F9C502-1742-11D4-9790-0080C882687E}) |
| Chinese (Traditional DaYi) | 0404:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{037B2C25-480C-4D7F-B027-D6CA6B69788A}                                               |
| Chinese (Wubi)             | 0804:{6a498709-e00b-4c45-a018-8f9e4081ae40}{82590C13-F4DD-44f4-BA1D-8667246FDF8E}                                               |
| Chinese (Yi)               | ii-CN: Yi Input Method(0478:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{409C8376-007B-4357-AE8E-26316EE3FB0D})                       |
| Japanese (Japan)           | ja-JP: Microsoft IME (0411:{03B5835F-F03C-411B-9CE2-AA23E1171E36}{A76C93D9-5523-4E90-AAFA-4DB112F9AC76})                        |
| Korean (Hangul)            | ko-KR: Microsoft IME (0412:{A028AE76-01B1-46C2-99C4-ACD9858AE02F}{B5FE1F02-D5F2-4445-9C03-C568F23C99A1})                        |
| Korean (Old Hangul)        | 0412:{a1e2b86b-924a-4d43-80f6-8a820df7190f}{b60af051-257a-46bc-b9d3-84dad819bafb}                                               |
| Tigrinya (Ethiopia)        | ti-ET: Tigrinya Input Method (0473:{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}{3CAB88B7-CC3E-46A6-9765-B772AD7761FF})                |

 

## <span id="related_topics"></span>Related topics


[Available Language Packs for Windows](available-language-packs-for-windows.md)

[Default Input Profiles (Input Locales) in Windows](default-input-locales-for-windows-language-packs.md)

 

 






