---
title: Dialer codes to launch diagnostic applications
description: To use an OEM diagnostic app in environments such as a service center, OEMs can configure special dialer codes to start the application.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6997e01a-2cb0-4b96-91f3-077f11cdaa04
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Dialer codes to launch diagnostic applications


To use an OEM diagnostic app in environments such as a service center, OEMs can configure special dialer codes to start the application. OEMs can also configure dialer codes to start apps to interact with mobile operator networks or to diagnose phone malfunctions.

Specific codes entered into the dialer will start the OEM dialer app. The dialer code is passed as a parameter to the OEM's primary dialer app. The primary dialer app starts when any configured dialer code is entered in the dialer.

Beginning with Windows 10, version 1607, the dialer codes customization supports these four different app types and behaviors:

-   **Windows Phone Silverlight 8.0 app** - For this type of app, the legacy customization behavior remains the same. You cannot pass **\*** as a dialer code and **\#**characters are removed from the dialer code.

-   **Windows Phone Silverlight 8.1 app** - For this type of app, you can define dial strings that contain **\***. The app receives the dial code through navigation arguments. Arguments are in the format "DialString=\#\#*dialer\_code*\#" (for example, "DialString=\#\#777\#").

-   **Windows Runtime app** - For Windows Runtime apps, you can define dial strings that contain **\***. The app receives the dial code through navigation arguments in the URI escape encoded format. Arguments are in the format "?DialString=%23%23*dialer\_code*%23". The app can use System.Uri.UnescapeDataString to get the arguments to format "?DialString=\#\#*dialer\_code*\#".

-   **Universal Windows app** - The behavior for this app is the same as that of a Windows Runtime app.

The OS trims the dial string for legacy apps while it passes the dial string without modifications for Universal Windows apps.

**Important**  
In your PROVXML file, you must also set the **FullyPreinstall** flag to TRUE so that the app is available to run immediate after first boot or an OS update. 

 

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

## Instructions


**First-use installation of the OEM dialer application**

