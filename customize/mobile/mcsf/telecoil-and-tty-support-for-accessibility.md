---
title: Telecoil and TTY support for accessibility
description: Partners can choose whether to show TTY and/or Telelcoil options in the device settings.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2fca7bb1-91dc-472e-b633-e26efd203c92
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Telecoil and TTY support for accessibility


Partners can choose whether to show TTY and/or Telelcoil options in the device settings.

The OS provides support for telecoil and TTY devices. The settings and options that can be configured for telecoil and TTY appear in the **ease of access** screen in **Settings**. By default, both the telecoil and TTY options are hidden.

**TTY**

A TTY is a separate device that enables people who are deaf, hard of hearing, or speech-impaired to communicate by sending and receiving text. TTY support is required at both ends of the conversation.

Partners can display a TTY/TDD option in the **ease of access** screen in **Settings**. Partners must decide whether to display two choices (Off or Full), or four choices (Off, Full, HCO, or VCO). If the TTY option is visible, it should be set to off by default.

**Telecoil**

A Telecoil is a supported hearing aid or implant that enables people who are deaf or hard of hearing to listen to audio from the device by using magnetic induction.

Partners can display a Telecoil option in the **ease of access** screen in **Settings**. If the Telecoil toggle is visible, it should be set to off by default.

<a href="" id="constraints---atomic--firstvariationonly"></a>**Constraints:** Atomic, FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="TelecoilAndTTY"  
                         Description="Use to display and configure the options for Telecoil and TTY/TDD option in the 
                                      'ease of access' screen under Settings."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <!-- This settings group is atomic so all settings must be configured -->
        <Settings Path="EaseOfAccessCPL/TTY">  
          <Setting Name="ShowInControlPanel" Value="" />    
          <Setting Name="CompactMode" Value="" /> 
          <Setting Name="Mode" Value="" /> 
       </Settings>  

        <!-- This settings group is atomic so all settings must be configured -->
        <Settings Path="EaseOfAccessCPL/Telecoil">  
          <Setting Name="ShowInControlPanel" Value="" />    
          <Setting Name="Enabled" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Configure the TTY/TDD settings and default values. The following settings group under `EaseOfAccessCPL/TTY` is atomic so all settings must be configured.

    1.  To hide or show the TTY/TDD option in the **ease of access** screen in **Settings**, set the value of `ShowInControlPanel` to one of the following:

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
        <td><p>1 or 'Show'</p></td>
        <td><p>Shows the TTY/TDD option in the <strong>ease of access</strong> screen in <strong>Settings</strong>.</p></td>
        </tr>
        <tr class="even">
        <td><p>0 or 'Hide'</p></td>
        <td><p>Hides the TTY/TDD option in the <strong>ease of access</strong> screen in <strong>Settings</strong>.</p></td>
        </tr>
        </tbody>
        </table>

         

    2.  To show two (Off or Full) or four (Off, Full, HCO, or VCO) menu items for TTY/TDD modes, set the value of `CompactMode` to one of the following:

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
        <td><p>1 or 'Enabled'</p></td>
        <td><p>Shows four choices (Off, Full, HCO, or VCO) for the TTY selection UI.</p></td>
        </tr>
        <tr class="even">
        <td><p>0 or 'Disabled'</p></td>
        <td><p>Shows two choices (Off or Full) for the TTY selection UI.</p></td>
        </tr>
        </tbody>
        </table>

         

    3.  To specify the default mode for the TTY/TDD option, set the value of `Mode` to one of the following:

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
        <td><p>0 or 'Off'</p></td>
        <td><p>Sets Off as the default user value.</p>
        <p>Microsoft recommends that partners use this as the default user value.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Full'</p></td>
        <td><p>Sets Full as the default user value.</p></td>
        </tr>
        <tr class="odd">
        <td><p>2 or 'HCO'</p></td>
        <td><p>Sets Hearing Carry Over (HCO) as the default user value.</p></td>
        </tr>
        <tr class="even">
        <td><p>3 or 'VCO'</p></td>
        <td><p>Sets Voice Carry Over (VCO) as the default user value.</p></td>
        </tr>
        </tbody>
        </table>

         

4.  Configure the telecoil settings and default value. The following settings group under `EaseOfAccessCPL/Telecoil` is atomic so all settings must be configured.

    1.  To hide or show the Telecoil option in the **ease of access** screen in **Settings**, set the value of `ShowInControlPanel` to one of the following:

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
        <td><p>1 or 'Show'</p></td>
        <td><p>Shows the Telecoil option in the <strong>ease of access</strong> screen in <strong>Settings</strong>.</p></td>
        </tr>
        <tr class="even">
        <td><p>0 or 'Hide'</p></td>
        <td><p>Hides the Telecoil option in the <strong>ease of access</strong> screen in <strong>Settings</strong>.</p></td>
        </tr>
        </tbody>
        </table>

         

    2.  To set the default user value for the Telecoil option, set the value of `Enabled` to one of the following:

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
        <td><p>1 or 'Enabled'</p></td>
        <td><p>Telecoil is on by default.</p></td>
        </tr>
        <tr class="even">
        <td><p>0 or 'Disabled'</p></td>
        <td><p>Telecoil is off by default.</p>
        <p>Microsoft recommends that partners use this as the default user value.</p></td>
        </tr>
        </tbody>
        </table>

         

To enable Telecoil, use the two registry entries exactly as shown in the TelecoilAndTTY.pkg.xml file.

To enable TTY/TTD, use the **tty\_UI** registry entry exactly as shown in the TelecoilAndTTY.pkg.xml file. To display two choices (Off or Full), leave the **compactMode** registry value set to 0. To display four choices (Off, Full, HCO, or VCO), set the compact mode registry value to 1, instead.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **ease of access** screen in **Settings**.

3.  Verify that the TTY and/or Telecoil options are visible and the default options are set accordingly. If TTY is visible, ensure that the correct number of options are shown (2 or 4).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Telecoil%20and%20TTY%20support%20for%20accessibility%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




