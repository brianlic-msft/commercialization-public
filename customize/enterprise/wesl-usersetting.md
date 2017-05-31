---
title: WESL\_UserSetting
description: WESL\_UserSetting
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 73c5bb46-bf9e-4657-a5ae-88dbd14b79e8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WESL\_UserSetting


This class configures which application Shell Launcher starts based on the security identifier (SID) of the signed in user, and also configures the set of return codes and return actions that Shell Launcher performs when the application exits.

## Syntax


``` syntax
class WESL_UserSetting {
    [read, write, Required] string Sid;
    [read, write, Required] string Shell;
    [read, write]  Sint32 CustomReturnCodes[];
    [read, write]  Sint32 CustomReturnCodesAction[];
    [read, write] sint32 DefaultAction;

    [Static] uint32 SetCustomShell(
        [In, Required] string Sid,
        [In, Required] string Shell,
        [In] sint32 CustomReturnCodes[],
        [In] sint32 CustomReturnCodesAction[],
        [In] sint32 DefaultAction
    );
    [Static] uint32 GetCustomShell(
        [In, Required] string Sid,
        [Out, Required] string Shell,
        [Out, Required] sint32 CustomReturnCodes[],
        [Out, Required] sint32 CustomReturnCodesAction[],
        [Out, Required] sint32 DefaultAction
    );
    [Static] uint32 RemoveCustomShell(
        [In, Required] string Sid
    );
    [Static] uint32 GetDefaultShell(
        [Out, Required] string Shell,
        [Out, Required] sint32 DefaultAction
    );
    [Static] uint32 SetDefaultShell(
        [In, Required] string Shell,
        [In, Required] sint32 DefaultAction
    );
    [Static] uint32 IsEnabled(
        [Out, Required] boolean Enabled
    );
    [Static] uint32 SetEnabled(
        [In, Required] boolean Enabled);
    );
};
```

## Members


The following tables list any methods and properties that belong to this class.

### <a href="" id="mth"></a>Methods

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Methods</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[WESL_UserSetting.SetCustomShell](wesl-usersettingsetcustomshell.md)</p></td>
<td><p>Configures Shell Launcher for a specific user or group, based on SID.</p></td>
</tr>
<tr class="even">
<td><p>[WESL_UserSetting.GetCustomShell](wesl-usersettinggetcustomshell.md)</p></td>
<td><p>Retrieves the Shell Launcher configuration for a specific user or group, based on the SID.</p></td>
</tr>
<tr class="odd">
<td><p>[WESL_UserSetting.RemoveCustomShell](wesl-usersettingremovecustomshell.md)</p></td>
<td><p>Removes a Shell Launcher configuration for a specific user or group, based on the SID.</p></td>
</tr>
<tr class="even">
<td><p>[WESL_UserSetting.GetDefaultShell](wesl-usersettinggetdefaultshell.md)</p></td>
<td><p>Retrieves the default Shell Launcher configuration.</p></td>
</tr>
<tr class="odd">
<td><p>[WESL_UserSetting.SetDefaultShell](wesl-usersettingsetdefaultshell.md)</p></td>
<td><p>Sets the default Shell Launcher configuration.</p></td>
</tr>
<tr class="even">
<td><p>[WESL_UserSetting.IsEnabled](wesl-usersettingisenabled.md)</p></td>
<td><p>Retrieves a value that indicates if Shell Launcher is enabled or disabled.</p></td>
</tr>
<tr class="odd">
<td><p>[WESL_UserSetting.SetEnabled](wesl-usersettingsetenabled.md)</p></td>
<td><p>Enables or disables Shell Launcher.</p></td>
</tr>
</tbody>
</table>

 

