---
title: Additional Internet APN settings
description: OEMs can hide both the add internet apn button and the IP type listbox in the internet APN settings screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 688c9a86-91dc-40c3-8d88-dd07202b4270
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Additional Internet APN settings


OEMs can hide both the **add internet apn** button and the **IP type** listbox in the **internet APN** settings screen.

If it is required by the mobile operator OEMs can hide the **add internet apn** button, which enables the user to manually add and configure a data connection for a network. OEMs can also hide the **IP type** listbox in the **internet APN** settings screen.

**Limitations and restrictions**:

-   Partners must not provide an alternate user interface for adding or editing APN values.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="InternetAPNSettings"  
                         Description="Use to hide or show the 'add internet apn' button in the SIM settings screen,
                                      and hide or show the 'IP type' setting in the internet APN settings screen."  
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
          <Setting Name="HideAPN" Value="" />  
          <Setting Name="HideAPNIPType" Value="" />      
          <Setting Name="APNIPTypeIfHidden" Value="" />      
        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
         <Settings Path="CellCore/PerDevice/CellUX">  
          <Setting Name="HideAPN" Value="" />  
          <Setting Name="HideAPNIPType" Value="" />      
          <Setting Name="APNIPTypeIfHidden" Value="" />      
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

4.  Set the value for `HideAPN` to one of the following:

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
    <td><p>Shows the <strong>add internet APN</strong> button in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the <strong>add internet APN</strong> button in the <strong>SIM</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

5.  Set the value for `HideAPNIPType` to one of the following:

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
    <td><p>Shows the <strong>IP type</strong> listbox in the <strong>internet APN</strong> settings screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Hides the <strong>IP type</strong> listbox in the <strong>internet APN</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  To change the default IP type shown in the **IP type** listbox: Set the value for `APNIPTypeIfHidden` to one of the following:

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
    <td><p>0 or 'IPV4'</p></td>
    <td><p>Sets the default IP type to IPv4.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'IPV6'</p></td>
    <td><p>Sets the default IP type to IPv6.</p></td>
    </tr>
    <tr class="odd">
    <td><p>2 or 'IPV4V6'</p></td>
    <td><p>Sets the default IP type to IPv4v6.</p></td>
    </tr>
    <tr class="even">
    <td><p>3 or 'IPV4V6XLAT'</p></td>
    <td><p>Sets the default IP type to IPv4v6 XLAT.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **cellular & SIM** screen in **Settings**.

3.  Verify that the **add internet apn** button is no longer visible if configured to be hidden.

4.  Tap the **add internet apn** button. Depending on the setting, verify that:

    1.  The **IP type** setting either shows a dropdown listbox with **IPv4**, **IPv6**, **IPv4v6**, or **IPv4v6 464XLAT**. Or,

    2.  The **IP type** setting is hidden.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Additional%20Internet%20APN%20settings%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




