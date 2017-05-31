---
author: Justinha
Description: Sideload Apps with DISM
ms.assetid: ce95f34a-b9a4-4130-89ed-b7a7126fe21b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Sideload Apps with DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sideload Apps with DISM


You can sideload line-of-business (LOB) Windows apps to a Windows 10 by using PowerShell or Deployment Image Servicing and Management (DISM). Windows apps include:

-   Universal Windows apps devices: Windows apps built upon the Universal Windows app platform, targeting the universal device family.
-   Universal Windows 8 apps: Windows apps that target Windows 8.x.

Typically, Windows apps are available only through the Windows Store. You can submit LOB Windows apps to the Windows Store and make them available outside of your enterprise. However, you can also develop Windows apps for use only within your enterprise and add them to Windows devices you manage through a process we call *sideloading*. Sideloaded apps do not have to be certified by or installed through the Windows Store.

Here’s what you’ll need to know in order to sideload apps:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">How to?</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>[Understand Sideloading Concepts](#understandingconcepts)</p></td>
<td align="left"><p>Introduces some basic concepts you’ll need to know about sideloading apps.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[Configure PCs for Sideloading Requirements](#sideloadingrequirements)</p></td>
<td align="left"><p>Shows the requirements to be met in order to sideload apps on devices running different Windows Editions. Includes how to use Group Policy to configure your enterprise PCs for sideloading apps.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[Configure PCs for Developing Windows Store Apps](#bkmk_developerlicense)</p></td>
<td align="left"><p>Shows you how to configure your PC to have a developer license that does not expire. The PC can be used to develop Windows Store apps or enterprise apps that will be added to your enterprise devices.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[Add Apps](#addapps)</p></td>
<td align="left"><p>Shows you how to sideload apps that you develop.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[Add Multiple Languages for Apps](#bkmk_mulitlang)</p></td>
<td align="left"><p>Shows you how to prepare a multi-lingual image, sign-in to the image, install any desired app resource packs (including language) and then use Copy Profile to capture the image.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[Inventory Apps](#inventoryapps)</p></td>
<td align="left"><p>Shows you how to list the LOB apps installed on the devices in your enterprise or in an offline Windows image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[Remove Apps](#removeapps)</p></td>
<td align="left"><p>Shows you how to remove individual instances of an app or remove the provisioning setting of an app.</p></td>
</tr>
</tbody>
</table>

 

## <span id="UnderstandingConcepts"></span><span id="understandingconcepts"></span><span id="UNDERSTANDINGCONCEPTS"></span>


**Understand Sideloading Concepts**

Windows apps differ from Windows desktop applications in their design and in the way users can interact with them. To learn more about Windows apps , see [what is a Windows Store App?](http://go.microsoft.com/fwlink/?LinkId=264710).

You cannot sideload an app that has been downloaded from the Windows Store. To install Windows apps that are not part of your business line, you must use the Windows Store. To learn more, see [Managing Client Access to the Windows Store](http://go.microsoft.com/fwlink/?LinkId=264712).

LOB Windows apps that are not signed by the Windows Store can be sideloaded or added to a PC in the enterprise through scripts at runtime on a per-user basis. They can also be provisioned in an image by the enterprise so that the app is registered to each new user profile that's created on the PC. The requirements to sideload the app per-user or in the image are the same, but the Windows PowerShell cmdlets you use to add, get, and remove the apps are different. This topic provides steps for both methods.

Before you can sideload LOB Windows apps that are not signed by the Windows Store, you will need to configure the PC, see [Configure PCs for Sideloading Requirements](#sideloadingrequirements).

**When You’re Developing LOB Windows apps for Your Enterprise**

LOB Windows apps that are not signed by the Windows Store must be cryptographically signed. The apps can only be installed on a computer that trusts the signing certificate.

For more information about how to sign an app and using certificates, see [App Packaging Tools](http://go.microsoft.com/fwlink/?LinkId=242873).

However, you can use a developer license to add apps that are in development to your PC. For more information about testing apps that are in development, see [Get a Developer License](http://go.microsoft.com/fwlink/?LinkId=241313).

You can use Group Policy to configure your domain-joined PCs to have a developer license that does not expire to support app development. Once the PCs are configured, you won’t need to connect to the Internet to obtain or renew a license. See [Configure PCs for Developing Windows Store Apps](#bkmk_developerlicense) for more information.

## <span id="SideloadingRequirements"></span><span id="sideloadingrequirements"></span><span id="SIDELOADINGREQUIREMENTS"></span>Configure PCs for Sideloading Requirements


Until the device meets all of the sideloading requirements, app tiles on the Start menu will show an "X" in the bottom-right corner to indicate that a problem is preventing the app from running.

In some cases, part of those requirements includes using a sideloading product key. This key provides use rights needed to deploy Windows 8, or Windows 8.1 apps directly to devices without having to install them through the public Windows Store.

Before you can add and run sideloaded LOB Windows apps that are not signed by the Windows Store you must configure your device based on the following conditions:

1.  For those devices that are joined to a workgroup, you must:

    -   Activate the sideloading product key on the device.

    -   And enable the **Allow all trusted applications to install** Group Policy setting. See [Use Group Policy to configure your enterprise PCs for sideloading apps](#usegp).

    This applies to:

    -   Windows 10 Enterprise
    -   Windows 8.1 Enterprise
    -   Windows 8 Enterprise
    -   Windows Embedded 8.1 Industry Enterprise
    -   Windows 8.1 Pro Update

2.  For those devices that will be joined to an Active Directory domain, you must:

    -   Join the device to an Active Directory domain.

    -   And enable the **Allow all trusted applications to install** Group Policy setting. See [Use Group Policy to configure your enterprise PCs for sideloading apps](#usegp).

    This applies to:

    -   Windows 10 Enterprise
    -   Windows 8.1 Enterprise
    -   Windows 8 Enterprise
    -   Windows Embedded 8.1 Industry Enterprise
    -   Windows 8.1 Pro Update
    -   Windows Server 2016 Technical Preview
    -   Windows Server 2012 R2 Update
    -   Windows Server 2012

3.  For those devices that will require a sideloading product key, whether the device is domain-joined or a member of a workgroup, you must:

    -   Activate the sideloading product key on the device.

    -   And enable the **Allow all trusted applications to install** Group Policy setting. See [Use Group Policy to configure your enterprise PCs for sideloading apps](#usegp).

    This applies to:

    -   Windows 10 Pro
    -   Windows RT 8.1
    -   Windows 8.1 Pro
    -   Windows RT
    -   Windows 8 Pro
    -   Windows Embedded 8.1 Industry Pro

4.  For certain Windows Embedded 8 Industry devices, you no longer need a sideloading product key whether the device is domain-joined or a member of a workgroup. In this case, you must:

    -   Enable the **Allow all trusted applications to install** Group Policy setting on the device.

    For more information about sideloading on Windows Embedded 8 Industry, see [Enterprise guide to installing Universal Windows 8 apps on Windows Embedded 8 Industry](http://go.microsoft.com/fwlink/?LinkId=391812).

    This applies to:

    -   Windows Embedded 8.1 Industry Pro Update
    -   Windows Embedded 8.1 Industry Enterprise Update

<span id="UseGP"></span><span id="usegp"></span><span id="USEGP"></span>
**Use Group Policy to configure your enterprise PCs for sideloading apps**

1.  Open the Group Policy Management Editor for a domain—based Group Policy Object (GPO) to which you will be applying the group policy setting, as specified below, to your selected PCs.

    **Note**  
    The steps provided in this procedure assume you understand the basics of Group Policy design and operations. To administer domain—based Group Policy on a Windows 8.1 PC, you will need to install the Group Policy Management Console which is installed with the [Remote Server Administration Tools for Windows 8.1](http://go.microsoft.com/fwlink/?LinkId=299896). For more information about Group Policy, see [Group Policy for Beginners](http://go.microsoft.com/fwlink/?LinkId=330723) and the [Group Policy Techcenter](http://go.microsoft.com/fwlink/?LinkId=330564).

     

2.  Click to expand **Computer Configuration**, **Administrative Templates**, **Windows Components**, and then **App Package Deployment**.

3.  Double-click the **Allow all trusted apps to install** setting.

4.  In the **Allow all trusted apps to install** window, click **Enabled** and then click **OK**.

Setting the Group Policy to allow trusted applications updates the following registry setting: **HKEY\_LOCAL\_MACHINE\\Software\\Policies\\Microsoft\\Windows\\Appx\\AllowAllTrustedApps = 1**

**To activate a sideloading product key**

1.  Open a command prompt with administrator privileges and type the following to add the sideloading product key:

    ``` syntax
    Slmgr /ipk <sideloading product key>
    ```

    Where *&lt;sideloading product key&gt;* is the 25 digit key to enable sideloading on the computer.

2.  Activate the sideloading key by typing:

    ``` syntax
    slmgr /ato ec67814b-30e6-4a50-bf7b-d55daf729d1e
    ```

    **Note**  
    The activation GUID is not the same as the sideloading product key. The activation GUID will always be ec67814b-30e6-4a50-bf7b-d55daf729d1e.

     

For more information about sideloading product keys, see the [Windows 8 Licensing Guide](http://go.microsoft.com/fwlink/?LinkId=267899).

## <span id="BKMK_DeveloperLicense"></span><span id="bkmk_developerlicense"></span><span id="BKMK_DEVELOPERLICENSE"></span>Configure PCs for Developing Windows apps


You can configure your PCs to have a developer license that does not expire. Once the PCs are configured, you won’t need to connect to the Internet to obtain or renew a license. Your computer must be a member of a domain and be running either of the following operating systems:

-   Windows 10 Enterprise
-   Windows 8.1 Enterprise
-   Windows 8 Pro

**Note**  
To enable sideloading on Windows 8 Pro device, you must use a sideloading product activation key. For more information see, [Configure PCs for Sideloading Requirements](#sideloadingrequirements)

 

**To configure your enterprise PCs with a developer license**

1.  Open the Group Policy Management Editor for a domain—based Group Policy Object (GPO) to which you will be applying the group policy settings, as specified below, to your selected PCs.

    **Note**  
    The steps provided in this procedure assume you understand the basics of Group Policy design and operations. To administer domain—based Group Policy on a Windows 8.1 PC, you will need to install the Group Policy Management Console which is installed with the [Remote Server Administration Tools for Windows 8.1](http://go.microsoft.com/fwlink/?LinkId=299896). For more information about Group Policy, see [Group Policy for Beginners](http://go.microsoft.com/fwlink/?LinkId=330723) and the [Group Policy Techcenter](http://go.microsoft.com/fwlink/?LinkId=330564).

     

2.  Click to expand **Computer Configuration**, **Administrative Templates**, **Windows Components**, and then **App Package Deployment**.

3.  Double-click the **Allow development of Windows apps without installing a developer license** setting.

4.  In the **Allow development of Windows apps without installing a developer license** window, click **Enabled** and then click **OK**.

5.  Double-click the **Allow all trusted apps to install** setting.

6.  In the **Allow all trusted apps to install** window, click **Enabled** and then click **OK**.

Setting the Group Policy to allow development of Windows apps without installing a developer license updates the following registry setting: **HKEY\_LOCAL\_MACHINE\\Software\\Policies\\Microsoft\\Windows\\Appx\\AllowDevelopmentWithoutDevLicense = 1**

Setting the Group Policy to allow trusted applications updates the following registry setting: **HKEY\_LOCAL\_MACHINE\\Software\\Policies\\Microsoft\\Windows\\Appx\\AllowAllTrustedApps = 1**

## <span id="AddApps"></span><span id="addapps"></span><span id="ADDAPPS"></span>Add Apps


There are two ways to add apps. A user can add an app package, which will make the app available to just that user. Or the app can be installed in the Windows image, which will make the app available to every user of the Windows image at first logon or at the next logon, if the user account is already created. This second case is referred to as provisioning an app package.

**Add an App Package**

You can install an app package (.appx or .appxbundle) on a per-user basis by using the *add-appxpackage* PowerShell cmdlet. There is no limit to the number of LOB apps you can add for each user.

**Add a LOB app to a user account**

-   At the Windows PowerShell prompt on a Windows 8 or Windows Server 2012 computer, add an .appx (or .appxbundle) file package. Include any required dependency app packages when you add the app. For example, type:

    ``` syntax
    add-appxpackage C:\app1.appx -DependencyPath C:\winjs.appx
    ```

    For more information, see [App Installation Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=393919).

**Add a provisioned LOB app to a Windows image**

Apps that are installed in the Windows image are called *provisioned* apps. Provisioned apps are staged in the image and are scheduled to be installed for every user of the Windows image at first logon or at the next logon, if the user account is already created.

You can add these apps to a Windows image when you boot into audit mode before you deploy the image by using the DISM app provisioning commands. For more information about audit mode, see [Audit Mode Overview](audit-mode-overview.md).

Provisioned apps are specific to the PC and will not roam with the user. You can only install 24 provisioned apps in an image.

On a Windows image that has already been deployed, you should instead use the Add-AppxPackage cmdlet in PowerShell. If you do use the DISM app provisioning commands on a deployed Windows image with active users, you should log all users off of the image, so that you are the only user logged on, before you run the command.

**Note**  
On Windows 8, to update a provisioned app, you must first remove the provisioned app and then deploy the new version of the app. The update will then be applied the next time each user logs in.

On Windows 8.1 and newer, you no longer need to remove the provisioned app prior to deploying the new version of the provisioned app.

 

**Add a provisioned LOB app to a Windows image**

-   Use the Deployment Image Servicing and Management (DISM) command-line tool or PowerShell cmdlets to add the LOB app without a Windows Store license. For example, at an elevated command prompt, type:

    ``` syntax
    DISM /Online /Add-ProvisionedAppxPackage /PackagePath:C:\App1.appx /SkipLicense
    ```

    Or, at a Windows PowerShell prompt, type:

    ``` syntax
    Add-AppxProvisionedPackage -Online -FolderPath C:\Appx -SkipLicense
    ```

    For more information, see [DISM App Package (.appx or .appxbundle) Servicing Command-Line Options](dism-app-package--appx-or-appxbundle--servicing-command-line-options.md) or [DISM Cmdlets](http://go.microsoft.com/fwlink/?LinkId=393917). For information about DISM supported platforms, see [DISM Supported Platforms](dism-supported-platforms.md).

**Note**  
The computer does not have to be joined to a domain or have an activated sideloading product key before you install provisioned LOB apps. However, the apps will not run until the computer meets this sideloading requirement. For more information, see [Customize the Start Screen](customize-the-start-screen.md).

 

**Update a provisioned LOB app once it is has been added to a Windows image**

On Windows 8, to update a provisioned app, you must first remove the provisioned app and then deploy the new version of the app. The update will then be applied the next time each user logs in.

On Windows 8.1 and newer, to update a provisioned app, you will need to update the app for each user that has signed on to the Windows image provisioned with the app:

**Update a provisioned LOB app to a Windows image**

1.  Use the PowerShell to update the LOB app without a Windows Store license. This must be done for each user that has signed in to the PC running the Windows image. For example, if you have installed the original version of the app, 1.0.0.0, that now needs to be updated to version 1.0.0.1, then at a PowerShell session, type:

    ``` syntax
    Add-AppxPackage -Path App1_1.0.0.2 -DependencyPath C:\appx\WinJS.appx
    ```

    Where `c:\appx\WinJS.appx` is the path to the dependency package.

2.  Once you have updated your app, you can verify the version of the updated app. From a PowerShell session, type:

    ``` syntax
    Get-AppxPackage | Out-GridView
    ```

## <span id="BKMK_MulitLang"></span><span id="bkmk_mulitlang"></span><span id="BKMK_MULITLANG"></span>Add Multiple Languages for Apps


To prepare a multi-lingual image, sign-in to the image, install any desired app resource packs (including language) and then use Copy Profile to capture the image.

**Preparing a multi-lingual image for an app**

1.  Create an unattend.xml with the following contents to c:\\unattend.xml:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <unattend xmlns="urn:schemas-microsoft-com:unattend">
        <settings pass="specialize">
            <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                <CopyProfile>true</CopyProfile>
                <RegisteredOrganization />
                <RegisteredOwner />
            </component>
        </settings>
        <cpi:offlineImage cpi:source="catalog:d:/desktop/x86 clgs/install_windows vista ultimate.clg" xmlns:cpi="urn:schemas-microsoft-com:cpi" />
    </unattend>
    ```

    **Note**  
    See [Change the language used in apps](http://go.microsoft.com/fwlink/?LinkId=389195) for information about setting the language and installing updates from the Windows Store.

     

2.  Sign-in to a local administrator user account from OOBE on clean image.

    **Important**  
    When adding a specific language to a Windows app, you would also want to [Add Language Packs to Windows](add-language-packs-to-windows.md) for the same languages as you did for the Windows app.

     

3.  Add the desired languages to the current user’s language preference list.

4.  **Install app updates using a Windows Store account (MSA account)**

    1.  Sign-in to the store with an MSA account.

        **Note**  
        Store only. Don’t convert the local account to MSA.

        If you do not have an MSA account, you can update apps without a Windows Store account.

         

    2.  Check for updates and install new language resource packs.

    3.  Sign out of the Windows Store and remove the MSA account.

5.  Open an elevated command prompt and type:

    ``` syntax
    Sysprep.exe /generalize /oobe /reboot /unattend:C:\unattend.xml
    ```

    Then press enter.

6.  You should see the PC boot to OOBE. Any languages that you have added prior to Copy Profile should be present at this point.

**Install app updates without using a Windows Store account (MSA account)**

1.  After the PC has finished installing, open an elevated command prompt.

2.  Type **Start ms-windows-store:Updates**

3.  You will see the Windows Store Updates page. You should see the pending updates displayed.

4.  Tap **Install** to install the updates.

## <span id="InventoryApps"></span><span id="inventoryapps"></span><span id="INVENTORYAPPS"></span>Inventory Apps


You can list the LOB apps installed in on offline or online Windows image and get additional information about the packages.

**List LOB Apps per user account**

1.  You can get a list of the Windows apps installed for a specific user account on the computer. You must open PowerShell with administrator privileges to list the packages for a user other than the current user. For example, at the PowerShell prompt, type:

    ``` syntax
    Get-AppxPackage -AllUsers
    ```

2.  You can get a list of packages installed for a specific user. You must open PowerShell with administrator privileges to list the packages for a user other than the current user. For example, at the PowerShell prompt, type:

    ``` syntax
    Get-AppxPackage -Name Package1 -User domain\username
    ```

3.  You can also get the manifest of an app package (.appx) which includes information such as the package ID. For example, at the PowerShell prompt, type:

    ``` syntax
    Get-AppxPackageManifest -Package Package1
    ```

4.  You can use the pipeline to get the manifest for an app package (.appx) if you don’t know the full name of the package. For example, at the PowerShell prompt, type:

    ``` syntax
    (Get-AppxPackage -Name "*WinJS*" | Get-AppxPackageManifest).package.applications.application.id
    ```

**List LOB apps that are provisioned in a Windows image**

-   You can get a list of the packages that are provisioned in a Windows image that will be installed for each new user by using Dism.exe or PowerShell. For example, at a PowerShell prompt, type:

    ``` syntax
    Get-AppxProvisionedPackage -Path c:\offline
    ```

    Or, at a command prompt, type:

    ``` syntax
    DISM.exe /Image:C:\test\offline /Get-ProvisionedAppxPackages
    ```

For more information, see [Take Inventory of an Image or Component Using DISM](take-inventory-of-an-image-or-component-using-dism.md).

## <span id="RemoveApps"></span><span id="removeapps"></span><span id="REMOVEAPPS"></span>Remove Apps


You can remove individual instances of an app, or remove the provisioning setting of an app.

**Remove LOB apps per user account**

-   You can remove a single app for the current user only. For example, at a command prompt, type:

    ``` syntax
    Remove-AppxPackage Package1
    ```

**Remove provisioned LOB apps in a Windows image**

-   When you remove a provisioned app, the app will not be installed for new user accounts. For the currently logged in user and other user accounts that are active on the computer, the app will not be removed from those accounts. The app will need to be uninstalled for those existing apps.

    For example, to remove a provisioned LOB app, MyAppxPkg, from a Windows image, at an elevated PowerShell prompt, type:

    ``` syntax
    Remove-AppxProvisionedPackage -Online -PackageName MyAppxPkg
    ```

    Or, at a command prompt, type:

    ``` syntax
    DISM.exe /Online /Remove-ProvisionedAppxPackage /PackageName:microsoft.app1_1.0.0.0_neutral_en-us_ac4zc6fex2zjp
    ```

## <span id="related_topics"></span>Related topics


[App Installation Cmdlets in Windows PowerShell](http://go.microsoft.com/fwlink/?LinkId=243074)

[DISM App Package (.appx or .appxbundle) Servicing Command-Line Options](dism-app-package--appx-or-appxbundle--servicing-command-line-options.md)

[App Packaging Tools](http://go.microsoft.com/fwlink/?LinkId=242873)

[AppX Module Cmdlets](http://go.microsoft.com/fwlink/?LinkId=393919)

[Change the language used in apps](http://go.microsoft.com/fwlink/?LinkId=389195)

[DISM Cmdlets](http://go.microsoft.com/fwlink/?LinkId=393917)

[DISM Supported Platforms](dism-supported-platforms.md)

[Enterprise guide to installing Universal Windows 8 apps on Windows Embedded 8 Industry](http://go.microsoft.com/fwlink/?LinkId=391812)

[Get a Developer License](http://go.microsoft.com/fwlink/?LinkId=241313)

[Group Policy for Beginners](http://go.microsoft.com/fwlink/?LinkId=330723)

[Group Policy Techcenter](http://go.microsoft.com/fwlink/?LinkId=330564)

[Customize the Start Screen](customize-the-start-screen.md)

[Managing Client Access to the Windows Store](http://go.microsoft.com/fwlink/?LinkId=264712)

[Microsoft Volume Licensing](http://go.microsoft.com/fwlink/?LinkId=264711)

[Remote Server Administration Tools for Windows 8.1](http://go.microsoft.com/fwlink/?LinkId=299896)

[What is a Windows Store App?](http://go.microsoft.com/fwlink/?LinkId=264710)

[Windows 8 Licensing Guide](http://go.microsoft.com/fwlink/?LinkId=267899)

 

 






