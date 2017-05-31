---
title: Shell Launcher
description: Shell Launcher
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c65f1400-9d2a-406e-8b43-74eaafb0ccae
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Shell Launcher


You can use Shell Launcher to replace the default Windows 10 shell with a custom shell. You can use any application or executable as your custom shell, such as a command window or a custom dedicated application.

**Warning**  
You may specify any executable file to be the default shell except C:\\Windows\\System32\\Eshell.exe. Using Eshell.exe as the default shell will result in a blank screen after user signs in.

 

You can also configure Shell Launcher to launch different shell applications for different users or user groups.

**Important**  
You cannot use Shell Launcher to launch a Universal Windows app as a custom shell.

 

Shell Launcher processes the **Run** and **RunOnce** registry keys before starting the custom shell, so your custom shell doesn’t need to handle the automatic startup of other applications and services.

Shell Launcher also handles the behavior of the system when your custom shell exits. You can configure the shell exit behavior if the default behavior does not meet your needs.

## Requirements


Windows 10 Enterprise or Windows 10 Education.

## Terminology


**Turn on, enable:** To make the setting available to the device and optionally apply the settings to the device.

**Configure:** To customize the setting or sub-settings.

**Embedded Shell Launcher:** This feature is called Embedded Shell Launcher in Windows 10, version 1511.

**Custom Shell Launcher:** This feature is called Shell Launcher in Windows 10, version 1607 and later.

## Turn on Shell Launcher


Shell Launcher is an optional component and is not turned on by default in Windows 10. It must be turned on prior to configuring. You can turn on and configure Shell Launcher in a customized Windows 10 image (.wim) if Microsoft Windows has not been installed. If Windows has already been installed and you are applying a provisioning package to configure Shell Launcher, you must first turn on Shell Launcher in order for a provisioning package successfully apply.

**Turn on Shell Launcher by using Control Panel**

1.  In the **Search the web and Windows** field, type **Programs and Features** and either press **Enter** or tap or click **Programs and Features** to open it.
2.  In the **Programs and Features** window, click **Turn Windows features on or off**.
3.  For Windows 10, version 1511 , in the **Windows Features** box, select **Embedded Shell Launcher**.

    For Windows 10, version 1607 , in the **Windows Features** window, expand the **Device Lockdown** node, select or clear the checkbox for **Shell Launcher**, and then click **OK.**

4.  The **Windows Features** window indicates that Windows is searching for required files and displays a progress bar. Once found, the window indicates that Windows is applying the changes. When completed, the window indicates the requested changes are completed.
5.  Click **Close** to close the **Windows Features** window.

    **Note**  Turning on Shell Launcher does not require a device restart.

     

**Enable or disable Shell Launcher by calling WESL\_UserSetting**

1.  Enable or disable Shell Launcher by calling the WESL\_UserSetting.SetEnabled function in the Windows Management Instrumentation (WMI) class WESL\_UserSetting.
2.  If you enable or disable Shell Launcher using WESL\_UserSetting, the changes do not affect any sessions that are currently signed in; you must sign out and sign back in.

