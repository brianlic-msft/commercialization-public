---
author: kpacquer
Description: 'Request-UpdateCancellation cmdlet'
ms.assetid: a01ab740-d6a2-4c9e-bfb6-ee3fabb3799a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Request-UpdateCancellation cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# <span id="request-updatecancellation"></span>Request-UpdateCancellation cmdlet


Request a cancellation of a firmware submission request using the **Request-UpdateCancellation** cmdlet.

You can cancel either OEM/mixed updates sent through the [New-RequestForUpdate cmdlet](new-requestforupdate-cmdlet.md). You cannot cancel a request for update (RFU) sent to Microsoft Update after the has been approved to ship Live.

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
    Request-UpdateCancellation [-RequestForUpdateTicketId] <String> 
    [-ServiceUri <Uri>] [-ServiceAccessControlNamespace <String>] 
    [-CertificateStoreLocation <StoreLocation>] [-CertificateStoreName 
    <StoreName>] [-ClientCertificateThumbprint <String>] 
    [-EncryptionCertificateThumbprint <String>] [<CommonParameters>]
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


Typically, the only parameter that is specified in this cmdlet is the firmware submission Ticket ID.

``` syntax
Request-UpdateCancellation -RequestForUpdateTicketId 
    TKT-RFU-PROD-ABCD56-1
```

## <span id="Help_documentation_from_PowerShell"></span><span id="help_documentation_from_powershell"></span><span id="HELP_DOCUMENTATION_FROM_POWERSHELL"></span>Help documentation from PowerShell


The following is the help documentation for the **New-FirmwareSubmission** cmdlet from Windows PowerShell.

``` syntax
NAME
    Request-UpdateCancellation
    
SYNOPSIS
    Requests cancellation for the specified ticket.
    
SYNTAX
    Request-UpdateCancellation [-RequestForUpdateTicketId] <String> 
    [-ServiceUri <Uri>] [-ServiceAccessControlNamespace <String>] 
    [-CertificateStoreLocation <StoreLocation>] [-CertificateStoreName 
    <StoreName>] [-ClientCertificateThumbprint <String>] 
    [-EncryptionCertificateThumbprint <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Requests cancellation for the specified update request. The request could 
    be for a MicrosoftOemMixed or MicrosoftAKOnly update.
    

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
    
        
        
    
     
    
NOTES
    
    
        
    
    --------------  Example 1 --------------
    
    C:\PS>Request-UpdateCancellation -RequestForUpdateTicketId 
    TKT-RFU-PROD-ABCD56-1
    
    
    Requests cancellation for a given RequestForUpdateTicketId
    
    
    
    
    
    
RELATED LINKS
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** None

## <span id="related_topics"></span>Related topics


[Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223)

[New-RequestForUpdate cmdlet](new-requestforupdate-cmdlet.md)

[New-RequestForMicrosoftUpdate cmdlet](new-requestformicrosoftupdate-cmdlet.md)

 

 






