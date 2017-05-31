---
author: Justinha
Description: Configure a Windows Repair Source
ms.assetid: 00c879d8-5c56-4e96-9c44-df0c2fc4371d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Configure a Windows Repair Source
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure a Windows Repair Source


You can use Group Policy to specify a Windows image repair source to use within your network. The repair source can be used to restore Windows features or to repair a corrupted Windows image.

Features on demand enables you to remove an optional feature from a Windows® image and then restore it later. You can disable optional features and remove files associated with those features from a Windows image using the Deployment Image Servicing and Management (DISM) tools. When you use the **/Remove** argument with the DISM **/Disable-Feature** option, the manifest files for the feature or Server role is maintained in the image. However, all other files for the feature are removed. This enables you to store, download, and deploy smaller images without losing features. Once the image has been deployed, users can enable the feature on their computers at any time by using features on demand to retrieve the required files from the repair source. For more information, see [Enable or Disable Windows Features Using DISM](enable-or-disable-windows-features-using-dism.md).

Automatic corruption repair provides files to repair Windows if the operating system has become corrupted. Users can also use a specified repair source on your network or use Windows Update to retrieve the source files that are required to enable a feature or to repair a Windows image. For more information, see [Repair a Windows Image](repair-a-windows-image.md).


## <span id="BKMK_Specify"></span><span id="bkmk_specify"></span><span id="BKMK_SPECIFY"></span>Choose a Repair Source


You can use Windows Update to provide the files that are required to restore a Windows feature or repair a corrupted operating system. You can also configure Group Policy to gather the required files from a network location. Multiple source locations can be specified in the Group Policy.

**To use Windows Update to restore optional features and repair Windows images**

1.  Windows Update will be used by default if it is allowed by the policy settings on the computer.

2.  If you want to use Windows Update as a primary or backup source for files that are used to restore optional features or repair Windows images, you should make sure that your firewall is configured to allow access to Windows Update.

**To use a network location to restore optional features and repair Windows images**

1.  You can use a mounted Windows image from a WIM file as a source to restore optional features and repair a corrupted operating system. For example, c:\\test\\mount\\Windows. For more information about capturing a Windows image as a WIM file, see [Capture Images of Hard Disk Partitions Using DISM](capture-images-of-hard-disk-partitions-using-dism.md).

2.  You can use a running Windows installation as a source to restore optional features by sharing the c:\\Windows folder on your network.

3.  You can use a Windows side-by-side folder from a network share or from a removable media, such as the Windows DVD, as the source of the files. For example, z:\\sources\\SxS.

4.  You can use a Windows image (.wim) file on a network share as a source to restore optional features. You must specify the index of the Windows image in the .wim file that you want to use and you must use a `Wim:` prefix in the path to identify this file format. For example, to specify index 3 in a file named contoso.wim, type: Wim:\\\\network\\images\\contoso.wim:3.

## <span id="BKMK_SetGPO"></span><span id="bkmk_setgpo"></span><span id="BKMK_SETGPO"></span>Set Group Policy


You can use Group Policy to specify when to use Windows Update, or a network location as a repair source for features on demand and automatic corruption repair.

**To configure Group Policy for Feature on Demand**

1.  Open the group policy editor. For example, on a computer that is running Windows 10, from the **Start** screen, type **Edit Group Policy**, and then select **Edit Group Policy** to open the Group Policy Editor.

2.  Click **Computer Configuration**, click **Administrative Templates**, click **System**, and then double-click the **Specify settings for optional component installation and component repair** setting.

3.  Select the settings that you want to use for Features on Demand.

## <span id="BKMK_Maintain"></span><span id="bkmk_maintain"></span><span id="BKMK_MAINTAIN"></span>Maintaining a Repair Source


If you do not use Windows Update as the repair source for features on demand and automatic corruption repair, you should consider the following guidelines for maintaining a repair source.

### <span id="Servicing_updates"></span><span id="servicing_updates"></span><span id="SERVICING_UPDATES"></span>Servicing updates

You should keep any repair source current with the latest servicing updates. If you are using an image from a WIM file for features on demand, you can use the DISM tool to service the image. For more information, see [Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md). If you are using an online Windows installation shared on your local network as a repair image, you should make sure that the computer has access to Windows Update.

### <span id="Multilingual_images"></span><span id="multilingual_images"></span><span id="MULTILINGUAL_IMAGES"></span>Multilingual images

You must include all of the relevant language packs with your repair source files for the locales that your image supports. If you try to restore a feature without all of the localization components that the Windows installation requires for that feature, the installation will fail.

You can install additional language packs after a feature is restored.

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[Enable or Disable Windows Features Using DISM](enable-or-disable-windows-features-using-dism.md)

[Repair a Windows Image](repair-a-windows-image.md)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

 

 






