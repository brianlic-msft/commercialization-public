---
title: Managing runtime configuration data
description: OEMs can configure the following settings to manage the cleanup of runtime configuration data on the mobile device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 225daf4d-cc46-4f0f-b959-b34d8af117d4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Managing runtime configuration data


When the runtime configuration engine applies a variant to a device, a number of assets are used and these can include maps, apps, wallpapers, ringtones, and so on. The data for these features can be significantly large. To enable many variants to ship in a single device image, multiple large sets of this data are included somewhere in storage. Only Retail Mode content, map data, and app installers are stored in the user store. Other smaller variant data is automatically placed in the OS partition.

To allow users to reset their device and not wait for apps to download from the Windows Store if the same variant is used, the OS protects the data by copying it to the OS partition. The following table describes what happens to the device content during initial install, upon resetting the storage limit, and after the device is reset.

<table style="width:100%;">
<colgroup>
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
</colgroup>
<thead>
<tr class="header">
<th>Content</th>
<th>Initial storage location</th>
<th>Initial storage location</th>
<th>Result upon reset/storage limit</th>
<th>Result upon reset/storage limit</th>
<th>Result after reset</th>
<th>Result after reset</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p> </p></td>
<td><p><strong>Selected subvariant</strong></p></td>
<td><p><strong>Other subvariants</strong></p></td>
<td><p><strong>Selected subvariant</strong></p></td>
<td><p><strong>Other subvariants</strong></p></td>
<td><p><strong>If the same subvariant is selected</strong></p></td>
<td><p><strong>Other subvariants</strong></p></td>
</tr>
<tr class="even">
<td><p>UI languages</p></td>
<td><p>OS partition</p></td>
<td><p>OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Used from OS partition</p></td>
<td><p>Used from OS partition</p></td>
</tr>
<tr class="odd">
<td><p>Retail mode</p></td>
<td><p>User partition</p></td>
<td><p>User partition</p></td>
<td><p>Deleted</p></td>
<td><p>Deleted</p></td>
<td><p>Downloaded from the Internet</p></td>
<td><p>Downloaded from the Internet</p></td>
</tr>
<tr class="even">
<td><p>Applications</p></td>
<td><p>User partition</p></td>
<td><p>User partition</p></td>
<td><p>Copied to OS partition</p></td>
<td><p>Deleted</p></td>
<td><p>Used from OS partition</p></td>
<td><p>Downloaded from the Internet</p></td>
</tr>
<tr class="odd">
<td><p>Wallpapers</p></td>
<td><p>OS partition</p></td>
<td><p>OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Used from OS partition</p></td>
<td><p>Used from OS partition</p></td>
</tr>
<tr class="even">
<td><p>Ringtones</p></td>
<td><p>OS partition</p></td>
<td><p>OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Used from OS partition</p></td>
<td><p>Used from OS partition</p></td>
</tr>
<tr class="odd">
<td><p>Configuration files</p></td>
<td><p>OS partition</p></td>
<td><p>OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Used from OS partition</p></td>
<td><p>Used from OS partition</p></td>
</tr>
<tr class="even">
<td><p>Online apps metadata</p></td>
<td><p>OS partition</p></td>
<td><p>OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Stays in OS partition</p></td>
<td><p>Used from OS partition</p></td>
<td><p>Used from OS partition</p></td>
</tr>
<tr class="odd">
<td><p>Maps and voice navigation</p></td>
<td><p>User partition</p></td>
<td><p>User partition</p></td>
<td><p>Deleted</p></td>
<td><p>Deleted</p></td>
<td><p>Downloaded from the Internet</p></td>
<td><p>Downloaded from the Internet</p></td>
</tr>
</tbody>
</table>

 

To reclaim storage for users, the OS performs data cleanup in two stages:

-   The OS performs post-variant cleanup in some amount of time (default of 0 hours) after applying a variant for the user's primary SIM card and after completing initial device setup. Variant data is deleted from the user store because the device has been effectively branded during this time.

-   The OS deletes all variant data from the user store in some amount of time (default of 72 hours) after completing initial device setup, if no variant has been applied to the device. No data type will be persisted on the device.

OEMs can configure the following settings to manage the cleanup of runtime configuration data on the device:

