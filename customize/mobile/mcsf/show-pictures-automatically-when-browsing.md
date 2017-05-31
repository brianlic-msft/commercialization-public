---
title: Show pictures automatically when browsing
description: Partners can enable or disable the Show pictures automatically setting in the browser's advanced settings screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 80d63ec5-1c1b-4f0b-ba11-324c3a6ef10e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Show pictures automatically when browsing


Partners can enable or disable the **Show pictures automatically** setting in the browser's **advanced settings** screen.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ShowPicturesAutomatically"  
                         Description="Use to enable or disable the 'Show pictures automatically' setting in the browser's advanced settings screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="MicrosoftEdge/DataSaving">  
          <Setting Name="ShowPicturesAutomatically" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `ShowPicturesAutomatically` to one of the following values:

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
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Shows the <strong>Show pictures automatically</strong> option in the browser <strong>advanced settings</strong> screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Disables the <strong>Show pictures automatically</strong> option in the browser <strong>advanced settings</strong> screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Open the browser settings screen and choose the **advanced settings** option.

3.  From the advanced settings screen, verify that **Show pictures automatically** is either enabled or disabled depending on the value that you set for `ShowPicturesAutomatically`.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Show%20pictures%20automatically%20when%20browsing%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




