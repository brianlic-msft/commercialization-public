---
title: Experience Customization
description: This topic provides design and testing guidelines for experience customization for Windows Precision Touchpad devices on Windows 10 and later operating systems.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: E44AEF81-1E5E-4F2D-A80B-FE09DD3273C9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Experience Customization


This topic provides design and testing guidelines for experience customization for Windows Precision Touchpad devices on Windows 10 and later operating systems.

Starting with Windows 10, it is possible to use customization filter drivers to provide device-specific experiences for a touchpad, beyond the core interactions supported in Windows.

Changing the behaviors of the device can lead to unexpected or damaged user experiences, so the following guidance should be taken as strong recommendations for any 3rd party who would like to use a filter driver to provide a differentiated user experience.

## User Experience Guidelines


All customizations should be built to produce an additive experience for users to improve the user experience in ways beyond what are already present without the driver. The following guidelines outline the behaviors that should be avoided to ensure a good user experience:

-   Product owners should not replace core Windows behaviors. Precision Touchpad devices provide a standard core set of interactions, and user expectations will be that these are available and predictable. Windows core gestures should be consistent between machines and driver versions. A consistent input experience is critical to inspire user confidence and modifying the core set of Precision Touchpad interactions will negatively impact confidence.

-   Product owners should not build new interactions that duplicate existing experiences. An excess of gestures that perform the same interaction can confuse users and make accidental gestures more likely. The following table presents the core Windows experiences on a touchpad device, showing how the Tap, Slide and Pinch & Spread actions are interpreted.

    | Contact type  | Tap                       | Slide                     | Pinch / Spread |
    |---------------|---------------------------|---------------------------|----------------|
    | One finger    | Click                     | One-finger mousing        | N/A            |
    | Two fingers   | Secondary click           | Panning                   | Zoom           |
    | Three fingers | Windows Shell interaction | Windows Shell interaction | N/A            |
    | Four fingers  | Windows Shell interaction | Windows Shell interaction | N/A            |

     

-   Mousing is the most basic and common touchpad interaction and should be protected for users. Avoid one finger gestures that would easily interfere with mousing such as drawing shapes, like characters or circles, with a single finger.

-   The manipulation recognition component is highly sensitive to changes in data. Avoid two, three, and four-finger interactions that may be detected immediately before, immediately after, or concurrent with inbox gestures, like for example, drawing a check mark with three fingers. Be sure to perform thorough usability testing of gestures in this space, to ensure that core gestures are still responsive and accurate.

-   If a custom gesture requires a constant stream of data, do not send data simultaneously to the Windows gesture processor as well. Doing so may result in interactions firing from the operating system during custom gesture detection. To ensure that this does not affect responsiveness of the system, avoid gestures that need to consume data for noticeable periods of time.

-   Ensure that users are deliberately performing a custom gesture before cutting off the flow of data to Windows. Performing a custom four-finger slide gesture immediately when a fifth finger is present, for instance, can lead to a damaged four-finger gesture experience.

-   If a gesture implements discretely, such as a gesture that triggers on tap or zone entry, do not implement the gesture during a continuous gesture created either by the system or the customization component. Doing so will result in an action triggering, while another interaction is still processing.

-   All gestures must be user configurable. At a minimum, it should be possible to switch the detection of all interactions on or off. Gesture settings should be made available in the system settings application. There are future plans to provide instructions for implementing feature settings.

## Guidance for Testing


Customization drivers are likely to cause failures for devices during compatibility tests. These tests are intended to test hardware capabilities, and the filter driver may interrupt the expected data flow to the tests. However, if you plan to ship your systems with customization components, then these components should be included during testing. So these customized behaviors must be implemented in such a way that they can be disabled during testing, if they would otherwise block the device from passing certification.

Since, as noted above, customized interactions should always have user configurable settings to disable or enable the behaviors, it should be possible for any filter driver to have its customizations disabled to allow testing of the hardware capabilities.

## Gesture Design Principles


Windows uses the following design principles in designing gestures. These ensure that gestures provide meaningful additions to user experiences.

**Deliberate**: Gestures should not be accidentally activated easily. Chose physical gestures that are both easy to invoke intentionally and hard to invoke unintentionally. Gestures should be reversible or terminable wherever appropriate.

**Productive**: Gestures should help users be more productive. Touchpad devices are primarily productivity devices, and helping users do what they want to do faster, provides value. Gestures that make users productive will keep users on their systems.

**Delightful**: Gestures should delight users by providing new and exciting ways to interact with their system that impress users when shown or discovered – gestures that delight users will help bring users to systems.

**Intuitive**: Gestures should have an intuitive mapping between physical motions and functional behaviors in the system. This makes the gestures easy to learn, and they will feel more natural to use.

**Breadth**: Gestures should be useful in as many situations as possible. Gestures that require certain Apps or frameworks in order to function, take up valuable space in the touchpad gesture set.

 

 






