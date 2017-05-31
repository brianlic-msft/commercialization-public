---
author: Justinha
Description: Add a custom tool to the Windows RE boot options menu
ms.assetid: 474958cf-91bc-4c5c-8afd-22865e9bf4a5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add a custom tool to the Windows RE boot options menu
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add a custom tool to the Windows RE boot options menu


You can add a custom troubleshooting or diagnostic tool to the Windows Recovery Environment (WinRE) image. This tool is displayed in the Boot Options menu.

By developing your custom tool to run in WinRE, you can leverage the touch and on-screen keyboard support available in WinRE.

New for Windows 10: You won't be able to add WinRE optional components that aren't already in the default WinRE tools. For example, if you have a app from Windows 8 that depended on the .NET optional components, you'll need to rewrite the app for Windows 10.

**To add a custom tool**

1.  Extract and mount a Windows image (install.wim) and its corresponding WinRE image (winre.wim):

    ``` syntax
    md c:\mount
    xcopy D:\sources\install.wim C:\mount 
    md C:\mount\windows
    Dism /mount-image /imagefile:C:\mount\install.wim /index:1 /mountdir:C:\mount\windows 
    md C:\mount\winre 
    Dism /mount-image /imagefile:c:\mount\windows\windows\system32\recovery\winre.wim /index:1 /mountdir:C:\mount\winre
    ```

    For more information about these steps, see the topic: [Customize Windows RE](customize-windows-re.md).

2.  In Notepad, create a configuration file that specifies the custom tool’s filename and parameters (if any):

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <!-- WinREConfig.xml -->
    <Recovery>
       <RecoveryTools>
          <RelativeFilePath>OEMDiagnostics.exe</RelativeFilePath>
          <CommandLineParam>/param1 /param2</CommandLineParam>
       </RecoveryTools>
    </Recovery>
    ```

    Where *C:\\Tools\\OEMDiagnostics.exe* is the custom troubleshooting or diagnostics tool, and where */param1* and */param2* are optional parameters used when running this custom tool.

    **Note**  
    You can only add one custom tool to the WinRE boot options menus.

    Save the file using UTF-8 coding. Do not use ANSI:

    Click **File**, and then click **Save As**. In the **Encoding** box, select **UTF-8**, and save this file as `C:\mount\WinREConfig.xml`.

3.  Create a \\Sources\\Recovery\\Tools folder in the WinRE mount folder, and then copy the custom tool and its configuration file into the new folder:

    ``` syntax
    md C:\mount\winre\sources\recovery\tools
    copy C:\Tools\OEMDiagnostics.exe C:\mount\winre\sources\recovery\tools
    copy C:\mount\WinREConfig.xml C:\mount\winre\sources\recovery\tools
    ```

    The custom tool and any associated folders must be in this folder so that it can continue to work after future WinRE upgrades.

4.  Commit your customizations and unmount the WinRE image:

    ``` syntax
    Dism /unmount-image /mountdir:C:\mount\winre /commit
    ```

5.  Optional: make a backup copy of the WinRE image.

    ``` syntax
    copy C:\mount\windows\windows\system32\recovery\winre.wim C:\mount\winre_amd64_backup.wim
    ```

    You can often reuse the same customizations on multiple images.

6.  Unmount and save the changes from the base Windows image:

    ``` syntax
    Dism /unmount-image /mountdir:C:\mount\windows /commit
    ```

**To deploy the image**

1.  In Notepad, create a configuration file that describes the custom tool in the boot options menu. Add descriptions for each language you support. This example specifies both English and French language versions of the tool name and description:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <!-- AddDiagnosticsToolToBootMenu.xml -->
    <BootShell>
       <WinRETool locale="en-us">
             <Name>Fabrikam Utility</Name>
             <Description>Troubleshoot your Fabrikam PC</Description>
       </WinRETool>
       <WinRETool locale="fr-fr">
          <Name>Utilité de Fabrikam</Name>
          <Description>Dépannez votre PC de Fabrikam</Description>
       </WinRETool>
    </BootShell>
    ```

    **Warning**  
    Limit the `<Name>` and `<Description>` values to approximately 30 characters or less to make sure that they appear correctly in the boot options menu.

    Save the file using UTF-8 coding:

    Click **File**, and then click **Save As**. In the **Encoding** box, select **UTF-8**, and save this file as `E:\Recovery\BootMenu\AddDiagnosticsToolToBootMenu.xml`.

    Where *E:\\* is the drive letter of a removable drive or network location.

2.  On your destination computer, during image deployment, but after you register the custom WinRE boot image and the Windows operating system, you must register the description of the custom tool:

    ``` syntax
    Reagentc /setbootshelllink /configfile E:\Recovery\BootMenu\AddDiagnosticsToolToBootMenu.xml
    ```

    If the custom tool is registered properly, the output from running this command will be: `<OEM Tool =  1>`.

    **Note**  
    For more information about deploying Windows, see the [Deploy Windows RE](deploy-windows-re.md) topic.

**To verify the custom tool appears in the Boot Options menu when launched from Windows**

1.  Restart the destination computer, and complete OOBE as your user.

    **Note**  
    If you are prompted for a product key, click **Skip**.   

2.  Click **Start** &gt; **PC settings**, and then select **General**.

3.  In the **Advanced startup** section, select **Restart now**.

    The Windows **Boot Options** menu appears.

4.  In the **Boot Options** menu, select **Troubleshoot**, and then click the **Fabrikam Utility** link.

    The computer restarts in WinRE, and the tool that is specified in the *&lt;RecoveryTools&gt;* section of the WinREConfig.xml file, appears.

5.  Confirm that the custom tool works properly, and then close the tool.

    If the custom tool does not appear on the Boot Options menu, you can try the following:

    -   Verify the WinREConfig.xml and the AddDiagnosticsToolToBootMenu.xml files are saved using the UTF-8 encoding format.

    -   Disable WinRE, register the custom tool again, and then enable WinRE. For example:

        ``` syntax
        Reagentc /disable 
        Reagentc /setbootshelllink /configfile E:\Recovery\BootMenu\AddDiagnosticsToolToBootMenu.xml
        Reagentc /enable
        ```
**To verify the custom tool appears in the WinRE recovery menu**

1.  In the recovery menu, select **Troubleshoot**, and then click the **Fabrikam Utility** link.

2.  Confirm that the custom tool works properly, and then close the tool.

3.  Click **Continue**.

    The PC reboots into the operating system.

## <span id="related_topics"></span>Related topics


[Windows Recovery Environment (Windows RE) Technical Reference](windows-recovery-environment--windows-re--technical-reference.md)

[Customize Windows RE](customize-windows-re.md)

[Deploy Windows RE](deploy-windows-re.md)

[Windows RE Troubleshooting Features](windows-re-troubleshooting-features.md)

 

 






