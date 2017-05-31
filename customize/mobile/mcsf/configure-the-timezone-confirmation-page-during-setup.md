---
title: Configure the timezone confirmation page during setup
description: Use to allow users to change the timezone and region during device setup.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 13f0314b-ac73-4807-a1d9-1d9a60e47756
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure the timezone confirmation page during setup


Use to allow users to change the timezone and region during device setup.

By default, the OS shows the timezone confirmation page during initial device setup after the device receives the Network Identity and Time Zone (NITZ) information. This page allows users to change the timezone and region during setup. To meet requirements from some mobile operators, OEMs can hide this page.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="EnableNITZTimeDateConfirmation"  
                         Description="Use to configure the timezone confirmation page during initial device setup."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="SetupWizard">  
          <Setting Name="EnableNITZTimeDateConfirmation" Value="" />  
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `EnableNITZTimeDateConfirmation` to one of the following values:

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
    <td><p>0 or 'Disable'</p></td>
    <td><p>Hides the timezone confirmation page during setup.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enable'</p></td>
    <td><p>Shows the timezone confirmation page during setup.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device capable of receiving NITZ information.

2.  During the initial device setup process, verify that the timezone confirmation page is either hidden or shown in the UI depending on the value that you set for `EnableNITZTimeDateConfirmation`.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configure%20the%20timezone%20confirmation%20page%20during%20setup%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




