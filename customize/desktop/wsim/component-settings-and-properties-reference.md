---
title: Component Settings and Properties Reference
description: Component Settings and Properties Reference
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d4573eb1-d270-4493-9897-fb1b60f1363f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Component Settings and Properties Reference


Windows System Image Manager (Windows SIM) displays the properties and settings of a selected component or package in the **Properties** pane. You can use this pane to manage and view the component settings that are available to change for each configuration pass. You can also use this pane to view properties and IDs where applicable. In the case of packages, the pane displays Windows feature selections that you can change. Settings that are not available for each component or package appear dimmed. 

## Component Settings


Component settings are the configurable aspects of each component in a Windows installation. For example, you can configure the Windows Internet Explorer component setting **Home\_Page** to open to a particular URL by configuring the default value of the setting in the **Properties** pane of Windows SIM.

## Component Properties


Component properties are non-configurable attributes of a component. The following table lists component properties for components that have been added to an answer file.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Property</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>AppliedConfigurationPass</strong></p></td>
<td><p>Specifies the configuration pass that all child settings are applied to.</p></td>
</tr>
<tr class="even">
<td><p><strong>Component</strong></p></td>
<td><p>Specifies the root <strong>ComponentSetting</strong> object that this setting override belongs to.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Path</strong></p></td>
<td><p>Specifies the path to the setting from the component. The path appears in the following format: <em>SettingName1</em>/<em>SettingName2</em>/...</p></td>
</tr>
<tr class="even">
<td><p><strong>Enabled</strong></p></td>
<td><p>Indicates whether the component has been installed. A setting of <strong>True</strong> means that the component is installed. A setting of <strong>False</strong> means that the component is not installed. When the component is not installed, the setting is ignored and the correct Windows Features in the foundation package that contains the component are enabled.</p></td>
</tr>
</tbody>
</table>

 

## Component IDs


