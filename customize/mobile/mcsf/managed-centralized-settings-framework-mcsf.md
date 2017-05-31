---
title: Managed Centralized Settings Framework (MCSF)
description: Provides a standard way to describe settings that are customizable within packages.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e583f02e-85c0-4e0e-bc80-dcf02e0e971c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Managed Centralized Settings Framework (MCSF)


The Managed Centralized Settings Framework (MCSF) is part of the customization and multivariant infrastructure first introduced in Windows Phone 8.1 and is still supported in Windows 10 Mobile. This component provides:

-   A simple and consistent way for Microsoft to declare various mobile OS settings.

-   All the necessary features and settings needed for mobile OS image and multivariant customization to be declared and fully supported.

-   A centralized framework that the provisioning engine, mobile operators, device management servers, and others can query or modify these settings.

MCSF consists of both image time and runtime components that enable these functionality. MCSF creates configuration service providers for registry-backed settings and custom configuration service providers can be referenced for more complex settings.

OEM partners can use MCSF and the MCSF packaging XML schema to declare and access custom OEM settings. The following sections provide more information about how you can declare your custom settings that conform to the MCSF packaging XML schema.

## Mobile OS settings and customizations


Microsoft-owned policy settings are documented in the Microsoft.*FeatureArea*.*FeatureSubArea*.policy.xml files. If you have the Adaptation Kit installed, you can find the policy settings files in the %WPDKCONTENTROOT%\\OEMCustomization\\generatedPolicy directory.

**Note**  
The packaging and imaging tools do not read the policy settings from these XML files. The tools read the policy settings from internal policy configurations that are not available for partners to modify directly. If you modify the XML files in the generatedPolicy directory, nothing will happen.

 

These XML files are provided only for your convenience so that you can review the customizations that have been enabled on Windows 10 Mobile.

## Declaring settings


Declared settings are added in the components’ existing .pkg.xml file as children of any **Component** element. For example, the following XML exposes a simple **DWORD** in the registry as a setting in a package file:

``` syntax
<SettingsGroup Path="OSArea/Feature">
   <Setting Name="Setting" Description="This is a DWORD registry value.">
     <RegistrySource Type="REG_DWORD" Path="HKEY_LOCAL_MACHINE\Software\Sample\RegKey" />
   </Setting>
</SettingsGroup>
```

### <a href="" id="settingsgroup"></a>Settings groups

Settings are grouped within the package file. A **SettingsGroup** element represents a settings group in the [customization answer file](customization-answer-file.md). This is the top-level element for the MCSF packaging XML. Each group can contain any number of individual settings.

OEMs building their own flexible hierarchy of settings must choose an associated **Path** for each group of settings. For example, ringtone settings may reside in a “Shell\\Ringtones” group while lock screen settings may reside under a “Shell\\Wallpaper” group. Microsoft recommends using a **Path** naming scheme similar to the above example: "OSArea/Feature"

