---
author: Justinha
Description: 'Enable .NET Framework 3.5 by using the Add Roles and Features Wizard'
ms.assetid: 08b011c7-7f15-4fd5-9a19-c99249e4f642
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Enable .NET Framework 3.5 by using the Add Roles and Features Wizard'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable .NET Framework 3.5 by using the Add Roles and Features Wizard


You can use Server Manager to enable .NET Framework 3.5 for a local or remote installation of Windows Server 2012 R2.

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


-   Windows Server 2012 R2

-   Installation media

-   Administrator user rights. The current user must be a member of the local Administrators group to add or remove Windows features.

-   Target Computers might need network access and rights to use either alternate sources or an Internet connection to use Windows Update.

## <span id="Steps"></span><span id="steps"></span><span id="STEPS"></span>Steps


1.  In Server Manager, click **Manage** and then select **Add Roles and Features** to start the Add Roles and Features Wizard.

2.  On the **Select installation type** screen, select **Role-based or feature-based installation**.

3.  Select the target server.

4.  On the **Select features** screen, check the box next to **.Net Framework 3.5 Features**.

5.  On the **Confirm installation selections** screen, a warning will be displayed asking **Do you need to specify an alternate source path?**. If the target computer does not have access to Windows Update, click the **Specify an alternate source path** link to specify the path to the **\\sources\\sxs** folder on the installation media and then click **OK**. After you have specified the alternate source, or if the target computer has access to Windows Update, click the **X** next to the warning, and then click **Install**.

    If you are using Server Manager in Windows Server 2012 to add a role or feature to a remote server, the remote server’s computer account (DOMAIN\\ComputerName$) requires access to the alternate source file path because the deployment operation runs in the SYSTEM context on the target server.

## <span id="related_topics"></span>Related topics


[Microsoft .NET Framework 3.5 Deployment Considerations](microsoft-net-framework-35-deployment-considerations.md)

 

 