-   [Persist variant data](#persistvariantdata)

-   [Post variant cleanup delay](#postvariantcleanupdelay)

-   [Unconditional cleanup delay](#unconditionalcleanupdelay)

-   [Factory mode](#factorymode)

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MVDataManagement"  
                         Description="Use to configure various cleanup settings for runtime configuration data."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="Multivariant"> 

             <!-- Set to 1 (to enable) or 0 (to disable) the backup of app installers for the selected variant when the device is branded. 
             <Setting Name="PersistVariantData" Value="" /> 
             -->

             <!-- Set the time, in minutes, to wait after branding the device before deleting unused variant data from the user store. 
                  Maximum is 10080 or 7 days 
             <Setting Name="PostVariantCleanupDelay" Value="" /> 
             -->

             <!-- Set the time, in minutes, to wait after finishing initial device setup before deleting all variant data from the user store. 
                  Maximum is 10080 or 7 days 
             <Setting Name="UnconditionalCleanupDelay" Value="" /> 
             -->

          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  See the following sections for more information about the settings and the values you can set for each.

## <a href="" id="persistvariantdata"></a>Persist variant data


Use the `PersistVariantData` setting to configure runtime configuration to back up the app installers for the selected variant when the device is branded. The setting can be set to one of the following values:

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
<td><p>0</p></td>
<td><p>Disable backup.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Enable backup. There must be sufficient space for runtime configuration backup to enable backup.</p></td>
</tr>
</tbody>
</table>

 

OEMs can configure the amount of reserved space to enable runtime configuration backup. To do this, set the **MainOSRTCDataReservedSectors** element in the OEMDevicePlatform.xml file.

**Note**  
OEMs should only configure **MainOSRTCDataReservedSectors** when using the runtime configuration feature to dynamically install certain applications from the Data partition depending on the SIM card(s) in the device during runtime. When using this functionality, the value is used to reserve space on the System partition to back up these applications so that they can be installed after a device reset.

 

When specifying the size, OEMs must specify a number of sectors that is sufficient to contain the latest get of applications placed in the data store that might be installed for an individual mobile operator. For example, if the OEM's customization answer file specified applications A, B, and C should be on the data partition and should only be installed for mobile operator Contoso, then the size reserved must be the size of A+B+C in MB and divided by 512 bytes per sector. At a maximum, OEMs can use **MainOSRTCDataReservedSectors** to reserve sectors up to 100 MB to be used by the runtime configuration engine. 

The following example shows how to reserve 50 MB:

``` syntax
<?xml version="1.0" encoding="utf-8\">
<OEMDevicePlatform xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">
    <MinSectorCount>20971520</MinSectorCount>
    <MainOSRTCDataReservedSectors>102400</MainOSRTCDataReservedSectors>
    <DevicePlatformID>{9D29F434-49E8-4C09-97AB-EF1DECC85D85}</DevicePlatformID>
</OEMDevicePlatform>
```

## <a href="" id="postvariantcleanupdelay"></a>Post variant cleanup delay


Use the `PostVariantCleanupDelay` setting to specify the time, in minutes, for the OS to wait after branding the device before deleting unused variant data from the user store. You can set this setting between 0 and 10080 minutes (or 7 days). If you specify a hexadecimal value, add the 0x prefix.

## <a href="" id="unconditionalcleanupdelay"></a>Unconditional cleanup delay


Use the `UnconditionalCleanupDelay` setting to specify the time, in minutes, for the OS to wait after initial device setup is finished before deleting unused variant data from the user store. You can set this setting between 0 and 10080 minutes (or 7 days). If you specify a hexadecimal value, add the 0x prefix.

## <a href="" id="factorymode"></a>Factory mode


This setting is not exposed through MCSF. OEMs can set the **Enable** value (REG\_DWORD) under the HKEY\_LOCAL\_MACHINE\\Software\\OEM\\FactoryMode registry key to 1 (indicates factory mode) or 0 (not in factory mode). A dialer plugin or other mechanism used during factory testing can turn on factory mode to prevent runtime configuration backup/restore/cleanup of variant data as well as retail mode offline content cleanup.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Managing%20runtime%20configuration%20data%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




