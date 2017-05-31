---
title: Showing the FM radio
description: For devices that include an FM radio chip, OEMs can show FM Radio in the Apps list.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 824ca9d5-6dda-41a3-83a5-230df3553688
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Showing the FM radio


For devices that include an FM radio chip, OEMs can show **FM Radio** in the Apps list. In addition, OEMs can also set the default [FM radio frequency band](fm-radio-frequency-band.md).

By default, the Windows 10 Mobile FM radio UI is hidden.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ShowFMRadioUI"  
                         Description="Use to show the FM radio UI for devices that include an FM radio chip."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="FmRadio">  
          <Setting Name="NotPresent" Value="0" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `NotPresent` to 0 to show the **FM Radio** app.

    **Note**  
    Setting `NotPresent` to 1 is not necessary because the radio UI is hidden by default.

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Verify that **FM radio** is now visible in the Apps list.

## Related topics


[FM radio frequency band](fm-radio-frequency-band.md)

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Showing%20the%20FM%20radio%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





