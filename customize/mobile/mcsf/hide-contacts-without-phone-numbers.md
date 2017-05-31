---
title: Hide contacts without phone numbers
description: Partners can change the default OS behavior so that both contacts with phone numbers and contacts without phone numbers are shown in the People Hub.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 68af9970-42a3-467c-9aec-dda028e28715
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hide contacts without phone numbers


Partners can change the default OS behavior so that both contacts with phone numbers and contacts without phone numbers are shown in the People Hub.

By default, contacts that do not have phone numbers are hidden in the People Hub.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HideContactsWithoutPhoneNumbers"  
                         Description="Use to show or hide in the People Hub the contacts without phone numbers."  
                         Owner=""  
                         OwnerType="OEM"> 
      <Static>  
        <Settings Path="People/ContactsFilteringSettings">  
          <Setting Name="HideContactsWithoutPhoneNumbers" Value="" />
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `HideContactsWithoutPhoneNumbers` to one of the following values:

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
    <td><p>1 or 'True'</p></td>
    <td><p>In the People Hub, this hides contacts without phone numbers.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'False'</p></td>
    <td><p>In the People Hub, this shows contacts with phone numbers and contacts without phone numbers.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  Set up the device and then add a few contacts. Make sure to include contacts with phone numbers and contacts without phone numbers.

3.  Open the People Hub.

    -   If you set `HideContactsWithoutPhoneNumbers` to 0 or 'False', verify that under the **Contacts** heading the filter shows **showing all** at the top of the contacts list. Confirm that all contacts, with and without phone numbers, are showing.

    -   If you set `HideContactsWithoutPhoneNumbers` to 1 or 'True' (or did not set this setting), verify that under the **Contacts** heading the filter shows **showing contacts with phone numbers** at the top of the contacts list. Confirm that only contacts with phone numbers are showing.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Hide%20contacts%20without%20phone%20numbers%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