This example uses a Windows image called install.wim, but you can use the same procedure to apply a provisioning package (for more information on DISM, see [What Is Deployment Image Servicing and Management](https://technet.microsoft.com/en-us/library/dd744566.aspx)?):

**Enable Shell Launcher by using DISM**

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
    dism /image:c:\wim /enable-feature /all /featureName:Client-EmbeddedShellLauncher
    ```

6.  Commit the change.

    ```
    dism /unmount-wim /MountDir:c:\wim /Commit
    ```

## Configure Shell Launcher using Windows Imaging and Configuration Designer (ICD)


The Shell Launcher settings are also available as Windows provisioning settings so you can configure these settings to be applied during the image runtime. You can set one or all Shell Launcher settings by creating a provisioning package using Windows Imaging and Configuration Designer (ICD) and then applying the provisioning package during image deployment time or runtime. If Windows has not been installed and you are using Windows ICD to create installation media with settings for Shell Launcher included in the image or you are applying a provisioning package during setup, you must enable Shell Launcher on the installation media with DISM in order for a provisioning package to successfully apply.

Use the following steps to create a provisioning package that contains the ShellLauncher settings.

1.  Build a provisioning package in Windows ICD by following the instructions in [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107).
    **Note**  In the **Select Windows Edition** window, choose **Common to all Windows desktop editions**.

     

2.  In the Available customizations page, select **Runtime settings** &gt; **SMISettings** and then set the value for the following ShellLauncher settings.
    -   Shell = *yourapp* where the default is cmd.exe

3.  Once you have finished configuring the settings and building the provisioning package, you can apply the package to the image deployment time or runtime. See the To apply a provisioning package to a Windows 10 for desktop editions image section in [Build and apply a provisioning package](https://msdn.microsoft.com/library/windows/hardware/dn916107) for more information. Note that the process for applying the image to a Windows 10 Enterprise is the same.

## <a href="" id="launch-diff-shells"></a>Launch different shells for different user accounts


By default, Shell Launcher runs the default shell, which is specified when you create the OS image at design time. The default shell is set to Cmd.exe, but you can specify any executable file to be the default shell.

You can configure Shell Launcher to launch a different shell for specific users or groups if you do not want to run the default shell. For example, you might configure a device to run a custom application shell for guest accounts, but run the standard Windows Explorer shell for administrator accounts in order to service the device.

If you use the WMI providers to configure Shell Launcher for a user or group at run time, you must use the security identifier (SID) for that user or group; you cannot use the user name or group name.

For more information about common security identifiers, see [Well-known SIDs](http://go.microsoft.com/fwlink/p/?LinkId=241319).

When the current signed in account belongs to two or more groups that have different configurations defined for each group, Shell Launcher uses the first configuration it finds. The search order is not defined, so we recommend that you avoid assigning a user to multiple groups with different Shell Launcher configurations.

## Perform an action when the shell exits


When a custom shell exits, Shell Launcher can perform one of four actions, based on the following return codes:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Return code</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Restart the shell.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Restart the device.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Shut down the device.</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Do nothing.</p></td>
</tr>
</tbody>
</table>

 

**Important**  
Make sure that your shell application does not automatically exit and is not automatically closed by any features such as Dialog Filter, as this can lead to an infinite cycle of exiting and restarting, unless the return code action is set to do nothing.

 

### Default return code action

You can define a default return code action for Shell Launcher with the DefaultReturnCodeAction setting. If you do not change the initial value, the default return code action is set to 0 (zero), which indicates that Shell Launcher restarts the shell when the shell exits.

### Map the exit code to a Shell Launcher action

Shell Launcher can take a specific action based on the exit code returned by the shell. For any given exit code returned by the shell, you can configure the action that Shell Launcher takes by mapping that exit code to one of the shell exit actions.

If the exit code does not match a defined value, Shell Launcher performs the default return code action.

For example, your shell might return exit code values of -1, 0, or 255 depending on how the shell exits. You can configure Shell Launcher to restart the system (1) when the shell returns a value of -1, restart the shell (0) when the shell returns a value of 0, and shut down the system (2) when the shell returns a value of 255. Your custom return code action mapping would look like this:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Exit code</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>-1</p></td>
<td><p>1 (restart the system)</p></td>
</tr>
<tr class="even">
<td><p>0</p></td>
<td><p>0 (restart the app)</p></td>
</tr>
<tr class="odd">
<td><p>255</p></td>
<td><p>2 (shut down the system)</p></td>
</tr>
</tbody>
</table>

 

## Configure Shell Launcher


You can configure the following options for Shell Launcher:

-   Enable or disable Shell Launcher.

-   Specify a shell configuration for a specific user or group.

-   Remove a shell configuration for a specific user or group.

-   Change the default shell configuration.

-   Get information on a shell configuration for a specific user or group.

Any changes do not take effect until a user signs in.

You can use the Shell Launcher WMI providers directly in a PowerShell script or in an application to configure Shell Launcher.

## <a href="" id="custom-shell"></a>Set your custom shell


Modify the following PowerShell script as appropriate and run the script on the device.

```
# Check if shell launcher license is enabled
function Check-ShellLauncherLicenseEnabled
{
    [string]$source = @"
using System;
using System.Runtime.InteropServices;

static class CheckShellLauncherLicense
{
    const int S_OK = 0;

    public static bool IsShellLauncherLicenseEnabled()
    {
        int enabled = 0;

        if (NativeMethods.SLGetWindowsInformationDWORD("EmbeddedFeature-ShellLauncher-Enabled", out enabled) != S_OK) {
            enabled = 0;
        }
        
        return (enabled != 0);
    }

    static class NativeMethods
    {
        [DllImport("Slc.dll")]
        internal static extern int SLGetWindowsInformationDWORD([MarshalAs(UnmanagedType.LPWStr)]string valueName, out int value);
    }

}
"@

    $type = Add-Type -TypeDefinition $source -PassThru

    return $type[0]::IsShellLauncherLicenseEnabled()
}

[bool]$result = $false

$result = Check-ShellLauncherLicenseEnabled
"`nShell Launcher license enabled is set to " + $result
if (-not($result))
{
    "`nThis device doesn&#39;t have required license to use Shell Launcher"
    exit
}

$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Create a handle to the class instance so we can call the static methods.
try {
    $ShellLauncherClass = [wmiclass]"\\$COMPUTER\${NAMESPACE}:WESL_UserSetting"
    } catch [Exception] {
    write-host $_.Exception.Message; 
    write-host "Make sure Shell Launcher feature is enabled"
    exit
    }


# This well-known security identifier (SID) corresponds to the BUILTIN\Administrators group.

$Admins_SID = "S-1-5-32-544"

# Create a function to retrieve the SID for a user account on a machine.

function Get-UsernameSID($AccountName) {

    $NTUserObject = New-Object System.Security.Principal.NTAccount($AccountName)
    $NTUserSID = $NTUserObject.Translate([System.Security.Principal.SecurityIdentifier])

    return $NTUserSID.Value
    
}

# Get the SID for a user account named "Cashier". Rename "Cashier" to an existing account on your system to test this script.

$Cashier_SID = Get-UsernameSID("Cashier")

# Define actions to take when the shell program exits.

$restart_shell = 0
$restart_device = 1
$shutdown_device = 2

# Examples. You can change these examples to use the program that you want to use as the shell.

# This example sets the command prompt as the default shell, and restarts the device if the command prompt is closed. 

$ShellLauncherClass.SetDefaultShell("cmd.exe", $restart_device)

# Display the default shell to verify that it was added correctly.

$DefaultShellObject = $ShellLauncherClass.GetDefaultShell()

"`nDefault Shell is set to " + $DefaultShellObject.Shell + " and the default action is set to " + $DefaultShellObject.defaultaction

# Set Internet Explorer as the shell for "Cashier", and restart the machine if Internet Explorer is closed.

$ShellLauncherClass.SetCustomShell($Cashier_SID, "c:\program files\internet explorer\iexplore.exe www.microsoft.com", ($null), ($null), $restart_shell)

# Set Explorer as the shell for administrators.

$ShellLauncherClass.SetCustomShell($Admins_SID, "explorer.exe")

# View all the custom shells defined.

"`nCurrent settings for custom shells:"
Get-WmiObject -namespace $NAMESPACE -computer $COMPUTER -class WESL_UserSetting | Select Sid, Shell, DefaultAction

# Enable Shell Launcher

$ShellLauncherClass.SetEnabled($TRUE)

$IsShellLauncherEnabled = $ShellLauncherClass.IsEnabled()

"`nEnabled is set to " + $IsShellLauncherEnabled.Enabled

# Remove the new custom shells.

$ShellLauncherClass.RemoveCustomShell($Admins_SID)

$ShellLauncherClass.RemoveCustomShell($Cashier_SID)

# Disable Shell Launcher

$ShellLauncherClass.SetEnabled($FALSE)

$IsShellLauncherEnabled = $ShellLauncherClass.IsEnabled()

"`nEnabled is set to " + $IsShellLauncherEnabled.Enabled

```

## Remarks


A custom shell is launched with the same level of user rights as the account that is signed in. This means that a user with administrator rights can perform any system action that requires administrator rights, including launching other applications with administrator rights, while a user without administrator rights cannot.

**Warning**  
If your shell application requires administrator rights and needs to be elevated, and User Account Control (UAC) is present on your device, you must disable UAC in order for Shell Launcher to launch the shell application.

 

## Related topics


[Unbranded Boot](unbranded-boot.md)

[Custom Logon](custom-logon.md)

[Create a Kiosk Image](create-a-kiosk-image.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Shell%20Launcher%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





