---
title: Sign a full flash update (FFU) image
description: You must cryptographically sign an FFU image before you can deploy it to a device. This step is required to help prevent tampering and malicious attacks. You can only flash images to a Windows 10 Mobile device after they are properly signed.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 94761827-8c91-4477-9483-c61095151f90
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sign a full flash update (FFU) image


You must cryptographically sign an FFU image before you can deploy it to a device. This step is required to help prevent tampering and malicious attacks. You can only flash images to a Windows 10 Mobile device after they are properly signed.

The OEM must sign the FFU image using a certificate that chains to the UEFI PK boot key that an OEM provisions.

During development and testing, a test certificate is used to sign the FFU image instead of a retail certificate. Use the secure boot test tool to provision the appropriate test certificates to the device

For retail phones, retail certificates are provisioned on the device using retail secure boot tools.

## Test signing images using Windows Imaging and Configuration Designer (ICD)


After you use the secure boot test tool to provision the appropriate test certificates to a phone, you can use the Windows Imaging and Configuration Designer (ICD) to generate test signed images. Windows ICD will automatically sign images using the correct test certificates. This is the recommended process, as it is the easiest method to prepare properly signed images. For more information, see [Windows ICD](https://msdn.microsoft.com/library/windows/hardware/dn916113).

## Retail signing FFU images


Before images can be shipped on a retail device, they must be signed by Microsoft. Use the process described in this section to create a retail signed image FFU file that can be flashed to retail devices.

1.  Before you can sign binaries, you must first install the test OEM certificates on the PC by following the steps in [Set up the signing environment](https://msdn.microsoft.com/library/windows/hardware/dn789236).

2.  Add the directory for the sign.cmd script that is located in %WPDKCONTENTROOT%\\tools\\bin\\i386 to your path using the path command.

    ``` syntax
    C:\> PATH = %PATH%;%WPDKCONTENTROOT%\Tools\bin\I386
    ```

3.  Open a developer prompt with administrator rights in the directory that contains the output from the image generation process.

4.  Confirm that you have the latest version of the kit that includes updated versions of imagesigner.exe and imagecommon.dll by typing the following command. Confirm that the truncate option is displayed.

    ``` syntax
    C:\> ImageSigner /?
    Usage:
            imagsigner sign <FFU> <catalog file>
            imagesigner getcatalog <FFU> <catalog file>
            imagesigner truncate <FFU> <truncated FFU>
    ```

    If you do not have a recent version of the kit that includes the updated ImageSigner, download and install the latest kit.

5.  Extract the first one MB of the FFU image which contains the FFU catalog and associated metadata using the truncate option.

    ``` syntax
    C:\> ImageSigner TRUNCATE OEM.ffu OEM.trunc
    ```

6.  Extract the catalog from the truncated FFU image in Step 5.

    ``` syntax
    C:\> ImageSigner GETCATALOG OEM.trunc OEM.cat
    Platform ID: <OEMID>.QC8960.P728
    Successfully extracted catalog.
    C:\>
    ```

7.  Validate that the &lt;OEMID&gt; returned in Step 6 is identical to the OEMID assigned to you by Microsoft. 

8.  Create and submit a TFS ticket to the Microsoft Service Desk to sign the FFU catalog.  Ensure that you attach the truncated FFU image that you created in Step 4.

    1.  Open an *Update* type ticket.

    2.  For the ticket title, enter *FFU Catalog Signing Request from &lt;OEMID&gt;*. Specify your OEM ID in the ticket tile where &lt;OEMID&gt; is shown.

    3.  Set the **Category** to *Ingestion and Publishing*.

    4.  Set the **Issue Type** to *New*.

9.  Microsoft will process the request and resolve the ticket back to the OEM.  Within the resolved ticket, Microsoft will include a retail signed version of the FFU catalog extracted from the FFU truncated image attached to the original ticket. For this example, assume that Microsoft returns the signed FFU catalog named OEM.cat.

10. Sign the FFU with the retail Microsoft signed catalog file using ImageSigner.

    ``` syntax
    C:\> ImageSigner SIGN OEM.ffu OEM.cat
    ```

11. Flash the retail signed retail image on to a device and verify that it behaves as expected.

    ``` syntax
    C:\> FFUTool -flash OEM.ffu
    ```

12. After the retail signed image has been tested it can be used to flash to retail devices. For more information see [Flashing tools](flashing-tools.md) and [Use the flashing tools provided by Microsoft](use-the-flashing-tools-provided-by-microsoft.md).

**Important**  
Secure all of the retail signed binaries using industry best practices.

 

## Test signing images manually


If your development environment includes work outside of Windows ICD, you can manually sign images using sign.cmd. After the test certificate has been provisioned on the device using the secure boot test tool, you can you can use the /pk option of the sign.cmd tool to sign images, by completing the following steps.

1.  Before you can sign binaries, you must first install the test OEM certificates on the PC by following the steps in [Set up the signing environment](https://msdn.microsoft.com/library/windows/hardware/dn789236).

2.  Add the directory for the sign.cmd script that is located in %WPDKCONTENTROOT%\\tools\\bin\\i386 to your path using the path command.

    ``` syntax
    C:\> PATH = %PATH%;%WPDKCONTENTROOT%\Tools\bin\I386
    ```

3.  Open a developer prompt with administrator rights in the directory that contains the output from the image generation process.

4.  Extract the catalog of the unsigned FFU file.

    ``` syntax
    C:\> ImageSigner GETCATALOG TestSigned.FFU TestSigned.Cat
    ```

5.  Sign the catalog using the /pk option.

    ``` syntax
    C:\> Set SIGN_OEM=1
    C:\> Sign.cmd /pk TestSigned.cat
    ```

6.  Sign the FFU with the signed catalog file using ImageSigner.

    ``` syntax
    C:\> ImageSigner SIGN TestSigned.FFU TestSigned.Cat
    ```

## Creating custom signed images


**Note**  
Some OEMs may want to use custom keys to manage images. This option is more complex and is not recommended.

 

When an image is created, an associated catalog file is also created. This catalog file is signed and then used by the ImageSigner tool to sign the FFU image. Sign the .cat file with a certificate that chains to the UEFI boot keys that are provisioned by the OEM. Different certificates are used for test and retail signing.

Sign the catalog file using an appropriate certificate by performing the following steps.

1.  Open a developer prompt with administrator rights in the directory that contains the output from the image generation process. For more information, see [Building an image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md).

2.  Test sign a catalog file named `TestRetailSigned.cat` using a certificate named `TestCertName.pfx` by typing the following command.

    ``` syntax
    C:\> SignTool sign /f TestCertName.pfx  TestRetailSigned.cat
    ```

    **Important**  
    You should only use the signtool.exe with the local file **/f** option internally in a development test environment. When a hardware security modules (HSM) is used, the **/csp** option is used to specify the cryptographic service provider (CSP) that contains the private key container. You should follow industry best practices when signing image update packages for final distribution.

     

3.  Create a signed .ffu file from the unsigned .ffu file and the matching signed .cat file using ImageSigner.exe tool.

    ``` syntax
    C:\> ImageSigner SIGN TestRetailSigned.FFU TestRetailSigned.Cat
    ```

## ImageSigner syntax reference


``` syntax
ImageSigner {SIGN|GETCATALOG|TRUNCATE} FFUFile CatalogFile|TruncatedFFU
```

-   **SIGN** – The **SIGN** action is used for signing an FFU file.

-   **GETCATALOG** – The **GETCATALOG** action extracts a catalog from an FFU file and writes it to a catalog file. This option can be used to determine if an FFU was prepared properly, by examining the extracted catalog file by using file properties or tools such as SignTool.

-   **TRUNCATE** – The truncate action is used to create a truncated FFU.

-   *FFUFile* – The path to the FFU image file.

-   *CatalogFile* – The path to the catalog file.

-   *TruncatedFFU* – The path to the truncated FFU file.

## Related topics


[Building a phone image using ImgGen.cmd](building-a-phone-image-using-imggencmd.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Sign%20a%20full%20flash%20update%20%28FFU%29%20image%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





