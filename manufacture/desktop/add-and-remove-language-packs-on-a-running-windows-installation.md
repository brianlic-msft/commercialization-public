---
author: themar
Description: Add and Remove Language Packs on a Running Windows Installation
ms.assetid: 0e3f0b85-417e-4e17-869e-05ae37e98c8f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add and Remove Language Packs on a Running Windows Installation
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add and remove language packs on a running windows installation

You can add support for additional languages on a running operating system, or to an offline image. For information about how to install languages to an offline image, see [Add and Remove Language Packs Offline Using DISM](add-and-remove-language-packs-offline-using-dism.md).

For information about installing Language Interface Packs (LIPs), see [Add Language Interface Packs to Windows](add-language-interface-packs-to-windows.md).

In Windows 10, users can install more languages and features by going to **Settings** &gt; **Time & language** &gt; **Region & language** &gt; **Add a language**. 

## <span id="online"></span><span id="ONLINE"></span>Use DISM to add a language pack online

When you add language packs using DISM, the licensing requirements of how many language packs are allowed to run on the Windows edition are not verified. If you add multiple language packs, all non-default, non-user selected languages will be removed from the computer after a period of time. For more information, see [Add Language Packs to Windows](add-language-packs-to-windows.md).

**Note**  
You can also add language packs to Windows Preinstallation and Windows Recovery installations. For more information, see [WinPE: Mount and Customize](winpe-mount-and-customize.md) and [Customize Windows RE](customize-windows-re.md).

**To add a language pack by using DISM**

1.  On the running operating system, open an elevated command prompt.

2.  Type the following command to add a language pack (Greek, in this example) to the operating system. 

    ``` syntax
    Dism /online /Add-Package /PackagePath:D:\x64\LangPacks\Microsoft-Windows-Client-Language-Pack_x64_el-gr.cab
    ```

For more information about DISM international servicing commands, see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md)

## <span id="online"></span><span id="REMOVE"></span>Remove a language pack online

Windows automatically removes non-user selected languages after a period of time. If you remove an installed language through the Settings app, the language will be removed from the listed languages, but the language pack will not be immediately deleted. If you want to immediately remove a language pack, use lpksetup.exe. <br>**Note:** Lpksetup will uninstall a language pack, but the language will still appear in the Settings app.

### Remove a language with the Settings app

  In the Settings app, you can remove a language by going to **Settings** &gt; **Time & language** &gt; **Region & language**. Click on the language you'd like to remove, and then click on **remove**. Windows will automatically delete language pack files the next time it runs its automated cleanup tasks.

### Remove a language pack with lpksetup.exe

1.  On the running operating system, open an elevated command prompt.

2.  Run `lpksetup.exe` with the */u* option to uninstall the language pack. Here is how you would remove a Greek (el-gr) language pack.

    ```
    lpksetup.exe /u el-gr
    ```
    See [Lpksetup command line options](https://technet.microsoft.com/en-us/library/cc766010(v=ws.10).aspx) to see all available command line options for lpksetup.



## <span id="related_topics"></span>Related topics


[Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

[Understanding Servicing Strategies](understanding-servicing-strategies.md)

[Add Language Packs to Windows](add-language-packs-to-windows.md)