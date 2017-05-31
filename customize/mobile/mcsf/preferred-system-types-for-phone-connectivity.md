---
title: Preferred system types for phone connectivity
description: OEMs can provide more control over the system types that their devices use to connect by mapping an ICCID or IIN to one radio (regardless of which SIM is chosen), specifying a list of MCC/MNCs that the MO wishes to limit, and/or restricting the second slot in a dual SIM device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f39fb423-2340-4c7d-afd4-587c8b355959
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Preferred system types for phone connectivity


OEMs can provide more control over the system types that their devices use to connect by: mapping an ICCID or IIN to one radio (regardless of which SIM is chosen), specifying a list of MCC/MNCs that the MO wishes to limit, and/or restricting the second slot in a dual SIM device.

For mobile operators that require more control over the system types that their phones use to connect to the mobile operators' networks, OEMs can:

-   Map a partial ICCID or Industry Identification Number (IIN) to the faster radio regardless of which SIM card is chosen for data connectivity.

-   Specify the MCC and MNC of other specific operators that the main mobile operator wishes to limit. If the UICC's MCC and MNC matches any of the pairs that OEMs can specify for the operator, a specified RIL system type will be removed from the UICC regardless of its app types, slot position, or executor mapping.

-   Restrict the second slot in a dual SIM device regardless of what apps or executor mapping the second slot is associated with.

**Note**  
This customization is only for China. OEMs should not set this customization unless required by the mobile operator.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PreferredSystemTypesForPhoneConnectivity"  
                         Description="Use to provide a mobile operator more control over the system types that their phones
                                      use to connect to the operator's network."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="CellCore/PerDevice/General">  

          <Setting Name="OperatorPreferredForFasterRadio" Value="" />   

          <Setting Name="OperatorListForExcludedSystemTypes" Value="" /> 
          <Setting Name="ExcludedSystemTypesPerOperator" Value="" /> 

          <Setting Name="Slot2ExcludedSystemTypes" Value="" />   

        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  To map a partial ICCID or the IIN to the faster radio regardless of which SIM card is chosen for data connectivity, set the value of `OperatorPreferredForFasterRadio` to match the IIN or the ICCID, up to 7 digits, of the preferred operator.

4.  To allow an operator to specify the MCC and MNC of other specific operators that they wish to limit, set the following settings:

    1.  Set the value of the `OperatorListForExcludedSystemTypes` setting a comma separated list of MCC:MNC pairs for which the system types should be restricted.

        For example, the value can be set to *310:026,310:030* to restrict operators with an MCC:MNC of 310:026 and 310:030.

    2.  Set the value of the `ExcludedSystemTypesPerOperator` setting to match the system type to be excluded from the SIM cards that match the MCC:MNC pairs you listed in `OperatorListForExcludedSystemTypes`. 

        For example, a value of 0x8 specifies RIL\_SYSTEMTYPE\_UMTS (3G) while 0x10 specifies RIL\_SYSTEMTYPE\_LTE (4G). To exclude more than one system type, perform a bitwise **OR** operation on the radio technologies you want to exclude. For example, a bitwise **OR** operation on RIL\_SYSTEMTYPE\_LTE (4G) and RIL\_SYSTEMTYPE\_UMTS (3G) results in the value 11000 (binary) or 0x18 (hexadecimal). In this case, the `ExcludedSystemTypesPerOperator` value must be set to 0x18 to limit the matching MCC:MNC pairs to 2G.

5.  To allow an operator to simply restrict the second slot in a dual SIM device regardless of what apps or executor mapping the second slot is associated with, set the value of `Slot2ExcludedSystemTypes` to the system types to be excluded from the SIM cards inserted in Slot 2.

    For example, a value of 0x8 specifies RIL\_SYSTEMTYPE\_UMTS (3G) while 0x10 specifies RIL\_SYSTEMTYPE\_LTE (4G). To exclude more than one system type, perform a bitwise **OR** operation on the radio technologies you want to exclude. For example, a bitwise **OR** operation on RIL\_SYSTEMTYPE\_LTE (4G) and RIL\_SYSTEMTYPE\_UMTS (3G) results in the value 11000 (binary) or 0x18 (hexadecimal). In this case, any SIM inserted in Slot 2 will be limited to 2G.

<a href="" id="testing-"></a>**Testing:**  
1.  Work with your mobile operator to obtain the partial ICCID or the IIN, the list of MCC and MNC values that they wish to limit, and the system types that they wish to restrict.

2.  Flash the build containing this customization to a dual SIM phone.

3.  Depending on which settings you set to provide the mobile operator more control over the system types that their phones use to connect to the network, test each scenario to make sure that the device behaves as expected.

    With the settings in this customization, verify that you don't see the restricted mobile operators able to use any of the restricted RIL system types.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Preferred%20system%20types%20for%20phone%20connectivity%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




