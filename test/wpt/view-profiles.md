---
title: View Profiles
description: View Profiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5103d6a8-8136-4667-9316-e824ecb44aaf
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# View Profiles


A view profile stores a view layout that you can use to quickly start your analysis. After you customize the layout, you can save it as the startup profile or create a profile that you can apply at any time.

View profiles are stored in .wpaprofile files and saved, by default, to the WPA Files folder under the user's Documents folder.

For information about changing the view layout, see [Change the View Layout](change-the-view-layout.md).

## Creating a Profile


To create a profile, first configure your view layout as you want it to appear, and then do the following:

1.  In the menu, choose **Profiles**, **Export…**.

2.  Navigate to the desired location.

3.  Name your profile, and choose **Save**.

## Applying a Profile


To apply a profile to one or more open traces, do the following:

1.  In the menu, choose **Profiles**, **Apply…**.

2.  In the pane that appears, choose **Browse…** to open a custom profile, or choose **Browse Catalog…** to view a list of profiles that are shipped with WPA.

3.  Navigate to and select the desired profile, and choose **Open**.

4.  If you have multiple traces open, or if the profile is configured for multiple traces, WPA asks you to associate traces with the profile. Select the desired traces, and choose **Apply**.

**Note**  
WPA also maintains a list of most recently used profiles in the menu under **Profiles**, **Apply Recently Used Profile**.

 

## Profile Catalog


WPA includes a set of profiles that help jumpstart different types of analysis. These profiles are contained in the **Profile Catalog** that can be found when you apply a profile to an open trace:

-   AppLaunch

-   FastStartup

-   FullBoot (Boot)

-   FullBoot (Shutdown)

-   Hibernate

-   HTMLApplicationAnalysis

-   PresetsForComparativeAnalysis

-   Standby

-   XAMLApplicationAnalysis

## Changing the Startup Profile


You can also use your current view as the default profile that is used when you first open a trace:

1.  In the menu, choose **Profiles**, **Save Startup Profile**.

2.  Choose **OK** in the confirmation box that appears.

**Note**  
You cannot change the startup profile when multiple traces are open.

 

## Related topics


[WPA Features](wpa-features.md)

[Comparative Analysis Views](comparative-analysis-views.md)

 

 







