---
title: Network-controlled caller ID settings
description: For markets or mobile operators that require support for network-controlled settings for outgoing caller ID, OEMs can configure the setting to indicate whether the network default setting is allowed and specify the default initial value for the caller ID setting.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cf9833ee-cbdb-416f-8c23-877afb40ef44
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Network-controlled caller ID settings


For markets or mobile operators that require support for network-controlled settings for outgoing caller ID, OEMs can configure the setting to indicate whether the network default setting is allowed and specify the default initial value for the caller ID setting.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample NetworkCallerIDSettings.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="NetworkCallerIDSettings"  
                         Description="Use to enable network-controlled settings for outgoing caller ID."  
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
          <Setting Name="ShowCallerIdNetworkDefaultSetting" Value="" /> 
          <Setting Name="DefaultCallerIdSetting" Value="" />
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  To indicate whether the network default setting is allowed for the outgoing caller ID, set `ShowCallerIdNetworkDefaultSetting` to one of the following values:

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
    <td><p>Not allowed. The network default option will not be shown.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Allowed. The network default option will be shown.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  To specify the default value for the caller ID setting, set `DefaultCallerIdSetting` to one of the following values:

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
    <td><p>1</p></td>
    <td><p>The caller ID is not shown for any calls.</p></td>
    </tr>
    <tr class="even">
    <td><p>2</p></td>
    <td><p>The caller ID is shown only to phone contacts.</p></td>
    </tr>
    <tr class="odd">
    <td><p>3</p></td>
    <td><p>The caller ID is shown for all calls.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>4</p></td>
    <td><p>The network default setting is shown.</p>
    <p>If this value is chosen, OEMs must also set <code>ShowCallerIdNetworkDefaultSetting</code> to 1 or 'True'.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator to fully test this customization on their network and verify that each setting and value behave as documented in this topic.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Network-controlled%20caller%20ID%20settings%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




