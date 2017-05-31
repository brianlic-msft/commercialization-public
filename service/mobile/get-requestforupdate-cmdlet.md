---
author: kpacquer
Description: 'Get-RequestForUpdate cmdlet'
ms.assetid: f2b86f24-b5ff-4c9d-ac46-66898ad79e8c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Get-RequestForUpdate cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Get-RequestForUpdate cmdlet


Use the **Get-RequestForUpdate** cmdlet to retrieve the current status of a request for update.

This is the syntax for **Get-RequestForUpdate**.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
NAME
     Get-RequestForUpdate
SYNTAX
     Get-RequestForUpdate
      [-RequestForUpdateTicketId] <string> 
      [-ServiceUri <uri>]
      [-ServiceAccessControlNamespace <string>]
      [-CertificateStoreLocation <StoreLocation> {CurrentUser | LocalMachine}]
      [-CertificateStoreName <StoreName> {AddressBook | AuthRoot | CertificateAuthority
          | Disallowed | My | Root | TrustedPeople | TrustedPublisher}]
      [-ClientCertificateThumbprint <string>]
      [-EncryptionCertificateThumbprint <string>]
      [<CommonParameters>]
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


Typically, the only parameters specified to this cmdlet are **RequestForUpdateTicketId**.

## <span id="Output"></span><span id="output"></span><span id="OUTPUT"></span>Output


This cmdlet returns a Microsoft.Phone.PartnerServices.Cmdlets.RequestForUpdate object that contains the following fields.

<span id="Status"></span><span id="status"></span><span id="STATUS"></span>**Status**  
This is the progress of the RFU submission. The following are the members of the status field.

-   **ErrorCode**. This is the error code of the error that was encountered.

-   **ErrorMessage**. This contains the messaged related to the failed RFU submission.

-   **Status**. This contains the status state of the current RFU submission. The following list contains the status states.

    -   **InProcessOnTrack**. The RFU submission is currently in progress.

    -   **InProcessFailure**. The RFU submission completed with a failure; however, the user still has the option to retry.

    -   **CompletedFailure**. The RFU submission completed with a failure and the user chose not to retry.

    -   **CompletedSuccess**. The RFU submission is completed with no issues.

    -   **FailedToRetrieveStatus**. This means that the status calculation failed. The ErrorMessage in this case is “An error occurred while retrieve the RFU status. No action is required by the OEM. Microsoft will be investigating the issue that caused this.”

## <span id="Exceptions"></span><span id="exceptions"></span><span id="EXCEPTIONS"></span>Exceptions


The following exceptions are thrown for their corresponding error scenarios.

<span id="FaultException_ArgumentFaultDetail_"></span><span id="faultexception_argumentfaultdetail_"></span><span id="FAULTEXCEPTION_ARGUMENTFAULTDETAIL_"></span>**FaultException&lt;ArgumentFaultDetail&gt;**  
-   An invalid ticket ID was provided. The ticket ID was either null or empty.

<span id="FaultException_InvalidOperationFaultDetail_"></span><span id="faultexception_invalidoperationfaultdetail_"></span><span id="FAULTEXCEPTION_INVALIDOPERATIONFAULTDETAIL_"></span>**FaultException&lt;InvalidOperationFaultDetail&gt;**  
-   An invalid ticket ID was provided. The ticket ID is not defined in the service.

-   The authenticated user is not the owner of the firmware submission.

-   The ticket ID is a resubmission ticket.

## <span id="Scenarios"></span><span id="scenarios"></span><span id="SCENARIOS"></span>Scenarios


### <span id="Retrieve_the_status_of_a_successfully_processed_request_for_update"></span><span id="retrieve_the_status_of_a_successfully_processed_request_for_update"></span><span id="RETRIEVE_THE_STATUS_OF_A_SUCCESSFULLY_PROCESSED_REQUEST_FOR_UPDATE"></span>Retrieve the status of a successfully processed request for update

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   A request for update has been successfully submitted.

-   The request for update ticket number is available.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Retrieve the status of the update and store the result object in a PowerShell variable named $result:

``` syntax
PS> $result = Get-RequestForUpdate -RequestForUpdateTicketId TKT-SIGN-TEST-FO03ST-1
```

Show the result on the console:

``` syntax
PS> $result | Format-List

Ticket             : TKT-SIGN-TEST-FO03ST-1
RfuType            : Trial
IsApproved         : False
CreatedOn          : 7/18/2013 5:22:44 PM
ModifiedOn         : 7/18/2013 5:22:45 PM
FirmwareSubmission : Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
Pop                : Microsoft.Phone.PartnerServices.Rfu.Pop
Bundles            :
Attachments        :
Operations         : {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOpera
                     tion}
ExtensionData      : System.Runtime.Serialization.ExtensionDataObjectFile    
```

Show the resulted status on the console:

``` syntax
PS> $result.Status

## StatusErrorCodeErrorMessageExtensionData

InProcessOnTrack    System.Runtime.Serializati... 
```

### <span id="Attempt_to_retrieve_the_status_for_an_RFU_when_the_ticket_does_not_exist"></span><span id="attempt_to_retrieve_the_status_for_an_rfu_when_the_ticket_does_not_exist"></span><span id="ATTEMPT_TO_RETRIEVE_THE_STATUS_FOR_AN_RFU_WHEN_THE_TICKET_DOES_NOT_EXIST"></span>Attempt to retrieve the status for an RFU when the ticket does not exist

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   An OEM is attempting to retrieve an RFU ticket number that does not exist.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Attempt to retrieve the signed submission for a ticket that is still in process:

