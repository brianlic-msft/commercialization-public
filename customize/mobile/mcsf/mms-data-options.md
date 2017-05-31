---
title: MMS data options
description: Partners can configure the MMS data options to Show the Allow MMS if cellular data is off toggle in the Messaging settings screen.Allow MMS messaging even if data is turned off.Allow MMS messaging even if data is turned off and the user is roaming.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: CE99E7FA-2B3F-483F-BDAD-D0F539874E95
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MMS data options


For some phones, the cellular data plan includes the data used to send MMS. If cellular data is turned off, so is the ability to send MMS messages. However, other data plans bill MMS data separately. In this case, it’s necessary to have a setting that allows for MMS messages to be sent even if the data toggle is off.

Partners can configure the MMS data options to:

-   Show the **Allow MMS if cellular data is off** toggle in the **Messaging** settings screen.

-   Allow MMS messaging even if data is turned off.

-   Allow MMS messaging even if data is turned off and the user is roaming.

OEMs can configure these settings on both single SIM and C+G dual SIM phones.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AllowMMSIfDataIsOff"  
                         Description="Use to configure MMS settings if data is turned off."  
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

        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/AllowMmsIfDataIsOff">  
          <Setting Name="AllowMmsIfDataIsOffSupported" Value="" />      
          <Setting Name="AllowMmsIfDataIsOff" Value="" />  
          <Setting Name="AllowMmsIfDataIsOffWhileRoaming" Value="" />  
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  To hide or show the **Allow MMS if cellular data is off** toggle in the **Messaging** settings screen, set the value of `AllowMmsIfDataIsOffSupported` to one of the following:

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
    <td><p>Hides the <strong>Allow MMS if cellular data is off</strong> toggle.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Shows the <strong>Allow MMS if cellular data is off</strong> toggle.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  Before you set the value for `AllowMmsIfDataIsOff`, note that if you do not set `ExemptFromDisablePolicy` to 1 (0 by default), then you must:

    -   Hide the **Allow MMS if cellular data is off** toggle by setting `AllowMmsIfDataIsOffSupported` to 0 (1 by default).

    -   Set `AllowMmsIfDataIsOff` itself to 1 (0 by default).

    For more information about `ExemptFromDisablePolicy`, see [CM\_CellularEntries CSP](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/mdm/cm-cellularentries-csp).

    To allow or disallow MMS messaging even if data is turned off, set the value of `AllowMmsIfDataIsOff` to one of the following:

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
    <td><p>MMS is on when data is on, and off when data is off. MMS will also be off when roaming if the user has set the phone to not use data while roaming.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>MMS is on even when the data toggle is off, but not when roaming if data is off.</p></td>
    </tr>
    </tbody>
    </table>

     

7.  To allow MMS if data is turned off while the user is roaming, set value of `AllowMmsIfDataIsOffWhileRoaming` to one of the following:

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
    <td><p>MMS messaging if off when roaming even if the user has set to allow MMS messaging if data is turned off.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>MMS messaging is on when roaming even while data is off.</p>
    <p>Shows the user alert.</p></td>
    </tr>
    </tbody>
    </table>

     

    **Note**  This setting is only visible if `AllowMmsIfDataIsOff` is set.

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **Messaging** settings screen.

3.  Verify if the messaging options match the values you set for each setting.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20MMS%20data%20options%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




