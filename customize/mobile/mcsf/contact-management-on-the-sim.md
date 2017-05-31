---
title: Contact management on the SIM
description: Partners can specify that users should be able to read, edit, delete, import, and export contact information on their SIM (basic SIM, USIM, or RUIM). This customization is only available for devices sold in China.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 05bcaee4-c2ee-4e56-8824-208f773e0a40
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Contact management on the SIM


Partners can specify that users should be able to read, edit, delete, import, and export contact information on their SIM (basic SIM, USIM, or RUIM). This customization is only available for devices sold in China.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SIMContactManagement"  
                         Description="Use to specify that users should be able to read, edit, delete, import, and export contact information
                                      on their SIM (basic SIM, USIM, or RUIM)."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="People/SIMContactManagement">  
          <Setting Name="EnableSIMAddressBookAndExport" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `EnableSIMAddressBookAndExport` to one of the following values:

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
    <td><p>Disables the <strong>export contacts to SIM</strong>/<strong>import SIM contacts</strong> button in the <strong>People</strong> settings screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Enables the <strong>export contacts to SIM</strong>/<strong>import SIM contacts</strong> button in the <strong>People</strong> settings screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device with a SIM.

2.  Go to the **People** Hub and tap the **+** button to add a new contact.

3.  Verify that you can see the **Create contact in** window, which includes an option for creating the contact in the **SIM**.

4.  Choose where you would like to create the contact, and then add a new contact by filling in a name and phone number.

5.  Go to the People **Settings** screen.

6.  Verify that you can see both an **export contacts to SIM** button and an **import SIM contacts** button.

    -   The **import SIM contacts** button will not be activated unless the SIM you used for testing already contains SIM contacts or the contact you created in step 4 was created in the SIM.

    -   The **export contacts to SIM** button will not be activated unless there are contacts in your Microsoft account.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Contact%20management%20on%20the%20SIM%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




