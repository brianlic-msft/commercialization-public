---
title: Custom Logon
description: Custom Logon
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: aaf4ddd3-eac4-4c60-90c8-38837078c43b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Custom Logon


You can use the Custom Logon feature to suppress Windows 10 UI elements that relate to the Welcome screen and shutdown screen. For example, you can suppress all elements of the Welcome screen UI and provide a custom logon UI. You can also suppress the Blocked Shutdown Resolver (BSDR) screen and automatically end applications while the OS waits for applications to close before a shutdown.

Custom Logon settings do not modify the credential behavior of **Winlogon**, so you can use any credential provider that is compatible with Windows 10 to provide a custom sign-in experience for your device.

## Requirements


Windows 10 Enterprise or Windows 10 Education.

## Terminology


**Turn on, enable:** To make the setting available to the device and optionally apply the settings to the device. Generally *turn on* is used in the user interface or control panel, whereas *enable* is used for command line.

**Configure:** To customize the setting or sub-settings.

**Embedded Logon:**This feature is called Embedded Logon in Windows 10, version 1511.

**Custom Logon:**This feature is called Custom Logon in Windows 10, version 1607 and later.

## <a href="" id="turn-on-logon"></a>Turn on Custom Logon


Custom Logon is an optional component and is not turned on by default in Windows 10. It must be turned on prior to configuring. You can turn on and configure Custom Logon in a customized Windows 10 image (.wim) if Microsoft Windows has not been installed. If Windows has already been installed and you are applying a provisioning package to configure Custom Logon, you must first turn on Custom Logon in order for a provisioning package to be successfully applied.

The Custom Logon feature is available in the Control Panel. You can set Custom Logon by following these steps:

**Turn on Custom Logon in Control Panel**

1.  In the **Search the web and Windows** field, type **Turn Windows features on or off**.
2.  For Windows 10, version 1511, in the **Windows Features** box, select **Embedded Logon**.

    For Windows 10, version 1607, in the **Windows Features** window, expand the **Device Lockdown** node, and select or clear the checkbox for **Custom Logon**.

When you use

**Turn on and configure Custom Logon using DISM**

1.  Open a command prompt with administrator rights.
2.  Copy install.wim to a temporary folder on hard drive (in the following steps, we'll assume it's called C:\\wim).
3.  Create a new directory.

    ```
    md c:\wim
    ```

4.  Mount the image.

    ```
    dism /mount-wim /wimfile:c:\bootmedia\sources\install.wim /index:1 /MountDir:c:\wim
    ```

5.  Enable the feature.

    ```
    dism /image:c:\wim /enable-feature /featureName:Client-EmbeddedLogon
    ```

6.  Commit the change.

    ```
    dism /unmount-wim /MountDir:c:\wim /Commit
    ```

### Configure Custom Logon settings using Unattend

You can configure the Unattend settings in the [Microsoft-Windows-Embedded-EmbeddedLogon](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/desktop/unattend/microsoft-windows-embedded-embeddedlogon) component to add custom logon features to your image during the design or imaging phase. You can manually create an Unattend answer file or use Windows System Image Manager (Windows SIM) to add the appropriate settings to your answer file. For more information about the custom logon settings and XML examples, see the settings in Microsoft-Windows-Embedded-EmbeddedLogon.

The following example shows how to disable all Welcome screen UI elements and the **Switch user** button.

```XML
<settings pass="specialize">
    <component name="Microsoft-Windows-Embedded-EmbeddedLogon" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <BrandingNeutral>17</BrandingNeutral>
      <AnimationDisabled>1</AnimationDisabled>
      <NoLockScreen>1</NoLockScreen>
      <UIVerbosityLevel>1</UIVerbosityLevel>
      <HideAutoLogonUI>1</HideAutoLogonUI>
    </component>
</settings>
```

## In this section


-   [Complementary features to Custom Logon](complementary-features-to-custom-logon.md)
-   [Troubleshooting Custom Logon](troubleshooting-custom-logon.md)

## Related topics


[Unbranded Boot](unbranded-boot.md)

[Shell Launcher](shell-launcher.md)

[Assigned access](assigned-access.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Custom%20Logon%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





