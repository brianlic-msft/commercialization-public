---
title: Change the default SIM name to match the SPN or operator name
description: By default, the OS displays SIM 1 or SIM 2 as the default friendly name for the SIM in slot 1 or slot 2 if the service provider name (SPN) or mobile operator name has not been set.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d40bb857-5496-459d-bcc7-38833a2db4c2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Change the default SIM name to match the SPN or operator name


By default, the OS displays **SIM 1** or **SIM 2** as the default friendly name for the SIM in slot 1 or slot 2 if the service provider name (SPN) or mobile operator name has not been set. Partners can use this customization to change the default name read from the SIM to define the SPN for SIM cards that do not contain this information or to generate the default friendly name for the SIM.

The OS uses the default value as the display name for the SIM or SPN in the Start screen and other parts of the UI including the SIM settings screen. For dual SIM phones that contain SIMs from the same mobile operator, the names that appear in the UI may be similar.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MultivariantProvisionedSPN"  
                         Description="Use to define the SPN for SIM cards that don't contain this information or use to
                                      generate the default friendly name for the SIM."  
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
       </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `MultivariantProvisionedSPN` value to the name of the SPN or mobile operator.

    The following table shows the scenarios supported by this customization:

    **Note**  
    In the **Default SIM name** column:

    -   The **" "** in *MultivariantProvisionedSPN*" "1234 means that there is a space between the mobile operator name or SPN and the last 4 digits of the MSISDN.

    -   *MultivariantProvisionedSPN* means the value that you set for the `MultivariantProvisionedSPN` setting.

    -   *SIM 1* or *SIM 2* is the default friendly name for the SIM in slot 1 or slot 2.

     

    <table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Multivariant setting set?</th>
    <th>SPN provisioned?</th>
    <th>MSISDN (last 4 digitis: 1234, for example) provisioned?</th>
    <th>Default SIM name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>Yes</p></td>
    <td><p>Yes</p></td>
    <td><p>Yes</p></td>
    <td><p><em>MultivariantProvisionedSPN</em>1234 or <em>MultivariantProvisionedSPN</em>&quot; &quot;1234</p></td>
    </tr>
    <tr class="even">
    <td><p>Yes</p></td>
    <td><p>No</p></td>
    <td><p>No</p></td>
    <td><p><em>MultivariantProvisionedSPN</em> (up to 16 characters)</p></td>
    </tr>
    <tr class="odd">
    <td><p>Yes</p></td>
    <td><p>Yes</p></td>
    <td><p>No</p></td>
    <td><p><em>MultivariantProvisionedSPN</em> (up to 16 characters)</p></td>
    </tr>
    <tr class="even">
    <td><p>Yes</p></td>
    <td><p>No</p></td>
    <td><p>Yes</p></td>
    <td><p><em>MultivariantProvisionedSPN</em>1234 or <em>MultivariantProvisionedSPN</em>&quot; &quot;1234</p></td>
    </tr>
    <tr class="odd">
    <td><p>No</p></td>
    <td><p>Yes</p></td>
    <td><p>Yes</p></td>
    <td><p>If SPN string &gt;= 12: <em>SPN</em>1234</p>
    <p>If SPN string &lt; 12: <em>SPN</em>&quot; &quot;1234</p></td>
    </tr>
    <tr class="even">
    <td><p>No</p></td>
    <td><p>No</p></td>
    <td><p>No</p></td>
    <td><p><em>SIM 1</em> or <em>SIM 2</em></p></td>
    </tr>
    <tr class="odd">
    <td><p>No</p></td>
    <td><p>Yes</p></td>
    <td><p>No</p></td>
    <td><p>SPN (up to 16 characters)</p></td>
    </tr>
    <tr class="even">
    <td><p>No</p></td>
    <td><p>No</p></td>
    <td><p>Yes</p></td>
    <td><p><em>SIM 1</em> or <em>SIM 2</em></p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone that supports either a single or dual SIM.

2.  Boot the phone and verify that the displayed friendly name for the SIM matches the SPN name or the value set for `MultivariantProvisionedSPN`.

    If there are two SIMs, verify that the displayed friendly names appear as expected.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Change%20the%20default%20SIM%20name%20to%20match%20the%20SPN%20or%20operator%20name%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




