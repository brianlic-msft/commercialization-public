---
author: kpacquer
Description: Creating a secure MMOS WIM image
ms.assetid: c3ab9a94-a0a6-4831-9ac9-09c2972bb074
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Creating a secure MMOS WIM image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Creating a secure MMOS WIM image


You can use the SecWimTool to create a secure WIM image that can be used to service retail devices.

Before you can create a secure WIM, you must first create the WIM image itself. For info about how to create a WIM image, see [Working with WIM MMOS images](working-with-wim-mmos-images.md).

To use the MMOS WIM in retail, it will need to be signed using retail certificates. More info will be provided in a later release of this documentation about how to work with the retail images.

For the secure WIM to run on the device, the signing certificates must match the certificates in the Platform Key (PK) that is provisioned on the device.

## <span id="Installing_the_needed_certificates_on_the_phone"></span><span id="installing_the_needed_certificates_on_the_phone"></span><span id="INSTALLING_THE_NEEDED_CERTIFICATES_ON_THE_PHONE"></span>Installing the needed certificates on the phone


Before you run the tools, you must first provision the appropriate certificates on the device. To become familiar with SecWimTool, partners can use the secure boot *test* tool to provision test (non-retail) certificates on the device. Use the secure boot *retail* tool for retail device.

## <span id="Creating_a_secure_MMOS_WIM_image"></span><span id="creating_a_secure_mmos_wim_image"></span><span id="CREATING_A_SECURE_MMOS_WIM_IMAGE"></span>Creating a secure MMOS WIM image


To create a secure wim image, complete the following steps.

1.  Open an elevated developer prompt in the directory that contains the output from the ImgToWim image generation process. For info about how to create a WIM image, see [Working with WIM MMOS images](working-with-wim-mmos-images.md).

    **Note**  
    The image generation executables are located in %WPDKCONTENTROOT%\\Tools\\bin\\i386. You can use the `set` command to add that path to your environment.

     

2.  The platform ID must be used to create the WIM for a specific platform. The platform ID is set in using a device platform XML file.

    You can display the platform ID using the ffutool command with the **-list** option.

    ``` syntax
    C:\> ffutool -list
    Name:   Contoso.DCD9X0X.BD301_ATT.3.2.1
    ID:     00000011-f151-a509-0000-FF0000000000
    ```

    Build the unsigned secure WIM targeted for a specific platform using the *-platform* command option as shown here. No output is returned if the command completes successfully.

    ``` syntax
    C:\> SecWimTool -build MMOSwim.wim MMOS wim.secwim -platform Contoso.DCD9X0X.BD301_ATT.3.2.1
    ```

3.  Extract the catalog from the secure WIM image. No output is returned if the command completes successfully.

    ``` syntax
    C:\> SecWimTool -extractcat MMOSwim.secwim MMOSwim.cat
    ```

4.  You can sign the WIM with test certificates to test the WIM process. For a retail secure WIM, the FFU must be signed by Microsoft.

    **Important**  
    Information about signing with the final retail certificates will be provided in a later release of the documentation.

    To sign the catalog using the test image certificate, use this command.

    ``` syntax
    C:\> sign /pk MMOSwim.cat
    ```

    This command will generate output that is similar to the following.

    ``` syntax
    signtool.exe sign /v /a /u 1.3.6.1.4.1.311.76.5.10 /r "Microsoft Testing Root Certificate Authority 2010" /fd SHA256 /s my /c "1.3.6.1.4.1.311.21.8.7587021.7518
    74.11030412.6202749.3702260.207.4167089.4524209"    "MMOSwim.cat"
    The following certificate was selected:
        Issued to: User1
        Issued by: MSIT Test CodeSign CA 3
        Expires:   Sat Jun 21 15:05:01 2014
        SHA1 hash: F571C183F768638B424A59772A1AFB1168164AFC

    Done Adding Additional Store
    Successfully signed: MMOSwim.cat

    Number of files successfully Signed: 1
    Number of warnings: 0
    Number of errors: 0
    signed:  "MMOSwim.cat"
    Sign.Cmd RC=0
    ```

5.  Replace the existing catalog with a signed catalog. No output is returned if the command completes successfully.

    ``` syntax
    C:\> SecWimTool -replacecat flashwim.cat MMOSwim.secwim
    ```

6.  Place the device in flashing mode.

7.  Flash the WIM to the device to test it using the FFUTool.

    ``` syntax
    C:\> ffutool -wim MMOSwim.secwim
    ```

    The command will generate output that is similar to the following.

    ``` syntax
    Found device:
    Name:   Contoso.MSM8X0X.BD301_ATT.3.2.1
    ID:     00000011-f151-a509-0000-FF0000000000
    Booting WIM: MMOSwim.secwim
    WIM transfer completed in 26.550073 seconds.
   
    ```

## <span id="Working_with_serial_numbers"></span><span id="working_with_serial_numbers"></span><span id="WORKING_WITH_SERIAL_NUMBERS"></span>Working with serial numbers


The serial number option can be used when including tools that should only be used for a specific device.

**Serial Number**- The serial number is a unique ID for the phone that is generated automatically. You can display the serial number using the ffutool command with the *-serial* option.

``` syntax
C:\> ffutool -serial
Serial No. : 01000500000000000000000000001234
```

To build a secure WIM targeted for a specific device, use the *–serial* command option as shown here.

``` syntax
C:\> SecWimTool -build MMOSwim.wim MMOS wim.secwim -serial 01000500000000000000000000001234
```

## <span id="Troubleshooting"></span><span id="troubleshooting"></span><span id="TROUBLESHOOTING"></span>Troubleshooting


When you flash the image if the PK doesn’t match, you will receive this message.

``` syntax
An FFU error occurred: Device returned WIM boot failure status code 0x80000004.
```

## <span id="SecWimTool_command_line_reference"></span><span id="secwimtool_command_line_reference"></span><span id="SECWIMTOOL_COMMAND_LINE_REFERENCE"></span>SecWimTool command line reference


The following summarizes the command syntax and the four command-line options for SecWimTool.

``` syntax
SecWimTool <command> <arguments>
```

**-build** - Packs the specified WIM into a secwim that is suitable for signing and transferring to a retail device.

-   *Platform* - Includes targeting information for a specific platform type that the WIM is intended for. This option must be used to target the WIM for a specific platform.

-   *Serial* - Includes the serial number of a specific device the WIM will be used on. This option can be used when including tools that should only be used for a specific device.

``` syntax
SecWimTool -build <WIM> <output file> [-platform <ID>] [-serial <serial number>]
```

**-extractcat** - Retrieves the catalog from the secure WIM file, and writes it either to the output file (if specified) or stdout.

``` syntax
secwim -extractcat <path to .secwim> [<output file>]
```

**-replacecat** - Replaces the catalog in the specified .secwim with the contents of the new catalog.

``` syntax
secwim -replacecat <path to catalog> <path to .secwim>
```

**-?** - Displays command line help. Use `secwimtool -<command> -?` for command level help.

## <span id="related_topics"></span>Related topics


[Working with WIM MMOS images](working-with-wim-mmos-images.md)

 

 






