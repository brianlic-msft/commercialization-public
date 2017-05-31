---
title: Roaming filter
description: Partners can add roaming filters that determine when the device appears to be roaming, based on the network the device is currently connected to. With roaming filters enabled, connections on other companies’ specified networks are not treated as roaming.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c334d1e9-2c20-48f0-9ee1-858bf43f1f95
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Roaming filter


Partners can add roaming filters that determine when the device appears to be roaming, based on the network the device is currently connected to. With roaming filters enabled, connections on other companies’ specified networks are not treated as roaming.

<a href="" id="constraints---atomic"></a>**Constraints:** Atomic  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="RoamingFilter"  
                         Description="Use to add 3GPP or 3GPP2 filters that determine when the phone appears to be roaming based on the network the phone is currently connected to."  
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

        <!-- Define for 3GPP. All these settings must be configured at the same time. -->
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/General/atomicRoamingTableSettings3GPP">  
          <Setting Name="RoamingTables/3GPPRoamingTables/Enabled" Value="" />    

          <Setting Name="RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)" Value="" />
          <Setting Name="RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)" Value="" />   
          <Setting Name="RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)" Value="" />  

          <Setting Name="RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)" Value="" />  

          <Setting Name="RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)" Value="" />  
        </Settings>  

        <!-- Define for 3GPP2. All these settings must be configured at the same time. -->
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/General/atomicRoamingTableSettings3GPP2">       
          <Setting Name="RoamingTables/3GPP2RoamingTables/Enabled" Value="" />    

          <Setting Name="RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)" Value="" />  

          <Setting Name="RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)" Value="" />  
        </Settings>   

      </Variant>

    -->

    <!-- Use for the per-device case
      
      <Static>  

        <!-- Define for 3GPP. All these settings must be configured at the same time. -->
        <Settings Path="Cellcore/PerDevice/General/atomicRoamingTableSettings3GPP">        
          <Setting Name="RoamingTables/3GPPRoamingTables/Enabled" Value="" />    

          <Setting Name="RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)" Value="" />
          <Setting Name="RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)" Value="" />   
          <Setting Name="RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)" Value="" />  

          <Setting Name="RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)" Value="" />  

          <Setting Name="RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)" Value="" />  
        </Settings>  


        <!-- Define for 3GPP2. All these settings must be configured at the same time. -->
        <Settings Path="Cellcore/PerDevice/General/atomicRoamingTableSettings3GPP2">        
          <Setting Name="RoamingTables/3GPP2RoamingTables/Enabled" Value="" />    

          <Setting Name="RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)" Value="" />  

          <Setting Name="RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)" Value="" />  
          <Setting Name="RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)" Value="" />  
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

4.  Use the correct settings for 3GPP or 3GPP2. You must work with your mobile operator to obtain the correct values specific to the mobile operator.

    The settings group is atomic so you must configure all the settings at the same time to correctly configure roaming filters.

    **Important**  
    When specifying the `$(SerialNumber)`, make sure that the order is absolutely sequential within the different lists. For example: 000, 001, 002.., or 001, 002, 003…, and so on.

     

    **3GPP**

    1.  To enable the 3GPP filter, set `RoamingTables/3GPPRoamingTables/Enabled` to 1 or Yes. Setting the value to 0 or No disables the 3GPP filter.

    2.  The `RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)` setting defines all the possible Mobile Country Code (MCC)-Mobile Network Code (MNC) pairs that can be included in the IMSI encoded on the mobile operator’s SIM cards. If the MCC-MNC value on the SIM in the device does not match one of these pairs, the SIM is recognized as belonging to another mobile operator, and the roaming filter is not enabled. The values in this registry key are specific to the mobile operator.

        Replace *$(SerialNumber)* to correspond to the 3-digit serial number, from 000 through 999, represented as a string. For each serial number that you defined, set the value to a string representing the **MCC,MNC**, such as **410,510** to represent an MCC of 410 and MNC of 510, for example.

        Add as many `RoamingTables/3GPPRoamingTables/TargetImsi/$(SerialNumber)` settings and values as you need.

    3.  The `RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)` setting defines the MCC-MNC values for networks on which the device is roaming within the group of home codes that you define.

        Replace *$(SerialNumber)* to correspond to the 3-digit serial number, from 000 through 999, represented as a string. For each serial number that you defined, set the value to a string representing the **MCC,MNC**, such as **410,510** to represent an MCC of 410 and MNC of 510, for example.

        Add as many `RoamingTables/3GPPRoamingTables/Exceptions/$(SerialNumber)` settings and values as you need.

        As with the rest of these settings, the exact MNC and MCC values are mobile operator-specific.

    4.  The `RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)` setting defines the network codes where the device is not deemed roaming. These settings can include just an MCC, or they can consist of a MCC-MNC pair. These settings are specific to the mobile operator.

        Replace *$(SerialNumber)* to correspond to the 3-digit serial number, from 000 through 999, represented as a string. For each serial number that you defined, set the value to a string representing the **MCC,MNC**, such as **410,510** to represent an MCC of 410 and MNC of 510, for example. Alternatively, you can also set the Value to a string that represents just the **MCC**, such as **460** for MCC of 460 and all networks of that country.

        Add as many `RoamingTables/3GPPRoamingTables/HomePLMN/$(SerialNumber)` settings and values as you need.

    **3GPP2**

    1.  To enable the 3GPP2 filter, set `RoamingTables/3GPP2RoamingTables/Enabled` to 1 or Yes. Setting the value to 0 or No disables the 3GPP2 filter.

    2.  The `RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)` setting defines the network codes where the device is not deemed roaming. These settings are specific to the mobile operator.

        Replace *$(SerialNumber)* to correspond to the 3-digit serial number, from 000 through 999, represented as a string. For each serial number that you defined, set the value to a DWORD representing the non-roaming indicator.

        Add as many `RoamingTables/3GPP2RoamingTables/Home/$(SerialNumber)` settings and values as you need until you have every valid code added.

    3.  The `RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)` setting defines the values for networks on which the device is deemed roaming.

        Replace *$(SerialNumber)* to correspond to the 3-digit serial number, from 000 through 999, represented as a string. For each serial number that you defined, set the value to a DWORD representing the roaming indicator.

        Add as many `RoamingTables/3GPP2RoamingTables/Roaming/$(SerialNumber)` settings and values as you need until you have every valid code added.

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Roaming%20filter%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




