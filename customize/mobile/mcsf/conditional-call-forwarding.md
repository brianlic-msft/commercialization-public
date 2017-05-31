---
title: Conditional call forwarding
description: Partners can now show the call forwarding icon for conditional call forwarding as well as unconditional call forwarding.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e4e48842-bcf1-40ec-8012-bf34cb92f121
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Conditional call forwarding


Partners can now show the call forwarding icon for conditional call forwarding as well as unconditional call forwarding.

Partners should not enable this feature for networks that support voicemail, which is implemented on the network as conditional call forwarding so the call forwarding icon would also be on.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ConditionalCallForwardingIcon"  
                         Description="Use to show the call forwarding icon for conditional call forwarding as well as unconditional call forwarding."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Shell/SystemTray/ConditionalCallForwarding">  
          <!-- Set the value to 0 or 'Disabled' (shows the icon for unconditional call forwarding only), or
               set to 1 or 'Enabled' (shows the icon for both conditional and unconditional call forwarding) -->
          <Setting Name="ConditionalCallForwardingIcon" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `ConditionalCallForwardingIcon` to one of the following values:

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
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Only unconditional forwarding will indicate call forwarding. This is the default.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Both conditional and unconditional forwarding will indicate call forwarding.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a UICC.

2.  Set conditional call forwarding using the following USDD codes as specified in the topic [Supplementary services exclusions](supplementary-services-exclusions.md):

    -   61 (FWDNOREPLY)

    -   62 (FWDNOTREACHABLE)

    -   67 (FWDBUSY)

3.  Depending on the market, verify that the call forwarding icon appears based on the `IndicateConditionalCallForwarding` registry setting.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Conditional%20call%20forwarding%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




