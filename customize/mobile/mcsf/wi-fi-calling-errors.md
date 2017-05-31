---
title: Wi-Fi calling errors
description: OEMs can customize the mobile device to configure settings related to Wi-Fi calling errors.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: E3BF5E3A-755B-4B8F-B528-A89A30034B7F
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Wi-Fi calling errors


OEMs can customize the mobile device to configure settings related to Wi-Fi calling errors, including:

-   Show an error message when a Wi-Fi calling error is reported by the modem.
-   Show a specific error message based on operator requirements.
-   Customize the generic error string when a Wi-Fi calling error happens.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="WiFiCallingErrors"  
                         Description="Use to customize the Wi-Fi calling error settings."  
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
          <Setting Name="ShowWifiCallingError" Value="" />  
          <Setting Name="ShowSpecificWifiCallingError" Value="" />  
          <Setting Name="GenericWifiCallingErrorMessage" Value="" />  
        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
         <Settings Path="CellCore/PerDevice/CellUX">  
          <Setting Name="ShowWifiCallingError" Value="" />  
          <Setting Name="ShowSpecificWifiCallingError" Value="" />  
          <Setting Name="GenericWifiCallingErrorMessage" Value="" />   
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

4.  To show the Wi-Fi calling error message in the mobile device UI, set `ShowWifiCallingError` to one of the following values:

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
    <td><p>Shows the Wi-Fi calling error message.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the Wi-Fi calling error message.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  To show the T-Mobile specific error message in the mobile device UI, set `ShowSpecificWifiCallingError` to one of the following values:

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
    <td><p>Shows the Wi-Fi calling error message.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the Wi-Fi calling error message.</p></td>
    </tr>
    </tbody>
    </table>

     

    **Note**  If the mobile device is not specific to T-Mobile, OEMs should use the `GenericWifiCallingErrorMessage` setting instead.

     

6.  To specify a custom generic Wi-Fi calling error string in the mobile device UI, set `GenericWifiCallingErrorMessage` to a string that corresponds to the error message you want to show. The string must not be longer than 127 characters.

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator partner to understand the Wi-Fi calling error message requirements for the operator and to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Wi-Fi%20calling%20errors%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




