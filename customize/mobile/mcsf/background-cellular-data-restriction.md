---
title: Background cellular data restriction
description: To meet market or mobile operator requirements, OEMs can restrict background data in the data usage settings.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4d938b9f-f100-406b-be76-4259005d1b1a
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Background cellular data restriction


To meet market or mobile operator requirements, OEMs can restrict background data in the data usage settings.

OEMs can set the default value to either never restrict usage of the data plan or restrict background data when roaming.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DataSaverMode"  
                         Description="Use to restrict background data. OEMs can set the default value to either never restrict usage
                                      of the data plan or restrict background data when roaming."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="DataSense">  
          <Setting Name="DataSaverMode" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `DataSaverMode` to one of the following:

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
    <td><p>0 or 'NeverRestrict'</p></td>
    <td><p>Never restrict usage of the data plan.</p></td>
    </tr>
    <tr class="even">
    <td><p>2 or 'RestrictWhenRoaming'</p></td>
    <td><p>Restrict background data when roaming.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build that contains this customization to a device.

2.  Go to the **Data usage** settings screen.

    Verify that the correct settings option is enabled depending on the default value that you set. A toggle to restrict background data also becomes available to the user.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Background%20cellular%20data%20restriction%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