1.  Preload the OEM dialer application. To do this, use the following code example.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <!--  Copyright (c) Microsoft Corporation.  All rights reserved.  -->  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="OEMDiagnosticApp"  
                         Description="Sample customization XML for OEM diagnostic app."  
                         Owner=""  
                         OwnerType="OEM">  

      <Static>

        <Applications>
          <Application Source="C:\Customization\TestData\apps\SampleDiagnosticApp.xap"
                       License="C:\Customization\TestData\apps\SampleDiagnosticAppLicense.xml"
                       ProvXML="C:\Customization\TestData\apps\mpap_oemmoapps_01.provxml" />
        </Applications>

      </Static>

    </ImageCustomizations>
    ```

    In the above example:

    1.  Specify the `Name`, `Description`, and `Owner` values.

    2.  Replace `Source` with the location and file name of the OEM dialer application source.

    3.  Replace `License` with the location and file name of the app's license file.

    4.  Replace `ProvXML` with the location and file name of the app's provXML file. Note that the provXML file must have the file name pattern MPAP\_\*\_\*.provxml.

        **Note**  
        To prevent the initial phone setup process from installing the application on first boot, do not place the provXML file in the directory that the initial phone setup process checks, such as $(runtime.commonfiles)\\Provisioning\\OEM. Instead, place the provXML file in another location, such as $(runtime.commonfiles)\\Xaps, which you can then reference from the `PartnerAppProvisioningFilePath` setting.

         

2.  You must also configure the following customization settings so that the dialer will start the primary OEM dialer application. If you set these values, no application is launched and no messages are displayed to the user. The following configuration causes the dialer to start the primary OEM dialer application.

    In the customization answer file, add the following settings:

    ``` syntax
    <Static>

        <Settings Path="Phone/PartnerAppSupport"> 
          <Setting Name="PartnerAppTaskUri" Value="" />    
          <Setting Name="PartnerAppProvisioningFilePath" Value="\Programs\CommonFiles\Xaps\MPAP_*_*.provxml" />

          <!-- Configure these settings to add additional dialer codes that can be accepted and passed as a parameter to 
               the primary OEM dialer app. You can add any number of additional diagnostic codes you want to use. 
               Each code should begin with ## -->
          <Setting Name="PartnerImmediateDialStrings" Value="" />
          <Setting Name="PartnerNonImmediateDialStrings" Value="" />

        </Settings>  

      </Static>
    ```

3.  In the above example, provide a value for the `PartnerAppTaskUri`, the `PartnerAppProvisioningFilePath` and include any desired immediate or non-immediate dial strings.

    1.  Set `PartnerAppTaskUri` to the task URI of the launched app.

        -   If you're using a Universal Windows app, you can launch a diagnostic app by setting the value of `PartnerAppTaskUri` to the AUMID of a Windows app. The AUMID is in the format similar to the package family name + the ID of the app, for example, *24f54b1d-732e-448c-b516-15078b047964\_120xq4c4hfa14!App*.

        -   If you're using a legacy app, you can launch a diagnostic app by setting the value of `PartnerAppTaskUri` to the app URI. The app URI is in the format *app://00000000-0000-0000-0000-000000000000/\_default.* Replace *00000000-0000-0000-0000-000000000000* with your app ID, such as *13372257-1b99-1712-17e7-157fc6f8557d*.

            The dial code parameter is URI escape encoded in order to pass **\#** and **\*** characters to Windows Phone Silverlight 8.1 apps.

    2.  Set `PartnerAppProvisioningFilePath` to the path (in the mobile device) and file name of the provXML that is used to install the OEM dialer app. The path must match the destination of the app you preloaded. For example, *$(runtime.commonfiles)\\Xaps map to \\Programs\\CommonFiles\\Xaps* and must be used when specifying the `PartnerAppProvisioningFilePath` value.

        When the dialer code is entered, the background installation process starts and when that completes, the application will be launched. If the installation is not complete within two minutes, the application is not started.

    3.  Set `PartnerImmediateDialStrings` and `PartnerNonImmediateDialStrings` to add additional dialer codes that can be accepted and passed as a parameter to the primary OEM dialer app.

        -   Use `PartnerImmediateDialStrings` to list dial codes that invoke the OEM app immediately without the need to press the dial button. For example, *\#\#3282\#\\0\#\#634\#\\0\#\#777\#\\0\#\#7820\#\\05555*

        -   Use `PartnerNonImmediateDialStrings` to list dial codes that invoke the OEM app after pressing the dial button. For example, *\#\#634\\0\#\#3282\\0\#\#777\\0\#\#7820*

## Testing


1.  Flash the build containing this customization to a phone.

2.  Launch the **Phone** app and dial any of the immediate or non-immediate dial strings that you've defined.

    When the dialer code is entered, the background installation process starts and when that completes, the application will be launched. If the installation is not complete within two minutes, the application is not started.

3.  Verify that the defined dial strings successfully launch the diagnostic app that you preloaded.

## Dialer codes


### Password protect diagnostic functionality

Microsoft recommends that OEMs implement an input screen that is displayed when the OEM dialer application launches diagnostic functionality. This screen can request a password that is unique to the OEM's application.

### Dialer code parameter passing

The following code example shows how to parse the dialer code parameter that was passed. The code requests the **DialString** String object out of the **navigationContext** by calling the **QueryString.TryGetValue** function.

``` syntax
string dialCode = "";if (NavigationContext.QueryString.TryGetValue("DialString", out dialCode)){   int intDialCode = int.Parse(dialCode);}
```

### Adding additional dialer codes

You can add additional dialer codes so that they will be accepted and passed as a parameter to the primary OEM dialer application. You can provide any number of additional diagnostic codes that you want to use. Each dialer code should begin with **\#\#**.

-   If the dialer string ends with **\#**, the app starts immediately after the last \# is pressed. These entries are stored in the `PartnerImmediateDialStrings` setting. You can use multiple values by separating them with a semicolon (**;**). For example, *\#\#634\#;\#\#3282\#;\#\#778\#;\#\#675\#;\#\#786\#*

-   If the dialer code does not end with **\#**, the app starts after the call button is pressed by the user. These are stored in the `PartnerNonImmediateDialStrings` setting. You can use multiple values by separating them with a semicolon (**;**). For example, *\#\#3282;\#\#2539\#;\#\#33284\#;\#\#2539;\#\#786;\#\#778;\#\#33284*

Only the defined dialer codes are passed to the partner app, which can use the code to determine what programs to load or which additional screens to display.

### Predefined dialer codes

The following table describes the predefined application dialer codes available. The &lt;Call&gt; in the dialer code sequences represents a press of the Call button on the phone.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Dialer code</th>
<th>Numeric equivalent</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>##DATA#</p></td>
<td><p>##3282#</p></td>
<td><p>Displays the network information.</p></td>
</tr>
<tr class="even">
<td><p>##MFG#</p></td>
<td><p>##634#</p></td>
<td><p>Calls the manufacturing test tool, if one has been implemented.</p></td>
</tr>
<tr class="odd">
<td><p>##RTN# or ##RTN@</p></td>
<td><p>##786# or ##786&lt;Call&gt;</p></td>
<td><p>&quot;Return To New&quot;—removes all user-specific information from NVRAM and deactivates the phone.</p></td>
</tr>
<tr class="even">
<td><p>##MSL#</p></td>
<td><p>##675#</p></td>
<td><p>Subsidy lock.</p></td>
</tr>
<tr class="odd">
<td><p>##PST# or ##PST@</p></td>
<td><p>##778# or ##778&lt;Call&gt;</p></td>
<td><p>Product Support Tool—Displays the product support menu to select tasks such as deactivation.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Dialer%20codes%20to%20launch%20diagnostic%20applications%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




