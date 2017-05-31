---
author: kpacquer
Description: 'Initialize-FirmwareSubmission cmdlet'
ms.assetid: f941c3e5-dea6-444b-aebe-41ca07b24377
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Initialize-FirmwareSubmission cmdlet'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Initialize-FirmwareSubmission cmdlet


Use this standalone cmdlet to prepare a firmware submission. This cmdlet combines the firmware submission into a zip file on the local computer, and does not communicate with partner services.

After using this cmdlet, use [New-FirmwareSubmission cmdlet](new-firmwaresubmission-cmdlet.md) to upload the zip file that contains the firmware submission. This cmdlet provides only a .NET file object as an output. To submit the zip file that is created from this cmdlet, use the **New-FirmwareSubmission** cmdlet.

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


Create a package using ImgGen.cmd. This creates multiple files, including an UpdateHistory.xml file and a targeting package file, which is named using the following format where &lt;OEM&gt; is the name of the OEM and &lt;Device&gt; is the name of the device:

&lt;OEM&gt;.&lt;Device&gt;.Customizations.MainOS.spkg

To use the same image for multiple OEMs or devices, add a targeting file (PhoneMetadataDeviceTargetingInfo.xml). For more info, see [DeviceInfo](https://msdn.microsoft.com/library/windows/hardware/mt138322).

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


The following are the input parameters for this cmdlet.

<span id="-UpdateHistoryPath__required_"></span><span id="-updatehistorypath__required_"></span><span id="-UPDATEHISTORYPATH__REQUIRED_"></span>*-UpdateHistoryPath (required)*  
A string path to the UpdateHistory file.

<span id="-OemInputPath__required_"></span><span id="-oeminputpath__required_"></span><span id="-OEMINPUTPATH__REQUIRED_"></span>*-OemInputPath (required)*  
A string path to the OEMInput.xml file.

<span id="-TypeOfSubmission__required_"></span><span id="-typeofsubmission__required_"></span><span id="-TYPEOFSUBMISSION__REQUIRED_"></span>*-TypeOfSubmission (required)*  
The submission type. The type must be **Image**, **FfuCatalog**, or **PartialImage**.

<span id="-OutputFilePath__required_"></span><span id="-outputfilepath__required_"></span><span id="-OUTPUTFILEPATH__REQUIRED_"></span>*-OutputFilePath (required)*  
A string path to the resulting output zip file. If this parameter does not contain a full path, the output file is saved in the current working directory.

<span id="-TypeOfProduct"></span><span id="-typeofproduct"></span><span id="-TYPEOFPRODUCT"></span>*-TypeOfProduct*  
An optional parameter that specifies the target product of the firmware submission. The product must be one of WindowsPhoneBlue, WindowsPhoneThreshold and WindowsIoTCoreThreshold. Default is WindowsPhoneBlue.

**Note** For all Windows 10 submissions, use WindowsPhoneThreshold.

 

<span id="-SignedRemovalPackageFolder"></span><span id="-signedremovalpackagefolder"></span><span id="-SIGNEDREMOVALPACKAGEFOLDER"></span>*-SignedRemovalPackageFolder*  
A string path to a folder that contains removal packages (with file extensions ending in .spkr) to be added to an image.

<span id="-PackagesToRemoveFolder"></span><span id="-packagestoremovefolder"></span><span id="-PACKAGESTOREMOVEFOLDER"></span>*-PackagesToRemoveFolder*  
A string path to a folder that contains packages (with file extensions ending in .spkg) that will be used to generate removal packages to the image.

<span id="-Baseline"></span><span id="-baseline"></span><span id="-BASELINE"></span>*-Baseline*  
Declare a firmware submission to be a baseline so it can be used for retail servicing (via Request for Update (RFU)). Baseline submissions must be Windows Standard Package Configuration compliant. For more info, see [Windows Standard Packaging Configuration (WSPC) requirements for retail images](https://msdn.microsoft.com/library/dn756781).

This flag cannot be used with **–TypeOfSubmission FfuCatalog** or **–TypeOfSubmission PartialImage**.

Also, this flag cannot be used with **–SignedRemovalPackageFolder** or **–PackagesToRemoveFolder**.

<span id="-NonWspcCompliant"></span><span id="-nonwspccompliant"></span><span id="-NONWSPCCOMPLIANT"></span>*-NonWspcCompliant*  
This parameter is deprecated. It was originally used to indicate that the submission was meant not to be compliant with the Windows Phone Standard Package Configuration (WSPC). The WSPC model has changed and this flag is no longer used.

For more info about WSPC requirements, see [Windows Standard Packaging Configuration (WSPC) requirements for retail images](https://msdn.microsoft.com/library/dn756781).

<span id="-FfuPath"></span><span id="-ffupath"></span><span id="-FFUPATH"></span>*-FfuPath*  
Full path to a FFU file that contains the FFU catalog to be submitted to be signed. Include this parameter when specifying **–TypeOfSubmission FfuCatalog**.

<span id="-PartialImageDirectory"></span><span id="-partialimagedirectory"></span><span id="-PARTIALIMAGEDIRECTORY"></span>*-PartialImageDirectory*  
Full path to a directory that contains a partial image that consists only of SPKG files. Include this parameter when specifying **–TypeOfSubmission PartialImage**.

## <span id="Sample_Windows_PowerShell_scripts"></span><span id="sample_windows_powershell_scripts"></span><span id="SAMPLE_WINDOWS_POWERSHELL_SCRIPTS"></span>Sample Windows PowerShell scripts


The following Windows PowerShell script can be used to submit a FFU catalog to be signed.

``` syntax
Initialize-FirmwareSubmission -TypeOfSubmission FfuCatalog –UpdateHistoryPath [path] –OemInputPath [path] –OutputFilePath [path] –FfuPath [path]
```

The following Windows PowerShell script can be used to submit a partial image to be signed.

``` syntax
Initialize-FirmwareSubmission -TypeOfSubmission PartialImage –UpdateHistoryPath [path] –OemInputPath [path] –OutputFilePath [path] –PartialImageDirectoy [path]
```

The following Windows PowerShell script can be used to read validation errors in the output pipeline of this cmdlet, where \[path\] is replaced with the respective absolute file path.

``` syntax
try 
{
Initialize-FirmwareSubmission -TypeOfSubmission Image –UpdateHistoryPath [path] –OemInputPath [path] –OutputFilePath [path] –SignedRemovalPackageFolder [path] –PackagesToRemoveFolder [path]
}
catch 
{
# Assuming exception is a validation error
Write-Host $_.Exception.ValidationErrorLog
}
```

## <span id="Errors"></span><span id="errors"></span><span id="ERRORS"></span>Errors


If the submission zip isn’t constructed properly, this Windows Powershell cmdlet returns an empty string. If the submission zip is constructed but there were validation errors, these errors are captured in the error log in the submission zip.

In Windows Phone 8.1, a targeting package was required (&lt;OEM&gt;.&lt;Device&gt;.Customizations.MainOS.spkg). If this package isn’t included, an exception will be thrown.

## <span id="Help_documentation_from_Windows_PowerShell"></span><span id="help_documentation_from_windows_powershell"></span><span id="HELP_DOCUMENTATION_FROM_WINDOWS_POWERSHELL"></span>Help documentation from Windows PowerShell


``` syntax
NAME
    Initialize-FirmwareSubmission

SYNOPSIS


SYNTAX
Initialize-FirmwareSubmission [[-TypeOfProduct] <String>] [[-TypeOfSubmission] <String>] [-UpdateHistoryPath]
    <String> [-OemInputPath] <String> -OutputFilePath <String> [-SignedRemovalPackageFolder <String>]
    [-PackagesToRemoveFolder <String>] [-Baseline] -FfuPath -PartialImageDirectory [<CommonParameters>]]


DESCRIPTION
    This cmdlet is used to prepare a submission .zip for code signing,
    including packages to be signed and related metadata. This cmdlet only
    works on an x86 instance of PowerShell.


PARAMETERS
    -TypeOfProduct <String>
        An optional parameter that specifies the target product of the
        firmware submission. The product must be one of WindowsPhoneBlue and
        WindowsPhoneThreshold. Default is WindowsPhoneBlue.

        **Note** For all Windows 10 submissions, use WindowsPhoneThreshold.

        Required?                    false
        Position?                    0
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -TypeOfSubmission <String>
        Acceptable values are Image, PartialImage, and FfuCatalog.
        Mandatory parameters for Image submission are: UpdateHistoryPath,
        OemInputPath, and OutputFilePath. If you forget a mandatory parameter,
        the cmdlet will prompt you for it.

        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -UpdateHistoryPath <String>
        Full path to UpdateHistory.xml file.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -OemInputPath <String>
        Full path to OEMInput.xml file.

        Required?                    true
        Position?                    3
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -OutputFilePath <String>
        Full path to directory which will contain output .zip file.

        Required?                    true
        Position?                    Named
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -SignedRemovalPackageFolder <String>
        Full path to directory containing spkrs available to include in
        submission .zip.

        Required?                    false
        Position?                    Named
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -PackagesToRemoveFolder <String>
        Full path to directory containing spkgs for which spkrs need to be
        generated and submitted.

        Required?                    false
        Position?                    Named
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -Baseline
        Indicates that the submission should be marked as baseline, which make this submission eligible for retail
        servicing updates.

        Required?                    false
        Position?                    Named
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -FfuPath <String>
        Full path to an FFU file that contains the FFU catalog to be submitted
        for code signing.  This parameter is only used for a FfuCatalog
        submission.

        Required?                    true
        Position?                    Named
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false

    -PartialImageDirectory <String>
        Full path to a directory containing a partial image that consists of
        only SPKG files.  This parameter is only used for a PartialImage
        submission.

        Required?                    true
        Position?                    Named
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
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
    .NET FileInfo object.

        .NET FileInfo object contains submission .zip ready to submit for code
        signing.

NOTES
    --------------  Non-baseline image submission example.  --------------

    PS C:\> Initialize-FirmwareSubmission -TypeOfProduct WindowsPhoneBlue -TypeOfSubmission Image -UpdateHistoryPath
    c:\input -OemInputPath c:\input -OutputFilePath c:\output





    --------------  Baseline image submission example.  --------------

    PS C:\> Initialize-FirmwareSubmission -TypeOfProduct WindowsPhoneThreshold -TypeOfSubmission Image
    -UpdateHistoryPath c:\input -OemInputPath c:\input -OutputFilePath c:\output -baseline





    --------------  FFU catalog submission example.  --------------

    PS C:\> Initialize-FirmwareSubmission -TypeOfProduct WindowsPhoneThreshold
            -TypeOfSubmission FfuCatalog -UpdateHistoryPath c:\input -OemInputPath
            c:\input -OutputFilePath c:\output -FfuPath c:\input\flash.ffu




    --------------  Partial image submission example.  --------------

    PS C:\> Initialize-FirmwareSubmission -TypeOfProduct WindowsPhoneBlue
            -TypeOfSubmission PartialImage -UpdateHistoryPath c:\input -OemInputPath
            c:\input -OutputFilePath c:\output -PartialImageDirectory c:\input\spkg




    --------------  Print usage text example.  --------------

    PS C:\> Initialize-FirmwareSubmission


RELATED LINKS
```

## <span id="related_topics"></span>Related topics


[Windows Standard Packaging Configuration (WSPC) requirements for retail images](https://msdn.microsoft.com/library/dn756781)

[New-FirmwareSubmission cmdlet](new-firmwaresubmission-cmdlet.md)

[Submit binaries to be retail signed](https://msdn.microsoft.com/library/windows/hardware/dn789223)

 

 






