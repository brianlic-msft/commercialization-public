---
title: 3. Profile Definitions
description: 3.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1d072198-f631-463a-886c-b69a48c1acd1
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# 3. Profile Definitions


Windows Performance Recorder (WPR) recording profiles are stored in an XML file that has a .wprp extension. *Profile definitions* bring together the collector and provider definitions in the .wprp file.

In this article:

-   [Profiles](#profiles)

-   [Collectors Element](#collectors)

-   [Profile Definition Example](#profdefex)

## Profiles


You define a WPR profile by using `(<Profile> … </Profile>` XML tags that refer to collector and provider definition XML tags that you define in either the same .wprp file or by using inheritance in another .wprp file. Each profile definition XML tag must have the following attributes:

-   **Id**: Unique identifier of the profile definition. Use the following profile identifier construction:

    &lt;*Name*&gt;.&lt;*DetailLevel*&gt;.&lt;*LoggingMode*&gt;.

-   **Name**: String that indicates the name of the profile.

-   **DetailLevel**: Attribute that specifies whether a profile definition is used for timing tracing (*Light*) or analysis tracing (*Verbose*).

-   **LoggingMode**: Attribute that specifies whether the profile logs events to a sequential file or to circular memory buffers. All profiles must have both a file and a memory version in the same .wprp file.

-   **Description**: Textual description of the profile that the user sees.

WPR supports performance recording for both file and memory logging modes for each .wprp file except for *on/off profiles*. You must log on/off profiles to a file, but you must define both a file and a memory version. Because a single profile definition can support only one logging mode, there can be two or four profile definitions in a .wprp file, one for each combination of logging mode and detail level. All profile definitions in a single .wprp file must have the same **Name** attribute.

&lt;*Name*&gt;.&lt;*DetailLevel*&gt;.&lt;*LoggingMode*&gt;

The following code example shows **Example1.wprp**. This file contains two profile definitions. The ellipsis (…) represents the body of the profile.

``` syntax
<Profile
  Id="Example1.Verbose.File"
  Name="Example1"
  DetailLevel="Verbose"
  LoggingMode="File"
  Description="Example1 profile">
…
</Profile>
<Profile
  Id="Example1.Verbose.Memory"
  Name="Example1"
  DetailLevel="Verbose"
  LoggingMode="Memory"
  Description="Example1 profile">
…
</Profile>
```

The following code example shows **Example2.wprp**. This file contains four profile definitions. The ellipsis (…) represents the body of the profile.

``` syntax
<Profile
  Id="Example2.Verbose.File"
  Name="Example2"
  DetailLevel="Verbose"
  LoggingMode="File"
  Description="Example2 profile">
…
</Profile>
<Profile
  Id="Example2.Light.File"
  Name="Example2"
  DetailLevel="Light"
  LoggingMode="File"
  Description="Example2 profile">
…
</Profile>
<Profile
  Id="Example2.Verbose.Memory"
  Name="Example2"
  DetailLevel="Verbose"
  LoggingMode="Memory"
  Description="Example2 profile">
…
</Profile>
<Profile
  Id="Example2.Light.Memory"
  Name="Example2"
  DetailLevel="Light"
  LoggingMode="Memory"
  Description="Example2 profile">
…
</Profile>
```

## <a href="" id="collectors"></a>Collectors Element


The **Collectors** element contains references to previously defined system and event collectors. The [SystemCollectorId](systemcollectorid.md) and [EventCollectorId](eventcollectorid.md) elements identify these collectors.

Each **SystemCollectorId** and **EventCollectorId** element contains a mandatory **Value** attribute that specifies the **Id** attribute of the collector that is to be used. Each **SystemCollectorId** and **EventCollectorId** element also contains a list of either [SystemProviderId](systemproviderid.md) or [EventCollectorId](eventcollectorid.md) elements. These elements have similar syntax. However, these elements refer to previously-defined system and event providers.

You can also define collectors and providers inside the profile definition.

## <a href="" id="profdefex"></a>Profile Definition Example


The following code example shows a complete profile definition.

``` syntax
<Profile
  Id="Example.Light.File"
  Name="Example"
  DetailLevel="Light"
  LoggingMode="File"
  Description="Example profile">
  <ProblemCategories> 
    <ProblemCategory
      Value="First Level Triage"/>
  </ProblemCategories> 
  <Collectors> 
    <SystemCollectorId
      Value="WPRSystemCollector">
      <!--Enables the system provider for this system collector. --> 
      <SystemProviderId
        Value="system-provider"/>
    </SystemCollectorId> 
    <EventCollectorId
      Value="WPREventCollector">
      <EventProviders> 
      <!--Enables two event providers for this event collector. --> 
        <EventProviderId
          Value="Win32K-provider"/>
        <EventProviderId
          Value="Search-Core-provider"/>
      </EventProviders> 
    </EventCollectorId> 
  </Collectors>
</Profile>
```

## Related topics


[Authoring Recording Profiles](authoring-recording-profiles.md)

[2. System and Event Provider Definitions](2-system-and-event-provider-definitions.md)

[Logging Mode](logging-mode.md)

[Detail Level](detail-level.md)

[ProblemCategories](problemcategories.md)

[SystemCollectorId](systemcollectorid.md)

[HeapEventProviderId](heapeventproviderid.md)

 

 







