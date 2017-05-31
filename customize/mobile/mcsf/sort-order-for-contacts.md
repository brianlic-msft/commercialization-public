---
title: Sort order for contacts
description: OEMs can use this customization to set the list of contacts displayed in the People Hub to be organized by last name instead of first name or first name instead of last name.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c6735ee8-c87d-4351-bfac-be5fcfcdd236
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sort order for contacts


OEMs can use this customization to set the list of contacts displayed in the People Hub to be organized by last name instead of first name or first name instead of last name. It is also possible to change the display format of contact names to appear as “First name Last name” or “Last name First name” for markets that use more formal nomenclature.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ContactSortSettings"  
                         Description="Use to set the sorting and display setting of the user's contacts"  
                         Owner=""  
                         OwnerType="OEM"> 
      <Static>  
        <Settings Path="People/SortAndDisplaySettings">
          <Setting Name="SortBy" Value="" />
          <Setting Name="DisplayBy" Value="" />      
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `SortBy` Value to one of the following values:

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
    <td><p>[Sort1] or FirstLast</p></td>
    <td><p>Sorts the contacts in the People Hub by their first name.</p></td>
    </tr>
    <tr class="even">
    <td><p>[Sort2] or LastFirst</p></td>
    <td><p>Sorts the contacts in the People Hub by their last name.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  Set the `DisplayBy` Value to one of the following values:

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
    <td><p>[Sort1] or FirstLast</p></td>
    <td><p>Displays the contacts in the People Hub in the format: “First name Last name”</p></td>
    </tr>
    <tr class="even">
    <td><p>[Sort2] or LastFirst</p></td>
    <td><p>Displays the contacts in the People Hub in the format: “Last name First name”.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  Go to the **People** settings screen. Verify that the **Sort list by** option is set to **Last name**, and that the **Display names by** option is set to **Last, First**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Sort%20order%20for%20contacts%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




