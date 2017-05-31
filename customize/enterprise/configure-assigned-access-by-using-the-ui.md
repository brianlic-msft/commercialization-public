---
title: Configure assigned access
description: Configure assigned access
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4456b4e6-5ef6-4daf-8c7b-a17351d34a55
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure assigned access


An administrator can use assigned access to limit an existing user account to use only one installed Windows app that you choose. This can be useful to set up single-function devices, such as restaurant menus or displays at trade shows.

For more information about assigned access, see [Assigned access](assigned-access.md).

## Prerequisites


You have Windows 10 Pro, Windows 10 Enterprise, or Windows 10 Education installed on your computer.

You have installed the Universal Windows app for the Assigned Access user account, following this procedure:

1.  Log in as administrator.
2.  Create a user account for assigned access.
    **Note**  Starting with Windows 10, version 1607, the user account for assigned access must be a local standard user account if you are configuring assigned access using Settings or Powershell. The same restriction does not apply if you are using the [Assigned Access CSP](https://msdn.microsoft.com/en-us/library/windows/hardware/mt158258.aspx).

     

3.  Log in as the assigned access user account.
4.  Install the Universal Windows app that follows guidance in [Kiosk apps for assigned access: Best practices](https://msdn.microsoft.com/en-us/windows/hardware/drivers/partnerapps/create-a-kiosk-app-for-assigned-access).
5.  Log out as the assigned access user account.
6.  Log in as administrator.

## Configure assigned access using Settings


1.  In the Search the web and Windows field, type **Settings**, and either press **Enter** (when Settings is highlighted) or tap or click **Settings**.
2.  Tap or click **Accounts**.
3.  Tap or click **Other users**, and then tap or click **Set up assigned access**.
4.  On the **Set Up Assigned access** page, perform the following steps:

    -   Tap or click **Choose an account**, and then click the account you want to use for assigned access. The selected account now displays in the **Choose which account will have assigned access** area.
        **Note**  If there is only one active account on the device, a dialog will display indicating you need to add or create a new account. To add or create a new account, click **Other users** to add other users.

         

    -   Tap or click **Choose an app**, and then choose the app that you want to start when the selected user signs in. The selected app now displays in the **Choose which app this account can access** area.
        **Warning**  
        You must have installed a store app with an uap extension windows.aboveLockScreen in order to have apps show up in the list.

         

5.  To start assigned access, log off the assigned access user account then re-log in.

## Configure assigned access using PowerShell


By using a Windows PowerShell cmdlet, you can configure assigned access to limit an existing user account to use only one installed Windows app that you choose. This can be useful to set up single-function devices, such as for a restaurant menu or a display at a trade show.

You can identify the user by one of the following:

-   User name of the user account name to use for assigned access.
-   User security identifier (SID) for the user to use for assigned access.

You can identify the Windows app by one of the following:

-   App name that is the friendly name of the installed Windows app to use for assigned access. Wildcard characters are accepted.
-   Application User Model ID (AUMID) for the installed Windows app to use for assigned access. For information on finding the AUMID, see [Find the Application User Model ID of an installed app](find-the-application-user-model-id-of-an-installed-app.md).

**To configure assigned access by user name and AppUserModelID**

-   At a Windows PowerShell prompt, type the following:

    ``` syntax
    Set-AssignedAccess -AppUserModelId microsoft.windows.photos_8wekyb3d8bbwe!app -UserName <username>
    ```

**To configure assigned access by user name and app name**

-   At a Windows PowerShell prompt, type the following, using the app name and user name:

    ``` syntax
    Set-AssignedAccess -AppName CustomApp -UserName <username>
    ```

**To configure assigned access by user SID and AppUserModelID**

-   At a Windows PowerShell prompt, type the following, using the AppUserModelID and user SID:

    ``` syntax
    Set-AssignedAccess -AppUserModelId microsoft.windows.photos_8wekyb3d8bbwe!app -UserSID S-1-5-21-523423449-2432423479-234123443-1004
    ```

**To configure assigned access by app name and user SID**

-   At a Windows PowerShell prompt, type the following, using the desired app name and user SID:

    ``` syntax
    Set-AssignedAccess -AppName CustomApp  -UserSID S-1-5-21-523423449-2432423479-234123443-1004
    ```

## <a href="" id="turn-off-aa"></a>


**To turn assigned access off**

1.  In the Search the web and Windows field, type **Settings**, and either press **Enter** (when Settings is highlighted) or tap or click **Settings**.
2.  Tap or click **Accounts**.
3.  Tap or click **Other users**, and then tap or click **Set up assigned access**.
4.  Tap or click **Choose a user account**. The Choose an account dialog opens with a list of accounts whose accounts are restricted by assigned access.

    Select the account you want remove assigned access and then tap or click **Don’t use assigned access**.

5.  To apply the change, log off the assigned access user account then re-log in.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Configure%20assigned%20access%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




