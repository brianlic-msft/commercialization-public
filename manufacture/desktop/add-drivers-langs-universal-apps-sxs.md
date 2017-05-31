---
author: KPacquer
Description: 'Lab 4: Add languages'
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 4: Add languages'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="Add_languages"></span>Lab 4: Add languages

**Notes** 

- **Add languages before major updates.** Major updates include hotfixes, general distribution releases, or service packs. If you add a language later, you'll need to [reinstall the updates](servicing-the-image-with-windows-updates-sxs.md).

- **Add major updates before apps**. Thes apps include universal Windows apps and desktop applications. If you add an update later, you'll need to  reinstall the apps. We'll show you how to add these later in [Lab 6: Add universal Windows apps](add-universal-apps-sxs.md)

- **Add your languages to your recovery image, too**: Many common languages can be added to your recovery image. We'll show you how to add these later in [Lab 12: Update the recovery image](update-the-recovery-image.md).

## <span id="Mount_the_image"></span>Mount the image

**Step 1: Mount the image**

Use the steps from [Lab 3: Add device drivers (.inf-style)](add-device-drivers.md) to mount the image. The short version:

1.  Open the command line as an administrator (**Start** > type **deployment** > right-click **Deployment and Imaging Tools Environment** > **Run as administrator**.)

2.  Make a backup of the file (`copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\install-backup.wim`)

3.  Mount the image (`md C:\mount\windows`, then `Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize`)

## <span id="Add_languages_to_the_image"></span>Add languages to the image

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
<td align="left"><code>Microsoft-Windows-Client-Language-Pack_x64_es-es</code></td>
<td align="left">None</td>
<td align="left">UI text, including basic Cortana capabilities.</td>
</tr>
<tr class="even">
<td align="left">Language interface pack</td>
<td align="left"><code>Microsoft-Windows-Client-Language-Interface-Pack_x64_ca-es</code></td>
<td align="left">Requires a specific fully-localized or partially-localized language pack. Example: ca-ES requires es-ES.</td>
<td align="left"><p>UI text, including basic Cortana capabilities. To learn more, see <a href="available-language-packs-for-windows.md">Available Language Packs for Windows</a>.</p></td>
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
<td align="left"><a href="features-on-demand-v2--capabilities.md#Fonts">Fonts required for some regions</a>. Example, th-TH requires the Thai font pack.</td>
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
<tr class="even">
<td align="left">Retail Demo experience</td>
<td align="left"><code>Microsoft-Windows-RetailDemo-OfflineContent-Content-fr-fr-Package</code></td>
<td align="left">Basic</td>
<td align="left"><a href="https://msdn.microsoft.com/windows/uwp/monetize/retail-demo-experience">Retail Demo Experience (RDX)</a></td>
</tr>
</tbody>
</table>

**Step 2: Add or change languages**

1.  Add languages and Features On Demand to the Windows image.

    Language updates have a specific order they need to be installed in. For example, to enable Cortana, install: **Microsoft-Windows-Client-Language-Pack**, then **–Basic**, then **–Fonts**, then **–TextToSpeech**, and then **–Speech**, in this order. If you’re not sure of the dependencies, it’s OK to put them all in the same folder, and then add them all using the same DISM /Add-Package command. 
    
    Example for adding French, x64:

    ``` syntax
    Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-Client-Language-Pack_x64_fr-fr" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-OCR-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Handwriting-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-TextToSpeech-fr-fr-Package.cab" /PackagePath="C:\Languages\fr-fr x64\Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package.cab" /LogPath=C:\mount\dism.log
    ```

    Example for adding Japanese, x64. Note, Japanese requires a font pack.

    ``` syntax
    Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\Languages\ja-jp x64\Microsoft-Windows-Client-Language-Pack_x64_ja-jp" /PackagePath="C:\Languages\ja-jp x64\Microsoft-Windows-LanguageFeatures-Basic-ja-jp-Package.cab" /PackagePath="C:\Languages\ja-jp x64\Microsoft-Windows-LanguageFeatures-OCR-ja-jp-Package.cab" /PackagePath="C:\Languages\ja-jp x64\Microsoft-Windows-LanguageFeatures-Handwriting-ja-jp-Package.cab" /PackagePath="C:\Languages\ja-jp x64\Microsoft-Windows-LanguageFeatures-TextToSpeech-ja-jp-Package.cab" /PackagePath="C:\Languages\ja-jp x64\Microsoft-Windows-LanguageFeatures-Speech-ja-jp-Package.cab" /PackagePath:"C:\Languages\ja-jp x64\Microsoft-Windows-LanguageFeatures-Fonts-Jpan-Package.cab"  /LogPath=C:\mount\dism.log
    ```

    Not every region has fonts or capability packs for every feature.

