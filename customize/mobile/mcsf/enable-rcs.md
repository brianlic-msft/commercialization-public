---
title: Enable RCS
description: OEMs can configure the RCS settings using the multivariant support in the OS. Using these settings, you can Specify whether the device is RCS-enabled.Specify whether to use single registration for RCS.Configure the user experience for RCS.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 119C8C71-5D9F-41C9-BF07-3A099808776C
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable RCS


OEMs can configure the RCS settings using the multivariant support in the OS. Using these settings, you can:

-   Specify whether the device is RCS-enabled.
-   Specify whether to use single registration for RCS.
-   Configure the user experience for RCS.

The following design principles for RCS settings apply in Windows 10 Mobile:

-   An OEM can set a policy that cannot be overwritten by the user.
-   A user can set the value for a setting unless the setting is hidden by the mobile operator or OEM, or if the setting is available only to the mobile operator or OEM.
-   The IMS and RCS services have a defined default behavior in the event that a policy or setting is not set.
-   Backup and restore are slot-based. Any per-slot SIM settings are backups for the associated slot. When the settings are restored, they are restored in the corresponding slot even if a different SIM is in that slot.
-   When there are no per-user or per-slot settings, then settings are applied per-SIM, not per-slot. For example, if the user sets group text ON for their Contoso SIM in Slot 1, and has group text OFF for their Fabrikam SIM in Slot 2, if the user swaps the Contoso SIM into Slot 2 and reboots the device, group text will be set to ON.

## RCS settings model


-   **Global policy** - The global policy reads from the Windows 10 Mobile registry location and if a value isn't found, the Windows Phone 8.1 registry location is used. If no value is found in the Windows Phone 8.1 location, the messaging app uses the default behavior of the app.

-   **Per-SIM policy** - The per-SIM policy is written to the Slot 1 or Slot 2 location based on the corresponding slot for the specific SIM.

    -   The per-SIM policy in Slot 1 reads from the Windows 10 Mobile registry location for Slot 1. If a value is not found, the messaging app falls back to the Windows Phone 8.1 location. If no value is found in Windows Phone 8.1 location, the messaging app uses the default behavior of the app.

    -   The per-SIM policy in Slot 2 reads from the Windows 10 Mobile registry location for Slot 2. If a value is not found, the messaging app uses the default app behavior.

-   **Per-SIM path policy** - The per-SIM path policy is written to the Slot 1 or Slot 2 location based on the corresponding slot for the specific SIM.

    -   The per-SIM policy in Slot 1 reads from the Windows 10 Mobile registry location for Slot 1. If a value is not found, the messaging app uses the default behavior of the app.

    -   The per-SIM policy in Slot 2 reads from the Windows 10 Mobile registry location for Slot 2. If a value is not found, the messaging app uses the default app behavior of the app.

-   **Per-provider SIM settings** - The per-provider SIM settings apply for single and dual SIM devices. The per-provider SIM settings are written to the Slot 1 or Slot 2 location based on the corresponding slot for the specific SIM. Each per-provider SIM setting (such as group text) has three separate values that determine its behavior in Windows 10 Mobile.

    The following table shows the expected behavior if all of the values are set in the Windows 10 Mobile location. This applies to both Slot 1 and Slot 2. In summary, if the setting is hidden from the user, any user setting value is ignored when the messaging app is determining which value to use.

    | OEM: Is it hidden? | User setting value | OEM default value | Final value |
    |--------------------|--------------------|-------------------|-------------|
    | No                 | N/A                | Off               | Off         |
    | No                 | On                 | Off               | On          |
    | Yes                | N/A                | Off               | Off         |
    | Yes                | On                 | Off               | Off         |

     

    Per-provider SIM Slot 2 settings will fall back to the default service behavior. The following table shows the expected behavior.

    Windows 10 Mobile OEM configuration

    Windows 10 Mobile behavior

    Windows 10 Mobile final value

    OEM: Is it hidden?

    User setting value

    OEM default value

    OEM: Is it hidden?

    OEM and user default fallback behavior

    N/A

    N/A

    N/A

    Yes

    On

    On

    No

    Off

    On

    Yes

    On

    Off

    Yes

    N/A

    Off

    Yes

    On

    Off

    No

    N/A

    Off

    Yes

    On

    Off

     

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="EnableRCS"  
                         Description="Use to configure RCS settings."  
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

        <!-- Configure these global settings to specify whether the device supports RCS. -->
        <Settings Path="CellCore/PerDevice/RCS">  
          <Setting Name="SystemEnabled" Value="" />
          <Setting Name="UserEnabled" Value="" />
        </Settings> 
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>

        <!-- Use these settings to specify whether to use single registration for RCS. -->
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/RCS">  
          <Setting Name="UseSingleRegistration" Value="" />
        </Settings> 

        <!-- Use these settings to configure the user experience for RCS -->
        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/RcsOptions">  
          <Setting Name="ShowRcsEnabled" Value="" />
          <Setting Name="RcsEnabled" Value="" />
          <Setting Name="RcsSendReadReceipt" Value="" />
          <Setting Name="RcsFileTransferAutoAccept" Value="" />
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's Mobile Country Code (MCC), Mobile Network Code (MNC), and Service Provider Name (SPN).

4.  Define the settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  To specify whether the system is RCS-enabled and the RCS package is installed, set `SystemEnabled` to one of the following values.

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
    <td><p>The system is not RCS-enabled.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>The system is RCS-enabled.</p>
    <p>If the system supports RCS, you can also specify whether to show the user setting by configuring the value for <code>UserEnabled</code>.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  To show the user setting if RCS is enabled on the device, set `UserEnabled` to one of the following values.

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
    <td><p>Don't show the user setting if RCS is enabled on the device.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Show the user setting if RCS is enabled on the device.</p></td>
    </tr>
    </tbody>
    </table>

     

7.  To specify whether to use single registration for RCS, set `UseSingleRegistration` to one of the following values.

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
    <td><p>Do not use single registration for RCS.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Use single registration for RCS.</p>
    <p>The RCS stack will use the modem interface to communicate with the RCS backend.</p></td>
    </tr>
    </tbody>
    </table>

     

8.  To configure the user experience for RCS, set the following settings.

    -   To show or hide the toggle for RCS activation, set `ShowRcsEnabled` to one of the following values.

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
        <td><p>Hides the toggle for RCS activation.</p>
        <p>This is the default OS value.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'True'</p></td>
        <td><p>Shows the toggle for RCS activation.</p>
        <p>If you use this value, you can also configure the default value for the service by setting <code>RcsEnabled</code>.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   To set the default value for the RCS service toggle, set `RcsEnabled` to one of the following values.

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
        <td><p>RCS service toggle is set to Off.</p>
        <p>This is the default OS value.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'True'</p></td>
        <td><p>RCS service toggle is set to On.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   To specify whether a read receipt is sent to the sender, set `RcsSendReadReceipt` to one of the following values.

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
        <td><p>A read receipt is not sent to the sender.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'True'</p></td>
        <td><p>A read receipt is sent to the sender.</p>
        <p>This is the default OS value.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   To specify whether to automatically download an incoming RCS file transfer when the file size is less than the limit for the warning file size, set `RcsFileTransferAutoAccept` to one of the following values.

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
        <td><p>Do not automatically download the incoming RCS file transfer.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'True'</p></td>
        <td><p>Do automatically download the incoming RCS file transfer.</p>
        <p>This is the default OS value.</p></td>
        </tr>
        </tbody>
        </table>

         

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator partner to test this customization on the operator's network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enable%20RCS%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




