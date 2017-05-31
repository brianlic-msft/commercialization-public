---
author: Justinha
Description: Configure International Settings in Windows
ms.assetid: 2ed4a22d-8cd1-49b8-8141-06ebbf26b24d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Configure International Settings in Windows
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure International Settings in Windows


You can specify the default language, locale, and keyboard values during deployment or after Windows is installed. You can configure international settings by using the International module for Windows PowerShell, by using an answer file with Windows Setup, or by using Deployment Imaging Servicing and Management (DISM).

For information about using DISM to configure international settings in an offline Windows image, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

**Important**  
In Windows 10, the intl.cpl command line tools do not support the new settings available in the Region and Language section of Control Panel. For Windows 10, we recommend using the International Windows PowerShell cmdlet settings to automate customizing international settings.

In addition, Deployment Imaging Servicing and Management (DISM) should also only be used against an offline Windows image. In Windows 10, language settings are dynamically configured based on the user’s language list. Individual settings, such as the display language, default input method, and user locale may be reset dynamically based on user preferences on a running Windows installation. Use the International PowerShell cmdlet settings to change the international settings of a running Windows installation.


## <span id="PowerShell"></span><span id="powershell"></span><span id="POWERSHELL"></span>Configure international settings by using Windows PowerShell


In Windows 10, you can use the International Settings Windows PowerShell cmdlets to change the language on a running Windows installation. 

1.  Open a Windows PowerShell prompt.

