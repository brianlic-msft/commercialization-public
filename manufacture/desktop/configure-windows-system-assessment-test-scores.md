---
author: Justinha
Description: Configure Windows System Assessment Test Scores
ms.assetid: b2906f26-8887-44fe-8894-f73caee41824
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Configure Windows System Assessment Test Scores
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure Windows System Assessment Test Scores


The Windows® System Assessment Tests (WinSAT) are used to analyze the performance of several system components, including CPU, memory, disk, and graphics.

The WinSAT results are summarized in the **Performance Information and Tools** Control Panel item as Windows Experience Index (WEI) scores. These scores show consumers the performance characteristics of their systems.

WinEI scores are no longer generated during OOBE, nor are prepop xml files used to create WinSAT formal files during OOBE. We recommended that you generate the WinSAT formal file on the system prior to shipping it to the end-users. This allows WinSAT scores to be available as soon as end-user boots their systems, and allows the optimizations that depend on these results to be immediately available. Because the assessments are not run during the out-of-box experience, the WinSAT and WEI scores are no longer generated when a user finishes OOBE. Instead, the scores can be generated at two other times, using other mechanisms besides prepopulating WinSAT on the system that will ship.

-   End users can explicitly request an assessment by using the **Re-run the assessment** option in the **Performance Information and Tools** Control Panel item.

-   When the system is idle, subsequent to the first boot, the remaining WinSAT assessments will run using the Maintenance Scheduler if they were not prepopulated.

## <span id="To_run_WinSAT_on_a_complete_system"></span><span id="to_run_winsat_on_a_complete_system"></span><span id="TO_RUN_WINSAT_ON_A_COMPLETE_SYSTEM"></span>To run WinSAT on a complete system


Use the **prepop** option with the WinSAT command-line tool to run assessments against component systems.

To run WinSAT per computer (for all systems):

