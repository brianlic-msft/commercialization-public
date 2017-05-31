---
author: kpacquer
Description: 'New-RequestForUpdate cmdlet'
ms.assetid: 8fef568e-4687-4862-ac7e-7a518ccbfe67
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'New-RequestForUpdate cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# New-RequestForUpdate cmdlet


Use **New-RequestForUpdate** to create a new request for update (RFU) based on a given update type and firmware submission ticket ID. The firmware submission must be signed successfully.

Before you can create an RFU, you’ll need to prepare the firmware submission, using [Initialize-FirmwareSubmission cmdlet](initialize-firmwaresubmission-cmdlet.md) with **TypeOfSubmission** set to **image**. For more info about the image submission process, see [Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223).

**Important**  
Submit separate RFUs for each Phone-Operator pairing. For example, if you have two phones on a specific Mobile Operator (MO), you will need to submit two RFUs. If you have a device on four different MOs, you will need to submit four RFUs.

 

This is the syntax for **New-RequestForUpdate**:

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
NAME
    New-RequestForUpdate
SYNTAX
    New-RequestForUpdate [-FirmwareSubmissionTicketId] <String>
    [-RequestForUpdateType] <RequestForUpdateType>
    [-SourceFirmwareSubmissionTicketId] <String>[[-OemDeviceName] <String>]
    [[-MOId] <String>]
    [-ServiceUri <Uri>]
    [-CertificateStoreLocation <StoreLocation>]
    [CertificateStoreName <StoreName>]
    [-ClientCertificateThumbprint <String>]
    [-EncryptionCertificateThumbprint <String>]
    [<CommonParameters>]
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


Typically, the only parameters that are specified for this cmdlet are **FirmwareSubmissionTicketId**, **RequestForUpdateType**, **SourceFirmwareSubmissionTicketId**, **OemDeviceName**, and **MOId**.

The **FirmwareSubmissionTicketId** property is the ID of the firmware submission ticket ID being associated with the new RFU.

The **RequestForUpdateType** must be set to one of these two values:

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
<td align="left"><p>Used by OEMs to make updates available over the air (OTA) to MOs for lab trials and technical acceptance. Updates in preview are published to the live production environment in accordance with published targets, after receiving the OEM approval (go live).</p></td>
</tr>
<tr class="even">
<td align="left"><p>Trial</p></td>
<td align="left"><p>Used by OEMs to test OTA updates and evaluate the quality of their RFUs prior to submitting a retail servicing submission. It's also used to test updates for commercializing new devices.</p>
<p>It is not intended for MO lab trials. Updates published here do not get published to Microsoft Update live production.</p></td>
</tr>
</tbody>
</table>

 

The **SourceFirmwareSubmissionTicketId** is the ticket ID of the firmware submission devices update from. This is only required if phones are updating to Windows Phone 8.1 or higher. To guard against publishing updates that could potentially cause update errors, the Windows Phone device update publishing service reserves the right to reject RFUs that do not include the **SourceFirmwareSubmissionTicketId** of the previous update. For more info on versioning, see [Update requirements](update-requirements.md).

The **OemDeviceName** is the name at which the request for update is being targeted. This is only required if device are updating to Windows Phone 8.1 or higher.

The **MOId** is the mobile operator at which the request for update is being targeted.

## <span id="Scenario__Create_a_new_RFU_for_use_in_retail_servicing"></span><span id="scenario__create_a_new_rfu_for_use_in_retail_servicing"></span><span id="SCENARIO__CREATE_A_NEW_RFU_FOR_USE_IN_RETAIL_SERVICING"></span>Scenario: Create a new RFU for use in retail servicing


### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   A firmware signing request has been successfully submitted.

-   The firmware signing request ticket number is available.

-   There is a desire to submit a new request for update for retail servicing.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Request a new update and store the result object in a Windows PowerShell variable named $result:

``` syntax
$result = New-RequestForUpdate -FirmwareSubmissionTicketId TKT-SIGN-PROD-ABCD56 –RequestForUpdateType RetailServicing -SourceFirmwareSubmissionTicketId TKT-SIGN-PROD-XYZ123 -OemDeviceName P4301 -MOId 000-22
```

Show the result on the console:

``` syntax
PS> $result | Format-List

Ticket             : TKT-SIGN-TEST-AB03ST-2
RfuType            : RetailServicing
IsApproved         : False
CreatedOn          : 7/18/2013 8:26:23 PM
ModifiedOn         : 7/18/2013 8:26:23 PM 
FirmwareSubmission : Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
Pop                : Microsoft.Phone.PartnerServices.Rfu.Pop
Bundles            :
Attachments        :
Operations         : {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOpera
                     tion}
ExtensionData      : System.Runtime.Serialization.ExtensionDataObjectFile      
```

## <span id="Scenario__Attempt_to_create_a_new_RFU_when_the_firmware_ticket_does_not_exist"></span><span id="scenario__attempt_to_create_a_new_rfu_when_the_firmware_ticket_does_not_exist"></span><span id="SCENARIO__ATTEMPT_TO_CREATE_A_NEW_RFU_WHEN_THE_FIRMWARE_TICKET_DOES_NOT_EXIST"></span>Scenario: Attempt to create a new RFU when the firmware ticket does not exist


### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   An OEM is attempting to retrieve an RFU ticket number that does not exist.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

