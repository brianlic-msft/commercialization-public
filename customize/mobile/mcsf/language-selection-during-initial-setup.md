---
title: Language selection during initial setup
description: If multiple display languages are included on the device, partners have the option of hiding the Language selection screen during setup.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: df02fcad-e3cb-49d7-ae8e-5bcdfe0a0fce
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Language selection during initial setup


If multiple display languages are included on the device, partners have the option of hiding the **Language selection** screen during setup. As a result, the device will use the default specified by the OEM, and users can change the language later by using the **Time & Language** screen in **Settings**.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Specify more than one phone language for your image. For more information, see [Phone languages](phone-languages.md).

2.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="LanguageSelectionScreen"  
                         Description="Use to show or hide the language selection screen during setup."
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="SetupWizard">  
          <Setting Name="ShowLanguageSelectionScreenInSetup" Value="" />  
        </Settings>

       </Static>
    </ImageCustomizations>
    ```

3.  Specify an `Owner`.

4.  Set the `Value` to either of the following:

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
    <td><p>0 or 'Hide'</p></td>
    <td><p>Hides the <strong>Language selection</strong> screen during setup.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Show'</p></td>
    <td><p>Shows the <strong>Language selection</strong> screen during setup.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization and multiple languages to a phone.

2.  At the beginning of setup, verify that the **Language selection** screen is either shown or hidden depending on the default value you specified.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Language%20selection%20during%20initial%20setup%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




