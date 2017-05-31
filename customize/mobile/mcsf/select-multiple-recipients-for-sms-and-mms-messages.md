---
title: Select multiple recipients for SMS and MMS messages
description: Partners can show the select all contacts/unselect all menu option to allow users to easily select multiple recipients for an SMS or MMS message.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a0d93bcd-818f-4118-ac11-38efbba5b4a2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Select multiple recipients for SMS and MMS messages


Partners can show the **select all contacts**/**unselect all** menu option to allow users to easily select multiple recipients for an SMS or MMS message. This menu option provides users with an easier way to add multiple recipients and may also meet a mandatory requirement for some mobile operator networks.

Windows 10 Mobile supports the following select multiple recipients feature:

-   A multi-select chooser, which enables users to choose multiple contacts.

-   A **select all contacts**/**unselect all** menu option, which enables users to select or unselect all their contacts. This option is not shown by default and must be enabled by the OEM.

**Note**  
Note that this feature will only be enabled if the `LimitRecipients` setting is set to more than 1 recipient. For more information, see [Maximum number of recipients for SMS and MMS](maximum-number-of-recipients-for-sms-and-mms.md).

 

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SelectMultipleRecipients"  
                         Description="Use to enable users to easily select multiple recipients for SMS and MMS messages."  
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
          <Setting Name="AllowSelectAllContacts" Value="" />    
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  Set the value for `AllowSelectAllContacts` to one of the following:

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
    <td><p>0 or 0x0</p></td>
    <td><p>The <strong>select all contacts</strong>/<strong>unselect all</strong> menu option is not shown.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 0x1</p></td>
    <td><p>The <strong>select all contacts</strong>/<strong>unselect all</strong> menu option appears in the app menu.</p></td>
    </tr>
    </tbody>
    </table>

     

    If `AllowSelectAllContacts` is not set or missing, the **select all contacts**/**unselect all** menu option is not shown.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device.

2.  Open the **Messaging** application and create a new SMS or MMS message.

3.  Select the **+** button to add message recipients.

4.  Verify that the multi-select icon appears in the **Choose a contact** screen. If you have more than one contact, this icon will be active. Otherwise, it will appear grey or inactive.

5.  Tap the multi-select icon then tap **…** for more menu options.

6.  Verify that you can see the **select all contacts** menu option.

7.  Tap **select all contacts**.

8.  Tap **…** and verify that you can see the **unselect all** menu option.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Select%20multiple%20recipients%20for%20SMS%20and%20MMS%20messages%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




