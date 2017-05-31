---
author: themar
Description: 'Where is DISM?'
ms.assetid: c7be3027-8aef-4a28-9a68-76d1e14db32b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Where is DISM?'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Where is DISM?


Deployment Image Servicing and Management (DISM.exe) is a command-line tool that can be used to service a Windows image or to prepare a Windows Preinstallation Environment (Windows PE) image. For more information about DISM see [What is DISM?](what-is-dism.md)


## DISM in Windows 10

DISM comes with Windows 10, in the `c:\windows\system32` folder. You can use DISM from a Command prompt running as administrator.

## DISM in the ADK

If you are running an older version of Windows, or you need a different version of DISM on your PC, download and install the Windows Assessment and Deployment Kit (Windows ADK), see [Windows Assessment and Deployment Kit (Windows ADK) Technical Reference](http://go.microsoft.com/fwlink/p/?LinkId=526740).

DISM appears in the Windows ADK here: `C:\Program Files (x86)\Windows Kits\<version>\Assessment and Deployment Kit\Deployment Tools\<arch>\DISM`

where &lt;version&gt; can be **8.0**, **8.1**, or **10**, and &lt;arch&gt; can be **x86** or **amd64**.

If you need to copy and ADK version of DISM to a PC that does not have the ADK, see [Copy DISM to another computer](copy-dism-to-another-computer.md).

## <span id="related_topics"></span>Related topics


[What is DISM?](what-is-dism.md)

[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

[Copy DISM to another computer](copy-dism-to-another-computer.md)

 






