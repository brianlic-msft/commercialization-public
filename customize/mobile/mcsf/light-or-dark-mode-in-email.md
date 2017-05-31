---
title: Light or dark mode in email
description: The email application consists of several screens, including the List View, Settings, Automatic Replies, Search, Inbox Linking, Read, and Compose.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 81ec5d29-1be6-4fbc-81aa-39ccb04087ba
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Light or dark mode in email


The email application consists of several screens, including the List View, Settings, Automatic Replies, Search, Inbox Linking, Read, and Compose. By default, the email background for all pages except Read and Compose match the system theme. The Read and Compose pages always have a light background. Partners can specify that the entire email application always has a light background, but users do not have access to this setting. However, if the user turns on high-contrast mode, it overrides all other settings, and all screens use the high contrast settings.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DefaultEmailBackgroundTheme"  
                         Description="Use to configure the entire email app to always have a light background."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="Email">  
          <Setting Name="DefaultBackgroundThemeSetting" Value="" />
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `DefaultBackgroundThemeSetting` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1 or Light Background</p></td>
    <td><p>Configures the entire email application to always have a light background.</p>
    <p>Users cannot override this setting, but if high contrast is enabled this setting will be changed.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or System Default</p></td>
    <td><p>Keeps the default background theme for the email app.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a phone that has data connectivity.

2.  Go to the **theme** screen in **Settings**. Set the background theme to dark.

3.  Go to the **email+accounts** screen in **Settings**. Configure an email account.

4.  Go to the configured email account’s inbox.

5.  Verify that the email background is light.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Light%20or%20dark%20theme%20in%20email%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