``` syntax
$result = New-RequestForUpdate -FirmwareSubmissionTicketId TKT-SIGN-TEST-NONONO -RequestForUpdateType Trial -SourceFirmwareSubmissionTicketId TKT-SIGN-PROD-XYZ123 -OemDeviceName P4301 -MOId 000-22
```

``` syntax
New-RequestForUpdate : An error has ocurred.  The request could not be
processed because operation is not valid for current state of service.
Details: The specified FirmwareSubmission ticket does not exist.
Reason: TicketDoesNotExist.
Correlation: 05818963-a8f4-4d9f-9472-5257374549a9.
At line:1 char:11
+ $result = New-RequestForUpdate -FirmwareSubmissionTicketId
TKT-SIGN-TEST-NONONO  ...
```

## <span id="Help_documentation_from_PowerShell"></span><span id="help_documentation_from_powershell"></span><span id="HELP_DOCUMENTATION_FROM_POWERSHELL"></span>Help documentation from PowerShell


The following is the help documentation for the **New-RequestForUpdate** cmdlet from Windows PowerShell.

``` syntax
PS C:\Windows\system32> get-help New-RequestForUpdate -full

NAME
    New-RequestForUpdate

SYNOPSIS
    Creates a new request for update of OEM binaries only.

SYNTAX
    New-RequestForUpdate [-FirmwareSubmissionTicketId] <String>
    [-RequestForUpdateType] <RequestForUpdateType>
    [[-SourceFirmwareSubmissionTicketId] <String>] [[-OemDeviceName] <String>]
    [[-MOId] <String>] [-ServiceUri <Uri>] [-ServiceAccessControlNamespace
    <String>] [-CertificateStoreLocation <StoreLocation>]
    [-CertificateStoreName <StoreName>] [-ClientCertificateThumbprint
    <String>] [-EncryptionCertificateThumbprint <String>] [<CommonParameters>]


DESCRIPTION
    Creates a new request for update of OEM binaries, with a
    given update type and firmware submission ticket id. To create a Request
    For Update to Windows Phone 8.1 or higher, a source (ie. update "from")
    firmware submission ticket id is also required, along with the target
    mobile operator name, and target device name.


PARAMETERS
    -FirmwareSubmissionTicketId <String>
        Ticket id of the firmware submission phones update to.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -RequestForUpdateType <RequestForUpdateType>
        The type of update request.

        Required?                    true
        Position?                    3
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -SourceFirmwareSubmissionTicketId <String>
        Ticket id of the firmware submission phones update from. Only required
        if phones are updating to Windows Phone 8.1 or higher.

        Required?                    false
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

        Provides detailed information about the request for update (RFU).  The
        Ticket property is the ticket id for the actual RFU that should be
        recorded to allow for future communication about the RFU, for example
        through the command Get-RequestForUpdate which returns current status
        of the RFU.



    --------------  Example 1 --------------

    C:\PS>New-RequestForUpdate -FirmwareSubmissionTicketId
    TKT-SIGN-PROD-ABCD56 -RequestForUpdateType RetailServicing


    Creates a new request for update for retail servicing and links it to the
    firmware submission ticket id, TKT-SIGN-PROD-ABCD56.



    Ticket                   : TKT-RFU-PROD-ABCD56-1
                RfuType                  : RetailServicing
                IsApproved               : False
                CreatedOn                : 6/29/2013 7:44:07 AM
                ModifiedOn               : 6/29/2013 7:44:08 AM
                FirmwareSubmission       :
    Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
                SourceFirmwareSubmission :
                SourceOSVersion          :
                TargetOSVersion          :
                Pop                      :
    Microsoft.Phone.PartnerServices.Rfu.Pop
                Bundles                  :
                Attachments              :
                Operations               :
    {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOperation}
                ExtensionData            :
    System.Runtime.Serialization.ExtensionDataObject
                RfuPayloadType           : MicrosoftOemMixed



    --------------  Example 2 --------------

    C:\PS>New-RequestForUpdate -FirmwareSubmissionTicketId
    TKT-SIGN-PROD-ABCD56 -RequestForUpdateType RetailServicing
    -SourceFirmwareSubmissionTicketId TKT-SIGN-PROD-XYZ123 -OemDeviceName
    P4301 -MOId 000-22


    Creates a new request for update for retail servicing with source and
    target firmware submission ticket ids, meaning that the target OS version
    of the update is Windows Phone 8.1 or later.



    Ticket                   : TKT-RFU-PROD-ABCD56-1
                RfuType                  : RetailServicing
                IsApproved               : False
                CreatedOn                : 3/14/2014 7:44:07 AM
                ModifiedOn               : 3/14/2014 7:44:08 AM
                FirmwareSubmission       :
    Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
                SourceFirmwareSubmission :
    Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
                SourceOSVersion          : 8.10.12349.825
                TargetOSVersion          : 8.10.12359.845
                Pop                      :
    Microsoft.Phone.PartnerServices.Rfu.Pop
                Bundles                  :
                Attachments              :
                Operations               :
    {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOperation}
                ExtensionData            :
    System.Runtime.Serialization.ExtensionDataObject
                RfuPayloadType           : MicrosoftOemMixed

RELATED LINKS
PS C:\Windows\system32>
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** None

## <span id="related_topics"></span>Related topics


[Submit an update](submit-an-update.md)

[Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223)

[Request-UpdateCancellation](request-updatecancellation.md)

 

 

