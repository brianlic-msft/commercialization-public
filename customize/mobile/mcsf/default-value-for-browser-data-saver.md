---
title: Default value for browser data saver
description: Partners can configure the default setting for the browser data saver feature by turning the browser optimization service on or off, using the BrowserDataSaver setting.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c94bf233-fb40-4386-939e-c4fc4ecb4cbb
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Default value for browser data saver


Partners can configure the default setting for the browser data saver feature by turning the browser optimization service on or off, using the **BrowserDataSaver** setting

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="BrowserDataSaver"  
                         Description="Use to configure the default setting for the browser data saver feature."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="InternetExplorer/DataSaving">  
          <Setting Name="BrowserDataSaver" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `BrowserDataSaver` to one of the following values:

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
    <td><p>0 or 'Disabled'</p></td>
    <td><p>The browser data saver feature is turned off.</p>
    <p>The <strong>Data Sense savings</strong> option in the browser settings CPL is set to <strong>off</strong>.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>The browser data saver feature is turned on.</p>
    <p>The <strong>Data Sense savings</strong> option in the browser settings CPL is set to <strong>automatic</strong>.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Setting does not exist</p></td>
    <td><p>The browser data saver feature is turned on.</p>
    <p>The <strong>Data Sense savings</strong> option in the browser settings CPL is set to <strong>automatic</strong>.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device.

2.  Open Microsoft Edge to launch the browser for the first time. Select **recommended** when the dialog to use the browser settings is displayed.

3.  Go to the browser settings CPL.

4.  Depending on the value that you set for `BrowserDataSaver`, verify:

    -   If `BrowserDataSaver` is set to 0, verify that the **Data Sense savings** option is set to **off**.

    -   If `BrowserDataSaver` is set to 1, verify that the **Data Sense savings** option is set to **automatic**.

    -   If `BrowserDataSaver` setting has not been set, verify that the **Data Sense savings** option is set to **automatic**.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Default%20value%20for%20browser%20data%20saver%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




