---
title: Register custom assessments
description: Register custom assessments
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b86c6b47-08d0-441a-ba92-3a7be65ebe16
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Register custom assessments


The assessments that are installed with the Windows Assessment Toolkit are automatically registered when they're installed. However, if you develop your own assessments by using the Assessment Platform APIs, you must manually register the assessments so that they appear in the Windows Assessment Console and the Windows Assessment Services - Client (Windows ASC).

**Note**  
You can use a set of public APIs to create and extend assessments that are compatible with the Assessment Platform. For more information, see [MSDN: Assessment Execution Engine](http://go.microsoft.com/fwlink/?LinkId=236367).

 

You can use the following command-line options to register or unregister custom assessments.

To register an assessment:

**Regasmt***&lt;path\_of\_assessment&gt;*

To unregister an assessment:

**Regasmt/u***&lt;path of assessment&gt;*

**Note**  
**Regasmt.exe** is installed by default when the Windows Assessment Toolkit is installed. By default, **Regasmt.exe** is installed at %PROGRAMFILES%\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Assessment Toolkit\\x86. There is no x64 version.

You must have administrative rights to run these commands.

 

**To register an assessment**

1.  At an elevated command prompt, type this:

    ``` syntax
    regasmt C:\MyAssessments\example.asmtmanifest.asmtx
    ```

    Where C:\\MyAssessments\\example.asmtmanifest is the path of the assessment. Relative paths are supported.

2.  To register more than one assessment, list the assessments. For example:

    ``` syntax
    regasmt C:\MyAssessments\example.asmtmanifest.asmtx example2.asmtmanifest.asmtx
    ```

**To unregister an assessment**

-   At an elevated command prompt, type this:

    ``` syntax
    regasmt /u C:\MyAssessments\example.asmtmanifest.asmtx
    ```

    **Note**  
    Unregistering an assessment does not uninstall it. You can unregister more than one assessment at a time.

     

## Related topics


[Windows Assessment Toolkit](windows-assessment-toolkit-technical-reference.md)

[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

 

 







