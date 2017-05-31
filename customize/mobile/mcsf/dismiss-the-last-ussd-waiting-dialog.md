---
title: Dismiss the last USSD waiting dialog
description: Dismiss the last USSD waiting dialog in the case where there is a sequence of USSD or SIM app dialogs.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 829b34c7-f36c-44e3-9770-4584013847e7
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Dismiss the last USSD waiting dialog


Dismiss the last USSD waiting dialog in the case where there is a sequence of USSD or SIM app dialogs.

This customization affects the behavior of USSD dialog sequencing. It dismisses the last **Waiting…** dialog in the case where there is a sequence of USSD or SIM app dialogs. OEMs may need to configure this customization in cases where there is a sequence of two or more SIM app dialogs and where the OS might display a **Waiting…** dialog indefinitely and the dialog can only dismissed when the user taps **Cancel**.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AutoDismissUssdWaitingDialog"  
                         Description="Use to dismiss the last 'Waiting...' dialog in cases where there is a sequence of USSD or SIM app dialogs"."  
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

        <Settings Path="Phone/PerSimSettings/$(__IMSI)"> 
          <Setting Name="AutoDismissUssdWaitingDialog" Value="" />        
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  For the **per-IMSI** case:

    1.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

    2.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

4.  Set `AutoDismissUssdWaitingDialog` to one of the following values:

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
    <td><p>The last <strong>Waiting…</strong> dialog won't be dismissed until the user cancels to dismiss the dialog. This may be confusing in some cases and can make the dialog appear frozen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>The last <strong>Waiting…</strong> dialog will be automatically dismissed when the sequence of USSD or SIM app dialogs completes.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator to fully test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Dismiss%20the%20last%20USSD%20waiting%20dialog%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




