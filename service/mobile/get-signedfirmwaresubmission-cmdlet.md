---
author: kpacquer
Description: 'Get-SignedFirmwareSubmission cmdlet'
ms.assetid: 911d3704-0508-4aae-8236-59cfd380867b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Get-SignedFirmwareSubmission cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Get-SignedFirmwareSubmission cmdlet


The code-signed firmware can be retrieved after a successful submission to Microsoft. If the submission is successful, the OEM receives a ticket number. Use the **Get-SignedFirmwareSubmission** cmdlet to retrieve the signed submission for the code sign ticket number.

The following is the syntax for the **Get-SignedFirmwareSubmission** cmdlet.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
NAME
     Get-SignedFirmwareSubmission
SYNTAX
     Get-SignedFirmwareSubmission
      [-TicketId] <string>
      [[-DownloadDirectory] <string>]
      [-ServiceUri <uri>]
      [-CertificateStoreLocation <StoreLocation> {CurrentUser | LocalMachine}]
      [-CertificateStoreName <StoreName> {AddressBook | AuthRoot | CertificateAuthority
         | Disallowed | My | Root | TrustedPeople | TrustedPublisher}]
      [-ClientCertificateThumbprint <string>]
      [-EncryptionCertificateThumbprint <string>]
      [<CommonParameters>]
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


Typically, the only parameters that are specified for this cmdlet are **TicketId** and **DownloadDirectory**.

The cmdlet obtains the default values for the rest of the parameters from a configuration file. By default, this configuration file is placed by the installer at: %ProgramFiles(x86)%\\Microsoft\\WP Ingestion Client\\Modules\\Microsoft.Phone.PartnerServices.Client\\ Microsoft.Phone.PartnerServices.Client.dll.config

An example config file is provided in the Config file section of this document.

If any of the non-required parameters are explicitly specified on the command line, those values override the default values that are stored in the configuration file.

To support Windows PowerShell automation scripts, the cmdlet returns an object of type `Microsoft.Phone.PartnerServices.SignedFirmwareSubmission`:

``` syntax
TypeName: Microsoft.Phone.PartnerServices.SignedFirmwareSubmission

Name        MemberType Definition
----        ---------- ----------
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()
GetType     Method     type GetType()
ToString    Method     string ToString()
File        Property   System.IO.FileInfo File {get;set;}
FirmwareSubmissionTicketId    Property   string TicketId {get;set;}
```

This object can be processed using Windows PowerShell or displayed on the command line. The following sections show common usage scenarios and common error cases for retrieving signed submissions.

**Note**  
Many of these commands are shown here as multiple lines, but must be entered as a single line in Windows PowerShell.

 

## <span id="Exceptions"></span><span id="exceptions"></span><span id="EXCEPTIONS"></span>Exceptions


The following exceptions are thrown for their corresponding error scenarios.

<span id="FaultException_ArgumentFaultDetail_"></span><span id="faultexception_argumentfaultdetail_"></span><span id="FAULTEXCEPTION_ARGUMENTFAULTDETAIL_"></span>**FaultException&lt;ArgumentFaultDetail&gt;**  
-   An invalid ticket ID was provided. The ticket ID was either null or empty.

<span id="FaultException_InvalidOperationFaultDetail_"></span><span id="faultexception_invalidoperationfaultdetail_"></span><span id="FAULTEXCEPTION_INVALIDOPERATIONFAULTDETAIL_"></span>**FaultException&lt;InvalidOperationFaultDetail&gt;**  
-   An invalid ticket ID was provided.

-   The ticket ID is not defined in the service.

-   The authenticated user is not the owner of the firmware submission.

-   The ticket ID is a resubmission ticket.

-   Code signing is still in progress.

-   Code signing is pending manual intervention from Microsoft. No OEM action required.

-   Code signing has failed.

## <span id="Scenarios"></span><span id="scenarios"></span><span id="SCENARIOS"></span>Scenarios


### <span id="Retrieve_a_successfully_signed_submission"></span><span id="retrieve_a_successfully_signed_submission"></span><span id="RETRIEVE_A_SUCCESSFULLY_SIGNED_SUBMISSION"></span>Retrieve a successfully signed submission

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   A firmware request has been successfully submitted for code signing.

-   The submission ticket that is returned by the firmware request is available.

-   A SUCCESS email notification that indicates that the firmware submission has been successfully signed has been received by the OEM.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Retrieve the signed submission for a ticket and store the result object in a Windows PowerShell variable:

