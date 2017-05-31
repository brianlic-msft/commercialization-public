---
author: Justinha
Description: Work with Product Keys and Activation
ms.assetid: 923c0cd1-527c-4610-b979-e068fcc0ef99
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Work with Product Keys and Activation
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Work with Product Keys and Activation


You can enter a product key during an automated installation of Windows® by including it in your answer file.

You can also use product keys to select an image to install during an automated Windows installation.

## <span id="In_this_Topic"></span><span id="in_this_topic"></span><span id="IN_THIS_TOPIC"></span>In this Topic


-   [Select Which Windows Edition to Install](#selectwhichwindowstoinstall)

-   [Activate Windows](#activatewindowsbyusingaproductkey)

## <span id="SelectWhichWindowsToInstall"></span><span id="selectwhichwindowstoinstall"></span><span id="SELECTWHICHWINDOWSTOINSTALL"></span>Select Which Windows Edition to Install


To select a Windows edition to install, you can do one of the following:

-   Install Windows manually, without an answer file. Windows Setup installs the default edition from the Windows product DVD.

-   Install Windows with an answer file, and include a product key in Microsoft-Windows-Setup\\UserData\\ProductKey\\`Key`. Each product key is specific to a Windows edition. Entering the product key in this setting does not activate Windows.

-   Install Windows with an answer file, and then manually type in a product key during Windows Setup. The product key selects a Windows edition to install.

**Warning**  
If you have multiple Windows images with the same Windows edition that are stored in the same Windows image file (.wim), you can use the setting: Microsoft-Windows-Setup\\ImageInstall\\OSImage\\InstallFrom\\`MetaData` to differentiate between them. You must still provide a product key using one of the methods listed in the previous list.

 

For information about managing Windows product keys when changing the Windows image to a higher edition, see [Change the Windows Image to a Higher Edition Using DISM](change-the-windows-image-to-a-higher-edition-using-dism.md).

## <span id="ActivateWindowsByUsingAProductKey"></span><span id="activatewindowsbyusingaproductkey"></span><span id="ACTIVATEWINDOWSBYUSINGAPRODUCTKEY"></span>Activate Windows


To automatically activate Windows by using a product key, you can do one of the following:

-   Use the Microsoft-Windows-Shell-Setup\\`ProductKey` unattend setting. You can use either a single-use product key or a Volume License Multiple Activation Key. For more information, see the [Volume Activation Planning Guide](http://go.microsoft.com/fwlink/p/?LinkID=734870).

    The product key used to activate Windows must match the Windows edition that you install. If you use a product key to select a Windows edition, we recommend using the same key to activate Windows, so that the edition you install is the same as the edition that you activate.

-   Original Equipment Manufacturers (OEMs) can use OEM-specific activation tools.

If a product key isn’t provided prior to Out-Of-Box Experience (OOBE), then OOBE will prompt the end user for a product key. If the end user skips this during OOBE, the user will be reminded later to enter a valid product key.

**Warning**  
In most Windows 8 deployment scenarios, you no longer have to use the `SkipRearm` answer file setting to reset the Windows Product Activation clock when you run the **Sysprep** command multiple times on a computer. In Windows 8, the `SkipRearm` setting is used to specify the Windows licensing state. If you specify a retail product key or volume license product key, Windows is automatically activated. You can run the **Sysprep** command up to 8 additional times on a single Windows image. After running Sysprep 8 times on a Windows 8 image, you must recreate your Windows image. For more information about Windows components and settings that you can add to an answer file, see the [Unattended Windows Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281).

 

## <span id="related_topics"></span>Related topics


[Windows Deployment Options](windows-deployment-options.md)

[How Configuration Passes Work](how-configuration-passes-work.md)

[Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md)

[Change the Windows Image to a Higher Edition Using DISM](change-the-windows-image-to-a-higher-edition-using-dism.md)

 

 






