---
author: kpacquer
Description: 'New-FirmwareSubmission cmdlet'
ms.assetid: f2a9e48c-a046-466b-8cfb-661e3bae88a8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'New-FirmwareSubmission cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# New-FirmwareSubmission cmdlet


Use the **New-FirmwareSubmission** cmdlet to create a new firmware submission and upload the zip file that contains the payload.

This is the syntax for **New-FirmwareSubmission**:

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
NAME
    New-FirmwareSubmission
SYNOPSIS
    Creates a new firmware submission.
SYNTAX
    New-FirmwareSubmission [-Path] <String>
    [-ServiceUri <Uri>]
    [-CertificateStoreLocation <StoreLocation>]
    [-CertificateStoreName <StoreName>]
    [-ClientCertificateThumbprint <String>]
    [-EncryptionCertificateThumbprint <String>]
    [<CommonParameters>]
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


Typically, the only parameter that is specified in this cmdlet is the path to the prepared submission zip file.

## <span id="Scenarios"></span><span id="scenarios"></span><span id="SCENARIOS"></span>Scenarios


### <span id="Create_a_new_firmware_submission"></span><span id="create_a_new_firmware_submission"></span><span id="CREATE_A_NEW_FIRMWARE_SUBMISSION"></span>Create a new firmware submission

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   Create a zip file with the firmware payload. For more info, see [Initialize-FirmwareSubmission cmdlet](initialize-firmwaresubmission-cmdlet.md).

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Request a new firmware submission and store the result object in a PowerShell variable named $result:

``` syntax
PS> $result=New-FirmwareSubmission -path C:\Data1\TESTOEM1-MS.TKT-SIGN-TEST-M3ZABC.zip
```

Display the result on the console:

``` syntax
PS> $result | Format-List

FirmwareSubmissionTicketId : TKT-SIGN-TEST-761234    
```

### <span id="Attempt_to_create_a_new_firmware_submission_with_a_missing_file"></span><span id="attempt_to_create_a_new_firmware_submission_with_a_missing_file"></span><span id="ATTEMPT_TO_CREATE_A_NEW_FIRMWARE_SUBMISSION_WITH_A_MISSING_FILE"></span>Attempt to create a new firmware submission with a missing file

### <span id="Scenario_prerequisites"></span><span id="scenario_prerequisites"></span><span id="SCENARIO_PREREQUISITES"></span>Scenario prerequisites

-   An OEM is attempting to create a firmware submission with a missing file.

### <span id="Example_usage_with_expected_output"></span><span id="example_usage_with_expected_output"></span><span id="EXAMPLE_USAGE_WITH_EXPECTED_OUTPUT"></span>Example usage with expected output

Attempt to retrieve the signed submission for a ticket that is still in process:

``` syntax
PS> $result=New-FirmwareSubmission -path C:\Data1\TESTOEM1-MS.TKT-SIGN-TEST-NOT-HERE.zip
```

``` syntax
PS C:\windows\system32> $result=New-FirmwareSubmission -path C:\Data1\TESTOEM1-M
S.TKT-SIGN-TEST-NOT-HERE.zip
New-FirmwareSubmission : File
'C:\Data1\TESTOEM1-MS.TKT-SIGN-TEST-NOT-HERE.zip' does not exist.
At line:1 char:9
+ $result=New-FirmwareSubmission -path
C:\Data1\TESTOEM1-MS.TKT-SIGN-TEST-NOT-HERE ...
+
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (:) [New-FirmwareSubmission], A
   rgumentException
    + FullyQualifiedErrorId : System.ArgumentException,Microsoft.Phone.Partner
   Services.Cmdlets.NewFirmwareSubmissionCommand
            
```

## <span id="Help_documentation_from_Windows_PowerShell"></span><span id="help_documentation_from_windows_powershell"></span><span id="HELP_DOCUMENTATION_FROM_WINDOWS_POWERSHELL"></span>Help documentation from Windows PowerShell


The following is the help documentation for the **New-FirmwareSubmission** cmdlet from Windows PowerShell.

``` syntax
PS C:\Windows\system32> get-help New-FirmwareSubmission -full

NAME
    New-FirmwareSubmission

SYNOPSIS
    Creates a new firmware submission.

SYNTAX
    New-FirmwareSubmission [-Path] <String> [-ServiceUri <Uri>]
    [-ServiceAccessControlNamespace <String>] [-CertificateStoreLocation
    <StoreLocation>] [-CertificateStoreName <StoreName>]
    [-ClientCertificateThumbprint <String>] [-EncryptionCertificateThumbprint
    <String>] [<CommonParameters>]


DESCRIPTION
    Creates a new firmware submission and uploads the file containing the
    payload.


PARAMETERS
    -Path <String>
        The full path to file containing the firmware-submission to be
        uploaded.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -ServiceUri <Uri>


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


        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -CertificateStoreName <StoreName>


        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -ClientCertificateThumbprint <String>


        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -EncryptionCertificateThumbprint <String>


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
    FirmwareSubmission

        Contains the firmware submission ticket Id

NOTES


RELATED LINKS

PS C:\Windows\system32>
```

## <span id="Troubleshooting"></span><span id="troubleshooting"></span><span id="TROUBLESHOOTING"></span>Troubleshooting


Error message:

``` syntax
New-FirmwareSubmission : An error has occurred. There was no endpoint
    listening at http://wp8partnerservicesv1.cloudapp.net:7159/Firmware.svc that
    could accept the message. This is often caused by an incorrect address or SOAP
```

Common cause: Your company network gateway configuration may not allow you to connect to the Microsoft signing server.

Solution: Contact your IT administration department to open or reconfigure the network port.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** None

## <span id="related_topics"></span>Related topics


[Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223)

 

 






