---
title: CMAS Required Monthly Test
description: Windows supports the Commercial Mobile Alert System (CMAS) Required Monthly Test (RMT) messages. To enable this, OEMs can set a registry key so messages can be delivered to the device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 47cebd30-fac0-4930-81c6-8fa1a14f3d07
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CMAS Required Monthly Test


Windows supports the Commercial Mobile Alert System (CMAS) Required Monthly Test (RMT) messages. To enable this, OEMs can set a registry key so messages can be delivered to the device. If this registry key is turned on, RMT messages will be displayed to the user in the same manner as other CMAS message types.

The alert title and message sender text used for threading will be **Required Monthly Test**.

There will be no changes made to the emergency alerts user settings on the device. RMT messages will only be configured by the OEM and users will not be able to change the setting. No user setting in Emergency alerts will have any impact on the RMT messages. For example, if the user selects **Presidential only** from the emergency messages settings, and the OEM turns on the CMAS RMT registry key, the user will still receive RMT messages.

Usually, this setting will only be turned on for test devices used by mobile operators. The CMAS RMT registry key will configure ports 4380 and 4381 although the latter is not RMT and is used by some mobile operators for testing purposes only.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ShowRequiredMonthlyTest"  
                         Description="Use to enable phones to receive CMAS RMT messages."  
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

        <Settings Path="Messaging/PerSimSettings/$(__ICCID)">  
          <Setting Name="ShowRequiredMonthlyTest" Value="" />             
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  Set `ShowRequiredMonthlyTest` to one of the following values:

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
    <td><p>1 or True</p></td>
    <td><p>Enable devices to receive CMAS RMT messages and have these show up on the device.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or False</p></td>
    <td><p>Disable devices from receiving CMAS RMT messages.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device.

2.  The length of time may vary, but the device should now be configured to receive RMT messages. The alert title and message text sender will show as **Required Monthly Test**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20CMAS%20Required%20Monthly%20Test%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




