---
Description: 'You need to sign a mobile image before you can deploy it to a device.'
ms.assetid: b5f9d31b-7293-4308-a761-c5cc87801e3c
MSHAttr: 'PreferredLib:/library'
title: Sign a mobile image
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sign a mobile image


You need to sign a mobile image before you can deploy it to a device. For more information about signing images, see [Sign a full flash update (FFU) image](https://msdn.microsoft.com/library/windows/hardware/dn789216).

Before you start, make sure you followed the steps in *Step 5: Install OEM test certs* in [Prepare for Windows mobile development](preparing-for-windows-mobile-development.md). If you haven't done this yet, do this first before proceeding with the steps for signing an image.

In this walkthrough, we'll focus on test signing the image manually. In addition to ImageSigner, we'll also use Sign.cmd.

**To test sign an image**

1.  Open a developer prompt with administrator rights in the directory that contains the output from the image generation process.

2.  Extract the catalog of the unsigned FFU file by running the following command:

    **ImageSigner GETCATALOG TestFlash.ffu TestFlash.cat**

3.  Sign the catalog using the /pk option. There are two parts to this step:

    **Set SIGN\_OEM=1**

    **Sign.cmd /pk TestFlash.cat**

4.  Sign the FFU with the signed catalog file using ImageSigner.

    **ImageSigner SIGN TestFlash.ffu TestFlash.cat**

Once the image is signed, you're ready to flash the image to your mobile device.

 

 



