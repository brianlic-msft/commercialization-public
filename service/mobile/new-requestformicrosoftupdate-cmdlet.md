---
author: kpacquer
Description: 'New-RequestForMicrosoftUpdate cmdlet'
ms.assetid: be21b20d-a3bf-4b83-9633-211dcbeecdb3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'New-RequestForMicrosoftUpdate cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# New-RequestForMicrosoftUpdate cmdlet


Use the **New-RequestForMicrosoftUpdate** cmdlet to create a new request for update (RFU) that contains Microsoft AK-only binaries for a given product, CPU, update type, source and target Microsoft OS version numbers, along with the target mobile operator name, and target phone name.

Beginning with the release of Windows 10, OEMs can no longer submit OS-only updates for retail devices by using the New-RequestForMicrosoftUpdate cmdlet. OS-only updates for retail devices will be provided by Microsoft on Windows Update.

OEMs can continue to submit OS-only updates for Trial and PartnerSelfHost preview environments.

**Important**  
You need to submit an update for each Phone-Operator pairing. For example, if you have two phones on a specific Mobile Operator, you will need to submit two request for updates (RFU). If you have a phone on four different MOs, you will need to submit four RFUs.

 

This is the syntax for **New-RequestForMicrosoftUpdate**:

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
New-RequestForMicrosoftUpdate [-TypeOfCPU <string>] [-TypeOfProduct <string>] 
[-SourceOSVersion <String>] [-TargetOSVersion <String>] [-RequestForUpdateType <RequestForUpdateType>]
[-OemDeviceName <String>] [-MOId <String>] [-ServiceUri <Uri>] [-ServiceAccessControlNamespace <String>]
[-CertificateStoreLocation <StoreLocation>] [-CertificateStoreName <StoreName>]
[-ClientCertificateThumbprint <String>] [-EncryptionCertificateThumbprint <String>]
 [<CommonParameters>]
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


Typically, the only parameters that are specified for this cmdlet are **SourceOSVersion**, **TargetOSVersion**, **RequestForUpdateType**, **OemDeviceName**, and **MOId**.

The **SourceOSVersion** is the version of the previous update. This setting is recommended, and helps guard against publishing updates that could potentially cause update errors. The device update publishing service reserves the right to reject RFUs that do not include the SourceOSVersion of the previous update. For more info on versioning, see [Update requirements](update-requirements.md).

The **TargetOS** version is the version of the update being submitted.

The **RequestForUpdateType** must be set to one of the two values summarized here.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">RequestForUpdateType</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>RetailServicing</p></td>
<td align="left"><p>OEM BSP updates are intended to service in-market devices. These updates are delivered as part of the planned OEM update cadence (A4, A5, A6, etc.).</p></td>
</tr>
<tr class="even">
<td align="left"><p>Trial</p></td>
<td align="left"><p>Trial updates are used with both Mobile Operator OTA Trials and OEM Engineering Trials.</p>
<ul>
<li><p>Mobile Operator OTA Trials – OEM BSP updates are intended to allow MOs to achieve new device commercialization.</p></li>
<li><p>OEM Engineering Trials – OEM R&amp;D trials are intended to enable OEMs to test the updateability of device image candidates.</p></li>
</ul></td>
</tr>
</tbody>
</table>

 

The **OemDeviceName** is the name at which the request for update is being targeted. This is only required if devices are updating to Windows Phone 8.1 or higher.

The **MOId** is the mobile operator at which the request for update is being targeted.

## <span id="Scenarios"></span><span id="scenarios"></span><span id="SCENARIOS"></span>Scenarios


### <span id="Create_a_new_RFU_for_use_in_trials"></span><span id="create_a_new_rfu_for_use_in_trials"></span><span id="CREATE_A_NEW_RFU_FOR_USE_IN_TRIALS"></span>Create a new RFU for use in trials

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   There is a desire to submit a new request for update for trials, for example, for OEM R&D.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Request a new update and store the result object in a Windows PowerShell variable named $result:

``` syntax
$result = New-RequestForMicrosoftUpdate -SourceOSVersion 8.10.12349.825 -TargetOSVersion 8.10.12359.845 -RequestForUpdateType Trial -OemDeviceName P4301 -MOId 000-22
```

Show the result on the console:

``` syntax
PS> $result | Format-List

Ticket                   : TKT-RFU-PROD-PQRST-1
RfuType                  : Trial
IsApproved               : False
CreatedOn                : 5/2/2014 5:42:51 PM
ModifiedOn               : 5/2/2014 5:42:52 PM
FirmwareSubmission       :
SourceFirmwareSubmission :
SourceOSVersion          : 8.10.12349.825
TargetOSVersion          : 8.10.12359.845
Pop                      : Microsoft.Phone.PartnerServices.Rfu.Pop
Bundles                  :
Attachments              :
Operations               : {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOperation}
Status                   : Microsoft.Phone.PartnerServices.Rfu.RfuStatusInfo
RfuPayloadType           : MicrosoftAKOnly
ExtensionData            : System.Runtime.Serialization.ExtensionDataObject
      
```