3.  Display the locale information on the computer by running the following command:

    ``` syntax
    Get-WinSystemLocale
    ```

    Set the locale for the region and language that you want. For example, the following command sets the system locale to Japanese (Japan):

    ``` syntax
    Set-WinSystemLocale ja-JP
    ```

    For a full description of these cmdlets, see [Get-WinSystemLocale](http://go.microsoft.com/fwlink/p/?linkid=242247) and [Set-WinSystemLocale](http://go.microsoft.com/fwlink/p/?linkid=242254). For more information about using International PowerShell cmdlets, see [International Settings Cmdlets](http://go.microsoft.com/fwlink/p/?linkid=238265).

## <span id="ControlPanel"></span><span id="controlpanel"></span><span id="CONTROLPANEL"></span>Configure international settings by using Control Panel

On a running Windows installation, you can use Control Panel to select language packs and configure additional international settings.

1.  On the Start page, type **language**, and select **Add a language**.

4.  Browse or search for the language that you want to install. For example, select **Catalan**, and then select **Add**.

    Catalan is now added as one of your languages.

5.  In the **Change your language preferences** pane, select **Options** next to the language that you added.

6.  If a language pack is available for your language, select **Download and install language pack**.

7.  When the language pack is installed, the language is displayed as available to use for the Windows display language.

8.  To make this language your display language, move it to the top of your language list.

9.  Log off and then log back on to Windows for the change to take effect.

Installing many additional language packs affects disk space and system performance. In particular, disk space and system performance are affected during servicing operations, such as service pack installations. Therefore, we recommend that you add a language pack to your computer only if you plan to use the language pack.

Language packs also let multiple users who share a computer select distinct display languages. For example, one user can select to see the dialog boxes, menus, and other text in Japanese, whereas another user can select to see the same content in French.

## <span id="DISM"></span><span id="dism"></span>Configure international settings by using DISM


You can use Deployment Imaging Servicing and Management (DISM) to change the international settings against an offline Windows image

1.  Mount a Windows image. For example,

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\my_distribution\sources\install.wim /Index:1 /MountDir:C:\mount\windows
    ```

2.  Get the language settings that are configured in the Windows image by using the **/Get-Intl** parameter. For example

    ``` syntax
    Dism /image:C:\mount\windows /Get-Intl
    ```

3.  Change the default language, locale, and other international settings by using the **/set-allInlt** parameter.

    ``` syntax
    Dism /image:C:\mount\windows /set-allIntl:fr-fr
    ```

For additional parameters and other options, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

## <span id="AnswerFile"></span><span id="answerfile"></span><span id="ANSWERFILE"></span>Configure international settings by using an answer file


You can configure international settings in an answer file in the following ways:

-   Language Packs are installed from a distribution share and settings are configured installed during **WindowsPE** configuration pass.

    Corporations that deploy a multilingual edition of Windows typically create an answer file that configures international settings during the **WindowsPE** configuration pass. For multilingual deployments, language packs can exist in both a distribution share and in the image. You can add and configure Language packs from the distribution share during the **WindowsPE** configuration pass, or you can add these Language pa cks during the **WindowsPE** configuration pass and configure the settings in another configuration pass.

    The Microsoft-Windows-International-Core-WinPE component includes the settings that you can use to modify the language and locale settings during the **windowsPE** configuration pass. Additionally, you can change the Setup UI language for Windows Setup by specifying values in this component.

-   Language packs are installed to the Windows image and settings are configured during **specialize** and **oobesystem** configuration passes.

    OEMs and corporations that deploy a single-language edition of Windows to various regions typically create an answer file for each region and set the locale and keyboard settings in the **specialize** configuration pass. In this scenario, the language pack is added to the Windows image before international settings are configured.

    The Microsoft-Windows-International-Core component includes the settings that you can use to modify the language and locale settings during the **specialize** and **oobeSystem** configuration passes.

    You can pre-select a language and skip the Windows Welcome language selection UI page for users by specifying language and locale settings in the **oobeSystem** configuration pass in the Microsoft-Windows-International-Core component. In general, a user can choose between the default Setup language and any additional languages that are installed in the image. The selection of the language will update the other regional settings to the default values that are associated with that language. The user can then individually change the default settings.

**To configure international settings during the Windows PE configuration pass**

1.  Verify that the necessary language packs are available in the image or in a Windows distribution share. For more information about multilingual distribution shares, see [Add Multilingual Support to a Windows Distribution](add-multilingual-support-to-a-windows-distribution.md).

2.  Open Windows System Image Manager (Windows SIM) and create an answer file. For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085).

3.  Add the Microsoft-Windows-International-Core-WinPE component to the answer file to apply settings during the **windowsPE** configuration pass.

4.  Configure international settings in the Microsoft-Windows-International-Core-WinPE component. For example, if the Spanish language pack is available in the distribution share, you can add *es-ES* values to the component settings in the **windowsPE** configuration pass.

    Most system locales require a restart. When you configure your locale settings during the **windowsPE** configuration pass, the computer will automatically restart. Additional restarts are not required.

    For more information about these settings, see the Microsoft-Windows-International-Core-WinPE components in the Windows® Unattended Setup Reference.

5.  Save the answer file and close Windows SIM. The language pack in the distribution share will be automatically added and the international settings will be applied when you run Windows Setup and specify this answer file.

**To configure international settings during the specialize configuration pass**

1.  Verify that the necessary language packs are available in the image. For more information about how to add a language pack offline, see [Add and Remove Language Packs Offline Using DISM](add-and-remove-language-packs-offline-using-dism.md). For more information about how to add a language pack using an answer file, see [Add a Package to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915066).

2.  Open Windows SIM and create a new answer file. For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085).

3.  Add the Microsoft-Windows-International-Core component to apply settings during the **specialize** and **oobeSystem** configuration passes.

    Most system locales require a restart. When you process language settings during the **specialize** or **oobeSystem** configuration passes, the computer might require an additional restart.

4.  Edit the settings for the Microsoft-Windows-International-Core component to configure international settings for a specific region. For example, you can add *EN-US* values to the Microsoft-Windows-International-Core settings in the **specialize** configuration pass.

    You can also pre-select a language and specify language and locale settings in the **oobeSystem** configuration pass in the Microsoft-Windows-International-Core component. When you do this, the Windows Welcome language selection UI page will be skipped when the users boot to Windows Welcome. In general the user can select between the default Setup language and any additional languages that are installed in the image. The selection of the language will update the other regional settings to the default values associated with that language. The user can then change these default settings individually.

    For more information about these settings, see the Microsoft-Windows-International-Core component in the Windows® Unattended Setup Reference.

5.  Save the answer file and close Windows SIM. When you run Windows Setup specifying this answer file, the regional settings that you specified in the answer file will be applied.

**To change international settings in separate configuration passes in the same answer file:**

-   Create multiple sections in an answer file that will process different language settings during different phases of Windows installation. This enables you to configure multiple language settings in an answer file by specifying different settings to be processed in different configuration passes. For more information, see [How Configuration Passes Work](how-configuration-passes-work.md).

    For example, you can create language and locale settings in the **windowsPE** configuration pass with the Microsoft-Windows-International-Core-WinPE component.

    You can then change the default settings in either the **oobeSystem** or the **specialize** configuration pass by adding settings to the Microsoft-Windows-International-Core component.

    For example, you can specify *EN-US* as the default language to use on the computer in the **windowsPE** configuration pass. Then, if you intend to send the computer to a different region, you can add more language and locale settings to the **oobeSystem** configuration pass.

    If language settings are processed during the **oobeSystem** configuration pass, a restart might be required. Also, the time that is required for the computer to process the language settings might prevent the end user from starting Windows Welcome quickly.

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Windows System Image Manager Technical Reference](https://msdn.microsoft.com/library/windows/hardware/dn922445)

[Add Language Packs to Windows](add-language-packs-to-windows.md)

[Add and Remove Language Packs Offline Using DISM](add-and-remove-language-packs-offline-using-dism.md)

 

 






