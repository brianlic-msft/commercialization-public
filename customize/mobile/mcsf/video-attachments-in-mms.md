---
title: Video attachments in MMS
description: Partners can specify the transcoding to use for video files sent as attachments in MMS messages.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 78ef9c04-2eaf-4c52-80c0-f595c4e8759a
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Video attachments in MMS


Partners can specify the transcoding to use for video files sent as attachments in MMS messages.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="TargetVideoFormat"  
                         Description="Use to specify the transcoding to use for video files sent as attachments in MMS messages."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <!-- Define the Targets --> 
      <Targets>
         <Target Id="">
            <TargetState>
               <Condition Name="" Value="" />
               <Condition Name="" Value="" />
            </TargetState>
         </Target>
      </Targets>
      
      <Static>
        <Settings Path="Multivariant">
          <Setting Name="Enable" Value="1" />
        </Settings>
        <Settings Path="AutoDataConfig">
          <Setting Name="Enable" Value="0" />
        </Settings>
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>

        <Settings Path="Messaging/PerSimSettings/$(__ICCID)">  
          <Setting Name="TargetVideoFormat" Value="" />             
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  Set `TargetVideoFormat` to one of the following values to configure the default transcoding for video files sent as attachments in MMS messages:

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
    <td><p>0 or 0x0</p></td>
    <td><p>Sets the transcoding to H.264 + AAC + MP4. This is the default set by the OS.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 0x1</p></td>
    <td><p>Sets the transcoding to H.264 + AAC + 3GP.</p></td>
    </tr>
    <tr class="odd">
    <td><p>2 or 0x2</p></td>
    <td><p>Sets the transcoding to H.263 + AMR.NB + 3GP.</p></td>
    </tr>
    <tr class="even">
    <td><p>3 or 0x3</p></td>
    <td><p>Sets the transcoding to MPEG4 + AMR.NB + 3GP.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Attempt to send a message with an attachment that requires the new transcoding. Verify that the message sends and that the file can be opened after it is received.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Video%20attachments%20in%20MMS%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




