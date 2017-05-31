---
title: Set the default country/region when SIM PIN is on
description: OEMs can customize the default home country/region that shows up during OOBE in cases where the SIM PIN is turned on. This value is associated with the default ICCID values. When SIM PIN is turned off, the OS uses the MCC-derived country/region instead.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5DD619AD-84F0-4E27-AE90-054BEE988DEC
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Set the default country/region when SIM PIN is on


OEMs can customize the default home country/region that shows up during OOBE in cases where the SIM PIN is turned on. This value is associated with the default ICCID values. When SIM PIN is turned off, the OS uses the MCC-derived country/region instead.

If enabling this customization, OEMs can specify one or more ICCID digit prefix strings and the desired country/region to associate with the ICCID prefix. OEMs can also specify an alternative IccidToRegion.xml mapping table to use as the lookup table during device setup. This table is a tree of ICCID digit segments.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SetBrandingSlot"  
                         Description="Use to modify the default ICCID settings."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="Multivariant">  
             <Setting Name="IccidToRegionOverride/$(PREFIX)" Value="" /> 
             <!-- Use to specify more than one ICCID digit prefix strings and their values
             <Setting Name="IccidToRegionOverride/$(PREFIX)" Value="" /> 
             <Setting Name="IccidToRegionOverride/$(PREFIX)" Value="" /> 
             <Setting Name="IccidToRegionOverride/$(PREFIX)" Value="" /> 
             -->
             <Setting Name="IccidToRegionTablePath" Value="" /> 
          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  For `IccidToRegionOverride`:

    -   Replace *($PREFIX)* with a string that you want to use for the ICCID digit prefix.

    -   Set the value to the desired region you want to associate with the ICCID digit prefix you added. The value must be in ISO-3166-1 Alpha-2 format.

    You must do this for each ICCID prefix that you want to configure. For example, if you are adding more than one ICCID digit prefix, you must specify a different `IccidToRegionOverride`*($PREFIX)* and the value that corresponds to that prefix.

4.  To specify a different IccidToRegion.xml mapping table, set `IccidToRegionTablePath` to the path that contains the new mapping table.

    The table format is a tree of ICCID digit segments and must contain the following elements:

    -   **IccidToRegion** - Parent element.

    -   **Segment** - First level of one or more segments.

    -   **Region** - Optional element. If the OS doesn't find a better match, it falls back to this value.

    -   **Digits** - Use to specify one or more digit strings that must match to continue the descent through the table.

    -   **Segment** - Use to specify one or more child **Segment**s. ICCID matching continues after the digits that matched at the current level.

    The following example shows the first few segments and digit strings in the default OS IccidToRegion.xml mapping table:

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <IccidToRegion>   
      <Segment> <!-- Row 1 -->  
        <!-- Fall back to US if no match -->  
        <Region>US</Region>  
        <Digits>01</Digits>  
        <Digits>1</Digits>  
        <!-- Known Issuer Identifiers -->  
        <Segment><Region>AI</Region><Digits>010</Digits></Segment> 
        <Segment>  
          <Region>AG</Region>  
          <Digits>011</Digits>  
          <Digits>130</Digits>  
        </Segment>  
        <Segment><Region>BB</Region><Digits>012</Digits></Segment>  
        <Segment>  
          <Region>BM</Region>  
          <Digits>013</Digits>  
          <Digits>232</Digits>  
          <Digits>351</Digits>  
        </Segment>  
        <Segment><Region>BS</Region><Digits>282</Digits></Segment>  
        <Segment>  
          <Region>CA</Region>  
          <Digits>007</Digits>  
          <Digits>035</Digits>  
          <Digits>037</Digits>  
          <Digits>223</Digits>  
          <Digits>228</Digits>  
          <Digits>236</Digits>  
          <Digits>248</Digits>  
          <Digits>250</Digits>  
          <Digits>258</Digits>  
          <Digits>277</Digits>  
          <Digits>369</Digits>  
          <Digits>370</Digits>  
          <Digits>456</Digits>  
          <Digits>482</Digits>  
          <Digits>490</Digits>  
          <Digits>593</Digits>  
          <Digits>628</Digits>  
          <Digits>629</Digits>  
          <Digits>635</Digits>  
          <Digits>654</Digits>  
          <Digits>660</Digits>  
          <Digits>682</Digits>  
          <Digits>687</Digits>  
          <Digits>688</Digits>  
          <Digits>699</Digits>  
          <Digits>727</Digits>  
          <Digits>789</Digits>  
          <Digits>821</Digits>  
          <Digits>835</Digits>  
          <Digits>837</Digits>  
          <Digits>869</Digits>  
          <Digits>895</Digits>  
          <Digits>930</Digits>  
        </Segment>  
        <Segment><Region>DM</Region><Digits>016</Digits></Segment>  
        <Segment>  
          <Region>DO</Region>  
          <Digits>028</Digits>  
          <Digits>650</Digits>  
        </Segment>  
        <Segment><Region>GD</Region><Digits>017</Digits></Segment>  
        <Segment><Region>GU</Region><Digits>008</Digits></Segment> 
        <Segment>  
          <Region>JM</Region>  
          <Digits>018</Digits>  
          <Digits>050</Digits>  
          <Digits>582</Digits>  
        </Segment>        
        <Segment><Region>KN</Region><Digits>020</Digits></Segment>  
        <Segment><Region>KY</Region><Digits>015</Digits></Segment>  
        <Segment><Region>LC</Region><Digits>021</Digits></Segment>  
        <Segment><Region>MP</Region><Digits>025</Digits></Segment>  
        <Segment><Region>MS</Region><Digits>019</Digits></Segment>  
        <Segment>  
          <Region>PR</Region>  
          <Digits>283</Digits>  
          <Digits>809</Digits>  
          <Digits>853</Digits>  
        </Segment>  
        <Segment><Region>TC</Region><Digits>024</Digits></Segment>  
        <Segment><Region>TT</Region><Digits>023</Digits></Segment>  
        <Segment><Region>VC</Region><Digits>022</Digits></Segment>  
        <Segment>  
          <Region>VG</Region>  
          <Digits>014</Digits>  
          <Digits>348</Digits>  
        </Segment>  
    </IccidToRegion>  
    ```

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone. Your phone must be using a SIM that has an ICCID that matches one or more of the prefixes that you specified in the customization.

2.  Go through initial device setup.

3.  If you added one or more ICCID digit prefixes, verify that the home country/region has changed based on the ICCID digit prefix you had set up.

    Or, if you used a different IccidToRegion.xml mapping table, verify that the home country/region that shows during initial device setup matches the value you specified in the mapping table.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Set%20the%20default%20country/region%20when%20SIM%20PIN%20is%20on%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




