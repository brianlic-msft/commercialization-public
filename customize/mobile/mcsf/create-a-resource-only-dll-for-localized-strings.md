---
title: Create a resource-only .dll for localized strings
description: Create a resource-only .dll for localized strings
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b51952eb-cddf-47d2-98d9-4a50590e2e8e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a resource-only .dll for localized strings


When you have multiple display languages included on a phone, you must create a resource-only .dll to store all of the necessary localized display strings. From the .dll and its associated .dll.mui files, you can access strings in the current language from the registry. This technique is used in some customizations where you can use localized display strings as input.

Note that a single common resource-only .dll file and set of .dll.mui files can be used to manage the localized display strings for all of these customizations. It is not necessary to include a separate .dll file for each customization.

## Creating a resource-only .dll for localized strings


1.  In Visual Studio, create a Visual C++ Win32 project:

    1.  Click **File** &gt; **New** &gt; **Project**.

    2.  In the left column, expand the **Visual C++** templates, then select **Win32**.

    3.  In the center column, choose **Win32 Project**. Give your project a name according to the language you are using so you can easily identify it, such as *DisplayStrings0409*. An alternative name can be *DisplayStrings\_en\_us*.

    4.  Click **OK**.

2.  In the Win32 Application Wizard:

    1.  Click **Next** on the first screen.

    2.  Select **DLL** as the **Application type**.

    3.  Uncheck **Security Development Lifecycle (SDL) checks**. Leave **ATL** and **MFC** unchecked.

    4.  Check **Empty Project**.

    5.  Click **Finish**.

3.  Click on the **Project** menu and select **Properties**.

4.  In the new project’s Property Pages window:

    1.  Navigate to **Configuration Properties** &gt; **Linker** &gt; **Advanced**.

    2.  In the right column, change **No Entry Point** to **Yes (/NOENTRY)**.

        /NOENTRY prevents the linker from linking a reference to \_main into the .dll; this option is required to create a resource-only .dll.

5.  Without closing the project’s Property Pages window:

    1.  Navigate to **Configuration Properties** &gt; **Resources** &gt; **Command Line**.

    2.  In the right column, locate **Additional Options** and add **/n** to the edit box.

        /n specifies that each entry in the string table must be null-terminated. This prevents the entire contents of the string table from being displayed on the phone’s screen in the event of an error.

    3.  Click **OK**.

6.  Add a new string table:

    1.  Click **Project** &gt; **Add Resource**.

    2.  In the Add Resource dialog, select **String Table**.

    3.  Click **New**.

7.  In the string table editor, add a string resource for every string that you want to display in the Windows Phone UI.

    For each localizable string that you have added, create a row in your string table. In the **Caption** field of each row, type the localizable string for the display language.

8.  Build the .dll by selecting **Build Solution** from the **Build** menu.

    This step will produce a .dll called DisplayStrings0409.dll.

9.  For every additional localized display language, repeat steps 1-8.

**Add custom build steps to each project to split the various language resource modules into separate .mui files**

A multi-part process is involved in splitting the DLLs into one executable DisplayStrings.dll, plus a DisplayStrings.dll.mui for each of the languages that you built.

To sort the localizable resources into separate .mui files, you can add the following custom build steps to each project by opening the project properties and navigating to **Configuration Properties** &gt; **Build Events**. For example, for a debug build for English (US):

1.  Pre-build:

    ``` syntax
    rmdir /s /q “.\en-us”
    ```

2.  Pre-link:

    ``` syntax
    mkdir “.\en-us”
    ```

3.  Post-build line 1:

    ``` syntax
    muirct.exe -q "DoReverseMuiLoc.rcconfig" -v 2 -x 0x0409 -g 0x0409 ".\Debug\DisplayStrings0409.dll" ".\Debug\DisplayStrings.dll" ".\en-us\DisplayStrings.dll.mui"
    ```

    DoReverseMuiLoc.rcconfig is a type of configuration file typically used by muicrt.exe to split resources between the language-neutral DLL and the language-dependent .mui files. See the next section for more information about this file.

4.  Post-build line 2:

    ``` syntax
    muirct.exe -c ".\Debug\DisplayStrings.dll" -e ".\en-us\DisplayStrings.dll.mui"
    ```

    muicrt.exe embeds a MUI resource into the DisplayStrings.dll module during splitting. To properly load at run-time the appropriate resources from the language-specific DisplayStrings.dll.mui modules, each .mui file must have its checksums fixed-up to match the checksums in the baseline language-neutral module. This is done using the command specified in this step.

    Note that the separate build steps shown in this section is just one of the ways you can do this. You can also put all the steps into a post-build step. The actual commands use Visual Studio macros to target the correct output directories.

