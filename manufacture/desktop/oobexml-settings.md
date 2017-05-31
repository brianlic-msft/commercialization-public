---
author: themar
Description: 'Oobe.xml Settings'
ms.assetid: 2c8ecddc-7099-451e-a069-642f654d4fbf
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Oobe.xml Settings'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Oobe.xml Settings


This topic describes the settings that can be set in Oobe.xml.

## <span id="oobe.xml_settings"></span><span id="OOBE.XML_SETTINGS"></span>Oobe.xml Settings


The following shows how elements are ordered in Oobe.xml. Not all elements and sections are required for Windows to process Oobe.xml.

```
<FirstExperience>
  <oobe>
    <oem>
      <name></name>
      <eulafilename></eulafilename>
      <computername></computername>
      <registration>
        <title></title>
        <subtitle></subtitle>
        <customerinfo>
          <label></label>
          <defaultvalue></defaultvalue>
        </customerinfo>
        <checkbox1>
          <label></label>
          <defaultvalue></defaultvalue>
        </checkbox1>
        <checkbox2>
          <label></label>
        </checkbox2>
        <checkbox3>
          <label></label>
        </checkbox3>
        <link1>
          <label></label>
        </link1>       
        <link2>
          <label></label>
        </link2>
        <link3>
          <label></label>
        </link3>
        <hideSkip></hideSkip>
      </registration>
    </oem>
    <defaults>
      <language></language>
      <location></location>
      <keyboard></keyboard>
      <adjustForDST></adjustForDST>
    </defaults>
    <hidSetup>
      <title></title>
      <mouseImagePath></mouseImagePath>
      <mouseText></mouseText>
      <mouseErrorImagePath></mouseErrorImagePath>
      <mouseErrorText></mouseErrorText>
      <keyboardImagePath></keyboardImagePath>
      <keyboardErrorImagePath></keyboardErrorImagePath>
      <keyboardText></keyboardText>
      <keyboardPINText></keyboardPINText>
      <keyboardPINImagePath></keyboardPINImagePath>
      <keyboardErrorText></keyboardErrorText>
    </hidSetup>
  </oobe>
</FirstExperience>
```
The following tables show descriptions and values for elements available in Oobe.xml.

The following table shows description for OEM customization and registration pages.

| Element | Setting | Description | Value |
| ------- | ------ | ----------- | ----- |
| <**oem**> |  |  |  |
|  | \<name> | Optional. Text to describe the name of the OEM. | String. |
|  | \<eulafilename> | Optional. Text with the filename of the EULA file. | Absolute path to the EULA .rtf file. The EULA .html document must be in the same folder. Windows knows to look for the .html file in that location. <p> **Note**: .htm files are ignored. <p> **Important**: All HTML files in OOBE must use UTF-8 encoding.  |
|  | \<computername> | Optional. Text to describe the name of the computer | String. |
|  | \<regsitration> | Optional. Additional details are below. |
| <**registration**> | | | |
| | \<title> | Required if registration element is used. Text to title the Registration page. | String of up to 25 characters. |  
| | \<subtitle> | Required if registration element is used. Text to describe the Registration page. |
| <**customerinfo**> | | | |
| | \<label> | Text to label customerinfo. Rquired for customerinfo to appear. | String of up to 250 characters. We strongly recommend that you use no more than 100 characters because this length of text will fit on one line. |
| | \<defaultvalue> | Value to set customerinfo as selected or not. If this field is checked, information from the four input fields will be provided via asymmetric key encryption. If not checked, no information from the four input fields will be provided. | True or False. True means the check box default condition is selected. False means the check box default condition isn't selected. |
| <**checkbox1**> | | | |
| | \<label> | Text to label checkbox1. Required for checkbox1 to appear. | String of up to 250 characters. We strongly recommend that you use no more than 100 characters because this length of text will fit on one line. |
| | \<defaultvalue> | Value to set checkbox1 as selected or not selected. | True or False. True means the check box default condition is selected. False means the check box default condition isn't selected. |
| \<**checkbox2**> | | | |
| | \<label> | Text to label checkbox2. Required for checkbox2 to appear. | String of up to 250 characters. We strongly recommend that you use no more than 100 characters because this length of text will fit on one line. |
| | \<defaultvalue> | Value to set checkbox3 as selected or not selected. | True or False. True means the check box default condition is selected. False means the check box default condition isn't selected. |
| <**checkbox3**> | | | |
| | \<label> | Text to label checkbox3. Required for checkbox3 to appear. | String of up to 250 characters. We strongly recommend that you use no more than 100 characters because this length of text will fit on one line. |
| | \<defaultvalue> | Value to set checkbox3 as selected or not selected. | True or False. True means the check box default condition is selected. False means the check box default condition isn't selected. |
| <**link1**> | | | |
| | \<label> | Label for the link to the HTML file. Required for link1 to appear. | String of up to 100 characters.|
| | \<link> | File must be named linkfile1.html. OOBE searches for these files under the oobe\info folder. OOBE searches for files under the appropriate locale and language specific subfolders of oobe\info. | linkfile1.html |
| <**link2**> | | | |
| | \<label> | Label for the link to the HTML file. Required for link2 to appear. | String of up to 100 characters.|
| | \<link> | File must be named linkfile2.html. OOBE searches for these files under the oobe\info folder. OOBE searches for files under the appropriate locale and language specific subfolders of oobe\info. | linkfile2.html |
| <**link3**> | | | |
| | \<label> | Label for the link to the HTML file. Required for link3 to appear. | String of up to 100 characters.|
| | \<link> | File must be named linkfile3.html. OOBE searches for these files under the oobe\info folder. OOBE searches for files under the appropriate locale and language specific subfolders of oobe\info. | linkfile3.html |
| <**hideSkip**> | | Optional. Controls whether or not the Skip button is displayed to the user.  Default is False, resulting in the skip button being visible. | True or False. True means the skip button is not visible to the user. False means the skip button is displayed as an option to the user. |

