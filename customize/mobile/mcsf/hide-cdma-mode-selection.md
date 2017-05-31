---
title: Hide CDMA mode selection
description: For CDMA phones, partners can hide CDMA option in the network Mode selection drop-down that appears on the Cellular SIM screen in Settings.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8ad8dc3d-1983-45ab-9f16-c82132677bf2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hide CDMA mode selection


For CDMA phones, partners can hide **CDMA** option in the network **Mode** selection drop-down that appears on the **Cellular & SIM** screen in **Settings**.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HideCDMAModeSelection"  
                         Description="Use to hide or show the 'CDMA' option in the network 'Mode' selection drop-down that appears in the cellular settings screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      

    <!-- Use for the per-IMSI case 
      
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
     
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/CellUX">   
          <!-- Hides or shows the 'CDMA' option in the network mode selection screen. Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="Hide3GPP2ModeSelection" Value="" />    
        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
         <Settings Path="CellCore/PerDevice/CellUX">  
          <!-- Hides or shows the 'CDMA' option in the network mode selection screen. Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="Hide3GPP2ModeSelection" Value="" />   
        </Settings>  
      </Static>

    -->

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Determine if you need to use the **per-IMSI** or **per-device** setting.

    For the **per-IMSI** case:

    1.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

    2.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

4.  Set the value for `Hide3GPP2ModeSelection` to one of the following:

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
    <td><p>0 or 'No'</p></td>
    <td><p>Shows the <strong>CDMA</strong> option in the network <strong>Mode</strong> selection drop-down.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the <strong>CDMA</strong> option in the network <strong>Mode</strong> selection drop-down.</p></td>
    </tr>
    </tbody>
    </table>

     

    The default for this setting is to show the **CDMA** option in the **Mode** selection drop-down that appears in the **Cellular & SIM** settings screen.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **Cellular & SIM** screen in **Settings**.

3.  Depending on the value that you set, verify whether the **CDMA** option in the network **Mode** selection drop-down is visible.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Hide%20CDMA%20mode%20selection%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