### <span id="Help_documentation_from_Windows_PowerShell"></span><span id="help_documentation_from_windows_powershell"></span><span id="HELP_DOCUMENTATION_FROM_WINDOWS_POWERSHELL"></span>Help documentation from Windows PowerShell

The following is the help documentation for the **New-RequestForMicrosoftUpdate** cmdlet from Windows PowerShell.

``` syntax
PS C:\Windows\system32> get-help New-RequestForMicrosoftUpdate -full

NAME
    New-RequestForMicrosoftUpdate

SYNOPSIS
    Creates a new request for update of Microsoft AK-only binaries.

SYNTAX
    New-RequestForMicrosoftUpdate [-TypeOfCPU <string>] [-TypeOfProduct <string>] 
[-SourceOSVersion <String>] [-TargetOSVersion <String>] [-RequestForUpdateType <RequestForUpdateType>]
[-OemDeviceName <String>] [-MOId <String>] [-ServiceUri <Uri>] [-ServiceAccessControlNamespace <String>]
[-CertificateStoreLocation <StoreLocation>] [-CertificateStoreName <StoreName>]
[-ClientCertificateThumbprint <String>] [-EncryptionCertificateThumbprint <String>]
 [<CommonParameters>]

DESCRIPTION
    Creates a new request for update of Microsoft AK-only binaries with a
    given update type, source and target Microsoft OS version numbers, along
    with the target mobile operator name, and target device name.


PARAMETERS
    -TypeOfProduct <String>
        The product targeted for the update.The product must be one of WindowsPhoneThreshold, WindowsHolographicThreshold, or WindowsPhoneBlue.

        **Note** For all Windows 10 submissions, use WindowsPhoneThreshold.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -TypeOfCPU <String>
        The CPU of the product targeted for the update.The CPU must be one of ARM, x86.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -SourceOSVersion <String>
        Microsoft AK OS version the phone updates from.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -TargetOSVersion <String>
        Microsoft AK OS version the phone updates to.

        Required?                    true
        Position?                    3
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -RequestForUpdateType <RequestForUpdateType>
        The type of update request.

        Required?                    true
        Position?                    4
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -OemDeviceName <String>
        Device name at which the Request for Update is being targeted. Only
        required if phones are updating to Windows Phone 8.1 or higher.

        Required?                    false
        Position?                    5
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -MOId <String>
        Mobile operator ID at which the Request for Update is being targeted.
        Only required if phones are updating to Windows Phone 8.1 or higher.

        Required?                    false
        Position?                    6
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -ServiceUri <Uri>
        The service URI. The default value for this parameter is read from the
        configuration file.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -ServiceAccessControlNamespace <String>
        The namespace for Partner Services Access Control. The default value
        for this parameter is read from the configuration file. Should only be
        modified if instructed by the system administrator or Microsoft.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -CertificateStoreLocation <StoreLocation>
        The certificate store location. The default value for this parameter
        is read from the configuration file.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -CertificateStoreName <StoreName>
        The certificate store name. The default value for this parameter is
        read from the configuration file.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -ClientCertificateThumbprint <String>
        The client certificate thumbprint. The default value for this
        parameter is read from the configuration file.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -EncryptionCertificateThumbprint <String>
        The encryption certificate thumbprint. The default value for this
        parameter is read from the configuration file.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information,
    see
        about_CommonParameters
    (http://go.microsoft.com/fwlink/p/?linkid=113216).

INPUTS


OUTPUTS
    RequestForUpdate

        Provides detailed information about the request for update (RFU) of
        Microsoft AK-only binaries.  The Ticket property is the ticket id for
        the actual RFU that should be recorded to allow for future
        communication about the RFU, for example through the command
        Get-RequestForUpdate which returns current status of the RFU.



    --------------  Example 1 --------------

    C:\PS>New-RequestForMicrosoftUpdate -SourceOSVersion 8.10.12349.825
    -TargetOSVersion 8.10.12359.845 -RequestForUpdateType Trial -OemDeviceName
    P4301 -MOId 000-22


    Creates a new request for update for retail servicing with source and
    target firmware submission ticket ids, meaning that the target OS version
    of the update is Windows Phone 8.1 or later.



    Ticket                   : TKT-RFU-PROD-PQRST-1
                RfuType                  : Trial
                IsApproved               : False
                CreatedOn                : 5/2/2014 5:42:51 PM
                ModifiedOn               : 5/2/2014 5:42:52 PM
                FirmwareSubmission       :
                SourceFirmwareSubmission :
                SourceOSVersion          : 8.10.12349.825
                TargetOSVersion          : 8.10.12359.845
                Pop                      :
    Microsoft.Phone.PartnerServices.Rfu.Pop
                Bundles                  :
                Attachments              :
                Operations               :
    {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOperation}
                Status                   :
    Microsoft.Phone.PartnerServices.Rfu.RfuStatusInfo
                RfuPayloadType           : MicrosoftAKOnly
                ExtensionData            :
    System.Runtime.Serialization.ExtensionDataObject

RELATED LINKS

PS C:\Windows\system32>
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** None

## <span id="related_topics"></span>Related topics


[Submit an update](submit-an-update.md)

[Request-UpdateCancellation](request-updatecancellation.md)

 

 