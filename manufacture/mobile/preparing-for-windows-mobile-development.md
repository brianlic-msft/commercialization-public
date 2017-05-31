---
Description: 'Here''s what you''ll need to start customizing, testing, and deploying Windows on mobile devices.'
ms.assetid: 57bc2066-0b27-4fcb-b938-1c73a361b212
MSHAttr: 'PreferredLib:/library'
title: Prepare for Windows mobile development
author: CelesteDG
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Prepare for Windows mobile development


Here's what you'll need to start customizing, testing, and deploying Windows on mobile devices.

## <span id="meet_all_the_prerequisites"></span><span id="MEET_ALL_THE_PREREQUISITES"></span>Step 1: Meet all the prerequisites


Before you can get started on your Windows mobile development, make sure you meet these requirements:

-   You have access to the Microsoft Connect site where mobile partners can download the latest mobile OS kits and packages.

    If you don't have access or need more information, contact your Microsoft representative.

-   A development workstation or technician computer

    This PC will run the tools needed during the development process. The PC must be running one of the following operating systems:

    -   Windows 10 32-bit (x86) or 64-bit (x64)
    -   Windows 8.1 32-bit (x86) or 64-bit (x64)
    -   Windows 7 32-bit (x86) or 64-bit (x64)

    You must install all Windows critical updates to avoid any issues when using the mobile kits.

-   Uninstall earlier versions of the tools and kits

    If you are using a different version of the tools and kits other than the ones listed in the *Pairing information* section of the kit release notes, you first need to uninstall all of the programs associated with these components.

-   Download the kits and OS packages

    Download the latest kits and tools for Windows 10 Mobile from the Microsoft Connect site. See Contents of the mobile build to learn more about the contents of the MobileOS kit for different silicon architectures.