<br>
The following table shows values for language and location.

| Element | Setting | Description | Value |
| ------- | ------ | ----------- | ----- |
| <**defaults**> | | | |
| | \<language> | Specifies the default language on the system. | Decimal identifier for language. These values can be found in the following topic, [Available Language Packs for Windows.](available-language-packs-for-windows.md) |
| | \<location> | Specifies the default location on the system. | GeoID. [A list of GeoIDs is available here.](https://msdn.microsoft.com/en-us/library/dd374073%28VS.85%29.aspx) |
| | \<keyboard> | Specifies the default timezone on the system. | Keyboard ID string. This can be found with the GetKeyboardLayoutList API.  Or, by prepending a colon and the appropriate LCID to one of the keyboard layout IDs listed under HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts |
| | \<adjustforDST> | Specifies whether to adjust for Daylight Saving Time. | True or False. True means adjust for Daylight Saving Time based on the time zone. False means always remain on Standard Time. |

<br>
The following table shows values for HID setup.

| Element | Setting | Description | Value |
| ------- | ------ | ----------- | ----- |
| <**hidsetup**> | | | |
| | \<title> | | |
| | \<mouseImagePath> | Absolute path to the mouse pairing instruction image.<p>The image must not be larger than 630 x 372 pixels. It's scaled to fit in portrait mode or on small form factors. | Absolue path to the image. |
| | \<mouseText> | Help text that displays at the bottom of the page. | String |
| | \<mouseErrorImagePath> | Absolute path to the mouse pairing error image.<p>The image must not be larger than 630 x 372 pixels. It's scaled to fit in portrait mode or on small form factors. |
| | \<mouseErrorText> | Error that displays to users along with mouse pairing error image. | String |
| | \<keyboardImagePath> | Absolute path to the first keyboard pairing instruction image.<p>The image must not be larger than 630 x 372 pixels. It’s scaled to fit in portrait mode or on small form factors. |
| | \<keyboardErrorImagePath> | Absolute path to the keyboard pairing error image.<p>The image must not be larger than 630 x 372 pixels. It's scaled to fit in portrait mode or on small form factors. | Absolute path to the image |
 | | \<keyboardText> | Specifies the text to prompt the user to pair the keyboard. | String |
| | \<keyboardPINText> | Specifies the prompt text for the user to enter a pin for the keyboard. | String |
| | \<keyboardPINImagePath> | Absolute path to the keyboard pairing instruction image.<p>The image must not be larger than 630 x 372 pixels. It’s scaled to fit in portrait mode or on small form factors. | Absoulte path to image |
| | \<keyboardErrorText> | Specifies the text to use when an error occurs when pairing the keyboard. | String |


## <span id="How_to_Customize_OOBE"></span><span id="how_to_customize_oobe"></span><span id="HOW_TO_CUSTOMIZE_OOBE"></span>How to Customize OOBE


**To customize OOBE by using Oobe.xml**

1.  Create a file named Oobe.xml and store this file in Windows\\System32\\Oobe\\Info.

2.  By using an XML editor or a text editor, such as Notepad, update Oobe.xml with the appropriate files, paths, and content.

3.  Save your updated version of Oobe.xml in Windows\\System32\\Oobe\\Info, or in the appropriate language- and locale-specific folders required for your customizations.

4.  Test OOBE.

    **Test OOBE**

    1.  On the **Start** menu, point to **All Programs**, and then click **Accessories**.

    2.  Right-click the command prompt shortcut, and click **Run as administrator**. Accept the **User Account Control** dialog box.

    3.  Navigate to \\Windows\\System32\\Sysprep

    4.  Run **sysprep /oobe**.

    5.  Start the computer.

## <span id="related_topics"></span>Related topics


[Configure Oobe.xml](configure-oobexml.md)

 

 






