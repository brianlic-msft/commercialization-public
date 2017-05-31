---
title: Inheritance
description: Inheritance
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5caaf667-4c1a-4459-8a45-36001ce6b414
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Inheritance


Windows Performance Recorder (WPR) recording profiles are stored in an XML file that has a .wprp extension. WPR supports inheritance of its objects by using the **Base=””** attribute in the WPR profile XML schema. Inheritance allows you to keep, reuse, and build upon common profile definitions to record specialized scenarios. For example, you can add a provider to an existing profile and thereby change buffer sizes without altering a definition in the actual profile.

**Important**  
When you author WPRP profiles, you should either inherit profile data from WPR's built-in base profiles, or reuse the same session names to avoid enabling the same provider multiple times.

 

In this article:

-   [Base Profiles](#base)

-   [Example](#ex)

-   [Inheritance Best Practices](#bestprac)

## <a href="" id="base"></a>Base Profiles


You can use XML tags to change the content of a profile. You must use the **Operation** attribute. The possible values for the **Operation** attribute are **Set** and **Add**. In the following example, **DerivedProfile** adds the **ReadyThread** system keyword to the **CpuConfig**, **CSwitch**, and **SampledProfile** keywords that **BaseProfile** defines.

``` syntax
<SystemCollector
  Id="BaseSystemCollector" ... />

<SystemProvider
  Id="MainSystemProvider">
  <Keywords>
    <Keyword
      Value="CpuConfig"/>
    <Keyword
      Value="CSwitch"/>
    <Keyword
      Value="SampledProfile"/>
  </Keywords>
</SystemProvider>

<SystemProvider
  Id="AnotherSystemProvider">
  <Keywords> 
    <Keyword
      Value="ReadyThread"/>
  </Keywords>
</SystemProvider>

<Profile
  Id="BaseProfile"...>
  ... 
  <Collectors>
    <SystemCollectorId
      Value="BaseSystemCollector">
      <SystemProviderId
        Value="MainSystemProvider"/>
    </SystemCollectorId>
  </Collectors>
</Profile>

<Profile
  Id="DerivedProfile"
  Base="BaseProfile"...>
... 
  <Collectors Operation="Add"> <!--Use "Add" operation to add new provider to an existing one. -->
    <SystemCollectorId
      Value="BaseSystemCollector">
      <SystemProviderId
        Value="AnotherSystemProvider"/> <!--Specify provider to add. --> 
    </SystemCollectorId> 
  </Collectors>
</Profile>
```

**Note**  
If you do not specify the **Operation** attribute but you use inheritance, WPR uses the default value **Set**.

 

## <a href="" id="ex"></a>Example


The following example defines a profile for file logging mode. The memory version inherits from the file version and overwrites the logging mode only.

``` syntax
<Profile
   Id="SampleProfile.Verbose.File"
   LoggingMode = "File"
   DetailLevel = "Verbose"
   Name = "SampleProfile"
   Description = "A sample profile">
   …

</Profile>

<Profile
   Id="SampleProfile.Verbose.Memory"
   Base="SampleProfile.Verbose.File”
   LoggingMode = "Memory"
   DetailLevel = "Verbose"
   Name = "SampleProfile"
   Description = "A sample profile"/>
```

## <a href="" id="bestprac"></a>Inheritance Best Practices


Poorly architected inheritance can create unintended consequences. We recommend that you only derive collectors from collectors, or profiles from profiles. You should never combine derivations across multiple types of objects.

The following three examples describe two good ways to use inheritance; the third example describes a poor use of inheritance.

### <a href="" id="ex1inher"></a>Example 1: Good Use of Inheritance

You want to use the specifications of Event Collector-A, with some modifications. To do so:

1.  Define a second collector (Collector-B) that inherits its specifications from Collector-A.

2.  Modify Collector-B.

3.  Set the profile to reference Collector-B.

This is a good practice because only the collector object inherits attributes from another collector object, which is then directly referenced by the profile.

### <a href="" id="ex2inher"></a>Example 2: Good Use of Inheritance

1.  Profile-A references Collector-A.

2.  Profile-B inherits attributes from Profile-A.

3.  You modify particular attributes in Profile-B.

This is good practice because only the profile object derives from another profile object.

### <a href="" id="ex3inher"></a>Example 3: Poor Use of Inheritance

1.  Profile-A references Collector-A.

2.  Collector-B inherits from Collector-A.

3.  Profile-B inherits from Profile-A and also references Collector-B.

In this case, Profile-B references Collector-B two times: one time through inheritance by Profile-A, and one time by direct reference to Collector-B. In this case, it is unclear how the definition for Collector-B should be evaluated; that is, which derivation should take precedence. This example portrays a bad practice because the ordering is undefined and might lead to contradictory outcomes based on ordering of operations. This type of inheritance should be avoided.

## Related topics


[Authoring Recording Profiles](authoring-recording-profiles.md)

[WPRControlProfiles Schema](wprcontrolprofiles-schema.md)

 

 