### <a href="" id="pro"></a>Properties

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Property</th>
<th>Data type</th>
<th>Qualifiers</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Sid</strong></p></td>
<td><p>string</p></td>
<td><p>[read, write, required]</p></td>
<td><p>User or group SID.</p></td>
</tr>
<tr class="even">
<td><p><strong>shell</strong></p></td>
<td><p>string</p></td>
<td><p>[read, write, required]</p></td>
<td><p>The application to start as the shell.</p>
<p>The <strong>shell</strong> property can be a filename in the <em>Path</em> environment variable, or it can contain a fully qualified path to the application. You can also use environment variables in the path.</p>
<p>Any spaces in the <strong>shell</strong> property must be part of a quote-delimited string.</p></td>
</tr>
<tr class="odd">
<td><p><strong>CustomReturnCodes</strong></p></td>
<td><p>Sint32[]</p></td>
<td><p>[read, write]</p></td>
<td><p>An array of custom return codes that can be returned by the shell.</p></td>
</tr>
<tr class="even">
<td><p><strong>CustomReturnCodesAction</strong></p></td>
<td><p>Sint32[]</p></td>
<td><p>[read, write]</p></td>
<td><p>An array of custom return code actions that determine what action Shell Launcher takes when the shell exits. The custom actions map to the array of <strong>CustomReturnCodes</strong>.</p>
<p>The possible actions are defined in the following table:</p>
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
<td><p>Restarts the shell.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Restarts the device.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Shuts down the device.</p></td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
<tr class="odd">
<td><p><strong>DefaultAction</strong></p></td>
<td><p>Sint32</p></td>
<td><p>[read, write]</p></td>
<td><p>The default action Shell Launcher takes when the shell exits.</p>
<p>The possible actions are defined in the following table:</p>
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
<td><p>Restarts the shell.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Restarts the device.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Shuts down the device.</p></td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
</tbody>
</table>

 

### Remarks

Only one **WESL\_UserSetting** instance exists on a device with Shell Launcher.

Shell Launcher uses the custom configuration defined for the SID of the user currently signed in, if one exists. Otherwise, Shell Launcher uses a custom configuration defined for a group SID that the user is a member of, if any exist. If multiple group custom configurations for the user exist, Shell Launcher uses the first valid configuration it finds. The search order is not defined.

If there is no custom configuration for the user’s SID or any group SIDs that the user is a member of, Shell Launcher uses the default configuration.

You can find the SID for a user and any groups that the user is a member of by using the [whoami](http://go.microsoft.com/fwlink/p/?LinkId=235063) command-line tool.

## Example


The following Windows PowerShell script demonstrates how to add and remove custom shell configurations for Shell Launcher by using the Windows Management Instrumentation (WMI) providers for Shell Launcher.

``` syntax
$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Create a handle to the class instance so we can call the static methods.
$ShellLauncherClass = [wmiclass]"\\$COMPUTER\${NAMESPACE}:WESL_UserSetting"


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

# Examples

# Set the command prompt as the default shell, and restart the device if it's closed.

$ShellLauncherClass.SetDefaultShell("cmd.exe", $restart_device)

# Display the default shell to verify that it was added correctly.

$DefaultShellObject = $ShellLauncherClass.GetDefaultShell()

"`nDefault Shell is set to " + $DefaultShellObject.Shell + " and the default action is set to " + $DefaultShellObject.defaultaction

# Set Internet Explorer as the shell for "Cashier", and restart the machine if it's closed.

$ShellLauncherClass.SetCustomShell($Cashier_SID, "c:\program files\internet explorer\iexplore.ext www.microsoft.com", ($null), ($null), $restart_shell)

# Set Explorer as the shell for administrators.

$ShellLauncherClass.SetCustomShell($Admins_SID, "explorer.exe")

# View all the custom shells defined.

"`nCurrent settings for custom shells:"
Get-WmiObject -namespace $NAMESPACE -computer $COMPUTER -class WESL_UserSetting | Select Sid, Shell, DefaultAction

# Remove the new custom shells.

$ShellLauncherClass.RemoveCustomShell($Admins_SID)

$ShellLauncherClass.RemoveCustomShell($Cashier_SID)
```

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[Shell Launcher](shell-launcher.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WESL_UserSetting%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





