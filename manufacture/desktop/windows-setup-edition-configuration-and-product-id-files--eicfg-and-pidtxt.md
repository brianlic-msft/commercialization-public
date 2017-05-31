---
author: Justinha
Description: 'Windows Setup Edition Configuration and Product ID Files (EI.cfg and PID.txt)'
ms.assetid: 1c0f17a9-6a74-40af-8d0b-fc6d807a6616
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Windows Setup Edition Configuration and Product ID Files (EI.cfg and PID.txt)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup Edition Configuration and Product ID Files (EI.cfg and PID.txt)


The edition configuration (EI.cfg) file and the product ID (PID.txt) file are optional configuration files that you can use to specify the Windows® product key and the Windows edition during Windows installation. You can use these files to automate the product-key entry page in Windows Setup instead of using an answer file. If you use an EI.cfg file to differentiate volume license media, but you do not include a PID.txt file, the user receives a prompt for a product key to continue Windows Setup.

You can reuse the product key in the product ID file for multiple installations. The product key in the product ID file is only used to install Windows. This key is not used to activate Windows. For more information, see [Work with Product Keys and Activation](work-with-product-keys-and-activation-auth-phases.md).

## <span id="Using_EI.cfg_and_PID.txt"></span><span id="using_ei.cfg_and_pid.txt"></span><span id="USING_EI.CFG_AND_PID.TXT"></span>Using EI.cfg and PID.txt


1.  Create these configuration files in a text editor such as Notepad.

2.  Save the files into the `\Sources` folder on the installation media. Windows Setup will use these files automatically during installation.

3.  Run Windows Setup. Setup uses these files during the Windows PE configuration pass as soon as it is launched.

**Note**  
An answer file takes precedence over these files. If you use an answer file during installation, Windows Setup ignores the EI.cfg and PID.txt files.

 

## <span id="ei.cfg_format"></span><span id="EI.CFG_FORMAT"></span>EI.cfg Format


The EI.cfg file specifies the values for the edition ID, the channel, and the volume license.

The EI.cfg file has the following format:

``` syntax
[EditionID]
{Edition ID}
[Channel]
{Channel Type}
[VL]
{Volume License}
```

*{Edition ID}* must be a valid Windows edition ID, for example, "Enterprise". To obtain the current EditionID, use the **Dism /Get-ImageInfo** command or the **Dism /Get-CurrentEdition** command. For more information, see [Take Inventory of an Image or Component Using DISM](take-inventory-of-an-image-or-component-using-dism.md) and [DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md).

*{Channel Type}* must be either "OEM" or "Retail"

*{Volume License}* must be either 1, if this is a volume license, or 0, if this is not a volume license. For example:

``` syntax
[EditionID]
Enterprise
[Channel]
OEM
[VL]
0
```

## <span id="pid.txt_format"></span><span id="PID.TXT_FORMAT"></span>PID.txt Format


The PID.txt file contains the product key for the edition of Windows that you are installing.

The PID.txt file has the following format:

``` syntax
[PID]
Value=XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
```

where *XXXXX-XXXXX-XXXXX-XXXXX-XXXXX* is the product key.

## <span id="Troubleshooting"></span><span id="troubleshooting"></span><span id="TROUBLESHOOTING"></span>Troubleshooting


**"The product key entered does not match any of the Windows images available for installation. Enter a different product key."**: You may need to download a separate version of Windows. OEM versions are only available to OEMs, and volume licenses are only available to MSDN subscribers.

## <span id="related_topics"></span>Related topics


[Work with Product Keys and Activation](work-with-product-keys-and-activation-auth-phases.md)

[Windows Setup Command-Line Options](windows-setup-command-line-options.md)

[Windows Setup States](windows-setup-states.md)

 

 






