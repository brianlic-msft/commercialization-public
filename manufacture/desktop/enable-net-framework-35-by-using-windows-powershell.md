---
author: Justinha
Description: 'Enable .NET Framework 3.5 by using Windows PowerShell'
ms.assetid: af189974-cffa-46d9-950a-40f5e28d378f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Enable .NET Framework 3.5 by using Windows PowerShell'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable .NET Framework 3.5 by using Windows PowerShell


For a Windows Server® 2012 core installation that is not connected to the Internet, you can use Windows PowerShell to add .NET Framework 3.5 and provide access to the **\\sources\\sxs** folder on the installation media. The **\\sources\\sxs** folder can be copied to network share (for example, \\\\network\\share\\sxs) to make it easily accessible to multiple computers. The target computer account DOMAIN\\SERVERNAME$ must have at least read access to the network share.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


-   Windows Server 2012

-   Installation media

-   Administrator user rights. The current user must be a member of the local Administrators group to add or remove Windows features.

-   Target Computers might need network access and rights to use either alternate sources or an Internet connection to use Windows Update.

## <span id="Steps"></span><span id="steps"></span><span id="STEPS"></span>Steps


1.  Start Windows PowerShell in the Administrator Command Prompt by typing:

    ``` syntax
    powershell
    ```

2.  To install .NET Framework 3.5 from installation media located on a network share, use the following command:

    ``` syntax
    Install-WindowsFeature Net-Framework-Core -source \\network\share\sxs
    ```

    Where *\\\\network\\share\\sxs* is the location of the source files.

    For more information about the Install-WindowsFeature cmdlet, see [Install-WindowsFeature](http://go.microsoft.com/fwlink/p/?linkid=329977).

3.  To verify installation, run the following command:

    ``` syntax
    Get-WindowsFeature
    ```

    The **Install State** column should show **Installed** for the **.NET Framework 3.5 (includes .NET 2.0 and 3.0)** feature.

## <span id="related_topics"></span>Related topics


[Microsoft .NET Framework 3.5 Deployment Considerations](microsoft-net-framework-35-deployment-considerations.md)

 

 






