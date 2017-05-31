---
author: Justinha
Description: 'Microsoft .NET Framework 3.5 Deployment Considerations'
ms.assetid: c231ba55-4181-47c0-bd16-f63e428f555f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Microsoft .NET Framework 3.5 Deployment Considerations'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft .NET Framework 3.5 Deployment Considerations


.NET Framework 3.5 is not included by default in Windows 10 or Windows Server 2016, but you can download and deploy it for application compatibility. This section describes these deployment options.

**In this section:**

-   [Deploy .NET Framework 3.5 by using Group Policy Feature on Demand setting](deploy-net-framework-35-by-using-group-policy-feature-on-demand-setting.md)
-   [Deploy .NET Framework 3.5 by using Deployment Image Servicing and Management (DISM)](deploy-net-framework-35-by-using-deployment-image-servicing-and-management--dism.md)
-   [Enable .NET Framework 3.5 by using Windows PowerShell](enable-net-framework-35-by-using-windows-powershell.md)
-   [Enable .NET Framework 3.5 by using Control Panel and Windows Update (Windows 8 only)](enable-net-framework-35-by-using-control-panel-and-windows-update--windows-8-only.md)
-   [Enable .NET Framework 3.5 by using the Add Roles and Features Wizard](enable-net-framework-35-by-using-the-add-roles-and-features-wizard.md)
-   [.NET Framework 3.5 deployment errors and resolution steps](net-framework-35-deployment-errors-and-resolution-steps.md)

## <span id="Introduction"></span><span id="introduction"></span><span id="INTRODUCTION"></span>Introduction


Windows 10 or Windows Server 2016 include .NET Framework 4.6, which is an integral Windows component that supports building and running the next generation of applications and web services. The .NET Framework provides a subset of managed types that you can use to create Windows Store apps for Windows by using C\# or Visual Basic. For more information, see [.NET Framework](http://go.microsoft.com/fwlink/p/?linkid=329972).

Only the metadata that is required to enable the .NET Framework 3.5 is contained in the default Windows image **(\\sources\\install.wim**). The actual binaries are not in the image. This feature state is known as *disabled with payload removed*.

You can get the .NET Framework 3.5 payload files from Windows Update or the installation media in the **\\sources\\sxs** folder. For more information, see [Installing the .NET Framework 3.5](http://go.microsoft.com/fwlink/p/?linkid=257556). After the .NET Framework 3.5 feature is enabled, the files are serviced just like other operating system files from Windows Update.

If you upgrade from Windows 7 (which includes .NET Framework 3.5.1 [by default](http://blogs.msdn.com/b/e7/archive/2009/03/06/beta-to-rc-changes-turning-windows-features-on-or-off.aspx)) to Windows 10, or from Windows Server 2008 R2 (which has .NET Framework 3.5.1 feature installed) to Windows Server 2016, .NET Framework 3.5 is automatically enabled.

If you have feedback about this topic, please visit the appropriate Microsoft forum:

-   [Windows IT Pro](http://social.technet.microsoft.com/Forums/windows/home?category=w8itpro)
-   [Windows Server](http://social.technet.microsoft.com/Forums/windowsserver/home?category=windowsserver)
-   [Windows Store apps](http://social.msdn.microsoft.com/Forums/windowsapps/home?category=windowsapps)

## <span id="related_topics"></span>Related topics


[Windows Server Installation Options](http://go.microsoft.com/fwlink/p/?linkid=251454)

 

 