``` syntax
PS> $result = Get-SignedFirmwareSubmission –FirmwareSubmissionTicketId TKT-SIGN-TEST-BTUADL 
-DownloadDirectory C:\temp
```

Show the result on the console:

``` syntax
PS> $result | Format-List

TicketId : TKT-SIGN-TEST-BTUADL
File     : c:\temp\OemTest.TKT-SIGN-TEST-BTUADL.zip
```

### <span id="Attempt_to_retrieve_a_signed_firmware_submission_before_completion"></span><span id="attempt_to_retrieve_a_signed_firmware_submission_before_completion"></span><span id="ATTEMPT_TO_RETRIEVE_A_SIGNED_FIRMWARE_SUBMISSION_BEFORE_COMPLETION"></span>Attempt to retrieve a signed firmware submission before completion

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   A firmware request has been successfully submitted for code signing.

-   The submission ticket that is returned by the firmware request is available.

-   The firmware code signing process is still in progress. That is, the ticket has been issued, but a SUCCESS email has not been received.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Attempt to retrieve the signed submission for a ticket that is still in process:

``` syntax
PS> Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId TKT-SIGN-TEST-XD252Y 
-DownloadDirectory c:\temp
```

``` syntax
Get-SignedFirmwareSubmission : An error has occurred.  The request could not be processed because the operation is not
valid for the current state of service.
Details: Unable to retrieve the specified firmware submission. Reason: Code signing is still in progress.
Reason: FirmwareSubmissionIsInProgress.
Correlation: 4ab98c1a-df9c-40a9-ac6a-f9b1e9d42e87.
At line:1 char:1
+ Get-SignedFirmwareSubmission TKT-SIGN-TEST-06TV0O c:\temp -Verbose
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Get-SignedFirmwareSubmission], FirmwareSubmissionInProgressExcept
   ion
    + FullyQualifiedErrorId : Microsoft.Phone.PartnerServices.Exceptions.FirmwareSubmissionInProgressException,Microso
   ft.Phone.PartnerServices.Cmdlets.GetSignedFirmwareSubmissionCommand            
```

This state is indicated by the returned reason, “Code signing is still in progress”.

If a custom PowerShell script is being used, it can be programmed to catch an exception (Microsoft.Phone.PartnerServices.Exceptions.FirmwareSubmissionInProgressException). That exception can be examined to determine if the submission has completed. The following code sample illustrates how to extract the error information from the returned result object.

``` syntax
      $result = ''
        try {
            $result = Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId "TKT-SIGN-TEST-17Y8M5" -DownloadDirectory c:\MyFirmwareSubmissions
        }
        catch [Microsoft.Phone.PartnerServices.Exceptions.FirmwareSubmissionInProgressException] {
            write-host "Error Message" + $_.Exception.Message
            write-host "Error Detail" + $_.Exception.Detail
            
            #exit or take other action since we've detected a failure
            exit 1
        } 
```

A loop can be constructed to wait (for at least 30 minutes) and then try again to determine if the submission has completed. You are strongly advised that such a polling style must not be invoked with intervals of less than 30 minutes to avoid overwhelming the update server.

### <span id="Attempt_to_retrieve_a_signed_firmware_submission_when_the_request_has_failed"></span><span id="attempt_to_retrieve_a_signed_firmware_submission_when_the_request_has_failed"></span><span id="ATTEMPT_TO_RETRIEVE_A_SIGNED_FIRMWARE_SUBMISSION_WHEN_THE_REQUEST_HAS_FAILED"></span>Attempt to retrieve a signed firmware submission when the request has failed

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   A firmware request has been successfully submitted for code signing.

-   The submission ticket that is returned by the firmware request is available.

-   The firmware code signing process has failed permanently. That is, a FAILURE email notification has been received by the OEM for the ticket.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Attempt to retrieve the signed submission for a ticket that has failed permanently:

``` syntax
PS> Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId TKT-SIGN-TEST-TUKJGG -DownloadDirectory c:\temp
```

``` syntax
Get-SignedFirmwareSubmission : An error has occurred.  The request could not be
processed because the operation is not valid for the current state of service.
Details: Unable to retrieve the specified firmware submission. Reason: Code
signing has failed.
Reason: FirmwareSubmissionHasFailed.
Correlation: 67a645af-19b7-468d-9f7a-4a3fd341a15e.
At line:1 char:11
+ $result = Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId
TKT-SIGN-TEST ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~
    + CategoryInfo          : InvalidOperation: (:) [Get-SignedFirmwareSubmiss
   ion], FirmwareSubmissionFailedException
    + FullyQualifiedErrorId : Microsoft.Phone.PartnerServices.Exceptions.Firmw
   areSubmissionFailedException,Microsoft.Phone.PartnerServices.Cmdlets.GetSi
  gnedFirmwareSubmissionCommand
```

