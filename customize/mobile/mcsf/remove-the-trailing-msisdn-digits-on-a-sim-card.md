---
title: Remove the trailing MSISDN digits on a SIM card
description: OEMs can remove the trailing MSISDN digits from the service provider name (SPN) in the device UI.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 43ee4fac-8a4c-4cd0-8395-5091aba3a1d8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Remove the trailing MSISDN digits on a SIM card


OEMs can remove the trailing MSISDN digits from the service provider name (SPN) in the device UI.

By default, the OS appends the trailing MSISDN digits to the service provider name (SPN) in the device UI, including on the device and messaging apps. If required by mobile operators, OEMs can use the `SimNameWithoutMSISDNEnabled` setting to remove the trailing MSISDN digits. However, you must use this setting together with `MultivariantProvisionedSPN` to suppress the MSISDN digits. For more information about how to use `MultivariantProvisionedSPN`, see [Change the default SIM name to match the SPN or operator name](change-the-default-sim-name-to-match-the-spn-or-operator-name.md).

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SimNameWithoutMSISDNEnabled"  
                         Description="Use to suppress the trailing MSISDN digits that are appended to the SPN in the device UI."  
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

        <Settings Path="CellCore/PerIMSI/$(__IMSI)/General/Critical">  
          <Setting Name="MultivariantProvisionedSPN" Value="" />    
          <Setting Name="SimNameWithoutMSISDNEnabled" Value="" />    
       </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `MultivariantProvisionedSPN` value to the name of the SPN or mobile operator. For more information, see [Change the default SIM name to match the SPN or operator name](change-the-default-sim-name-to-match-the-spn-or-operator-name.md).

4.  Set `SimNameWithoutMSISDNEnabled` to one of the following values:

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
    <td><p>Keeps the trailing MSISDN digits.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Removes the trailing MSISDN digits.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device that supports either a single or dual SIM.

2.  Boot the device and verify the following:

    -   The displayed friendly name for the SIM matches the SPN name or the value set for `MultivariantProvisionedSPN`. If there are two SIMs, verify that the displayed friendly names appear as expected for that SIM.

    -   If you set `SimNameWithoutMSISDNEnabled`=1, the trailing MSISDN digits should not appear. If there are two SIMs and both have `SimNameWithoutMSISDNEnabled`=1, both SIMs should not show the MSISDN digits in the UI.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Remove%20the%20trailing%20MSISDN%20digits%20on%20a%20SIM%20card%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




