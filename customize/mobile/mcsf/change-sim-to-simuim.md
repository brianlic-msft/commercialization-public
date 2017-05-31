---
title: Change SIM to SIM/UIM
description: Partners can change the string \ 0034;SIM \ 0034; to \ 0034;SIM/UIM \ 0034; in the device UI.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3d304e12-14ff-4c7b-a46c-9d7cdcd97223
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Change SIM to SIM/UIM


Partners can change the string "SIM" to "SIM/UIM" in the device UI.

Enabling this customization changes all "SIM" strings to "SIM/UIM".

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SIMToSIMUIM"  
                         Description="Use to replace the 'SIM' strings in the device UI to 'SIM/UIM' to accommodate scenarios such as Dual Mode cards of 
                                      SIM cards on the device."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="CellCore/PerDevice/UIX">  
          <!-- Set the value to 0 or "SIM" (to use the default SIM string), or set to 1 or "UIM" (to use the alternate SIM/UIM string) -->
          <Setting Name="SIMToSIMUIM" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `SIMToSIMUIM` to one of the following:

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
    <td><p>0 or 'SIM'</p></td>
    <td><p>Uses the default string &quot;SIM&quot;.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'UIM'</p></td>
    <td><p>Uses the alternate string &quot;SIM/UIM&quot;.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device without a SIM.

2.  During the initial device setup, verify that you see the following error:

    **SIM/UIM error**

    **The SIM/UIM card is missing or invalid. You can still make emergency calls if your mobile operator supports it.**

3.  In the Start screen, verify that the phone tile shows **No SIM/UIM**.

    All other "SIM" strings on the device should now show "SIM/UIM".

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Change%20SIM%20to%20SIM/UIM%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




