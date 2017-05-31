---
title: Keyboard Filter
description: Keyboard Filter
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 95de7d47-f488-44ea-94a1-2ae542b7f344
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Keyboard Filter


You can use Keyboard Filter to suppress undesirable key presses or key combinations. Normally, a customer can use certain Microsoft Windows key combinations like Ctrl+Alt+Delete or Ctrl+Shift+Tab to alter the operation of a device by locking the screen or using Task Manager to close a running application. This may not be desirable if your device is intended for a dedicated purpose.

The Keyboard Filter feature works with physical keyboards, the Windows on-screen keyboard, and the touch keyboard. Keyboard Filter also detects dynamic layout changes, such as switching from one language set to another, and continues to suppress keys correctly, even if the location of suppressed keys has changed on the keyboard layout.

## Requirements


Windows 10 Enterprise or Windows 10 Education.

## Terminology


**Turn on, enable:** To make the setting available to the device and optionally apply the settings to the device. Generally *turn on* is used in the user interface or control panel, whereas *enable* is used for command line.

**Configure:** To customize the setting or sub-settings.

**Embedded Keyboard Filter:**This feature is called Embedded Keyboard Filter in Windows 10, version 1511.

**Keyboard Filter:**This feature is called Keyboard Filter in Windows 10, version 1607 and later.

## Turn on Keyboard Filter


By default, Keyboard Filter is not turned on. You can turn Keyboard Filter on or off for your device by using the following steps.

Turning on an off Keyboard Filter requires that you restart your device. Keyboard Filter is automatically enabled after the restart.

**Turn on Keyboard Filter by using Control Panel**

1.  In the **Search the web and Windows** field, type **Programs and Features** and either press **Enter** or tap or click **Programs and Features** to open it.
2.  In the **Programs and Features** window, click **Turn Windows features on or off**.
3.  For Windows 10, version 1511, in the **Windows Features** box, select or clear the checkbox for **Embedded Keyboard Filter**.

    For Windows 10, version 1607, in the **Windows Features** window, expand the **Device Lockdown** node, and select or clear the checkbox for **Keyboard Filter**.

4.  Click **OK**. The **Windows Features** window indicates Windows 10 is searching for required files and displays a progress bar. Once found, the window indicates Windows 10 is applying the changes. When completed, the window indicates the requested changes are completed.
5.  Click **Close** to close the **Windows Features** window.

**Configure Keyboard using Unattend**

1.  You can configure the Unattend settings in the [Microsoft-Windows-Embedded-KeyboardFilterService](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/desktop/unattend/microsoft-windows-embedded-keyboardfilterservice) component to add Keyboard Filter features to your image during the design or imaging phase.
2.  You can manually create an Unattend answer file or use Windows System Image Manager (Windows SIM) to add the appropriate settings to your answer file. For more information about the keyboard filter settings and XML examples, see the settings in [Microsoft-Windows-Embedded-KeyboardFilterService](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/customize/desktop/unattend/microsoft-windows-embedded-keyboardfilterservice).

## Turn on and configure Keyboard Filter using Windows Imaging and Configuration Designer (ICD)


The Keyboard Filter settings are also available as Windows provisioning settings so you can configure these settings to be applied during the image deployment time or runtime. You can set one or all keyboard filter settings by creating a provisioning package using Windows Imaging and Configuration Designer (ICD) and then applying the provisioning package during image deployment time or runtime.

1.  Build a provisioning package in Windows ICD by following the instructions in [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107).
    **Note**  In the **Select Windows Edition** window, choose **Common to all Windows desktop editions**.

     

2.  On the **Available customizations** page, select **Runtime settings** &gt; **SMISettings**, and then set the desired values for the keyboard filter settings.
3.  Once you have finished configuring the settings and building the provisioning package, you can apply the package to the image deployment time or runtime. See the To apply a provisioning package to a Windows 10 for desktop devices sectionin [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107) for more information. Note that the process for applying the image to a Windows 10 Enterprise is the same.

