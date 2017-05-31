---
title: Enabling runtime configuration
description: Runtime configuration, or multivariant, provides a generic mechanism for creating a single image that can work for multiple markets and reduce the number of images that OEMs need to create, manage, and test.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9099d7c2-35fb-4b9a-be8e-aa598df0da7f
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enabling runtime configuration


Runtime configuration, or multivariant, provides a generic mechanism for creating a single image that can work for multiple markets and reduce the number of images that OEMs need to create, manage, and test. By default, runtime configuration is enabled and ADC is turned off. Only one or the other must be turned on. So, if an OEM wants to disable runtime configuration, they must enable ADC.

The OS will handle different scenarios depending on whether runtime configuration has been enabled so OEMs should take into consideration the scenarios they are trying to enable.

**Note**  
By enabling runtime configuration, SIM-based language detection will also be enabled.

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="EnableRuntime configuration"  
                         Description="Use to enable runtime configuration."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>
          <!-- Turns on runtime configuration -->
          <Settings Path="Multivariant">  
             <Setting Name="Enable" Value="1" /> 
          </Settings>  
          <!-- Turns off ADC -->
          <Settings Path="AutoDataConfig">  
             <Setting Name="Enable" Value="0" /> 
          </Settings>  
       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  The above code example shows the default setting. Only one can be turned on (or enabled), and the other must be turned off (or disabled). Depending on what you want to do, you can use one of the following values:

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
    <td><p>0</p></td>
    <td><p>Disables the feature</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>Enables the feature</p></td>
    </tr>
    </tbody>
    </table>

     

The registry key for enabling or disabling runtime configuration is below. This registry key can have a value of 1 or 0 where 1 represents enabled and 0 represents disabled.

``` syntax
HKLM\software\microsoft\multivariant\enable
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enabling%20runtime%20configuration%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




