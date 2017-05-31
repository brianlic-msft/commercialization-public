---
title: Ignore NITZ information from LTE networks
description: For mobile networks that can receive Network Identity and Time Zone (NITZ) information from multiple sources, partners can set the device to ignore the time received from an LTE network.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 41f92b6e-ed82-4fd1-95d7-fd9706cfc143
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Ignore NITZ information from LTE networks


For mobile networks that can receive Network Identity and Time Zone (NITZ) information from multiple sources, partners can set the device to ignore the time received from an LTE network. Time received from a CDMA network is not affected.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="NITZFiltering"  
                         Description="Use to set the phone to ignore the time received from an LTE network."  
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

        <Settings Path="CellCore/PerIMSI/$(__IMSI)/General">  
          <Setting Name="NitzFiltering" Value="0x10" />      
        </Settings>  

      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
        <Settings Path="CellCore/PerDevice/General">  
          <Setting Name="NitzFiltering" Value="0x10" />   
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

4.  Set the `Value` to 0x10.

    The value specifies RIL\_SYSTEMTYPE\_LTE. 

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator partner to test this customization on their network.

1.  Flash the build containing this customization to a device capable of receiving NITZ information from both a CDMA network and LTE network.

2.  Verify that the device only uses NITZ information received from the CDMA network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Ignore%20NITZ%20information%20from%20LTE%20networks%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