This example uses a Windows image called install.wim, but you can use the same procedure to apply a provisioning package. For more information on DISM, see [What Is Deployment Image Servicing and Management](https://technet.microsoft.com/en-us/library/dd744566.aspx)?

**Turn on and configure Keyboard Filter by using DISM**

1.  Open a command prompt with administrator privileges.
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
    Dism /online /Enable-Feature /FeatureName:Client-KeyboardFilter
    ```

6.  Commit the change.

    ```
    dism /unmount-wim /MountDir:c:\wim /Commit
    ```

## Keyboard Filter features


Keyboard Filter has the following features:

-   Supports hardware keyboards, the standard Windows on-screen keyboard, and the touch keyboard (TabTip.exe).
-   Suppresses key combinations even when they come from multiple keyboards.

    For example, if a user presses the Ctrl key and the Alt key on a hardware keyboard, while at the same time pressing Delete on a software keyboard, Keyboard Filter can still detect and suppress the Ctrl+Alt+Delete functionality.

-   Supports numeric keypads and keys designed to access media player and browser functionality.
-   Can configure a key to breakout of a locked down user session to return to the Welcome screen.
-   Automatically handles dynamic layout changes.
-   Can be enabled or disabled for administrator accounts.
-   Can force disabling of Ease of Access functionality.
-   Can block physical hardware keys.
-   Supports x86 and x64 architectures.

## Keyboard scan codes and layouts


When a key is pressed on a physical keyboard, the keyboard sends a scan code to the keyboard driver. The driver then sends the scan code to the OS and the OS converts the scan code into a virtual key based on the current active layout. The layout defines the mapping of keys on the physical keyboard, and has many variants. A key on a keyboard always sends the same scan code when pressed, however this scan code can map to different virtual keys for different layouts. For example, in the English (United States) keyboard layout, the key to the right of the P key maps to “{“. However, in the Swedish (Sweden) keyboard layout, the same key maps to “Å”.

Keyboard Filter can block keys either by the scan code or the virtual key. Blocking keys by the scan code is useful for custom keyboards that have special scan codes that do not translate into any single virtual key. Blocking keys by the virtual key is generally more convenient because it is easier to read and Keyboard Filter suppresses the key correctly even when the location of the key changes because of a layout change.

When you configure Keyboard Filter to block keys by using the virtual key, you must use the English names for the virtual keys. For more information about the names of the virtual keys, see keyboard filter key names.

For the Windows on-screen keyboard, keyboard filter converts each keystroke into a scan code based on the layout, and back into a virtual key. This allows keyboard filter to suppress the on-screen keyboard keys in the same manner as physical keyboard keys, whether they are configured by scan code or virtual key.

## Keyboard Filter and ease of access features


By default, ease of access features are enabled and Keyboard Filter is disabled for administrator accounts.

If Sticky Keys are enabled, a user can bypass Keyboard Filter in certain situations. You can configure keyboard filter to disable all ease of access features and prevent users from enabling them.

You can enable ease of access features for administrator accounts, while still disabling them for standard user accounts, by making sure that Keyboard Filter is disabled for administrator accounts.

## Keyboard Filter configuration


You can configure the following options for Keyboard Filter:

-   Set/unset predefined key combinations to be suppressed.

-   Add/remove custom defined key combinations to be suppressed.

-   Enable/disable keyboard filter for administrator accounts.

-   Force disabling ease of access features.

-   Configure a breakout key sequence to break out of a locked down account.

Most configuration changes take effect immediately. Some changes, such as enabling or disabling Keyboard Filter for administrators, do not take effect until the user signs out of the account and then back in. If you change the breakout key scan code, you must restart the device before the change take effect.

You can configure keyboard filter by using Windows Management Instrumentation (WMI) providers. You can use the Keyboard Filter WMI providers directly in a PowerShell script or in an application.

For more information about Keyboard Filter WMI providers, see [Keyboard Filter WMI provider reference](keyboardfilter-wmi-provider-reference.md).

## <a href="" id="change-keyboard-breakout"></a>Keyboard breakout


You may need to sign in to a locked down device with a different account in order to service or configure the device. You can configure a breakout key to break out of a locked down account by specifying a key scan code. When you press Ctrl+Alt+Delete, Windows presents the Welcome screen so that you can sign in to a different account.

The breakout key is set to the scan code for the left Windows logo key by default. You can use the [WEKF\_Settings](wekf-settings.md)WMI class to change the breakout key scan code. If you change the breakout key scan code, you must restart the device before the change takes effect.

## Keyboard Filter considerations


Starting a device in Safe Mode bypasses keyboard filter. The Keyboard Filter service is not loaded in Safe Mode, and keys are not blocked in Safe Mode.

Keyboard filter cannot block the Sleep key.

Some hardware keys, such as rotation lock, do not have a defined virtual key. You can still block these keys by using the scan code of the key.

The add (+), multiply (\*), subtract (-), divide (/), and decimal (.) keys have different virtual keys and scan codes on the numeric keypad than on the main keyboard. You must block both keys to block these keys. For example, to block the multiply key, you must add a rule to block “\*” as well as a rule to block Multiply.

When locking the screen by using the on-screen keyboard, or a combination of a physical keyboard and the on-screen keyboard, the on-screen keyboard sends an additional Windows logo key keystroke to the OS. If your device is using the Windows 10 shell and you use keyboard filter to block Windows logo key+L, the extra Windows logo key keystroke causes the shell to switch between the **Start** screen and the last active app when a user attempts to lock the device by using the on-screen keyboard, which may be unexpected behavior.

Some custom keyboard software, such as Microsoft IntelliType Pro, can install Keyboard Filter drivers that prevent Keyboard Filter from being able to block some or all keys, typically extended keys like BrowserHome and Search.

## In this section


-   [Keyboard Filter key names](keyboardfilter-key-names.md)
-   [Predefined key combinations](predefined-key-combinations.md)
-   [Keyboard Filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)
-   [Windows PowerShell script samples for Keyboard Filter](keyboardfilter-powershell-script-samples.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Keyboard%20Filter%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




