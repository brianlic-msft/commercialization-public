---
title: Sort order for contacts override
description: OEMs can customize the default values for people sort and display settings as documented in the Sort order for contacts customization.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f71ed846-9547-4f24-bd53-d44d255cbf5d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sort order for contacts override


OEMs can customize the default values for people sort and display settings as documented in the [Sort order for contacts](sort-order-for-contacts.md) customization. However, these settings may be overridden by the defaults for the user’s current locale unless the OEM sets an additional override registry key.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
      <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="OEMOverridesSortDisplay"  
                         Description="Use to prevent OEM values for people sort and display settings from being overridden by user's current locale."  
                         Owner=""  
                         OwnerType="OEM">
     <Static>  
        <Settings Path="People/SortAndDisplaySettings">  
          <Setting Name="OEMOverridesSortDisplay" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `OEMOverridesSortDisplay` value to 1 or 0x1 to prevent the OEM values for people sort and display settings from being overridden.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  Go to the **People** settings screen.

3.  Verify that the **Sort list by** and the **Display names by** option is set to the values you specified in the [Sort order for contacts](sort-order-for-contacts.md) customization.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Sort%20order%20for%20contacts%20override%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




