---
title: MMS for group messages
description: For the setting that determines if group messages sent to multiple people must be sent as MMS, partners can customize the setting by hiding or showing the Group text toggle in the Messaging settings screen, changing the default value, and configuring the option to alert the user of possible additional charges for sending a group text as MMS.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2c4d4745-733c-4a9a-933d-204efac137cc
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MMS for group messages


For the setting that determines if group messages sent to multiple people must be sent as MMS, partners can customize the setting by hiding or showing the **Group text** toggle in the **Messaging** settings screen, changing the default value, and configuring the option to alert the user of possible additional charges for sending a group text as MMS.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MMSGroupText"  
                         Description="Use to determine if group messages sent to multiple people must be sent as MMS. 
                                      Partners can show/hide the 'Group text' toggle, configure the default value, and 
                                      alert users of possible additional charges for sending a group text."  
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

        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/MMSGroupText">  
          <Setting Name="ShowMMSGroupTextUI" Value="" />      
          <Setting Name="MMSGroupText" Value="" />  
          <Setting Name="ShowMmsGroupTextWarning" Value="" />  
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  To hide or show the toggle for **Group text** in the **Messaging** settings screen, set the value of `ShowMMSGroupTextUI` to one of the following:

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
    <td><p>Hides the toggle.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Shows the toggle.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  To set the default value for the **Group text** toggle, set the value of `MMSGroupText` to one of the following:

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
    <td><p>Sets the default value to off.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Sets the default value to on.</p></td>
    </tr>
    </tbody>
    </table>

     

7.  To hide or show the warning that alerts users of possible additional charges before sending a group text as MMS, set value of `ShowMmsGroupTextWarning` to one of the following:

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
    <td><p>Hides the user alert.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Shows the user alert.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **Messaging** settings screen.

3.  Verify that the **Group text** toggle is visible or not. Also verify that the toggle has the correct default value.

4.  Write and then send a group text as MMS. Depending on the value you set for the user alert, verify if the user alert is shown or hidden.






