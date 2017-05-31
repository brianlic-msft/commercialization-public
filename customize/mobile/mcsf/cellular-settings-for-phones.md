---
title: Cellular settings for phones
description: OEMs can hide certain user options for phones that appear in the Cellular SIM screen in Settings.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 328fb6ed-50b6-4e73-8752-704fe7bcf587
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cellular settings for phones


OEMs can hide certain user options for phones that appear in the **Cellular & SIM** screen in **Settings**.

These options include:

-   For World mode: **Network Mode selection** drop-down

-   For GSM: **Network Selection** drop-down

-   For CDMA: **Network Type** drop-down

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CellularSettings"  
                         Description="Use to hide certain user options for phones that appear in the cellular+SIM settings screen."  
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
          <!-- Hides or shows the 'Network Mode selection' drop-down in the SIM settings screen for world mode phones.
               Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="HideModeSelection" Value="" />  

          <!-- Hides or shows the 'Network Selection' drop-down in the SIM settings screen for 3GPP or GSM phones. 
               Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="Hide3GPPNetworks" Value="" />   

          <!-- Hides or shows the 'Network Type' drop-down in the SIM settings screen for 3GPP2 or CDMA phones. 
               Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="Hide3GPP2Selection" Value="" />     
        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
         <Settings Path="CellCore/PerDevice/CellUX">  
          <!-- Hides or shows the 'Network Mode selection' drop-down in the SIM settings screen for world mode phones.
               Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="HideModeSelection" Value="" />  

          <!-- Hides or shows the 'Network Selection' drop-down in the SIM settings screen for 3GPP or GSM phones. 
               Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="Hide3GPPNetworks" Value="" />   

          <!-- Hides or shows the 'Network Type' drop-down in the SIM settings screen for 3GPP2 or CDMA phones. 
               Set to 0 or 'No' (to show) or set to 1 or 'Yes' (to hide). -->
          <Setting Name="Hide3GPP2Selection" Value="" />        
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

4.  For World mode phones: Set the value for `HideModeSelection` to one of the following:

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
    <td><p>Shows the <strong>Network Mode selection</strong> drop-down in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the <strong>Network Mode selection</strong> drop-down in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  For 3GPP or GSM phones: Set the value for `Hide3GPPNetworks` to one of the following:

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
    <td><p>Shows the <strong>Network Selection</strong> drop-down in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the <strong>Network Selection</strong> drop-down in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  For 3GPP2 or CDMA phones: Set the value for `Hide3GPP2Selection` to one of the following:

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
    <td><p>Shows the <strong>Network Type</strong> drop-down in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the <strong>Network Type</strong> drop-down in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Go to the **Cellular & SIM** screen in **Settings**.

3.  Verify that the user options are visible only if appropriate.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Cellular%20settings%20for%20phones%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




