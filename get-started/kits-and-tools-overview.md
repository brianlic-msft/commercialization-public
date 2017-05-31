---
title: Kits and tools overview
description: An overview of the kits and tools needed for developing with Windows 10 Mobile and Windows 10.
ms.assetid: F0055AF7-D679-4BC6-94C8-2FCD5832B9D8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Kits and tools overview


These kits and tools are available for use with Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) and Windows 10 Mobile for development and manufacturing.

Learn about known issues and workarounds for this release in our [WinHEC forums](http://go.microsoft.com/fwlink/p/?LinkId=526372).

## Microsoft Visual Studio 2015


[Install Microsoft Visual Studio 2015](http://go.microsoft.com/fwlink/p/?LinkId=526729)

Start by downloading Visual Studio 2015 and Microsoft Visual Studio Tools for Windows 10. Used together, Microsoft Visual Studio, Visual Studio Tools for Windows 10, standalone Windows Software Development Kit (SDK) for Windows 10, and Windows Driver Kit (WDK) 10 provide an integrated development environment for creating efficient, high-quality drivers for devices running Windows 10.

## Standalone Windows SDK for Windows 10


[Install the Standalone Windows SDK for Windows 10](https://go.microsoft.com/fwlink/p/?LinkID=845298)

Windows SDK for Windows 10 contains headers, libraries, and tools you can use when you create apps that run on Windows operating systems. You can use the Windows SDK for Windows 10, along with your chosen development environment, to write apps for Windows 10 for desktop editions and Windows 10 Mobile.

## WDK 10


[Install the Windows Driver Kit (WDK) 10](https://developer.microsoft.com/windows/hardware/windows-driver-kit)

[Download Universal Windows driver samples](http://go.microsoft.com/fwlink/p/?LinkId=526735)

WDK 10 contains the tools to build, test, debug, and deploy drivers for Windows 10. WDK 10 unifies support for mobile and desktop devices, Universal Windows drivers, and, with Visual Studio, provides a unified test experience with reliable deployment and debug provisioning that includes WinDbg. You can run many basic certification tests in the integrated environment. The WDK 10 includes templates for several technologies and driver models, including Windows Driver Frameworks (WDF), Universal Serial Bus (USB), print, networking, and file system filters. WDK 10 also supports Windows 7, Windows 8, and Windows 8.1 driver development.

For more information about driver development for Windows 10, see [What's new in Universal Windows driver development](https://msdn.microsoft.com/windows/hardware/drivers/what-s-new-in-driver-development) and [What's new in kits and tools](what-s-new-in-kits-and-tools.md).

## Enterprise WDK (EWDK)

The Enterprise WDK (EWDK) is a kit that large organizations can use as an alternative to downloading and installing the SDK and WDK individually on each computer. The EWDK has a command-line build environment that is based on files and is not computer-dependent, so after the environment file structure has been created, it can be distributed for direct use, such as through version control software or by zipping the contents and unzipping on other computers. It contains the necessary elements to build *Windows Driver Model* (WDM) drivers, WDF drivers, and classic Windows test applications.

## Windows symbols


Symbol files make it easier to debug your code. The easiest way to get Windows symbols is to use the [Microsoft Symbol Server](http://support.microsoft.com/kb/311503/). If you prefer to download the entire set of symbols for a particular version of Windows, [download a symbol package](http://go.microsoft.com/fwlink/?LinkId=528570).

## Windows Hardware Lab Kit (HLK) for Windows 10


[Download the HLK for Windows 10](http://go.microsoft.com/fwlink/p/?LinkId=532718)

The Windows Hardware Lab Kit (HLK) for Windows 10 is an all-purpose test and measurement kit to help you determine how well your hardware interacts with Windows. The HLK provides a test infrastructure for PCs. For more information on the using the HLK with Windows 10, see [Windows Hardware Lab Kit User's Guide](https://msdn.microsoft.com/library/windows/hardware/dn939963.aspx).

## HLK supplemental test content


Some tests, like graphics and multimedia tests, require additional files for testing. You can find this content in the **Windows HLK supplemental media test content** section on the [Download the Windows HLK, HCK, or Logo Kit](http://go.microsoft.com/fwlink/p/?LinkId=532718) page.

## ADK for Windows 10


[Download the ADK for Windows 10](https://developer.microsoft.com/windows/hardware/windows-assessment-deployment-kit)

Download the Windows ADK to install tools and documentation for OEMs and ODMs to customize Windows 10 images, assess the quality and performance of systems or components, and to deploy Windows operating systems to new computers. The Windows ADK includes Windows Configuration Designer, the Windows Assessment Toolkit, the Windows Performance Toolkit, and several new and improved deployment tools that can help you automate a large-scale deployment of Windows 10. For more information, see [What’s new in kits and tools](what-s-new-in-kits-and-tools.md).


## What else is new?
See [What's new in kits and tools](what-s-new-in-kits-and-tools.md)

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_getstarted\p_getstarted%5D:%20Kits%20and%20tools%20overview%20%20%20RELEASE:%20%286/15/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




