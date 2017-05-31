---
title: Configure C+G dual SIM phones
description: Partners can configure the settings for C+G dual SIM phones.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8d48cff1-441f-45c1-9c33-695ca31aa485
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure C+G dual SIM settings


Partners can configure the settings for C+G dual SIM phones. The first slot is for CDMA (C) and the second slot is for GSM (G).

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value.

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CGSettings"  
                         Description="Use to configure settings for C+G dual SIM phones."  
                         Owner=""  
                         OwnerType="OEM"> 

    <!-- Use for the per-IMSI case.

      <!-- Define the Targets. --> 
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

      <!-- Specify the Variant. -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>

        <Settings Path="CellCore/PerIMSI/$(__IMSI)/CellUX">  
          <Setting Name="ShowManualAvoidance" Value="" />  
        </Settings>

        <Settings Path="CellCore/PerIMSI/$(__IMSI)/General">  
          <Setting Name="CardLock" Value="" /> 
          <Setting Name="CardAllowList" Value="" /> 
          <Setting Name="CardBlockList" Value="" /> 
          <Setting Name="SuggestDataRoamingARD" Value="" /> 
        </Settings>

        <Settings Path="DeviceInfo/Variant">      
          <Setting Name="RoamingSupportPhoneNumber" Value="" />
       </Settings>

      </Variant>

    -->


    <!-- Use for the per-device case.   
      <Static>  

        <Settings Path="CellCore/PerDevice/CellUX">  
          <Setting Name="ShowManualAvoidance" Value="" />  
        </Settings>  

        <Settings Path="CellCore/PerDevice/CGDual">  
          <Setting Name="RestrictToGlobalMode" Value="" />  
        </Settings>  

        <Settings Path="CellCore/PerDevice/UIX">  
          <Setting Name="SIM1ToUIM1" Value="" />  
        </Settings>  

        <Settings Path="CellCore/PerDevice/General">  
          <Setting Name="CardLock" Value="" /> 
          <Setting Name="CardAllowList" Value="" /> 
          <Setting Name="CardBlockList" Value="" /> 

          <Setting Name="DefaultSlotAffinity" Value="" />  
          <Setting Name="Slot2DisableAppsList" Value="" />  
          <Setting Name="SuggestGlobalModeARD" Value="" />  
          <Setting Name="SuggestGlobalModeTimeout" Value="" />  
          <Setting Name="SuppressDePersoUI" Value="" />  
          <Setting Name="SuggestDataRoamingARD" Value="" /> 
        </Settings>  

        <Settings Path="AutomaticTime">  
          <Setting Name="PreferredSlot" Value="" />  
        </Settings>  

      </Static>

    -->

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  To show the **Switch to next network manually** button on the **Settings** &gt; **Cellular & SIM** page, set `ShowManualAvoidance` to one of the following values:

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
    <td><p>Does not show the <strong>Switch to next network manually</strong> button.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Shows the <strong>Switch to next network manually</strong> button.</p></td>
    </tr>
    </tbody>
    </table>

     

    **Note**  
    This setting supports per-IMSI or per-device values. Determine which one you would like to set. By default, this setting is off or missing.

     

4.  To configure card lock support, use and set the following settings:

    1.  To enforce either the card allow list or both the card allow and block lists, set `CardLock` to one of the following values:

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
        <td><p>0 or 'PersoLockType_AllowAndBlockList'</p></td>
        <td><p>Enforces both the card allow list and the card block list.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'PersoLockType_AllowListOnly'</p></td>
        <td><p>Enforces only the card allow list.</p></td>
        </tr>
        </tbody>
        </table>

         

        Set the values for the `CardAllowList` and `CardBlockList` settings to configure the allow list and block list, respectively.

    2.  To configure the list of SIM cards allowed in the first slot, set the value for `CardAllowList` to a comma separated MCC:MNC list. You can also use wild cards, represented by an asterisk (\*), to accept any value. For example, you can set the value to *310:410,311:\*,404:012,310:70*.

    3.  To configure the list of SIM cards that are not allowed in the first slot, set the value for `CardBlockList` to a comma separated MCC:MNC list. You can also use wild cards, represented by an asterisk (\*), to accept any value. For example, you can set the value to *310:410,311:\*,404:012,310:70*.

    **Note**  
    These settings support per-IMSI or per-device values. Determine which one you would like to set. By default, this setting is off or missing.

     

5.  To specify the OEM or mobile operator's roaming support contact phone number, set the optional **RoamingSupportPhoneNumber** setting to the phone number you want to use. This string appears in the **About** settings screen.

    This setting is part of the DeviceInfo/Variant settings group. For more information about the other device info settings, see [Phone metadata in DeviceTargetingInfo](phone-metadata-in-devicetargetinginfo.md).

