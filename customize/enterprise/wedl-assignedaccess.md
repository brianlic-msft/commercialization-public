---
title: WEDL\_AssignedAccess
description: WEDL\_AssignedAccess
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2be8d294-db13-4494-bd5f-ba97ed89528e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WEDL\_AssignedAccess


This Windows Management Instrumentation (WMI) provider class configures settings for assigned access.

## Syntax


``` syntax
class WEDL_AssignedAccess {
    [Key] string UserSID;
    [Read, Write] string AppUserModelId;
    [Read] sint32 Status;
};
```

## Members


The following tables list any methods and properties that belong to this class.

### <a href="" id="mth"></a>Methods

This class contains no methods.

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
<td><p><strong>UserSID</strong></p></td>
<td><p>string</p></td>
<td><p>[key]</p></td>
<td><p>The security identifier (SID) for the user account that you want to use as the assigned access account.</p></td>
</tr>
<tr class="even">
<td><p><strong>AppUserModelId</strong></p></td>
<td><p>string</p></td>
<td><p>[read, write]</p></td>
<td><p>The Application User Model ID (AUMID) of the Windows app to launch for the assigned access account.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Status</strong></p></td>
<td><p>Boolean</p></td>
<td><p>none</p></td>
<td><p>Indicates the current status of the assigned access configuration:</p>
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
<td><p>A valid account is configured, but no Windows app is specified. Assigned access is not enabled.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Assigned access is enabled.</p></td>
</tr>
<tr class="odd">
<td><p>0x100</p></td>
<td><p>UserSID error: cannot find the account.</p></td>
</tr>
<tr class="even">
<td><p>0x103</p></td>
<td><p>UserSID error: the account profile does not exist.</p></td>
</tr>
<tr class="odd">
<td><p>0x200</p></td>
<td><p>AppUserModelID error: cannot find the Windows app.</p></td>
</tr>
<tr class="even">
<td><p>0x201</p></td>
<td><p>Task Scheduler error: Could not schedule task. Make sure that the Task Scheduler service is running.</p></td>
</tr>
<tr class="odd">
<td><p>0xffffffff</p></td>
<td><p>Unspecified error.</p></td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
</tbody>
</table>

 

### Remarks

Changes to assigned access do not affect any sessions that are currently signed in; you must sign out and sign back in.

## Example


The following Windows PowerShell script demonstrates how to use this class to set up an assigned access account.

``` syntax
#
#---Define variables---
#

$COMPUTER = "localhost"
$NAMESPACE = "root\standardcimv2\embedded"

# Define the assigned access account. 
# To use a different account, change $AssignedAccessAccount to a user account that is present on your device.

$AssignedAccessAccount = "KioskAccount"

# Define the Windows app to launch, in this example, use the Application Model User ID (AUMID) for Windows Calculator.
# To use a different Windows app, change $AppAUMID to the AUMID of the Windows app to launch.
# The Windows app must be installed for the account.

$AppAUMID = "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App"

#
#---Define helper functions---
#

function Get-UsernameSID($AccountName) {

# This function retrieves the SID for a user account on a machine.
# This function does not check to verify that the user account actually exists.

    $NTUserObject = New-Object System.Security.Principal.NTAccount($AccountName)
    $NTUserSID = $NTUserObject.Translate([System.Security.Principal.SecurityIdentifier])

    return $NTUserSID.Value
}

#
#---Set up the new assigned access account---
#

# Get the SID for the assigned access account.

$AssignedAccessUserSID = Get-UsernameSID($AssignedAccessAccount)

# Check to see if an assigned access account is already set up, and if so, clear it.

$AssignedAccessConfig = get-WMIObject -namespace $NAMESPACE -computer $COMPUTER -class WEDL_AssignedAccess

if ($AssignedAccessConfig) {

# Configuration already exists.  Delete it so that we can create a new one, since only one assigned access account can be set up at a time.

    $AssignedAccessConfig.delete();

}

# Configure assigned access to launch the specified Windows app for the specified account.

Set-WmiInstance -class WEDL_AssignedAccess -ComputerName $COMPUTER -Namespace $NAMESPACE -Arguments @{
        UserSID = $AssignedAccessUserSID;
        AppUserModelId = $AppAUMID
        } | Out-Null;
    
# Confirm that the settings were created properly.    
    
$AssignedAccessConfig = get-WMIObject -namespace $NAMESPACE -computer $COMPUTER -class WEDL_AssignedAccess

if ($AssignedAccessConfig) {
        
    "Set up assigned access for the " + $AssignedAccessAccount + " account."
    "  UserSID = " + $AssignedAccessConfig.UserSid
    "  AppModelId = " + $AssignedAccessConfig.AppUserModelId

} else {

    "Could not set up assigned access account."
}
 
```

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | Yes       |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[Assigned access](assigned-access.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20WEDL_AssignedAccess%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





