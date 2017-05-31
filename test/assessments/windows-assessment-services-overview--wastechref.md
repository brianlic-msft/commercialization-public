---
title: Windows Assessment Services overview
description: Windows Assessment Services overview
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 192c0739-dabd-4ff8-9ac8-5bf6e026757f
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Assessment Services overview


Windows Assessment Services is used to automate the scheduling of assessments from a central location to run on many computers. It is used to find quality issues and to speed up resolution of issues. It is ideal for providing consistency in test processes and for enabling faster resolution of issues.

## How does Windows Assessment Services work?


Windows Assessment Services is test framework that is configured to interact with and store assets such as test computers, Windows images and answer files in Windows Assessment Services shares. When it is installed on Windows Server 2012, Windows Deployment Services (Windows DS) provides Dynamic Driver Provisioning (DDP) and is used for computer discovery and PXE-based image deployment to test computers. When an assessment is completed, the results are copied to the server and stored in the Windows Assessment Services results share so that they are available in the Windows Assessment Services - Client (Windows ASC). The Windows ASC is a graphical user interface that is used to interact with Windows Assessment Services.

Windows Assessment Services and the Windows ASC enable you to do the following:

-   Send multiple job requests from Windows ASC computers to one Windows Assessment Services server

-   Manage computer inventory and assess all or a subset of the test computers that are in inventory

-   Create projects using various computers and various images

-   Create jobs that include one or more assessments

-   Run jobs on one or more test computers

-   Run analysis of assessment results on the server to free up test computers for other uses

-   Run analysis of assessment results on a server with greater resources than test computers

-   Rerun analysis of assessment results using updated diagnostics or symbols

-   Monitor job status while the assessment runs on the test computer

-   Access results from the server results share and present them consistently for review and comparison purposes

## Common scenarios


-   Apply an image to a set of specified computers and run specific assessments on those computers to compare computer and image characteristics.

-   Run the same assessment on multiple computers, or multiple assessments on the same computer or multiple assessments on multiple computers.

-   Import results from multiple Windows Assessment Services labs into a central SQL database for generating consolidated reports.

-   Run analysis of assessment results on the server to free up the target computer for other uses, take advantage of the resources on the server to save time running the analysis, and use symbols already loaded on the server.

## Benefits


-   Expedited resolution for quality issues through the collaboration of OEM, ODM, IHV and ISV before the computer goes to manufacturing.

-   An end-to-end testing and validation platform for use in the OEM and ODM factory process that uses Microsoft tests, diagnostics, and debugging expertise.

-   Easily identifiable quality differentiators for OEMs, retailers, and retail customers.

## Limitations


-   Windows Assessment Services supports running a job on a maximum of 150 test computers at the same time. You might see a decrease in performance when assessing more than 150 computers at the same time.

-   The test computers must not be joined to a domain. WinRM doesn’t grant permissions to run programs on domain joined computers.

## Related topics


[Windows Assessment Services](windows-assessment-services-technical-reference.md)

[Windows Assessment Services common scenarios](windows-assessment-services-how-to-topics--wastechref.md)

 

 