2.  Verify that the language package is part of the image:

    ``` syntax
    Dism /Get-Packages /Image:"C:\mount\windows"
    ```

    where *C* is the drive letter of the drive that contains the image.

    Review the resulting list of packages and verify that the list contains the package. For example:

    ``` syntax
    Package Identity : Microsoft-Windows-Client-LanguagePack  ...  fr-FR~10.0.15063.0
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
    Dism /Set-AllIntl:fr-fr /Image:"C:\mount\windows"
    ```
    
5.  Change the default timezone to match the timezone for your customers. See [List of timezones](default-time-zones.md).

    ``` syntax
    Dism /Set-TimeZone:"W. Europe Standard Time" /Image:"C:\mount\windows"
    ```

**Step 3: Remove the base language (only needed for non-English regions)**

1.  To save space, you can remove English language components when deploying to non-English regions. You can either uninstall them in the reverse order from how you add them, or remove them all at once in the same DISM /remove-package command.

    ``` syntax
    dism /Remove-Package /Image:"c:\mount\windows" /PackageName:Microsoft-Windows-Client-LanguagePack-Package~31bf3856ad364e35~amd64~en-US~10.0.15063.0 /PackageName:Microsoft-Windows-LanguageFeatures-Basic-en-us-Package~31bf3856ad364e35~amd64~~10.0.15063.0 /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-us-Package~31bf3856ad364e35~amd64~~10.0.15063.0 /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-us-Package~31bf3856ad364e35~amd64~~10.0.15063.0 /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-us-Package~31bf3856ad364e35~amd64~~10.0.15063.0 /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-us-Package~31bf3856ad364e35~amd64~~10.0.15063.0  /LogPath=C:\mount\dism.fod2.log
    ```

    where *C* is the drive letter of the drive.

    **Troubleshooting** If removing the package fails due to pending updates, try the command again. 

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

## <span id="Unmount_the_images"></span> Unmount the images

**Step 4: Unmount the images**

1.  Close all applications that might access files from the image.

2.  Commit the changes and unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

## <span id="Try_it_out"></span>Try it out

**Step 5: Apply the image to a new PC**

Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the image, and boot it up. The short version:

1.  Copy the image file to the storage drive.
2.  [Boot the reference device to Windows PE using the Windows PE USB key](install-windows-pe-sxs.md).
3.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).
4.  Apply the image: `D:\ApplyImage.bat D:\Images\install.wim`.
5.  Disconnect the drives, then reboot (`exit`).

**Step 6: Verify updates**

1.  After the PC boots, if you have multiple languages installed, you should receive a list of lanugages during the out-of-box experience. 

2.  Either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

3.  Right-click the **Start** button, and select **Command Prompt (Admin)**.

4.  Verify that the language packages appear correctly:

    ``` syntax
    C:\Windows\System32\Dism /Get-Packages /Online
    ```

    Review the resulting list of packages and verify that the list contains the package. For example:

    ``` syntax
    Package Identity : Microsoft-Windows-Client-LanguagePack  ...  fr-FR~10.0.15063.0
    State : Installed
    ```
	
Next step: [Lab 5: Add updates and upgrade the edition](servicing-the-image-with-windows-updates-sxs.md)