``` syntax
PS> $result = Get-RequestForUpdate –RequestForUpdateTicketId TKT-SIGN-TEST-NONONO
```

``` syntax
Get-RequestForUpdate : An error has ocurred.  The request could not be
processed because operation is not valid for current state of service.
Details: The specified RequestForUpdate ticket does not exist.
Reason: TicketDoesNotExist.
Correlation: 994c438c-a6e1-44eb-8f06-2cbfa6c097bb.
At line:1 char:11
+ $result = Get-RequestForUpdate -RequestForUpdateTicketId TKT-SIGN-TEST-NONONO
+           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Get-RequestForUpdate], Ti
   cketDoesNotExistException
    + FullyQualifiedErrorId : Microsoft.Phone.PartnerServices.Exceptions.Ticke
   tDoesNotExistException,Microsoft.Phone.PartnerServices.Cmdlets.GetRequestF
  orUpdateCommand            
```

## <span id="Help_documentation_from_PowerShell"></span><span id="help_documentation_from_powershell"></span><span id="HELP_DOCUMENTATION_FROM_POWERSHELL"></span>Help documentation from PowerShell


The following is the help documentation for the **Get-RequestForUpdate** cmdlet from Windows PowerShell.

``` syntax
PS C:\Windows\system32> get-help get-requestforupdate -full

NAME
    Get-RequestForUpdate

SYNOPSIS
    Gets the status of a current request for update.

SYNTAX
    Get-RequestForUpdate [-RequestForUpdateTicketId] <String> [-ServiceUri
    <Uri>] [-ServiceAccessControlNamespace <String>]
    [-CertificateStoreLocation <StoreLocation>] [-CertificateStoreName
    <StoreName>] [-ClientCertificateThumbprint <String>]
    [-EncryptionCertificateThumbprint <String>] [<CommonParameters>]


DESCRIPTION
    Gets the status of a current request for update. The request could be for
    a MicrosoftOemMixed or MicrosoftAKOnly update.


PARAMETERS
    -RequestForUpdateTicketId <String>
        The request for update ticket id.

        Required?                    true
        Position?                    2
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

        Provides detailed information of the request for update (RFU).



NOTES




    --------------  Example 1 --------------

    C:\PS>Get-RequestForUpdate -RequestForUpdateTicketId TKT-RFU-PROD-ABCD56-1


    Gets the status for a given RequestForUpdateTicketId



    Ticket             : TKT-RFU-PROD-ABCD56-1
                RfuType            : RetailServicing
                IsApproved         : False
                CreatedOn          : 6/29/2013 7:44:07 AM
                ModifiedOn         : 6/29/2013 7:44:08 AM
                FirmwareSubmission :
    Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
                Pop                : Microsoft.Phone.PartnerServices.Rfu.Pop
                Bundles            :
                Attachments        :
                Operations         :
    {Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOperation}
                ExtensionData      :
    System.Runtime.Serialization.ExtensionDataObject




RELATED LINKS



PS C:\Windows\system32>NAME
    Get-RequestForUpdate

SYNOPSIS
    Gets the status of a current request for update.

SYNTAX
    Get-RequestForUpdate [-RequestForUpdateTicketId] <String> 
    [-ServiceUri <Uri>] 
    [-CertificateStoreLocation <StoreLocation>] 
    [-CertificateStoreName <StoreName>] 
    [-ClientCertificateThumbprint <String>]
    [-EncryptionCertificateThumbprint <String>]
    [<CommonParameters>]

DESCRIPTION
    Gets the status of a current request for update.


PARAMETERS
    -RequestForUpdateTicketId <String>
        The request for update ticket id.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -ServiceUri <Uri>
        The service URI. The default value for this parameter is read from the configuration file. 

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -CertificateStoreLocation <StoreLocation>
        The certificate store location. The default value for this parameter is read from the configuration file.
        
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -CertificateStoreName <StoreName>
        The certificate store name. The default value for this parameter is read from the configuration file. 

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -ClientCertificateThumbprint <String>
        The client certificate thumbprint. The default value for this parameter is read from the configuration file.
        
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -EncryptionCertificateThumbprint <String>
        The encryption certificate thumbprint. The default value for this parameter is read from the configuration
        file. 
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, and OutVariable. For more information, see
        about_CommonParameters (http://go.microsoft.com/fwlink/p/?linkid=113216).

INPUTS



OUTPUTS
    RequestForUpdate

        Provides detailed information about the request for update (RFU).



NOTES




    --------------  Example 1 --------------

    C:\PS>Get-RequestForUpdate -RequestForUpdateTicketId TKT-RFU-PROD-ABCD56-1


    Gets the status for a given RequestForUpdateTicketId.



    Ticket             : TKT-RFU-PROD-ABCD56-1
    RfuType            : RetailServicing
    IsApproved         : False
    CreatedOn          : 6/29/2013 7:44:07 AM
    ModifiedOn         : 6/29/2013 7:44:08 AM
    FirmwareSubmission : Microsoft.Phone.PartnerServices.Rfu.FirmwareSubmission
    Pop                : Microsoft.Phone.PartnerServices.Rfu.Pop
    Bundles            :
    Attachments        :
    Operations         : 
{Microsoft.Phone.PartnerServices.Rfu.RequestForUpdateOperation}
    Status             : Microsoft.Phone.PartnerServices.Rfu.RfuStatusInfo
    ExtensionData      : System.Runtime.Serialization.ExtensionDataObject




RELATED LINKS
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** None

## <span id="related_topics"></span>Related topics


[Submit an update](submit-an-update.md)

 

 






