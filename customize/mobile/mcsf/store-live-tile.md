---
title: Store live tile
description: The Store tile, when medium-sized, becomes a live tile.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 37a4827d-190c-40f1-acf7-9523af758b8c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Store live tile


The Store tile, when medium-sized, becomes a live tile. It shows both the Windows Store logo and the name. The Windows Store live tile cycles through apps that the user will see in the Store and lets the user discover apps outside of the Store. By default, the Store live tile is on and out-of-the-box, the live tile is only updated over Wi-Fi until the user enters the Store for the first time. After the user enters the Store, the OS will start using cellular data to update the Store live tile in the background.

Microsoft recommends that partners keep the default Store live tile behavior. However, partners may change the default behavior to turn off the Store live tile and to prevent the OS from using cellular data to update the Store live tile in the background.

Regardless of the default Store live tile settings, users have the option of changing the defaults by choosing the **Live Tile** settings in the Windows Store **Settings** screen.



<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample StoreLiveTile.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="StoreLiveTile"  
                         Description="Use to configure the Store tile in the Start screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="StoreMoOemGroup">  
          <Setting Name="OemMoCustomizedIsLiveTileEnabled" Value="" /> 
          <Setting Name="OemMoLiveTileOptInToCellularAfterStoreLaunch" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  To set the default value for **Live Tile** **Show products on tile** option in the Windows Store **Settings** screen, set `OemMoCustomizedIsLiveTileEnabled` to one of the following values:

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
    <td><p>Disables the live tile feature for the Store tile. The <strong>Show products on tile</strong> option is Off.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Enables the live tile feature for the Store tile. The <strong>Show products on tile</strong> option is On.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  To set the default value for **Live Tile** **Only update the tile when I'm on Wi-Fi** option in the Windows Store **Settings** screen, set `OemMoLiveTileOptInToCellularAfterStoreLaunch` to one of the following values:

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
    <td><p>Prevents the OS from using cellular data to update the Store live tile after the user enters the Store for the first time. The <strong>Only update the tile when I'm on Wi-Fi</strong> option is On.</p>
    <p>Although the feature does not use a lot of data, partners may want to disable live tile updates over cellular data to meet certain market requirements.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Allows the OS to use cellular data to update the Store live tile in the background after the user enters the Store for the first time. The <strong>Only update the tile when I'm on Wi-Fi</strong> option is Off.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  Verify that the Store live tile is medium-sized and pinned to the Start screen.

3.  Go to the **Settings** screen in the Windows Store app, and check the default values for the following **Live Tile** options: **Show products on tile** and **Only update the tile when I'm on Wi-Fi**. Confirm that they match the default values that you set.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Store%20live%20tile%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