### <span id="Attempt_to_retrieve_a_signed_firmware_submission_when_the_ticket_does_not_exist"></span><span id="attempt_to_retrieve_a_signed_firmware_submission_when_the_ticket_does_not_exist"></span><span id="ATTEMPT_TO_RETRIEVE_A_SIGNED_FIRMWARE_SUBMISSION_WHEN_THE_TICKET_DOES_NOT_EXIST"></span>Attempt to retrieve a signed firmware submission when the ticket does not exist

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   An OEM is attempting to retrieve a ticket number that does not exist.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

``` syntax
PS> Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId bad_ticket_number -DownloadDirectory c:\temp
```

``` syntax
Get-SignedFirmwareSubmission : An error has ocurred.  The request could not be
processed because the operation is not valid for the current state of service.
Details: The specified FirmwareSubmission ticket does not exist.
Reason: TicketDoesNotExist.
Correlation: fd8bb041-fe0f-46ea-9b89-ccf91a57178c.
At line:1 char:11
+ $result = Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId
TKT-SIGN-TEST ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~
    + CategoryInfo          : InvalidOperation: (:) [Get-SignedFirmwareSubmiss
   ion], TicketDoesNotExistException
    + FullyQualifiedErrorId : Microsoft.Phone.PartnerServices.Exceptions.Ticke
   tDoesNotExistException,Microsoft.Phone.PartnerServices.Cmdlets.GetSignedFi
  rmwareSubmissionCommand
```

## <span id="Help_documentation_from_PowerShell"></span><span id="help_documentation_from_powershell"></span><span id="HELP_DOCUMENTATION_FROM_POWERSHELL"></span>Help documentation from PowerShell


The following is the help documentation for the **Get-SignedFirmwareSubmission** cmdlet from Windows PowerShell.

``` syntax
NAME
    Get-SignedFirmwareSubmission

SYNOPSIS
    Gets a signed firmware submission for a given firmware submission ticket.

SYNTAX
    Get-SignedFirmwareSubmission [-FirmwareSubmissionTicketId] <String>
    [[-DownloadDirectory] <String>] [-ServiceUri <Uri>]
    [-ServiceAccessControlNamespace <String>] [-CertificateStoreLocation
    <StoreLocation>] [-CertificateStoreName <StoreName>]
    [-ClientCertificateThumbprint <String>] [-EncryptionCertificateThumbprint
    <String>] [<CommonParameters>]


DESCRIPTION
    Downloads a signed firmware submission for a given ticket id.

            The download can only be performed after a new firmware submission
    has been created and uploaded with the OemSubmit tool or WP Ingestion
    Client and the uploaded files have been signed by Microsoft. Otherwise it
    will throw an error.


PARAMETERS
    -FirmwareSubmissionTicketId <String>
        Firmware-Submission ticket. Must be a valid ticket.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -DownloadDirectory <String>
        The download directory for the signed firmware-submission. Must be a
        full path to the download directory.

                    A default value can be defined in the configuration file.

        Required?                    false
        Position?                    3
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
        parameter is read from the configuration file. Should only be modified
        if instructed by the system administrator or Microsoft

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
    SignedFirmwareSubmission

        Contains information about the downloaded file and the firmware
        submission ticket related to the signing.

NOTES
    --------------  Example 1 --------------

    C:\PS>Get-SignedFirmwareSubmission -FirmwareSubmissionTicketId
    TKT-SIGN-PROD-ABCDEF -DownloadDirectory
    C:\SignedFirmwareSubmissionDownloads | Format-List


    Successful download of a signed firmware-submission read for download.

                The ticket id is TKT-SIGN-PROD-ABCDEF and the zip-file is
    downloaded to directory C:\SignedFirmwareSubmissionDownloads.



    FirmwareSubmissionTicketId : TKT-SIGN-PROD-ABCDEF
                File     :
    c:\SignedFirmwareSubmissionDownloads\OemTest.TKT-SIGN-PROD-ABCDEF.zip

RELATED LINKS
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** None

## <span id="related_topics"></span>Related topics


[Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223)

 

 






