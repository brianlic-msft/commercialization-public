---
title: Disabling text correction and suggestions
description: For markets that do not use any of the available input languages, partners pick an alternative available input language as the default, but disable text prediction, auto-correction, and the spelling checker by default, using this customization.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 16bffab4-8ac1-4bd9-93cf-bbe34810bf3b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disabling text correction and suggestions


For markets that do not use any of the available input languages, partners pick an alternative available input language as the default, but disable text prediction, auto-correction, and the spelling checker by default, using this customization.

Partners must not remove any keyboards, disable default keyboards for an input language, nor modify any keyboard layouts in any way. However, for markets that do not use any of the available input languages, partners pick an alternative available input language as the default, but disable text prediction, auto-correction, and the spelling checker. This prevents the user’s words from being automatically changed to similar words in the alternate language as they type.

Users can turn text prediction, auto-correction, and the spelling checker back on by going to the **keyboard** screen in **Settings**, tapping their desired keyboard language, and selecting **Suggest text**.

**Limitations and restrictions:**

-   Partners can disable text correction and suggestions for only one language. This functionality cannot be disabled for Japanese, Chinese, or Korean.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisableTextCorrection"  
                         Description="Use to disable text prediction, auto-correction, and spelling checker for an alternative input language."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="TextInput/Intelligence">  
          <Setting Name="DisablePredictions" Value="" />       
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value` to the locale or alternative input language that must have the text intelligence features disabled. For example, to disable text correction and suggestions for English (UK), set `Value` to `en-gb`.

<a href="" id="testing-steps-"></a>**Testing Steps:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **keyboard** screen in **Settings**.

3.  Choose the keyboard language where you turned off text correction and suggestions to open the keyboard settings.

4.  Verify that the checkboxes for **Suggest text**, **Highlight misspelled words**, **Correct misspelled words**, and **Insert a space after selection a suggestion** are unchecked.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Disabling%20text%20correction%20and%20suggestions%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