The component ID uniquely identifies the component of the operating system to which the settings belong. The ID contains the name, version, architecture, and other information for the component that is selected in the **Windows Image** pane or **Answer File** pane. The following table describes the different attributes of a component.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Language</strong></p></td>
<td><p>Specifies the language code. For more information, see the language codes in the [MSDN Library](http://go.microsoft.com/fwlink/?LinkId=68146).</p></td>
</tr>
<tr class="even">
<td><p><strong>Name</strong></p></td>
<td><p>Specifies the long name of the component or package.</p></td>
</tr>
<tr class="odd">
<td><p><strong>ProcessorArchitecture</strong></p></td>
<td><p>Specifies the processor architecture of the component or package. For example, <strong>x86</strong> or <strong>amd64</strong>.</p></td>
</tr>
<tr class="even">
<td><p><strong>PublicKeyToken</strong></p></td>
<td><p>Specifies the public-key token of the component or package. This is a string of 16 hexadecimal digits and is the hash value of the Microsoft public key. The value is unique and prevents collision between components and packages.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Version</strong></p></td>
<td><p>Specifies the version of the Windows component or package.</p></td>
</tr>
<tr class="even">
<td><p><strong>VersionScope</strong></p></td>
<td><p>Specifies the version scope of the Windows component or package. The possible values are <strong>SxS</strong> and <strong>nonSxS</strong>.</p></td>
</tr>
</tbody>
</table>

 

## Package Properties


Package properties are non-configurable attributes of the package. Package properties appear when you select a package in the **Windows Image** pane or **Answer File** pane. The following table describes the properties of packages.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Package property</strong></th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>CompanyName</strong></p></td>
<td><p>Specifies the name of the company that created the package.</p></td>
</tr>
<tr class="even">
<td><p><strong>Copyright</strong></p></td>
<td><p>Specifies the copyright disclaimer of the package.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Description</strong></p></td>
<td><p>Specifies the description of the package.</p></td>
</tr>
<tr class="even">
<td><p><strong>Id</strong></p></td>
<td><p>Specifies the identifier for the package. The format is: <em>ProcessorArchitecture</em>_<em>Version</em>_<em>Language</em>_<em>PublicKeyToken</em>_<em>VersionScope</em></p></td>
</tr>
<tr class="odd">
<td><p><strong>Keyword</strong></p></td>
<td><p>Specifies the keyword of the package.</p></td>
</tr>
<tr class="even">
<td><p><strong>Path</strong></p></td>
<td><p>Specifies the file-system path of the package file. This is blank if the package is from a Windows image.</p></td>
</tr>
<tr class="odd">
<td><p><strong>ProductName</strong></p></td>
<td><p>Specifies the product name that this package applies to.</p></td>
</tr>
<tr class="even">
<td><p><strong>ProductVersion</strong></p></td>
<td><p>Specifies the product version that this package applies to.</p></td>
</tr>
<tr class="odd">
<td><p><strong>ReleaseType</strong></p></td>
<td><p>Specifies the <strong>PackageReleaseType</strong> enumeration of this package. <strong>PackageReleaseType</strong> is documented in the Component Platform Interface (CPI) Reference.</p></td>
</tr>
<tr class="even">
<td><p><strong>SupportInformation</strong></p></td>
<td><p>Specifies the support information for the package. This can contain contact information about the package author.</p></td>
</tr>
</tbody>
</table>

 

## Package Settings


Package settings are the configurable attributes of the package that is selected in the **Answer File** pane. Package settings appear only when the package is selected in the **Answer File** pane because that is when you can change them. The following table describes package settings

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Setting name</strong></th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Action</strong></p></td>
<td><p>Specifies the action to be performed on the package within the answer file. Possible actions are <strong>Install</strong>, <strong>Configure</strong>, <strong>Remove</strong>, or <strong>Stage</strong>.</p></td>
</tr>
<tr class="even">
<td><p><strong>PermanenceType</strong></p></td>
<td><p>Describes whether a component is removable or permanent. Permanence types are members of the <strong>PackageActionType</strong> enumeration and are documented in the CPI Reference (CPIAPI.chm).</p></td>
</tr>
<tr class="odd">
<td><p><strong>PrimarySourcePath</strong></p></td>
<td><p>Specifies the primary file-system path that is the source of the package file. If the package is from a Windows image, this will be blank.</p></td>
</tr>
</tbody>
</table>

 

## Right-Click Menu Options


The following menu commands are available when you right-click a setting in the **Properties** pane.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>revert change</strong></p></td>
<td><p>Reverts to the previous state or setting. This command removes the entry for the setting from the answer file. The setting remains unchanged after the Unattend.xml answer file has been applied.</p></td>
</tr>
<tr class="even">
<td><p><strong>write empty string</strong></p></td>
<td><p>Writes the XML equivalent of an empty string for the setting in the answer file.</p>
<p>By default, if no value is specified, the setting will be omitted from the answer file. However, you can specifically write an empty value for a string type in an answer file by using this command.</p>
<p>This command applies to string types only.</p>
<div class="alert">
<strong>Important</strong>  
<p>Not all component string settings support empty values. For more information, see the Unattended Windows Setup Reference.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p><strong>write image value</strong></p></td>
<td><p>Creates an entry for the setting in the answer file with the value of the setting that is currently in the Windows image.</p></td>
</tr>
</tbody>
</table>

 

## .NET Types in Windows System Image Manager


Microsoft® .NET types appear at the bottom of the **Properties** pane. Component settings have a type that describes the kind of data that is valid for that setting. These types are mapped to their equivalent .NET types in Windows SIM. The following table lists the possible types that can be associated with component settings.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>.NET type</th>
<th>Parameters</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>System.Byte</strong></p></td>
<td><p>0 to 255</p></td>
<td><p>Unsigned 8-bit integer</p></td>
</tr>
<tr class="even">
<td><p><strong>System.SByte</strong></p></td>
<td><p>-128 to 127</p></td>
<td><p>Signed 8-bit integer</p></td>
</tr>
<tr class="odd">
<td><p><strong>System.UInt16</strong></p></td>
<td><p>0 to 65,535</p></td>
<td><p>Unsigned 16-bit integer</p></td>
</tr>
<tr class="even">
<td><p><strong>System.Int16</strong></p></td>
<td><p>-32,768 to 32,767</p></td>
<td><p>Signed 16-bit integer</p></td>
</tr>
<tr class="odd">
<td><p><strong>System.UInt32</strong></p></td>
<td><p>0 to 4,294,967,295</p></td>
<td><p>Unsigned 32-bit integer</p></td>
</tr>
<tr class="even">
<td><p><strong>System.Int32</strong></p></td>
<td><p>-2,147,483,648 to 2,147,483,647</p></td>
<td><p>Signed 32-bit integer</p></td>
</tr>
<tr class="odd">
<td><p><strong>System.UInt64</strong></p></td>
<td><p>0 to 18,446,744,073,709,551,615</p></td>
<td><p>Unsigned 64-bit integer</p></td>
</tr>
<tr class="even">
<td><p><strong>System.Int64</strong></p></td>
<td><p>-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807</p></td>
<td><p>Signed 64-bit integer</p></td>
</tr>
<tr class="odd">
<td><p><strong>System.Boolean</strong></p></td>
<td><p>true | false</p></td>
<td><p>Boolean data</p></td>
</tr>
<tr class="even">
<td><p><strong>System.String</strong></p></td>
<td><p>Represents text as a series of Unicode characters</p></td>
<td><p>String data</p></td>
</tr>
</tbody>
</table>

 

## Array Types


Some component settings require arrays of data. These arrays are mapped to their equivalent .NET array types in Windows SIM. The following table lists the possible array types that are associated with component settings.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>System.String[]</strong></p></td>
<td><p>Array of <strong>System.String</strong></p></td>
</tr>
<tr class="even">
<td><p><strong>System.Byte[]</strong></p></td>
<td><p>Array of <strong>System.Byte</strong></p></td>
</tr>
<tr class="odd">
<td><p><strong>System.SByte[]</strong></p></td>
<td><p>Array of <strong>System.SByte</strong></p></td>
</tr>
</tbody>
</table>

 

## List-Item Types


Settings are sometimes organized into groups called list items. List items specify one or more values for a list-item type. A list-item type may include one or more component settings. For example, you can create multiple Favorites links by using the **FavoriteItem** setting for Internet Explorer.

You add a list item by right-clicking the setting for a container. For example, you can add a **FavoriteItem** list item by right-clicking the **FavoritesList** container in the Answer File pane. For more information, see [Configure Components and Settings in an Answer File](configure-components-and-settings-in-an-answer-file.md).

### Key Settings for List Items

Each list item must have a unique identifier, which is known as the key for that specific list item. When you modify the key setting for the list item, the key identifier appears in brackets (\[\]) next to the list item in the **Answer File** pane.

### List-Item Actions

The following actions are available for list items when you use Windows SIM.

### Add a New List Item

You can use Windows SIM to add list items to the currently open answer file. In the **Setting Action** drop-down list, click **AddListItem**. You must also add a unique key setting to the list item. The unique key setting appears in brackets next to the list item in the tree view of the **Answer File** pane. A plus sign (+) appears, which indicates that the list item is added to the Windows image when the unattended answer file is run.

### Delete a List Item

You can use Windows SIM to delete a list item that is defined in a Windows image (.wim) file. In the **Setting Action** drop-down list, click **RemoveListItem**. A minus sign (–) appears, which indicates that the list item is deleted from the image when the unattended answer file is run.

### Modify a List Item

You can use Windows SIM to modify a list item that is defined in a Windows image file. To change the default value for an existing list item, click **Modify** in the **Properties** pane, and then enter the updated information under **Settings**. The updated list-item setting is added to the answer file.

## Related topics


[Windows System Image Manager Reference Topics](windows-system-image-manager-technical-reference.md)

[Windows System Image Manager Overview Topics](windows-system-image-manager-overview-topics.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Component%20Settings%20and%20Properties%20Reference%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