6.  To configure the **Mode selection** in the **Cellular & SIM** settings page, set `RestrictToGlobalMode` to one of the following values:

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
    <td><p>0 or 'RestrictToGlobalMode_Disabled'</p></td>
    <td><p>The phone is not restricted to global mode.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'RestrictToGlobalMode_Home'</p></td>
    <td><p>When a slot is registered at home and supports global mode, the mode selection is restricted to global mode.</p></td>
    </tr>
    <tr class="odd">
    <td><p>2 or 'RestrictToGlobalMode_Always'</p></td>
    <td><p>If a slot supports global mode and this value is selected, the mode selection is restricted to global mode.</p></td>
    </tr>
    </tbody>
    </table>

     

    This setting is required for phones shipping on the China Telecom network. By default, this setting is off or missing.

    When the device registration changes, if the value for this setting is set, the OS changes the preferred system type to the default preferred system type for world mode. If the phone is not camped on any network, the OS assumes the phone is on the home network and changes the network registration preference to default mode.

7.  To show **UIM1** as an alternate string instead of **SIM1** for the first SIM, set `SIM1ToUIM1` to one of the following values:

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
    <td><p>Keeps the <strong>SIM1</strong> strings in the UI for dual SIM phones.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Changes the <strong>SIM1</strong> strings in the UI to <strong>UIM1</strong> for dual SIM phones.</p></td>
    </tr>
    </tbody>
    </table>

     

    By default, this setting is off or missing.

8.  To set the data connection preference, set `DefaultSlotAffinity` to one of the following values:

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
    <td><p>0 or 'SlotAffinityForInternetData_Automatic'</p></td>
    <td><p>The data connection preference is automatically set.</p>
    <p>When set, the OS shows the <strong>Two SIMs?</strong> page when trying to identify the network.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'SlotAffinityForInternetData_Slot0'</p></td>
    <td><p>Sets the data connection preference to Slot 0 and the data connection cannot be edited.</p></td>
    </tr>
    <tr class="odd">
    <td><p>2 or 'SlotAffinityForInternetData_Slot1'</p></td>
    <td><p>Sets the data connection preference to Slot 1 and the data connection cannot be edited.</p></td>
    </tr>
    </tbody>
    </table>

     

9.  To disable a list of specified apps from Slot 2, set `Slot2DisableAppsList` to a comma separated value. For example, *4,6*.

10. To suggest global mode when the phone is not registered on other modes in the network, set `SuggestGlobalModeARD` to one of the following values:

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
    <td><p>0 or 'SuggestGlobalModeARD_Disable'</p></td>
    <td><p>No suggestion is made.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'SuggestGlobalModeARD_Enable'</p></td>
    <td><p>Global mode is suggested.</p></td>
    </tr>
    </tbody>
    </table>

     

11. To specify the number of seconds to wait for the network registration before suggesting global mode, set `SuggestGlobalModeTimeout` to a value between 1 and 600, inclusive. For example, to set the timeout to 60 seconds, set the value to 60 (decimal) or 0x3C (hexadecimal).

12. To suppress the perso unlock UI, set `SuppressDePersoUI` to one of the following values:

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
    <td><p>0 or 'Disable'</p></td>
    <td><p>Shows the perso unlock UI.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enable'</p></td>
    <td><p>Supresses the perso unlock UI.</p></td>
    </tr>
    </tbody>
    </table>

     

13. To show the data roaming suggestion dialog when roaming and the data roaming setting is set to no roaming, set `SuggestDataRoamingARD` to one of the following values:

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
    <td><p>0 or 'SuggestDataRoamingARD_Disable'</p></td>
    <td><p>No suggestion is made.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'SuggestDataRoamingARD_Enable'</p></td>
    <td><p>Data roaming suggestion is made.</p></td>
    </tr>
    </tbody>
    </table>

     

14. To specify which UICC slot will be used for NITZ handling, set `PreferredSlot` to one of the following values:

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
    <td><p>0 or 'Slot 0'</p></td>
    <td><p>Uses the UICC in Slot 0 for NITZ handling.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Slot 1'</p></td>
    <td><p>Uses the UICC in Slot 1 for NITZ handling.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator to determine the setting requirements for the network.

1.  Flash the build containing this customization to a C+G dual SIM phone.

2.  Depending on the values you specified for the C+G settings, verify that the behavior matches the setting value description.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configure%20C+G%20dual%20SIM%20settings%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




