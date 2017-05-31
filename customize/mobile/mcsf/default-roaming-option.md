---
title: Default roaming option
description: Partners can set the default value for the Default roaming options option in the Cellular SIM settings screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3d02bf12-08c1-4889-89c4-a76b0c60e7ef
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Default roaming option


Partners can set the default value for the **Default roaming options** option in the **Cellular & SIM** settings screen.

Users can later change the default roaming option on the device.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DefaultRoamingOption"  
                         Description="Use to set the default roaming option."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Connections/General">  
          <Setting Name="DataRoam" Value="" />    
       </Settings>  

      </Static>
    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `DataRoam` to one of the following:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Option</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'DoNotRoam'</p></td>
    <td><p>Don’t roam</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'DomesticRoaming'</p></td>
    <td><p>Don’t roam (domestic roaming if applicable)</p></td>
    </tr>
    <tr class="odd">
    <td><p>2 or 'InternationalRoaming'</p></td>
    <td><p>Roam (international roaming if applicable)</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **Settings** &gt; **Cellular & SIM** screen.

3.  Verify that the **Default roaming options** shows the correct default value that you set.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Default%20roaming%20option%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




