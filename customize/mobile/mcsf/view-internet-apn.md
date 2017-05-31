---
title: View Internet APN
description: For mobile operators that require it, OEMs can show the View Internet APN button in the Cellular SIM settings page for users that have a data plan.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f938feac-d198-4b4d-8a8f-7e2f803e47d5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# View Internet APN


For mobile operators that require it, OEMs can show the **View Internet APN** button in the **Cellular & SIM** settings page for users that have a data plan. When data is off, the button is disabled. By default, the button is hidden.

For dual SIM devices, the button is visible depending on the multivariant SIM settings. For example, if the data plan is on SIM1 and the setting is configured to hide the button, the **View Internet APN** button will be hidden. If the user switches to SIM2 and the setting is configured to show the button, the user will see the **View Internet APN** button.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ViewInternetAPN"  
                         Description="Use to show the 'View Internet APN' button in the cellular+SIM settings screen."  
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
          <!-- Use to show the 'View Internet APN' button in the cellular+SIM settings screen. 
               Set to 0 or 'No' (to hide, default) or set to 1 or 'Yes' (to show). -->
          <Setting Name="ShowViewAPN" Value="" />  
        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
         <Settings Path="CellCore/PerDevice/CellUX">  
          <!-- Use to show the 'View Internet APN' button in the cellular+SIM settings screen. Set to 0 or 'No' (to hide, default) or set to 1 or 'Yes' (to show). -->
          <Setting Name="ShowViewAPN" Value="" />         
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

4.  Set the value for `ShowViewAPN` to one of the following:

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
    <td><p>Hides the <strong>View Internet APN</strong> button in the <strong>Cellular + SIM</strong> settings screen.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Shows the <strong>View Internet APN</strong> button in the <strong>Cellular + SIM</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a SIM.

2.  Go to the **Cellular & SIM** screen in **Settings**.

3.  Verify that the **View Internet APN** button is either hidden or visible depending on the value you set for `ShowViewAPN`.

    On a dual SIM device, verify if the **View Internet APN** button is hidden or visible depending on the `ShowViewAPN` setting value for each SIM.

4.  If there is no data plan associated with the SIM or data is turned off, verify that the button is disabled.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20View%20Internet%20APN%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