**Note**  
When naming your settings group, you must not include illegal file system characters in the settings group name. This [MSDN Web site](http://go.microsoft.com/fwlink/p/?LinkId=328836) provides some guidelines on naming conventions. You can use both **\\** and **/** but do not use the reserved characters in your settings group name.

 

### <a href="" id="groupconstraints"></a>Group constraints

Some settings groups may have special properties. A **Constraints** element within the settings group declaration indicates these special properties.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>ImageTimeOnly</strong></p></td>
<td><p>Specifies settings that are available to OEMs for customization during image time, but does not require runtime configuration by the runtime configuration engine or OTA.</p>
<div class="alert">
<strong>Note</strong>  
<p>If you are declaring a settings group that is not in the MainOS partition, you must specify this settings group as image time only.</p>
</div>
<div>
 
</div></td>
<td><p><code>&lt;Constraints ImageTimeOnly=&quot;Yes&quot; /&gt;</code></p></td>
</tr>
<tr class="even">
<td><p><strong>FirstVariationOnly</strong></p></td>
<td><p>Specifies settings that are restricted such that these settings can only be modified by the runtime configuration engine during the first variation (typically when applying branding related to the first SIM).</p>
<p>Settings with the <strong>FirstVariationOnly</strong> constraint are configured whenever the runtime configuration engine finds the first valid configuration when a SIM is inserted and there is a marked configuration for it. During SIM change, the value for the <strong>FirstVariationOnly</strong> setting will not be changed again.</p></td>
<td><p><code>&lt;Constraints FirstVariationOnly=&quot;Yes&quot; /&gt;</code></p></td>
</tr>
<tr class="odd">
<td><p><strong>Atomic</strong></p></td>
<td><p>Specifies that one or more of the settings depend on the value of some of the other settings in the group. For OEMs that configures an atomic settings group, OEMs must specify every setting in that group.</p></td>
<td><p><code>&lt;Constraints Atomic=&quot;Yes&quot; /&gt;</code></p></td>
</tr>
</tbody>
</table>

 

### <a href="" id="individualsettings"></a>Individual settings

A **Setting** element represents a setting that is contained within a **Settings** group. Each setting must have a **Name** attribute, which must be unique within the settings group. A **Description** attribute can be used to display information about the setting. For example, a description can be: "Use to display the battery life warning on phones with AMOLED or OLED displays." OEMs must provide a **Description** attribute for each setting.

A setting can point to a particular location in the registry or to a configuration service provider node.

-   To point your setting at a registry location, add a **RegistrySource** element to the setting.

    The **RegistrySource** must contain a **Path** attribute that specifies the full path to the desired value in the registry. You must also specify the **Type** attribute, such as REG\_DWORD, REG\_SZ. and so on, to indicate the type of registry value. Optionally, you can specify a default value for your registry setting by including a **Default** value. The following example shows what a registry-sourced setting looks like:

    ``` syntax
    <Setting Name="MyString">
       <!-- Use '@' to specify the default registry value. The Path must resolve to a value, rather than a key.
            Note that this registry location will have a default value of 3. -->
       <RegistrySource Type="REG_SZ" Path="HKEY_LOCAL_MACHINE\Software\Sample\@" Default="DefaultValue" />
    </Setting>
    ```

-   To point your setting at a configuration service provider node, add a **CSPSource** element to the setting.

    The **CSPSource** must contain a **Path** attribute that specifies the full URI path to the desired configuration service provider node. You must also specify the **Type** attribute, which may contain one of the ConfigManager2 data types such as CFG\_DATATYPE\_INTEGER, CFG\_DATATYPE\_STRING, and so on. The following example shows what a configuration service provider-sourced setting looks like:

    ``` syntax
    <Setting Name="MyPhoneVersion">
       <CspSource Type="CFG_DATATYPE_STRING" Path="./devdetail/swv" />
    </Setting>
    ```

### <a href="" id="controllingaccess"></a>Controlling access

You can control access to each setting by including an optional **AccessType** element. There are four **AccessType** attributes: **Create**, **Delete**, **Get**, and **Replace**. There is also an **All** attribute that overrides any of the other access types. These attributes default to “Yes” so if you omit **AccessType** altogether, this implies that all access is allowed for your setting. You can use this element if you need to restrict the allowed operations for your setting.

The following example shows how to specify the type of access for a setting:

``` syntax
<Setting Name="NoDeleteSetting">
   <RegistrySource Type="REG_DWORD" Path="HKEY_LOCAL_MACHINE\Software\Sample\NoDelete" Default="3" />
 
   <!-- This Setting cannot be deleted once created. -->
   <AccessType Create="Yes" Delete="No" Get="Yes" Replace="Yes" />
</Setting>
```

**Note**  
This access control is done at the MCSF configuration service provider level and is not intended to take the place of security. If you need to protect your registry locations, you must do so using capabilities.

 

### <a href="" id="validatingsettings"></a>Validating settings

MCSF allows you to specify simple rules to control which values are allowed for your settings. To do this, add a **Validate** element for your setting. There are three methods to validate a setting:

-   For numeric values, you can specify a minimum and/or a maximum value. You can do this by setting the **Min** and **Max** attributes in the **Validate** element.

    ``` syntax
    <Setting Name="MyNumericSetting">
       <RegistrySource Type="REG_DWORD" Path="HKEY_LOCAL_MACHINE\Software\Sample\Number" Default="3" />

       <!-- Validate that the range is from 0 through 10. -->
       <Validate Min="0" Max="10" />
    </Setting>
    ```

-   For string values, you can specify a minimum and/or a maximum string length. You can do this by setting the **MinLength** and **MaxLength** attributes in the **Validate** element.

    ``` syntax
    <Setting Name="MyString">
       <RegistrySource Type="REG_SZ" Path="HKEY_LOCAL_MACHINE\Software\Sample\PutStringHere" Default="" />
     
       <!-- Validate that the string length is from 0 to 255. -->
       <Validate MinLength="0" MaxLength="255" />
    </Setting>
    ```

-   You can also specify an explicit list of allowed values for your setting. You can do this by adding the **Option** element to the **Validate** element for each allowed value. Option elements have a **Value** attribute and an optional **FriendlyName** attribute. You can use the friendly name to show identifiable string names in your customization tools for simple enum values. The following example shows several options with friendly names:

    ``` syntax
    <Setting Name="MyEnum">
       <RegistrySource Type="REG_DWORD" Path="HKEY_LOCAL_MACHINE\Software\Sample\PutOneOfListHere" Default="1" />
     
       <!-- The Value attribute has to be one of the following values. -->
       <Validate>
          <Option Value="0" FriendlyName="Red" />
          <Option Value="1" FriendlyName="Green" />
          <Option Value="2" FriendlyName="Blue" />
       </Validate>
    </Setting>
    ```

Options for numeric settings must be specified in hexadecimal format, but without a 0x prefix.

### <a href="" id="settingsthatreferencefiles"></a>Settings that reference files

Some settings may be related to asset files, such as lock screen backgrounds, that OEMs or mobile operators include in the phone image. To specify an asset file, use an **Asset** element to your settings group. Each **Asset** element must specify a unique asset **Name** attribute as well as a **Description**. Assets are defined by a number of properties that help the imaging system validate their content.

The asset contains a **Type** attribute that specifies a semicolon delimited list of file extensions that the setting supports. OEMs must also specify a **Path** attribute to indicate where the OEM assets should be placed on the phone.

Any **Setting** can reference any existing asset by specifying the **Asset** attribute. This indicates to the OEM customization tools that the setting expects to use an asset filename for its value.

**Note**  
When creating your own policy settings and you're adding an **Asset** to a **SettingsGroup**, you must specify the **Asset** within the **SettingsGroup** first. Otherwise, the package containing your policy settings will not get built.

 

The following example shows how an **Asset** as the first attribute declared within the **SettingsGroup** and a **Setting** that references the **Asset** that was declared:

``` syntax
<SettingsGroup Path="LockScreen">
   <Asset Name="Wallpapers" Type=".jpg;.jpeg;.png" Path="\Programs\CommonFiles\Wallpapers" Description="Use to add lock screen backgrounds to the phone." >
       <MultiStringList Key="HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\OEM\Wallpaper" Value="WallpaperSet" />
   </Asset>

   <Setting Name="DefaultWallpaper" Asset="Wallpapers" Description="Use to set the default lock screen background.">
      <RegistrySource Type="REG_SZ" Path="HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\OEM\Wallpaper\CurrentWallpaper" />
   </Setting>
</SettingsGroup>
```

**Asset** names can include macros and allow you to put files into locations based on the value of the macro specified in the asset name.

**Warning**  
Macros in **SettingsGroup** paths do not work with Assets. To use a macro in an **Asset** path, the macro reference must be part of the **Asset** name.

 

``` syntax
<SettingsGroup Path="Contoso/MyConfig">
    <Asset Name="MyVariant/$(VarType)"
        Type=".txt"
        Path="\Programs\CommonFiles\OEM\Public\Contoso\$(VarType)\"
        Description="Use to write a text file" />
</SettingsGroup>
```

Optionally, the image customization process can build a list of supplemental asset files added by OEM partners or mobile operator partners and set the list in the registry. There are two models that support this:

-   OEMs can use the **ValueList** element within your asset declaration if your component expects a list of extra files to appear in the registry as individual values per file under a parent key. The **ValueList** element has two attributes, **OEMKey** and **MOKey**, which specify where OEM and mobile operator files should be listed, respectively. The customization tooling creates one value for each asset file added by the OEM or mobile operator. These values will be of registry type REG\_SZ. The name will be the full path to the asset file on the device. The REG\_SZ content of the value will be a localizable string in the form `"<MUIDllPath>,-<StringID>"`. The **ValueList** can also specify the **FileNamesOnly** attribute to indicate that it does not expect full paths in the list, only file names.

    The following example shows this model:

    ``` syntax
    <Asset Name="Ringtones" Type=".wma" Path="\Programs\CommonFiles\Sounds">
       <ValueList
          OEMKey="HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\OEM\Sounds\Ringtones"
          MOKey="HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\MO\Sounds\Ringtones" FileNamesOnly="Yes" />
    </Asset>
    ```

-   OEMs can use the **MultiStringList** element in your asset if your component expects a simple REG\_MULTI\_SZ list of file paths in the registry. The customization tooling builds a multi-string list of each asset file added by partners and sets this value at the registry location specified by the **Key** and **Value** attributes.

    **Note**  
    In Windows 10 Mobile, the Windows Provisioning framework does not support multi-string registry values so this element is only available in the MCSF framework. This means that assets, such as wallpapers or ringtones, can only be added through MCSF.

     

    The following example shows this model:

    ``` syntax
    <Asset Name="Wallpapers" Type=".jpg;.jpeg;.png" Path="\Programs\CommonFiles\Wallpapers">
       <MultiStringList
          Key="HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\OEM\Wallpaper"
          Value="WallpaperSet" />
    </Asset>
    ```

### <a href="" id="multisettings"></a>Multi-settings

Multi-settings are settings or groups of settings that are SIM-based or account-based. You can handle these types of settings using MCSF by declaring your **SettingsGroup**’s **Path** in a specific format that declares one segment of the setting’s URI to become a variable. You can reuse this variable when you declare each of your settings’ underlying source locations such as the **RegistrySource** **path** or **CSPSource** **Path**.

To declare a multi-setting variable, you can use the **$(VariableName)** packaging XML macro format. The following examples show how to do this:

``` syntax
<!-- Specifies a pair of Settings that we may have many sets of, one per "account" -->
<SettingsGroup Path="TestSettings/MyAccounts/$(AccountID)">
 
   <!-- Each account has a username. -->
   <Setting Name="Username">
      <!-- Note that the macro used above in the SettingsGroup must also appear here. -->
      <RegistrySource Type="REG_SZ" Path="HKEY_LOCAL_MACHINE\Software\Sample\$(AccountID)\Username" />
   </Setting>
 
   <!-- Each account has a password. -->
   <Setting Name="Password">
      <RegistrySource Type="REG_SZ" Path="HKEY_LOCAL_MACHINE\Software\Sample\$(AccountID)\Password" />
   </Setting>
 
</SettingsGroup>
```

In the above example, the variable name is **AccountID**. You must specify that segment of the setting’s URI to provision this setting. In this example, when MCSF sets the underlying value, it fetches the string value of the **AccountID** segment and injects it into the registry paths for Username and Password. For example, provisioning the following XML sets `HKEY_LOCAL_MACHINE\Software\Sample\{71986}\Username` to “RobinNail” and `HKEY_LOCAL_MACHINE\Software\Sample\{71986}\Password` to “1234Password”.

``` syntax
<wap-provisioningdoc>
   <characteristic type="MCSF">
      <!-- This sets the username and password for account {71986}. -->
      <characteristic type="TestSettings\MyAccounts\{71986}">
         <parm name="Username" value="RobinNail" />
         <parm name="Password" value="1234Password" />
      </characteristic>
   </characteristic>
</wap-provisioningdoc>
```

For SIM-based settings, you can use the special variable **$(\_\_IMSI)** that’s built-in to MCSF. When these types of settings are being provisioned, the **$(\_\_IMSI)** segment is replaced with the IMSI string for the current SIM card. The following example shows how to do this:

``` syntax
<!-- Specifies some SIM-specific settings... -->
<SettingsGroup Path="TestSettings/SimSpecific/$(__IMSI)">
  <Setting Name="SimSpecificValue">
    <!-- There should be one setting like this for  every SIM card. -->
    <RegistrySource Type="REG_DWORD" Path="HKEY_LOCAL_MACHINE\Software\Sample\$(__IMSI)\SimSpecificValue" />
  </Setting>
</SettingsGroup>
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Managed%20Centralized%20Settings%20Framework%20%28MCSF%29%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




