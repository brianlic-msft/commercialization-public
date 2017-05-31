---
title: Enable call recording by default
description: Partners can configure devices to have the call recording feature enabled by default.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: DF25904A-BF66-4E1B-9085-A0BBE3AD28F8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable call recording by default


\[Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.\]

Partners can configure devices to have the call recording feature enabled by default.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CallRecordingOff"  
                         Description="Indicates if call recording is turned off. User will not see call recording functionality when this is set to true."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name=" CallRecordingOff" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `CallRecordingOff` to one of the following values:

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
    <td><p>0 or 'False'</p></td>
    <td><p>Sets the call recording management app to Voice Recorder, which turns on the call recording feature.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Sets the call recording management app to none, which turns off the call recording feature. This is the default OS Value.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build that contains this customization to a phone.

2.  Open the **Settings** app and select **Phone.**

3.  Under **Default apps**, tap **Choose apps**.

4.  Under **Calling**, verify that Voice Recorder is showing under **Choose the app you want to use to manage recorded phone calls**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enable%20call%20recording%20by%20default%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




