---
title: Connection speed option
description: Partners can customize the listed names of the connection speeds, and can hide the user option to select the connection speed that is displayed on the SIM screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7de0a570-a183-4776-bba0-6a84c6081e95
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Connection speed option


Partners can customize the listed names of the connection speeds, and can hide the user option to select the connection speed that is displayed on the **SIM** screen.

Partners can hide the user option to select the connection speed that is displayed on the **SIM** screen in **Settings** &gt; **Cellular & SIM**, if they do not want users to be able to deselect the highest possible speed.

Alternately, partners can customize the listed names of the connection speeds with their own character codes. The default values are 2G, 3G, and 4G.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ConnectionSpeedOption"  
                         Description="Use to hide the connection speed option or customize the default character codes for connection speed."  
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

          <!-- Settings to hide some options or the entire Highest connection speed dropdown -->
          <!-- To hide the 4G Only option from the Highest connection speed dropdown
          <Setting Name="HideHighestSpeed4GOnly" Value="1" />
          -->   
          <!-- To hide the 4G option from the Highest connection speed dropdown
          <Setting Name="HideHighestSpeed4G" Value="1" />
          -->       
          <!-- To hide the 3G Only option from the Highest connection speed dropdown
          <Setting Name="HideHighestSpeed3GOnly" Value="1" />
          --> 
          <!-- To hide the 2G option from the Highest connection speed dropdown 
          <Setting Name="HideHighestSpeed2G" Value="1" />         
          -->

          <!-- To hide the Highest connection speed dropdown entirely
          <Setting Name="HideHighestSpeed" Value="1" />         
          -->

          <!-- To show the 3G Preferred option in the Highest connection speed dropdown 
          <Setting Name="ShowHideHighestSpeed3GPreferred" Value="1" />         
          -->

          <!-- Settings to customize the default character codes for connection speed. For example, to change the default '4G' character
               code for ighestSpeed4G, change the value to another character code such as 'LTE'.  
          <Setting Name="HighestSpeed2G" Value="" />
          <Setting Name="HighestSpeed3G" Value="" />
          <Setting Name="HighestSpeed3GOnly" Value="" />
          <Setting Name="HighestSpeed3GPreferred" Value="" />
          <Setting Name="HighestSpeed4G" Value="" />
          <Setting Name="HighestSpeed4GOnly" Value="" />              
          -->            

          <!-- To modify the Highest connection speed dropdown title
          <Setting Name="HighestSpeedTitle" Value="" />         
          --> 

        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
        <Settings Path="CellCore/PerDevice/CellUX">  

          <!-- Settings to hide some options or the entire Highest connection speed dropdown -->
          <!-- To hide the 4G Only option from the Highest connection speed dropdown
          <Setting Name="HideHighestSpeed4GOnly" Value="1" />
          -->   
          <!-- To hide the 4G option from the Highest connection speed dropdown
          <Setting Name="HideHighestSpeed4G" Value="1" />
          -->       
          <!-- To hide the 3G Only option from the Highest connection speed dropdown
          <Setting Name="HideHighestSpeed3GOnly" Value="1" />
          --> 
          <!-- To hide the 2G option from the Highest connection speed dropdown 
          <Setting Name="HideHighestSpeed2G" Value="1" />         
          -->

          <!-- To hide the Highest connection speed dropdown entirely
          <Setting Name="HideHighestSpeed" Value="1" />         
          -->

          <!-- To show the 3G Preferred option in the Highest connection speed dropdown 
          <Setting Name="ShowHideHighestSpeed3GPreferred" Value="1" />         
          -->

          <!-- Settings to customize the default character codes for connection speed. For example, to change the default '4G' character
               code for ighestSpeed4G, change the value to another character code such as 'LTE'.  
          <Setting Name="HighestSpeed2G" Value="" />
          <Setting Name="HighestSpeed3G" Value="" />
          <Setting Name="HighestSpeed3GOnly" Value="" />
          <Setting Name="HighestSpeed3GPreferred" Value="" />
          <Setting Name="HighestSpeed4G" Value="" />
          <Setting Name="HighestSpeed4GOnly" Value="" />
          -->       

          <!-- To modify the Highest connection speed dropdown title
          <Setting Name="HighestSpeedTitle" Value="" />         
          -->

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

4.  **To hide some options or the entire Highest connection speed drop-down**

    -   To hide the "4G Only" option from the **Highest connection speed** drop-down in the **Settings** &gt; **Cellular & SIM** &gt; **SIM** screen, set `HideHighestSpeed4GOnly` to 1 or 'Yes'.

    -   To hide the "4G" option from the **Highest connection speed** drop-down in the **Settings** &gt; **Cellular & SIM** &gt; **SIM** screen, set `HideHighestSpeed4G` to 1 or 'Yes'.

    -   To hide the "3G Only" option from the **Highest connection speed** drop-down in the **Settings** &gt; **Cellular & SIM** &gt; **SIM** screen, set `HideHighestSpeed3GOnly` to 1 or 'Yes'.

    -   To hide the "2G" option from the **Highest connection speed** drop-down in the **Settings** &gt; **Cellular & SIM** &gt; **SIM** screen, set `HideHighestSpeed2G` to 1 or 'Yes'.

    -   To hide the **Highest connection speed** drop-down entirely, set `HideHighestSpeed` to 1 or 'Yes'.

5.  **To show the 3G Preferred option in the Highest connection speed drop-down**

    -   Set `ShowHighestSpeed3GPreferred` to 1 or 'Yes'.

6.  **To customize the character codes for connection speed**

    -   To modify the "2G" string to another character code, change the `HighestSpeed2G``Value`.

    -   To modify the "3G" string to another character code, change the `HighestSpeed3G``Value`.

    -   To modify the "3G Only" string to another character code, change the `HighestSpeed3GOnly``Value`.

    -   To modify the "4G (3G Preferred)" string to another character code, change the `HighestSpeed3GPreferred``Value`.

    -   To modify the "4G" string to another character code, change the `HighestSpeed4G``Value`.

    -   To modify the "4G Only" string to another character code, change the `HighestSpeed4GOnly``Value`.

    For example, to change the default '4G' character code for `HighestSpeed4G` to another character code such as 'LTE', set the `Value` to 'LTE'. Although there is no limit to number of characters you can use, if the character code is too long, this will be truncated in the UI.

    **Note**  
    You must include all three values (even if you are only modifying one) or the display text will not be set correctly.

     

7.  **To customize the Highest connection speed drop-down label**

    -   Set the `HighestSpeedTitle``Value` to the string that you want to use.

        For example, to change 'Highest connection speed' to another string such as 'Preferred connection speed', set the `Value` to 'Preferred connection speed'.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **Settings** &gt; **Cellular & SIM** &gt; **SIM** screen.

3.  If you hid the **Highest connection speed** drop-down or one or more options within the drop-down, verify that the behavior matches your setting.

4.  If you customized the dropdown label, or the one- or two-character codes for connection speed for one or more options within the connection speed drop-down, verify that the string matches what you specified.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Connection%20speed%20option%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