1.  Install Windows 8 and boot to audit mode. For more information about audit mode, see [Audit Mode Overview](http://go.microsoft.com/fwlink/?LinkId=214469).

2.  Add supplemental components, such as out-of-box drivers.

3.  Run **WinSAT prepop**.

    This will generate the WinSAT prepop .xml results files to the Datastore directory, located at: `%WINDIR%\performance\winsat\datastore\`

4.  \[Optional\] If you plan to capture this installation to deploy onto other computers, run **sysprep /generalize /audit /shutdown** and then capture the installation. Deploy the image to a PC that you intend to ship, and boot it.

5.  Verify that Windows boots to audit mode, and then run **WinSAT moobe**.

    This generates a WinSAT formal file from the matching prepop files, and ensures that the WinSAT formal file is available when the end-user boots the system the first time. Windows scales some features based on the WinSAT formal file, and if this file is not present on the system, then the system might experience performance problems, including unnecessary storage device defragmentation, lack of optimized memory management and prefetching optimizations.

    **Note**  
    To reduce the time a PC spends on the factory floor, we recommend using **WinSAT prepop** when you are creating your master Windows images. On the factory floor, you would only need to run **WinSAT moobe**. However, if you want to run both **WinSAT prepop** and **WinSAT moobe** on the factory floor, you can use **WinSAT formal** instead. This option creates the same set of files as running both **WinSAT prepop** and **WinSAT moobe** and should be used in scenarios when you are not able to run **WinSAT prepop** on your master Windows images.

     

6.  Run the **sysprep /oobe** to configure Windows to boot to OOBE.

    **Warning**  
    Running **sysprep /generalize** after running **WinSAT moobe** will delete the results that **WinSAT moobe** created. We recommend that you run **WinSAT moobe** or **WinSAT formal** on the factory floor for each PC that you intend to ship to a customer.

     

The system is now ready to be shipped to a customer. The benefit of running all of the WinSAT assessments per computer image is that the customer’s computer always has a complete set of WinSAT results. It also has the most accurate WinSAT results. In this use, accurate means that if the consumer used on-demand rating of a system, that system would get a rating equal to or greater than the rating that was prepopulated by WinSAT.

Pre-population is not meant to enable transferring WinSAT data among systems with very different capabilities, such as among laptops and desktops, because the data is not accurate across widely differing systems. Instead, it is meant to make it easier to re-use WinSAT data among similar systems; those systems that contain the same motherboard/chipset and similar CPU, video cards and disks.

The following procedure describes how to run WinSAT on selected configurations within a line of similar computers. This involves running the **WinSAT prepop** commands multiple times.

## <span id="To_run_WinSAT_for_selective_PC_configurations_and_PC_components"></span><span id="to_run_winsat_for_selective_pc_configurations_and_pc_components"></span><span id="TO_RUN_WINSAT_FOR_SELECTIVE_PC_CONFIGURATIONS_AND_PC_COMPONENTS"></span>To run WinSAT for selective PC configurations and PC components


1.  Identify the configurations that you intend to include in the PC, including video processors, memory, and storage devices.

2.  Install Windows 8 and boot to audit mode. For more information about audit mode, see [Audit Mode Overview](http://go.microsoft.com/fwlink/?LinkId=214469).

3.  Add supplemental components, such as out-of-box drivers.

4.  Run **WinSAT prepop**.

5.  Run **Sysprep /generalize /audit /reboot**. This will remove any non-prepop WinSAT .xml files.

6.  Copy the resulting WinSAT prepop .xml files from `%WINDIR%\performance\winsat\datastore` to the network share that you are using to store WinSAT results.

7.  Upgrade one of the components. For example, increase the memory of one configuration in your set of computers.

8.  Run **WinSAT prepop -mem** test. Using the tool this way ensures that only tests relevant to the specified component will run. An additional .xml file is generated that shows the memory test results.

9.  Restore the original memory configuration, and upgrade a different component, such as the video card.

    **Note**  
    Because WinSAT results can be used with configurations of the same level or higher, if you revert to the base configuration, the test results are relevant to a broader range of computers.

     

10. Re-run the test using the **WinSAT prepop -graphics** command. Only tests relevant to the specified component run. An additional .xml file is generated for the Graphics results.

11. Store the new results files with the original .xml results files on your network share.

12. To prepopulate the WinSAT results for a new computer with similar components, copy the .xml files from the network share to the target computer's WinSAT Datastore directory: `%WINDIR%\performance\winsat\datastore`. You can copy the entire set of WinSAT prepop files from the network share to the local WinSAT directory. WinSAT will find the correct set for the current computer.

13. On the new computer run `WinSAT moobe`. This generates a WinSAT formal file from the matching prepop files, and ensures that the WinSAT formal file is available when the end-user boots the system the first time. Windows scales some features based on the WinSAT formal file, and if this file is not present on the system, then the system might experience performance problems, including unnecessary storage device defragmentation, lack of optimized memory management and prefetching optimizations.

When running **WinSAT moobe** WinSAT examines the following directory for results files: `%WINDIR%\performance\winsat\datastore`. If WinSAT does not discover a relevant set of .xml files, it will ignore the irrelevant files and treat the system as unrated. The DWM test will run immediately, and the other tests will run as a maintenance task, or when the end-user opts to run the tests from the **Performance Information and Tools** Control Panel item. If WinSAT finds a relevant set of prepop .xml files, it uses the files to generate a formal .xml file which will be available for use when the end-user boots the computer for the first time. This enables scaling of features and allows Windows to perform appropriate optimizations.

WinSAT determines relevance by using hardware IDs. This includes: CPUID, memory DIMM configuration, hard disk model and size, and video card PNP ID. If the relevant secondary assessment is not present, WinSAT will run both the primary and secondary assessments; for example, both CPU and memory.

The advantage of this second option, running on selective configurations, is that WinSAT assessments may be run on fewer configurations and copied to similar systems. The disadvantage is that if a set of WinSAT files is not relevant to the current system, those tests will be ignored and the system will be treated as unrated, and optimizations and feature scaling will not be performed when the end-user boots the computer.

## <span id="WinSAT_Prepop_Command-line_Options"></span><span id="winsat_prepop_command-line_options"></span><span id="WINSAT_PREPOP_COMMAND-LINE_OPTIONS"></span>WinSAT Prepop Command-line Options


**The syntax for prepopulation is as follows:**

`Winsat prepop [-datastore <directory>][-graphics | -cpu | -mem | -disk | -dwm]`

The following command runs all WinSAT tests: `Winsat prepop`.

You can prepopulate only one subsystem, such as DWM, subject to the following dependencies:

-   The DWM assessment can be run independently.

-   The disk assessment can be run independently.

-   The CPU assessment requires that a relevant memory assessment is present.

-   The memory assessment requires that a relevant CPU assessment is present.

-   The graphics assessment requires that relevant CPU and memory assessments are present.

**The syntax for moobe is as follows:**

`Winsat moobe [-datastore <directory>]`

**The WinSAT file naming pattern is as follows:**

For Windows 8, there is a `%type%` identifier, `Prepop`. This identifies datastore files that are a result of prepopulation. The naming pattern is:

`%IdentifierDerivedFromDate% %Component%.Assessment(Prepop).WinSAT.xml`

Where `%IdentifierDerivedFromDate%` is year-month-day and time represented as, for example, `0012-08-01 14.48.28` where the test was run on August 1, 2012 at 2:48:28 PM.

A WinSAT formal file created from running **winsat prepop** followed by **winsat moobe**; or from running **winsat formal** uses the following naming pattern:

`%IdentifierDerivedFromDate% Formal.Assessment(Initial).WinSAT.xml`

## <span id="related_topics"></span>Related topics


[Windows Deployment Options](windows-deployment-options.md)

 

 