5.  Repeat steps 1-4 for the other languages that you are using and replace the language-specific settings with the ones that correspond to the other languages. For example, if you are processing the German settings next:

    1.  Replace `–x 0x0409` with the new language ID that you are using, such as `–x 0x0407` for German.

    2.  Replace `en-us` with `de-de`.

    3.  Change the output file in the post-build step from DisplayStrings.dll to DisplayStrings\_discard.dll.

    Once all the projects have been built, deploy the projects to your image and verify the strings are properly loaded for each language.

DoReverseMuiLoc.rcconfig is an XML file that contains the following lines. Copy this XML file to the *ProjectRootDirectory*\\*ProjectName* folder.

``` syntax
<?xml version="1.0" encoding="utf-8"?>
    <localization>
        <resources>
            <win32Resources fileType="Application">
                <neutralResources>
                </neutralResources>
                <localizedResources>
                    <resourceType typeNameId="#1"/>
                    <resourceType typeNameId="#10"/>
                    <resourceType typeNameId="#1024"/>
                    <resourceType typeNameId="#11"/>
                    <resourceType typeNameId="#12"/>
                    <resourceType typeNameId="#13"/>
                    <resourceType typeNameId="#14"/>
                    <resourceType typeNameId="#15"/>
                    <resourceType typeNameId="#16"/>
                    <resourceType typeNameId="#17"/>
                    <resourceType typeNameId="#18"/>
                    <resourceType typeNameId="#19"/>
                    <resourceType typeNameId="#2"/>
                    <resourceType typeNameId="#20"/>
                    <resourceType typeNameId="#2110"/>
                    <resourceType typeNameId="#23"/>
                    <resourceType typeNameId="#240"/>
                    <resourceType typeNameId="#3"/>
                    <resourceType typeNameId="#4"/>
                    <resourceType typeNameId="#5"/>
                    <resourceType typeNameId="#6"/>
                    <resourceType typeNameId="#7"/>
                    <resourceType typeNameId="#8"/>
                    <resourceType typeNameId="#9"/>
                    <resourceType typeNameId="HTML"/>
                    <resourceType typeNameId="MOFDATA"/>
                </localizedResources>
            </win32Resources>
        </resources>
    </localization>
```

## Accessing localized strings from a customization


To add the resource .dll files to a phone image and access localized strings in a customization, follow these instructions.

1.  Add the DisplayStrings.dll file and the DisplayStrings.dll.*LCID*.mui files to your customization answer file by using the following syntax.

    ``` syntax
    <Settings Path="Localization/MUI">  
      <!-- Use to add your base MUI DLL file -->
      <Asset Name="BaseDll" Source="C:\Path\DisplayStrings.dll" />

      <!-- Use to specify the language MUI packages (*.dll.mui) for the languages you are supporting and have localized strings for -->
      <Asset Name="LanguageDll/$(langid)" Source="C:\Path\DisplayStrings.dll.mui" />
      <!-- Add as many as you need -->         
    </Settings>
    ```

    Make the following changes to this XML:

    -   In the `BaseDll` asset, replace *C:\\Path* with the location of DisplayStrings.dll on your development machine.

    -   Add additional assets for the language MUI packages (\*.dll.mui) for all the languages you are supporting and have localized strings for. Set each asset's `Name` to `LanguageDll/`*$(langid)* where *$(langid)* corresponds to the language, such as *LanguageDll/en-US*. Also set each asset's `Source` to the location of the .dll.mui file for that language, such as *C:\\Path\\en-us\\DisplayStrings.dll.mui*.

2.  To access strings from a resource .dll file in a customization asset, set the `DisplayName` attribute for the asset to the name of the resource-only .dll file and specify the string offset as shown in the following customization answer file excerpt.

    ``` syntax
    <!-- Use to add one additional alarm sound -->
    <Settings Path="EventSounds">  
      <Asset Name="AlarmSounds" DisplayName="@DisplayStrings.dll,-101" Source="C:\Path\NewAlarmSound.wma" />
    </Settings>
    ```

    This particular example shows how to access string 101 (as specified in the `Value` field of the string table) for an additional alarm sound.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Create%20a%20resource-only%20.dll%20for%20localized%20strings%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




