---
title: 2. System and Event Provider Definitions
description: 2.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 24358037-a8ad-41c8-b82c-b4c5111b17d3
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# 2. System and Event Provider Definitions


Windows Performance Recorder (WPR) recording profiles are stored in an XML file that has a .wprp extension. A system provider definition specifies the system keywords, stacks, and memory pool tags in the .wprp file.

In this article:

-   [Provider Definition](#provdef)

-   [System Providers](#sys)

-   [Event Providers](#event)

-   [Heap Event Providers](#heap)

-   [Capture-State Providers](#cap)

-   [Example](#ex)

## <a href="" id="provdef"></a>Provider Definition


Items in the .wprp file must be defined in the following order:

1.  All collectors

2.  System providers

3.  Event providers

4.  Heap providers, if present

5.  All profiles

In some cases, providers can be defined in, instead of before, the profile definition. For example:

``` syntax
<EventCollector Id="Collector1" Name="Sample Event Collector">
   <BufferSize Value="128"/>
   <Buffers Value="64"/>
</EventCollector>

<Profile Id="Sample.Verbose.File" Name="Sample" Description="Sample profile" DetailLevel="Verbose" LoggingMode="File">
   <Collectors>
      <EventCollectorId Value="Collector1">
         <EventProviders>
            <EventProvider Id="EventProvider_Microsoft-Windows-Kernel-Power" Name="Microsoft-Windows-Kernel-Power" NonPagedMemory="true">
               <Keywords>
                  <Keyword Value="0x4"/>
               </Keywords>
            </EventProvider>
         </EventProviders>
      </EventCollectorId>
   </Collectors>
</Profile>
```

## <a href="" id="sys"></a>System Providers


The only mandatory attribute for a system provider definition is **Id**. Inner XML tags specify the keywords, stacks, and pool tags to enable. For lists of all supported keywords and stacks, see [Stack](stack-wpa.md) and [Keyword (in SystemProvider)](keyword--in-systemprovider-.md).

The following code example shows a system provider definition.

``` syntax
<SystemProvider
  Id="system-provider">
  <Keywords>
    <Keyword
      Value="ProcessThread"/>
    <Keyword
      Value="Loader"/>
    <Keyword
      Value="CSwitch"/>
  </Keywords>
  <Stacks>
    <Stack
      Value="ThreadCreate"/>
    <Stack
      Value="ReadyThread"/>
    <Stack
      Value="CSwitch"/>
  </Stacks>
  <PoolTags>
    <PoolTag
      Value="a*"/>
    <PoolTag
      Value="b*"/>
    <PoolTag
      Value="c*"/>
    <PoolTag
      Value="d*"/>
  </PoolTags>
</SystemProvider>
```

## <a href="" id="event"></a>Event Providers


An event provider definition specifies the Event Tracing for Windows (ETW) provider to use and the keywords and levels to enable. the, An event provider definition requires a mandatory **Name** attribute and a mandatory **Id** attribute.

The **Name** attribute specifies one of the following names:

-   The name of a registered Crimson provider, such as "Microsoft-Windows-Search-Core".

-   The provider GUID, such as "49c2c27c-fe2d-40bf-8c4e-c3fb518037e7".

-   The name of an earlier provider, such as "IE6".

-   The special-case name, such as "PerfTrack" or "DotNetProvider".

You can use the following optional attributes to fine-tune provider parameters:

-   **Stack**: Indicates whether the provider captures stacks. The default setting is "false".

-   **Level**: Specifies the ETW logging level. The default setting is 0xFF.

-   **NonPagedMemory**: Indicates whether WPR uses non-paged memory for the buffer for this provider. The default setting is "false".

    **Warning**  
    Some Windows event providers require the use of nonpaged memory during trace capture. An example of an event provider that requires NonPagedMemory is `EventProvider_Microsoft-Windows-Win32k`.

     

-   **CaptureStateOnly**: If set to "true", indicates that WPR enables this provider at the specified capture state Only.

-   **SID**: Specifies whether the extended data of logged events includes the user's security identifier (SID).

-   **TSID**: If set to "true", specifies the terminal session identifier to extended data of logged events.

Optional inner XML tags specify the keywords to enable. Unlike system providers, event providers do not have defined textual constants. Therefore, event providers have hexadecimal values. However, the syntax is the same as that of system providers. If you do not specify keywords, the default value is 0xFFFFFFFFFFFFFFFF.

## <a href="" id="heap"></a>Heap Event Providers


The heap provider definition specifies the process identifier of the process for which WPR captures heap events. **Id** is the only mandatory attribute. The **HeapProcessId** child element is not mandatory. This element specifies the process **Id** attribute of the process that you want to analyze. The following example shows how to do this.

``` syntax
<HeapEventProvider
  Id="Base_Heap_Provider">
</HeapEventProvider>
<HeapEventProvider
  Base="Base_Heap_Provider"
  Id="Derived_Heap_Provider">
  <HeapProcessIds Operation="Set">
    <HeapProcessId Value="2314"/>
  </HeapProcessIds>
</HeapEventProvider>
```

## <a href="" id="cap"></a>Capture-State Providers


Unlike regular providers that are enabled throughout the whole tracing session, capture-state providers are enabled only when you save or start a capture session. The following example shows both regular and capture-state providers.

``` syntax
<EventProvider Id="sample-provider" Name="SampleProvider" NonPagedMemory="true" Level="5">
  <Keywords>
    <Keyword Value="0x98"/> <!-- Provider is enabled with these keywords throughout the tracing session. -->
  </Keywords>
  <CaptureStateOnStart>
    <Keyword Value="0xff4"/> <!-- Provider is enabled with these keywords when tracing is started. -->
  </CaptureStateOnStart>
  <CaptureStateOnSave>
    <Keyword Value="0x118"/> <!-- Provider is enabled with these keywords when tracing is saved. -->
  </CaptureStateOnSave>
</EventProvider>

<EventProvider Id="EventProvider_DWMWin32k_CaptureState" Name="e7ef96be-969f-414f-97d7-3ddb7b558ccc" NonPagedMemory="true" CaptureStateOnly="true" >
  <!-- CaptureStateOnly="true" means provider is not enabled throughout the tracing session. -->
  <CaptureStateOnSave>
    <Keyword Value="0x80000"/> <!-- Provider is enabled with these keywords when tracing is saved. -->
  </CaptureStateOnSave>
</EventProvider>
```

## <a href="" id="ex"></a>Example


The following code example defines two event providers.

``` syntax
<EventProvider
  Id="Win32K-provider"
  Name="Microsoft-Windows-Win32K"
  NonPagedMemory="true"
  Stack="true">
  <Keywords>
    <Keyword
      Value="0x240000"/>
  </Keywords>
</EventProvider>

<EventProvider
  Id="Search-Core-provider"
  Name="Microsoft-Windows-Search-Core"/>
```

## Related topics


[Authoring Recording Profiles](authoring-recording-profiles.md)

[1. Collector Definitions](1-collector-definitions.md)

[3. Profile Definitions](3-profile-definitions.md)

[SystemProvider](systemprovider.md)

[EventProvider](eventprovider.md)

[HeapEventProvider](heapeventprovider.md)

[Keyword (in SystemProvider)](keyword--in-systemprovider-.md)

[Stack](stack-wpa.md)

[PoolTag](pooltag.md)

 

 