-   Reference mobile hardware

    This mobile device should represent all the mobile devices in a single model line; for example, the Contoso Windows Phone. For more information about detailed hardware requirements for any device that runs Windows 10 Mobile, see *Section 2.0 - Minimum hardware requirements for Windows 10 Mobile* in [Minimum hardware requirements](https://msdn.microsoft.com/library/windows/hardware/dn915086).

-   Board support package (BSP) prerequisites

    Make sure you have all the necessary BSP files for your reference hardware. A BSP is a set of files and drivers that Windows 10 Mobile uses to communicate with the hardware on the device, to launch the OS, and to create an OS image that can run on your reference hardware. The SoC vendor provides the BSP for your reference hardware.

## <span id="install_the_tools_and_development_kits"></span><span id="INSTALL_THE_TOOLS_AND_DEVELOPMENT_KITS"></span>Step 2: Install the tools and development kits


The following kits and tools are used for Windows mobile development:

-   Visual Studio 2015, which is your primary development environment for writing apps and drivers.

-   Windows 10 Mobile OS, which is contained in the MobileOS package.

-   Windows Assessment and Deployment Kit (ADK), which contains the tools you can use for building and customizing your image as well as several other deployment tools that you can use to help you automate a large-scale deployment of Windows.

-   Windows Driver Kit (WDK) and Windows 10 Standalone SDK, which you can install separately or install the Enterprise WDK (EWDK), which contains a version of the driver kit and SDK.

-   Windows Hardware Lab Kit (HLK), which is a test framework you can use to test hardware devices for Windows.

The following table specifies which development scenarios require each of the kits and tools.

| Development scenario                                                                   | MobileOS kit | Windows ADK  | Windows Standalone SDK | WDK          | Visual Studio 2015 |
|----------------------------------------------------------------------------------------|--------------|--------------|------------------------|--------------|--------------------|
| Compile code that runs on the mobile device (for example, drivers, services, and apps) | Required     | Required     | Required               | Required     | Required           |
| Build packages                                                                         | Not required | Required     | Not required           | Not required | Not required       |
| Sign binaries and packages                                                             | Not required | Required     | Not required           | Not required | Not required       |
| Build and customize mobile images on the command line using ImgGen                     | Required     | Not required | Required               | Required     | Not required       |
| Build and customize mobile images using Windows ICD                                    | Required     | Required     | Not required           | Not required | Not required       |

 

**To install the kits and tools**

1.  Follow the instructions for downloading and installing [Visual Studio 2015](https://go.microsoft.com/fwlink/p/?LinkId=533470), the [Windows Driver Kit (WDK) 10](https://go.microsoft.com/fwlink/p/?LinkId=733614), and the [Windows 10 SDK](https://go.microsoft.com/fwlink/p/?LinkId=616887).

    **Note**  Visual Studio 2015 is only required if you are compiling code that will run on the mobile device, such as drivers and apps.

     

    To confirm that the Windows SDK was properly installed, make sure that the subdirectories listed in the following table exist on your technician PC. Some of these subdirectories may not appear in the kit install directory if you didn't select them from the Windows SDK install wizard.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Windows installation directory tree</th>
    <th align="left">Subdirectories within the directory tree</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>For a 32-bit OS: <strong>C:\Program Files\Windows Kits\10</strong></p>
    <p>For a 64-bit OS: <strong>C:\Program Files (x86)\Windows Kits\10</strong></p></td>
    <td align="left"><ul>
    <li><strong>Bin</strong></li>
    <li><strong>Catalogs</strong></li>
    <li><strong>Debuggers</strong></li>
    <li><strong>DesignTime</strong></li>
    <li><strong>Include</strong></li>
    <li><strong>Lib</strong></li>
    <li><strong>Redist</strong></li>
    <li><strong>References</strong></li>
    <li><strong>Shortcuts</strong></li>
    <li><strong>Testing</strong></li>
    </ul></td>
    </tr>
    </tbody>
    </table>

     

    To confirm that the WDK was properly installed, make sure that the subdirectories listed in the following table exist on your technician PC.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Windows installation directory tree</th>
    <th align="left">Subdirectories within the directory tree</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>For a 32-bit OS: <strong>C:\Program Files\Windows Kits\10</strong></p>
    <p>For a 64-bit OS: <strong>C:\Program Files (x86)\Windows Kits\10</strong></p></td>
    <td align="left"><ul>
    <li><strong>Build</strong></li>
    <li><strong>BuildLabSupport</strong></li>
    <li><strong>CodeAnalysis</strong></li>
    <li><strong>CrossCertificates</strong></li>
    <li><strong>Debug</strong></li>
    <li><strong>Help</strong></li>
    <li><strong>Remote</strong></li>
    <li><strong>Tools</strong></li>
    </ul></td>
    </tr>
    </tbody>
    </table>

     

2.  Install the [Windows 10 ADK](http://go.microsoft.com/fwlink/p/?LinkId=526740).

    Ensure that the **Install Path** is set to the kit install directory, **C:\\Program Files\\Windows Kits\\10** (for a 32-bit OS) or **C:\\Program Files (x86)\\Windows Kits\\10** (for a 64-bit OS).

    In the **Select the features you want to install** page, select the following:

    -   **Deployment Tools**
    -   **Windows Preinstallation Environment (Windows PE)**
    -   **Imaging and Configuration Designer (ICD)**
    -   **Configuration Designer**
    -   **User State Migration Tool (USMT)**

    To confirm that the Windows ADK was properly installed, make sure that the **Assessment and Deployment Kit** appears under your Windows installation directory.

3.  Download the latest mobile OS kits and packages from the Microsoft Connect site and copy the contents to a local directory on your development workstation.

    The kits and packages contain the files and tools you need to build a Windows 10 Mobile image.

4.  Extract the packages and files to the kit install location.

    1.  Unzip the MobileOS-arm-fre.zip package.
    2.  Open the extracted package and copy all the subfolders and their contents to the kit install directory, **C:\\Program Files\\Windows Kits\\10** (for a 32-bit OS) or **C:\\Program Files (x86)\\Windows Kits\\10** (for a 64-bit OS). The folders should be: FieldMedic, FMFiles, MSPackages, OEMCustomization, and OEMInputSamples.

5.  In the **OEM** folder, double-click **Setup.exe** to install the following mobile components:

    -   Windows Phone Driver Kit (WPDK)
    -   Debugger symbols
    -   Windows Hardware Lab Kit content for phone
    -   Test Shell (TShell)
    -   Core OS packages

## <span id="install_other_tools"></span><span id="INSTALL_OTHER_TOOLS"></span>Step 3: Install other tools


You can install some tools separately from the mobile kit. These tools, which are contained in the IHV\_Tools folder, are listed below.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Installer package</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>WP_CPTT_NT-x86-fre.msi</p></td>
<td align="left"><p>The Windows phone common packaging and test tools.</p></td>
</tr>
<tr class="even">
<td align="left"><p>WP8KDConn.msi</p></td>
<td align="left"><p>The KDBG Connectivity package, which contains the following components:</p>
<ul>
<li><p>Virtual Ethernet tool (VirtEth.exe)</p></li>
<li><p>Virtual network driver (the Virtual PC 2007 filter, VmNetSrv), which is required for the Virtual Ethernet tool unless Virtual PC 2007 is already installed; the user will be prompted to install two unsigned drivers.</p></li>
<li><p>USB serial drivers (usb2ethernet and usbcompcom)</p></li>
<li><p>USB debugger drivers (usb2dbg); the user will be prompted to install one signed driver.</p></li>
</ul>
<p>The virtual network driver is installed in the %ProgramFiles%\Microsoft Virtual PC\Utility\VMNetSrv (or %ProgramFiles(x86)%\Microsoft Virtual PC\Utility\VMNetSrv for a 64-bit OS) directory.</p>
<p>The other three components are installed in the %ProgramFiles%\Microsoft Windows Phone 8 KDBG Connectivity (or %ProgramFiles(x86)%\Microsoft Windows Phone 8 KDBG Connectivity for a 64-bit OS) directory tree, with the virtual Ethernet tool in the bin subdirectory, the USB serial drivers in the drivers\Usb2Eth subdirectory, and the USB debugger drivers in the drivers\Usb2Dbg subdirectory.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>TShell.msi</p></td>
<td align="left"><p>The Test Shell, which is a set of command-line tools for use in the bring-up and testing of a mobile device. You can use TShell for tasks such as copying files to the mobile device and to view logs.</p></td>
</tr>
</tbody>
</table>

 

## <span id="set_up_environment_variables"></span><span id="SET_UP_ENVIRONMENT_VARIABLES"></span>Step 4: Set up environment variables


Follow the steps below to set up the environment variables that are required for a working build environment.

**To set up a build environment in Visual Studio 2015**

1.  Open a **Developer Command Prompt for VS2015** window.

2.  Set the WPDKCONTENTROOT environment variable to the location of the Windows 10 Mobile kit installation directory.

    -   For computers running a 32-bit version of Windows, by default this is %ProgramFiles%\\Windows Kits\\10.

        **set WPDKCONTENTROOT=%ProgramFiles%\\Windows Kits\\10**

    -   For computers running a 64-bit version of Windows, by default this is %ProgramFiles(x86)%\\Windows Kits\\10.

        **set WPDKCONTENTROOT=%ProgramFiles(x86)%\\Windows Kits\\10**

3.  Set the WDKCONTENTROOT environment variable to the location of the WDK kit installation directory.

    -   For computers running a 32-bit version of Windows, by default this is %ProgramFiles%\\Windows Kits\\10.

        **set WDKCONTENTROOT=%ProgramFiles%\\Windows Kits\\10**

    -   For computers running a 64-bit version of Windows, by default this is %ProgramFiles(x86)%\\Windows Kits\\10.

        **set WDKCONTENTROOT=%ProgramFiles(x86)%\\Windows Kits\\10**

4.  Add the x86 tools directory for the Windows kits and the Windows kit tools directory to the PATH environment variable.

    **set PATH=%PATH%;%WDKCONTENTROOT%\\bin\\x86;%WPDKCONTENTROOT%\\Tools\\bin\\i386**

## <span id="install_OEM_test_certs"></span><span id="install_oem_test_certs"></span><span id="INSTALL_OEM_TEST_CERTS"></span>Step 5: Install OEM test certs


To sign binaries and packages, you must install the OEM test certificates.

**To install OEM test certs**

-   After ensuring that WPDKCONTENTROOT is set to the path of the kit install location, run InstallOEMCerts.cmd by using the following command:

    **%WPDKCONTENTROOT%\\tools\\bin\\i386\\InstallOEMCerts.cmd**

    For more information, see [Set up the signing environment](https://msdn.microsoft.com/library/windows/hardware/dn756804).

 

 



