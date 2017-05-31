---
title: Hide Sensitive Data in an Answer File
description: Hide Sensitive Data in an Answer File
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b71b5922-d6b8-4d64-9773-649e6ce44c60
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hide Sensitive Data in an Answer File


You can use Windows® System Image Manager (Windows SIM) to hide the password for the administrator account, and for any other user accounts on the local system, in an answer file. Hiding passwords in an answer file prevents users from reading the answer file and identifying passwords for local accounts.

The settings that you can hide include the following:

-   **Microsoft-Windows-Shell-Setup | AutoLogon | Password**

-   **Microsoft-Windows-Shell-Setup | UserAccounts | AdministratorPassword**

-   **Microsoft-Windows-Shell-Setup | UserAccounts | LocalAccounts | LocalAccount | Password**

This option only hides the passwords in an answer file. It does not provide encryption or other security benefits. Consider answer files as sensitive data and be careful about authorizing access to your answer files.

**Note**  
You can hide only local account passwords in an answer file. Domain passwords, product keys, and other sensitive data may still be available as clear text in an answer file.

 

**To hide account passwords in an answer file**

1.  Open Windows SIM.

2.  Open a Windows image. For more information, see [Open a Windows Image or Catalog File](open-a-windows-image-or-catalog-file.md).

3.  Create or open an answer file. For more information, see [Create or Open an Answer File](create-or-open-an-answer-file.md).

4.  Add one of the following password settings to your answer file:

    -   **Microsoft-Windows-Shell-Setup | AutoLogon | Password**

    -   **Microsoft-Windows-Shell-Setup | UserAccounts | AdministratorPassword**

    -   **Microsoft-Windows-Shell-Setup | UserAccounts | LocalAccounts | LocalAccount | Password**

5.  Add a value to one or more of the password settings.

    The component is added to the answer file in the specified configuration pass.

6.  On the **Tools** menu, click **Hide Sensitive Data**. This makes sure that when the answer file is saved, the password information will be hidden.

7.  Save the answer file and close Windows SIM. The answer file will resemble the following example.

    ``` syntax
       <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
          <UserAccounts>
             <LocalAccounts>
                <LocalAccount wcm:action="add">
                   <Password>
                      <Value>UABhAHMAcwB3AG8AcgBkADEAMgAzADQANgBQAGEAcwBzAHcAbwByAGQA</Value> 
                      <PlainText>false</PlainText> 
                   </Password>
                   <Description>MyAccountName</Description> 
                   <DisplayName>MyAccountName</DisplayName> 
                   <Group>FabrikamGroup</Group> 
                   <Name>MyAccountName</Name> 
                </LocalAccount>
             </LocalAccounts>
          </UserAccounts>
       </component>
    ```

    **Note**  
    Windows SIM adds the **PlainText** element to the answer file. This element is used during Windows Setup to indicate whether or not the password is in plain text.

     

## Related topics


[Windows System Image Manager How-to Topics](windows-system-image-manager-how-to-topics.md)

[Create or Open an Answer File](create-or-open-an-answer-file.md)

[Configure Components and Settings in an Answer File](configure-components-and-settings-in-an-answer-file.md)

[Validate an Answer File](validate-an-answer-file.md)

[Add a Device Driver Path to an Answer File](add-a-device-driver-path-to-an-answer-file.md)

[Add a Package to an Answer File](add-a-package-to-an-answer-file.md)

[Add a Custom Command to an Answer File](add-a-custom-command-to-an-answer-file.md)

[Find a Component, Setting, or Package in Windows SIM](find-a-component-setting-or-package-in-windows-sim.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_wsim\p_wsim%5D:%20Hide%20Sensitive%20Data%20in%20an%20Answer%20File%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





