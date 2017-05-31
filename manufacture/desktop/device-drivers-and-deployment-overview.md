---
author: Justinha
Description: Device Drivers
ms.assetid: daa94074-a23d-4788-8e32-0e27c0a62d88
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Device Drivers
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device Drivers


You can add device drivers to a Windows image before, during, or after you deploy the image. When planning how to add drivers to your Windows deployment, it's important to understand how driver folders are added to the image, how driver ranking affects deployment, and the digital signature requirements for drivers.

In this topic:

-   [Adding Drivers](#addingdrivers)

-   [Managing Driver Folders](#drivermgmt)

-   [Understanding Driver Ranking](#driverranking)

-   [Understanding Digital Signature Requirements](#signaturereqs)

-   [Additional Resources](#resources)

## <span id="AddingDrivers"></span><span id="addingdrivers"></span><span id="ADDINGDRIVERS"></span>Adding Drivers


You can add device drivers to a Windows image:

-   [Before deployment on an offline Windows image](#offline)

-   [During an automated deployment](#automated)

-   [After deployment on a running operating system](#online)

For more information, see [Understanding Servicing Strategies](understanding-servicing-strategies.md).

### <span id="offline"></span><span id="OFFLINE"></span>Add drivers before deployment on an offline Windows image by using DISM

Offline servicing occurs when you modify a Windows image entirely offline without booting the operating system. You can add, remove, and enumerate drivers on an offline Windows image by using the DISM command-line tool. DISM is installed with Windows and is also distributed in the Windows Assessment and Deployment Kit (Windows ADK). For more information about DISM, see the [DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md).

When you add a driver to an offline image, it's either staged or reflected in the image:

-   **Boot-critical drivers** are reflected. In other words, the files are copied into the image according to what's specified in the .inf file. The PC completes installation tasks during the initial boot, including updating the Critical Devices Database (CDDB) and the registry.

-   **Drivers that aren't boot critical** are staged. In other words, they're added to the driver store. After Windows starts, PnP detects the device and installs the matching driver from the driver store.

You can use DISM commands to add or remove drivers on a mounted or applied Windows or Windows Preinstallation Environment (Windows PE) image.

**Note**  
You can't use DISM to remove inbox drivers (drivers that are installed on Windows by default). You can use it only to remove third-party or out-of-box drivers.

 

You can also use DISM commands to apply an unattended answer file to a mounted or applied Windows image.

For more information, see [Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md).

If you're using DISM, you can add only .inf drivers to an offline Windows image. Drivers that display the Designed for Windows logo are provided as .cab files. You must expand the .cab file before you install the .inf file if you're using DISM for the installation. You must install a driver that's packaged as a .exe file or another file type on a running Windows operating system. To run a .exe or Windows Installer (.msi) driver package, you can add a custom command to an answer file to install the driver package. For more information, see [Add a Custom Command to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915058).

### <span id="automated"></span><span id="AUTOMATED"></span>Add drivers during an automated deployment by using Windows Setup and an answer file

You can use an unattended answer file to add drivers to an image when you use Windows Setup for deployment. In this answer file, you can specify the path of a device driver on a network share (or a local path). You accomplish this by adding the Microsoft-Windows-PnpCustomizationWinPE or Microsoft-Windows-PnpCustomizationNonWinPE components and specifying the configuration passes where you want to install them. When you run Windows Setup and specify the name of the answer file, out-of-box drivers are staged (added to the driver store on the image), and boot-critical drivers are reflected (added to the image so that they'll be used when the computer boots). Setup uses the answer file. By adding device drivers during the **windowsPE** or **offlineServicing** configuration passes, you can add out-of-box device drivers to the Windows image before the computer starts. You can also use this method to add boot-critical device drivers to a Windows image. For more information, see [Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md). For more information about how Windows Setup works, see the [Windows Setup Technical Reference](windows-setup-technical-reference.md).

If you want to add boot-critical drivers to Windows PE, use the **windowsPE** configuration pass to reflect the drivers before the Windows PE image is booted. The difference between adding boot-critical drivers during the **windowsPE** configuration pass and adding them during the **offlineServicing** configuration pass is that during the **windowsPE** configuration pass, boot-critical drivers are reflected for Windows PE to use. During the **offlineServicing** configuration pass, the drivers are staged to the driver store on the Windows image.

Methods for adding device drivers by using Windows Setup include these:

-   Using an answer file to add drivers during the **offlineServicing** configuration pass of Setup.

-   Using an answer file to add drivers during the **windowsPE** configuration pass of Setup.

-   For Windows Server®, placing drivers in the $WinPEDriver$ directory to be installed automatically during the **windowsPE** configuration pass of Setup. All drive letters with a value of C or greater are scanned for a $WinPEDriver$ directory. The drive must be accessible to the hard disk during Setup. Make sure that the drive does not require a storage driver to be loaded before it can be accessed.

For more information about these and other configuration passes, see [Windows Setup Configuration Passes](windows-setup-configuration-passes.md).

When you're using Windows Deployment Services for deployment in Windows Server, you can add device drivers to your server and configure them to be deployed to clients as part of a network-based installation. You configure this functionality by creating a driver group on the server, adding packages to it, and then adding filters to define which clients will install those drivers. You can configure drivers to be installed based on the client's hardware (for example, manufacturer or BIOS vendor) and the edition of the Windows image that's selected during the installation. You can also configure whether clients install all packages in a driver group or only the drivers that match the installed hardware on the client. For more information about how to implement this functionality, see the Windows Deployment Services documentation.

### <span id="online"></span><span id="ONLINE"></span>Add drivers after deployment on a running operating system by using PnPUtil or an answer file

You can use the PnPUtil tool to add or remove drivers on a running operating system. Alternatively, you can use an answer file to automate the installation of the drivers when the computer is booted in audit mode. These methods can be helpful if you want to maintain a simple Windows image, and then add only the drivers that are required for a specific hardware configuration. For more information about how to use audit mode, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

Methods for adding device drivers online to a running operating system include these:

-   Using PnPUtil to add or remove PnP drivers. For more information, see [Use PnPUtil at a command line to install a Plug and Play device](http://go.microsoft.com/fwlink/?LinkId=139151).

-   Using an answer file to automate the installation of PnP drivers when the computer is booted in audit mode. For more information, see [Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md).

## <span id="DriverMgmt"></span><span id="drivermgmt"></span><span id="DRIVERMGMT"></span>Managing Driver Folders


If you're adding multiple drivers, you should create separate folders for each driver or driver category. This makes sure that there are no conflicts when you add drivers that have the same file name. After the driver is installed on the operating system, it's renamed to Oem\*.inf to ensure unique file names in the operating system. For example, the staged drivers named MyDriver1.inf and MyDriver2.inf are renamed to Oem0.inf and Oem1.inf after they're installed.

When you specify a device-driver path in an answer file, all .inf drivers in the specified directory and subdirectories are added to the driver store of the Windows image, %SystemRoot%\System32\DriverStore\FileRepository. For example, if you want all of the drivers in the C:\\MyDrivers\\Networking, C:\\MyDrivers\\Video, and C:\\MyDrivers\\Audio directories to be available in your Windows image, specify the device-driver path, C:\\MyDrivers, in your answer file. If you're not using an answer file, you can use the **/recurse** command in DISM. For more information about the **/recurse** command, see [DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md). This command makes sure that all drivers in each subdirectory will be added to the driver store in your Windows image.

If all drivers in the specified directory and subdirectories are added to the image, you should manage the answer file or your DISM commands and these directories carefully. Do your best to address concerns about increasing the size of the image through unnecessary driver packages.

If it isn't practical to manage your driver shares so that only the required drivers are added to your image, you can use the Driver Package Installer (DPInst) tool to add drivers that aren't boot critical online. DPInst selectively installs drivers that aren't boot critical only if the hardware is present or if the driver package is a better match for the device.

## <span id="DriverRanking"></span><span id="driverranking"></span><span id="DRIVERRANKING"></span>Understanding Driver Ranking


One of the most common issues in deploying drivers happens when a driver is successfully imported into the driver store but, after the system is online, PnP finds a higher-ranking driver and installs that driver instead.

The Windows PnP manager ranks these driver package properties in order of importance:

1.  Signing

2.  PnP ID match

3.  Driver date

4.  Driver version

For example, if a device has a better PnP ID match but is unsigned, a signed driver that has a compatible ID match takes precedence. An older driver can outrank a newer driver if the older driver has a better PnP ID match or signature.

For more information about driver ranking, see [How Windows Ranks Drivers](http://go.microsoft.com/fwlink/?LinkId=91227).

## <span id="SignatureReqs"></span><span id="signaturereqs"></span><span id="SIGNATUREREQS"></span>Understanding Digital Signature Requirements


Signed device drivers are a key security feature in Windows. Drivers that are installed on x64-based computers must have a digital signature. Although it isn't required, we recommend making sure that drivers are signed before you install them on x86-based computers.

All boot-critical drivers must contain embedded signatures. A digital signature isn't required for Plug and Play (PnP) drivers. But when an unsigned PnP driver is installed on a running operating system, administrator credentials are required, and you can't install such drivers on 64-bit operating systems.

There are two ways that a driver can be signed:

-   Kernel mode and boot-critical drivers are digitally signed via a method called embedded signing. By using embedded signatures, every binary in the driver package is signed. Embedded signatures improve boot loading performance. For drivers that are not PnP, signatures should be embedded so that they're not lost during an upgrade of the operating system.

-   Digitally signed PnP drivers contain a catalog (.cat) file that's digitally signed. The catalog file contains a hash of all the files in the driver's .inf file for installation. A signed catalog file is all that's required to correctly install most PnP drivers.

Either of these sources can sign drivers:

-   Windows Hardware Quality Labs (WHQL), which makes sure that your drivers qualify for the Windows Hardware Certification Program. WHQL creates a signed driver catalog. For boot-critical drivers, you should add embedded signatures instead of relying on the catalog. Embedded signatures in boot-critical driver image files optimize boot performance of the operating system by eliminating the requirement to locate the appropriate catalog file when the operating system loader verifies the driver signature.

-   A certification authority (CA), by using a Software Publishing Certificate (SPC). For boot-critical and x64-based kernel drivers, Microsoft provides an additional certificate that can be used to cross-sign the drivers. Drivers that aren't boot critical don't have to be cross-signed by Microsoft or embedded. You can use the Windows Kernel Mode Code Signing process if you need the flexibility of signing the drivers yourself. For information about digital signatures for kernel modules on x64-based systems, see [64-Bit Driver Guidelines](http://go.microsoft.com/fwlink/?LinkId=529487).

For testing, you can also use test certificates.

If you have received an unsigned driver from a vendor for testing, you can use a test signature to validate the driver and to test the installation. Test signing is the act of digitally signing an application by using a private key and a corresponding code-signing certificate that's trusted only in the confines of a test environment.

These are the primary ways to generate such test-signing certificates:

-   Developers can generate their own self-signed certificates.

-   A CA can issue certificates.

For either option, test-signing certificates must be clearly identified as appropriate only for testing. For example, the word "test" can be included in the certificate subject name, and additional legal disclaimers can be included in the certificate. Production certificates that are issued by commercial CAs must be reserved for signing only public beta releases and public final releases of software and internal line-of-business software.

For more information, see [Requirements for Device Driver Signing and Staging](http://go.microsoft.com/fwlink/?LinkId=210665).

When you're adding test-signed driver packages to Windows, consider these points:

-   You must install the test certificates on a running operating system. You can't install them offline.

-   The certificate of the CA that issued the test certificate must be inserted in the Trusted Root Certification Authorities certificate store.

    **Note**  
    If the test certificate is self-signed—for example, by using the Certificate Creation Tool (MakeCert)—the test certificate must be inserted in the Trusted Root Certification Authorities certificate store.

     

-   The test certificate that's used to sign the driver package must be inserted in the Trusted Publishers certificate store.

-   You must add test certificates online (to a booted instance of the Windows image) before you can use the Deployment Image Servicing and Management (DISM) command-line tool to add test-signed drivers offline.

-   DISM validates WHQL certifications only for boot-critical drivers. But, a DISM command-line option can override this behavior. For more information, see [DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md).

-   To install and verify test-signed drivers on 64-bit operating systems, set the Windows boot configuration to test mode by using the BCDedit tool on the destination computer. Test mode verifies that the driver image is signed, but certificate path validation doesn't require the issuer to be configured as a trusted root authority. For the PnP driver installation and ranking logic to treat the driver correctly, the test certificate must be stored in the trusted certificate store of the operating system image. For information about test mode during development, see [64-Bit Driver Guidelines](http://go.microsoft.com/fwlink/?LinkId=62690).

**Caution**  
If an unsigned or invalid boot-critical device driver is installed on an x64-based computer, the computer will not boot. The unsigned or invalid boot-critical device driver will cause a Stop error. You should remove the driver from either the critical device database (CDDB) or its reflected location in the image. If you're performing an upgrade, make sure that unsigned drivers and their associated applications, services, or devices are removed or updated with a signed driver.

If you don't enable test mode by using BCDedit, and you have a test-signed driver installed, your computer will not boot. If you use DISM to remove the driver, all instances of the reflected driver package might not be removed. So, we recommend that you don't deploy images that have test-signed drivers installed.

 

## <span id="Resources"></span><span id="resources"></span><span id="RESOURCES"></span>Additional Resources


These websites provide more information about device-driver requirements:

-   For more information about PnP driver deployment, see [PnP Device Installation Signing Requirements](http://go.microsoft.com/fwlink/?LinkId=89602).

-   For more information about digital signatures and developing drivers, see the relevant page on the [Windows Hardware Developer Central](http://go.microsoft.com/fwlink/?LinkId=139175) website.

## <span id="related_topics"></span>Related topics


[Add a Device Driver Path to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915062)

[Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md)

[DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md)

[Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[Maintain Driver Configurations when Capturing a Windows Image](maintain-driver-configurations-when-capturing-a-windows-image.md)

[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

[Deployment Troubleshooting and Log Files](deployment-troubleshooting-and-log-files.md)

 

 






