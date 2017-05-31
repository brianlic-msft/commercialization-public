---
author: kpacquer
Description: Partial Image Signing
ms.assetid: dac19053-5243-45f2-9041-b9de9ea0bd80
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Partial Image Signing
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Partial Image Signing


Previous versions of the ingestion client supported signing only full FFU images. However, there are several valid scenarios where you might want to submit a partial FFU image to be signed rather than a full image, such as:

-   Signed package caching functionality as described in detail in Windows Standard Package Configuration (WSPC) scenario, as described in [Windows Standard Packaging Configuration (WSPC) requirements for retail images](https://msdn.microsoft.com/library/dn756781).

-   Signing MMOS packages for validation and troubleshooting during manufacture.

-   Rapid testing of fixes for bugs that do not manifest themselves on test images. For example, previously there could be a delay of week or more between the time your fix is checked in to the actual build of the binary containing the fix. To reduce this latency, you can now build a local copy of the binary, create the package, submit the partial package to be retail signed, and then retrieve the retail signed partial package before re-integrating and flashing it to the phone using IUTool.

-   Installing testing and debugging tools on retail images to debug issues that only manifest themselves on retail images.

The latest version of the ingestion client now implements functionality to support partial image signing, mitigating the need for you to manually create your own "manufactured" packages and UpdateHistory.xml files when submitting packages to the ingestion client to be signed. Note that your account must have permission to sign partial images in order to utilize this new functionality otherwise any such submissions will fail.

## <span id="Contextual_Individual_Package_Signing"></span><span id="contextual_individual_package_signing"></span><span id="CONTEXTUAL_INDIVIDUAL_PACKAGE_SIGNING"></span>Contextual Individual Package Signing


OEMs might leverage a package caching mechanism to optimize their build process. In this process, retail signed packages are cached so that they may be re-used across multiple images. Therefore any new code must be retail signed and then deposited into the package cache in order to re-use it across multiple images. To do so, you should create a new package that contains the binary and an image. However, instead of submitting all the packages from the image to be retail signed, you can now submit only the package that contains the fix. To do so, use the ingestion client's `Initialize-FirmwareSubmission` cmdlet with `-TypeOfSubmission PartialImage`, specifying the directory that contains the new package to be retail signed, along with the UpdateHistory.xml file created during image generation into a directory. The Ingestion Client will retrieve the package and the UpdateHistory.xml file. Microsoft will then validate the submission based on the UpdateHistory.xml file and retail sign the package. You can then use the `Get-SignedFirmwareSubmission` cmdlet to obtain the retail signed package and place it in the package cache. Note that your account must have permission to sign individual packages in this way in order to utilize this new functionality otherwise any such submissions will fail.

## <span id="Context_Free_Individual_Package_Signing"></span><span id="context_free_individual_package_signing"></span><span id="CONTEXT_FREE_INDIVIDUAL_PACKAGE_SIGNING"></span>Context Free Individual Package Signing


OEMs can now also use the ingestion client to create "context free" submissions. For example, if you need to create a new MMOS package based on changes to a product line that have been made recently, you can place the MMOS package in a directory, specifying the directory when using the Ingestion Client during the submission as well as specifying that the submission is “context free." Such package submissions are signed based solely on the EKU combination.

## <span id="Partial_Image_Package_Signing_Example"></span><span id="partial_image_package_signing_example"></span><span id="PARTIAL_IMAGE_PACKAGE_SIGNING_EXAMPLE"></span>Partial Image Package Signing Example


To prepare a partial FFU to be signed:

``` syntax
PS> Initialize-FirmwareSubmission -TypeOfProduct WindowsPhoneBlue -TypeOfSubmission PartialImage -UpdateHistoryPath c:\input\UpdateHistory.xml -OemInputPath c:\input -OutputFilePath c:\output -PartialImageDirectory c:\input\spkg
```

 

 





