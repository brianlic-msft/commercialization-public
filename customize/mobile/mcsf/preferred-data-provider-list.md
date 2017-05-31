---
title: Preferred data provider list
description: For mobile operators that require it, OEMs can set a list of MCC/MNC pairs for the purchase order (PO) carrier or primary operator so that it can be set as the default data line for phones that have a dual SIM.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3c991ec4-2472-4890-baa7-7fa473367b0b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Preferred data provider list


For mobile operators that require it, OEMs can set a list of MCC/MNC pairs for the purchase order (PO) carrier or primary operator so that it can be set as the default data line for phones that have a dual SIM.

When the PO SIM is inserted into the phone, the OS picks the PO SIM as the data line and shows a notification to the user that the SIM has been selected for internet data. If two PO SIMs are inserted, the OS will choose the first PO SIM that was detected as the default data line and the mobile operator action required dialogue (ARD) is shown. If two non-PO SIMs are inserted, the user is prompted to choose the SIM to use as the default data line.

**Note**  
OEMs should not set this customization unless required by the mobile operator.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PreferredDataProviderList"  
                         Description="Use to specify the list of preferred mobile operators' MCC and MNC 
                                      information to use for data connections."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="CellCore/PerDevice/General">  
          <Setting Name="PreferredDataProviderList" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  To enumerate the MCC/MNC value pairs to use for data connections, set the value for `PreferredDataProviderList`. The value must be a comma-separated list of preferred MCC:MNC values. For example, the value can be *301:026,310:030* and so on.

<a href="" id="testing-"></a>**Testing:**  
1.  Work with your mobile operator to obtain the list of preferred MCC and MNC values for data connections.

2.  Flash the build containing this customization to a dual SIM phone.

3.  Insert the PO SIM into the phone. Verify that the OS picks the PO SIM as the default data line and shows a notification that the SIM has been selected for Internet data.

4.  Insert two PO SIMs. Verify that the OS chooses the first PO SIM that was detected as the default data line and the mobile operator action required dialogue (ARD) is shown.

5.  Insert two non-PO SIMs. Verify that you can see a prompt to choose the SIM to use as the default data line.

6.  Verify that you can change the default SIM by going to the **Cellular+SIM** settings screen and selecting a different SIM to use as the default data line.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Preferred%20data%20provider%20list%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




