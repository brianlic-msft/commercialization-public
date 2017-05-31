---
author: themar
Description: Add and Remove Language Packs Offline Using DISM
ms.assetid: 128cffa3-8c53-41c8-add2-fa10197f36a3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add and Remove Language Packs Offline Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add and Remove Language Packs Offline Using DISM


All installations of Windows contain at least one language pack and the language-neutral binaries that make up the core operating system. This topic includes information about how to use Deployment Image Servicing and Management (DISM.exe) to add or remove additional language packs, and to configure international settings. You can use the same procedures to add or remove Language Interface Packs (LIPs). For more information about the difference between a language pack and a LIP, see [Add Language Packs to Windows](add-language-packs-to-windows.md).

The Windows image must be a recently installed and captured image, or the default retail image. This ensures that the Windows image does not have any pending package actions. The Windows images can be in any language. For example, you can start with an English (en-US) image and add support for Japanese (ja-JP) and Korean (ko-KR). In addition, you can add LIPs to a Windows image that contains the supported parent language. For more information about the supported language packs and LIPs, see [Language Packs](language-packs-and-windows-deployment.md).


For information about how to add a language pack to a Windows Preinstallation Environment (Windows PE) image, [see WinPE: Add packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md).

## <span id="AddLangPacktoImage"></span><span id="addlangpacktoimage"></span><span id="ADDLANGPACKTOIMAGE"></span>Add a Language Pack to a Windows Image


Language packs are available as .cab files and are named with their locale; for example, Microsoft-Windows-Client-Language-Pack_x64_es-es.cab. Packages provided as .cab files can be added to an offline Windows image using the DISM command-line tool. You can use the same procedure to add a language pack or a Language Interface Pack (LIP).

**Important**  

LIPs can be installed only on a Windows image that has the supported parent languages installed. For example, the Basque (Basque) LIP can be installed only on a Windows image that has the Spanish (Spain) or French (France) parent language pack installed. Before you install a LIP to an offline Windows image, verify that the supported parent languages are installed. For more information about the supported language packs and LIPs, see [Language Packs](language-packs-and-windows-deployment.md).

You can also add language packs and LIPs to an answer file and then apply the answer file to an offline Windows image. When you do this, you can install the LIP and the parent language in the same operation.

**Important**  
Do not install a language pack after an update. If you install an update (hotfix, general distribution release \[GDR\], or service pack \[SP\]) that contains language-dependent resources before you install a language pack, the language-specific changes that are contained in the update are not applied and you will have to reinstall the update. Always install language packs before you install updates.

 

**To add a language pack using DISM**

