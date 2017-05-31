---
title: Best Practices for Authoring Answer Files
description: Best Practices for Authoring Answer Files
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 59761ac8-d6ff-4803-a4eb-d2668f846441
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Best Practices for Authoring Answer Files


We recommend the following best practices for creating answer files.

There are many ways in which you can use answer files. For more information about how to use an answer file with Windows® Setup, see [Windows Setup Automation Overview](http://go.microsoft.com/fwlink/p/?linkid=219489). For more information about how to use an answer file with the **Sysprep** tool, [Using Answer Files with Sysprep](http://go.microsoft.com/fwlink/?LinkId=224958). For more information about how to use an answer file with Deployment Image Servicing and Management (DISM), see [Unattended Servicing Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=224959).

## Always Validate Answer Files in Windows SIM


The recommended way to author answer files is to create them in Windows System Image Manager (Windows SIM). However, if you use a manually authored answer file, you must validate the answer file in Windows SIM to verify that the answer file works.

Because available settings and default values can sometimes change, you must revalidate your answer file when you reuse it.

## Avoid Unnecessary Settings


You can introduce unnecessary settings by inserting a setting's parent node into the answer file.

Windows SIM does not create an empty setting in an answer file. Although empty settings are ignored during Windows Setup, empty strings can extend installation time. Therefore, as you author your answer file, remove any settings that are not required.

In general, it is best to expand down to the lowest level of a component and select only those elements that you intend to set. For the default value, you do not have to include the element unless it is a required element.

## Understand Configuration Passes


Configuration passes represent different phases of installation. Understanding what happens during each configuration pass is very important to creating answer files. For more information, review [Windows Setup Automation Overview](http://go.microsoft.com/fwlink/p/?linkid=219489) and [How Configuration Passes Work](http://go.microsoft.com/fwlink/?LinkId=224960).

## Avoid Creating Empty Elements


Windows SIM supports creating empty elements in an answer file. By right-clicking a string setting type and then clicking **Write empty string**, you create an empty element in the answer file. However, some settings support empty elements, and some do not. In some cases, creating an empty element causes Windows Setup to fail. Before you create an empty element, see the component-setting documentation in the Windows® Unattended Setup Reference (Unattend.chm).

## <a href="" id="creating-architecture-specific-sections-for-each-configuration-pass-"></a>Creating Architecture-Specific Sections for Each Configuration Pass


If you perform cross-platform deployments, do not duplicate components for different architecture types in a single answer file. If you have multiple components that apply to different architecture types in a single answer file, the installation program may apply settings in the components more than once, or it may apply the settings incorrectly.

For cross-platform deployments, you must create architecture-specific settings for each configuration pass in an answer file. For example, for a 32-bit preinstallation environment and a 64-bit destination computer, you must specify only x86-based components in the **windowsPE** configuration pass and only x64-based components in all other configuration passes.

For 64-bit answer files, the wow64 settings are the 32-bit versions of an app, for those apps that include both 32-bit and 64-bit modes.

## Improve Security for Answer Files


Answer files store sensitive data, including product keys, passwords, and other account information. You can help protect this sensitive data by following these best practices:

-   **Restrict access to answer files.** Depending on your environment, you can change the access control lists (**ACLs**) or permissions on a file. Only approved accounts can access answer files.

-   **Hide passwords.** To improve security in answer files, you can hide the passwords for local accounts by using Windows SIM. For more information, see [Hide Sensitive Data in an Answer File](http://go.microsoft.com/fwlink/?LinkId=224961).

-   **Delete the cached answer file.** During unattended Windows installation, answer files are cached to the computer. For each configuration pass, sensitive information such as domain passwords and product keys are deleted in the cached answer file. However, other information is still readable in the answer file. Before you deliver the computer to a customer, delete the cached answer file in **%WINDIR%\\panther**.

    Delete the answer file only if no settings will be processed during the **oobeSystem** configuration pass. The **oobeSystem** configuration pass is processed immediately before Out-Of-Box Experience (OOBE) starts. This is typically the first time that a customer turns on the computer. If you delete the answer file from this folder, those settings will not be processed.

## Do Not Overwrite Existing Files When You Are Using Data Images or $OEM$ Folders


When you add data, such as additional drivers or applications, do not overwrite Windows system files. Overwriting system files can corrupt your computer. For information about how to add drivers and applications, see [How to Create a Data Image](http://go.microsoft.com/fwlink/?LinkId=224962) and [How to Manage Files and Folders in a Distribution Share](http://go.microsoft.com/fwlink/?LinkId=224963).

## Use Separate Answer Files to Deploy to Multiple Architecture Types


Create separate answer files for each architecture type that you intend to deploy to. If a single answer file contains multiple components that apply to different architecture types, the component settings may be applied more than once or may be applied incorrectly.

## Use Multiple Answer Files for Specific Customizations


You can use multiple answer files (Unattend.xml) to create different sets of customizations that you can apply to your images at different times. For example, you can use a generic answer file that contains your branding and support information during Windows Setup. After installation finishes, when you run the **Sysprep** tool, you can apply a second answer file to add more customizations. When you must service your Windows image, you can use a different answer file with **DISM**.

For example, you can define your basic customizations in an answer file that you use with Windows Setup. After installation finishes, you can use an answer file with **Sysprep** or **DISM**. For example, if you want to keep all of the drivers that were added to the installation during a **generalize** process, you can create an answer file to use with **Sysprep** that contains the **PersistAllDeviceInstalls** setting. You can apply an answer file by running the following command: **Sysprep /generalize /unattend:***answerfile*.

For more information about how to use an answer file with Windows Setup, see [Windows Setup Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=224964).

For more information about how to use an answer file with **Sysprep**, see [Sysprep Command-Line Syntax](http://go.microsoft.com/fwlink/?LinkId=224965).

For more information about how to use an answer file with DISM, see [Unattended Servicing Command-Line Options](http://go.microsoft.com/fwlink/?LinkId=224959).

## Use the Correct Mechanisms to Add Updates to a Windows Image


Use only the Microsoft-supported servicing mechanisms to update a Windows image.

Use **DISM** to update an offline Windows image. For more information, see [Service an Offline Image](http://go.microsoft.com/fwlink/?LinkId=224966).

During installation, you can also configure the computer to automatically download updates from Windows Update.

**Warning**  
Never overwrite Windows system files by using **$OEM$** Folders subfolders or data images.

 

If you have additional device drivers to add to a computer, add these drivers offline by using **DISM**. You can also include additional drivers in an unattended installation by using the **Microsoft-Windows-PnPCustomizationsNonWinPE** and **Microsoft-Windows-PnPCustomizationWinPE** components. For more information, see [How to Add and Remove Drivers Offline](http://go.microsoft.com/fwlink/?LinkId=224967).

## Specify Language Settings


To change languages by using an answer file, use the **Microsoft-Windows-International-Core-WinPE** component. There are two components in which you can specify language settings:

-   **Microsoft-Windows-International-Core-WinPE**. Language settings are applied during the **windowsPE** configuration pass.

-   **Microsoft-Windows-International-Core**. Language settings are applied during the **specialize** or **oobeSystem** configuration pass.

Because some languages require a restart, we recommend that you configure your language settings during the **windowsPE** configuration pass because the computer will always restart. If you process language settings during the **specialize** or **oobeSystem** configuration pass, the computer might require an additional restart.

## Use the Sysprep/generalize Command with LocalAccounts to Change Account Information


You can use the **Sysprep** command with the **generalize** option and the **LocalAccounts** settings to change account information about an existing user account.

If you specify the settings in the following example in the **specialize** configuration pass, all the values of *NEWVALUE* will be changed. However, *MyAccount* will retain its security group memberships. *MyAccount* is considered to be the same account with a different display name, description, and password value.

``` syntax
<LocalAccount>
   <Name>MyAccount</Name>
   <DisplayName>NEWVALUE</DisplayName>
   <Description>NEWVALUE</Description>
   <Password>
      <PlainText>false</PlainText>
      <Value>NEWVALUEBASE64</Value>
   </Password>
</LocalAccount>
```

## Related topics


[Windows System Image Manager (Windows SIM)](http://go.microsoft.com/fwlink/?LinkId=214570)

[Sysprep Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214573)

[Windows Setup Technical Reference](http://go.microsoft.com/fwlink/?LinkId=214572)

[Deployment Image Servicing and Management (DISM)](http://go.microsoft.com/fwlink/?LinkId=214548)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Best%20Practices%20for%20Authoring%20Answer%20Files%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





