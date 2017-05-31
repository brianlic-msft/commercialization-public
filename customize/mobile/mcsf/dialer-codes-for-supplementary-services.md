---
title: Dialer codes for supplementary services
description: Partners can define a dialer code to use for services like changing the pin, changing the password, caller ID, call forwarding, call waiting, call blocking, and so on.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e8d19312-7e56-448a-9ecf-8033d49bf75b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Dialer codes for supplementary services


Partners can define a dialer code to use for services like changing the pin, changing the password, caller ID, call forwarding, call waiting, call blocking, and so on. Partners can define new mappings or disable the default mappings. For more information about the default dialer codes you can redefine or disable, see [Supplementary services exclusions](supplementary-services-exclusions.md).

**Limitations and restrictions**:

-   The format of the supplementary service string cannot be modified.

-   The data sent over the network for a given operation cannot be modified.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SupplementaryServicesDialerCodes"  
                         Description="Use to define new mappings or disable the default mappings for dialer codes."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>

        <Settings Path="Phone/SupplementaryServiceCodeOverrides"> 
          <-- Select the dialer codes to disable or redefine from the set below 
          <Setting Name="002" Value="" />    
          <Setting Name="004" Value="" />
          <Setting Name="03" Value="" />
          <Setting Name="04" Value="" />
          <Setting Name="042" Value="" />
          <Setting Name="052" Value="" />
          <Setting Name="070" Value="" />
          <Setting Name="071" Value="" />
          <Setting Name="072" Value="" />
          <Setting Name="073" Value="" />    
          <Setting Name="074" Value="" />
          <Setting Name="075" Value="" />
          <Setting Name="076" Value="" />
          <Setting Name="077" Value="" />
          <Setting Name="078" Value="" />
          <Setting Name="079" Value="" />
          <Setting Name="21" Value="" />
          <Setting Name="30" Value="" />
          <Setting Name="300" Value="" />    
          <Setting Name="31" Value="" />
          <Setting Name="33" Value="" />
          <Setting Name="330" Value="" />
          <Setting Name="331" Value="" />
          <Setting Name="332" Value="" />
          <Setting Name="333" Value="" />
          <Setting Name="35" Value="" />
          <Setting Name="351" Value="" />
          <Setting Name="353" Value="" />
          <Setting Name="354" Value="" />
          <Setting Name="360" Value="" />
          <Setting Name="361" Value="" />
          <Setting Name="362" Value="" />
          <Setting Name="363" Value="" />
          <Setting Name="37" Value="" />    
          <Setting Name="43" Value="" />
          <Setting Name="591" Value="" />
          <Setting Name="592" Value="" />
          <Setting Name="593" Value="" />
          <Setting Name="594" Value="" />
          <Setting Name="61" Value="" />
          <Setting Name="62" Value="" />
          <Setting Name="66" Value="" />
          <Setting Name="67" Value="" />
          <Setting Name="75" Value="" />
          <Setting Name="750" Value="" />
          <Setting Name="751" Value="" />
          <Setting Name="752" Value="" />
          <Setting Name="753" Value="" />
          <Setting Name="754" Value="" />    
          <Setting Name="76" Value="" />
          <Setting Name="77" Value="" />
          <Setting Name="96" Value="" />
          -->
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  **To disable a default mapping**

    1.  Select the setting name that matches the dialer code that you want to disable. For example, `Setting Name="21"` corresponds to FWDUNCONDITIONAL or the default unconditional call forwarding code.

    2.  Set the `Value` of the dialer code that you want to disable to 0x1D or 29. This causes the dialer code to send a USSD request instead.

4.  **To define a new mapping**

    1.  Select the setting name that matches the dialer code that you want to redefine.

    2.  Set the `Value` to the desired supplementary service. The following example maps dialer code 66 to unconditional call forwarding (dialer code 21):

        ``` syntax
              <Setting Name="66" Value="21" />
        ```

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Tap on the keypad button in **Phone**.

3.  Verify modified dialer codes are handled as configured.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Dialer%20codes%20for%20supplementary%20services%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