1.  Before you add new language packs to a Windows image, you must remove any language packs from the Windows image that you do not intend to use. For more information, see [Remove a Language Pack from a Windows Image](#removelangpackfromwin).

2.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

3.  If your image is already mounted from the previous procedure, you can type the following command to list the images that are currently mounted and information about the mounted image such as mount location and mounted image index.

    ``` syntax
    Dism /Get-MountedImageInfo
    ```

    If your image is not mounted, type the following command to retrieve the name or index number for the image that you want to modify.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

    An index or name value is required for most operations that specify an image file. Type the following command to mount the image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows 7 HomeBasic" /MountDir:C:\test\offline
    ```

4.  Type the following command to add a language pack to the mounted offline image. You can add multiple packages on one command line.

    ``` syntax
    Dism /Image:C:\test\offline /ScratchDir:C:\Scratch /Add-Package /PackagePath:C:\packages\package1.cab /PackagePath:C:\packages\package2.cab ...
    ```

    **Note**  
    The scratch directory must be at least 1 GB for adding language packs.

5.  Type the following command to commit the changes. The image remains mounted until the **/unmount** option is used.

    ``` syntax
    Dism /Commit-Image /MountDir:C:\test\offline
    ```

6.  The language packs are added to the Windows image. The next step is to [Configure International Settings](#configintlsettings).

**To add a language pack using an answer file and DISM**

1.  Note the location of the language packs you want to add to the Windows image. Language packs are stored in .cab files.

2.  Use Windows SIM to create an answer file that contains only the language packs that you want to add. For more information about how to create an answer file, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085).

3.  In the **Package** node, under **Language Packs**, right-click the language pack that you want to add, and then select **Add to Answer File**.

4.  In the **Properties** pane, under **Settings**, select the **Install** value for the **Action** setting.

5.  You can also configure international settings in the answer file. For more information, see [Configure International Settings in Windows](configure-international-settings-in-windows.md).

6.  Validate and save the answer file.

7.  Close Windows SIM.

    **Important**  
    Make sure that the language pack is copied to the location specified in the answer file.

     

8.  If the image is not already mounted, use DISM to mount the Windows image. For example,

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Index:1 /MountDir:C:\test\offline
    ```

9.  Use DISM to apply the unattended installation answer file to the mounted Windows image. For example,

    ``` syntax
    DISM /Image:C:\test\offline /Apply-Unattend:C:\test\answerfiles\myunattend.xml
    ```

    For more information about how to apply an unattended answer file by using DISM, see [DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md).

10. The language packs are added to the Windows image, and international settings are configured.

## <span id="RemoveLangPackfromWin"></span><span id="removelangpackfromwin"></span><span id="REMOVELANGPACKFROMWIN"></span>Remove a Language Pack from a Windows Image


Before you add new language packs to a Windows image, you must remove any language packs that you do not intend to use. There are two ways to remove language packs offline with DISM. You can either apply an unattended answer file to the offline image, or you can remove the language pack directly from the offline image, using the command prompt.

**Important**  
You cannot remove a language pack from an offline Windows image if there are pending online actions. The Windows image should be a recently installed and captured image. This will guarantee that the Windows image does not have any pending online actions that require a reboot.

 

**To remove a language pack using DISM**

1.  Locate the Windows image (.wim) file or virtual hard disk (.vhd or .vhdx) that contains the Windows image that you intend to remove languages from.

2.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

3.  At the command prompt, type the following command to retrieve the name or index number for the image that you want to modify.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim 
    ```

    An index or name value is required for most operations that specify an image file.

4.  Type the following command to mount the offline Windows image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows 7 HomeBasic" /MountDir:C:\test\offline
    ```

5.  Optional: Type the following command to list the languages in the offline image.

    ``` syntax
    Dism /Image:C:\test\offline /Get-Intl
    ```

6.  Type the following command to remove a language pack from the image. You can remove multiple .cab files by using one command-line statement.

    ``` syntax
    Dism /Image:C:\test\offline /Remove-Package /PackagePath:C:\packages\package1.cab /PackagePath:C:\packages\package2.cab ...
    ```

7.  Type the following command to commit the changes. The image remains mounted until the **/unmount** option is used.

    ``` syntax
    Dism /Commit-Image /MountDir:C:\test\offline
    ```

8.  The language packs are removed from your image. The next step is to add a language pack to the mounted offline image. To continue, see [Add a Language Pack to a Windows Image](#addlangpacktoimage).

**To remove a language pack using DISM and an unattended answer file**

1.  Use Windows® System Image Manager (Windows SIM) to create an answer file that contains only the language packs that you want to remove. Open the Windows image by using Windows SIM and create a new answer file. For more information about how to use Windows SIM, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085).

2.  In the **Package** node, under **Language Packs**, right-click the language pack that you want to remove and select **Add to Answer File**.

3.  In the **Properties** pane, under **Settings**, select the **Remove** value for the **Action** setting.

4.  Save the answer file and close Windows SIM. The answer file must resemble the following example.

    ``` syntax
    <package action="remove">
       <assemblyIdentity name="Microsoft-Windows-LanguagePack-Package" version="6.0.5714.0" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="en-US" />
    </package>
    ```

5.  Use DISM to mount the Windows image. For example,

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Index:1 /MountDir:C:\test\offline
    ```

6.  Use DISM to apply the unattended answer file to the mounted Windows image. For example,

    ``` syntax
    Dism /Image:C:\test\offline /Apply-Unattend:C:\test\answerfiles\myunattend.xml
    ```

    For more information about how to use DISM to apply an unattended answer file, see [DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md).

7.  Type the following command to commit the changes. The image remains mounted until the **/unmount** option is used.

    ``` syntax
    Dism /Commit-Image /MountDir:C:\test\offline
    ```

8.  The language packs are removed from your image. The next step is to add a language pack to the mounted offline image. To continue, see [Add a Language Pack to a Windows Image](#addlangpacktoimage).

## <span id="ConfigIntlSettings"></span><span id="configintlsettings"></span><span id="CONFIGINTLSETTINGS"></span>Configure International Settings


After you add or remove a language pack in a Windows image, you can set the default user interface (UI) language, which is also known as the display language. At the same time, you can configure the international settings in the Windows image using DISM.

You can also configure international settings in an answer file. For more information about how to do this, see [Configure International Settings in Windows](configure-international-settings-in-windows.md).

**Note**  
If you specify a default UI language and locale settings with the DISM tool, and then specify different language and locale settings in an answer file, the settings in the answer file overwrite the default values specified by the DISM tool.

 

**To configure international settings using DISM**

1.  You must first mount the image if it is not already mounted. For example,

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Index:1 /MountDir:C:\test\offline
    ```

2.  To change all international language settings in the mounted offline image to match the default values set by Microsoft for a given language, at the DISM command prompt, type the following command,

    ``` syntax
    Dism /Image:C:\test\offline /Set-SKUIntlDefaults:en-us
    ```

    **Note**  
    The **/Set-SKUIntlDefaults** option does not change the keyboard driver for Japanese and Korean keyboards. You must use the **/Set-LayeredDriver** option to change this. For more information, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

     

    For more information about default values, see [Windows Language Pack Default Values](windows-language-pack-default-values.md).

    Optionally, you can configure different values for different settings, including UI language, system locale, user locale, input locale, and others. For more information about how to specify individual values for each of these settings, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

3.  At a command prompt, type the following command to commit the changes and unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

The Windows image is ready to be deployed.

## <span id="related_topics"></span>Related topics


[Add Language Packs to Windows](add-language-packs-to-windows.md)

[Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md)

[DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md)

[Windows System Image Manager Technical Reference](https://msdn.microsoft.com/library/windows/hardware/dn922445)

 

 






