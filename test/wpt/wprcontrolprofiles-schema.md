---
title: WPRControlProfiles Schema
description: WPRControlProfiles Schema
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a64ede15-c0d0-4070-b51f-e5dce0964aa6
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WPRControlProfiles Schema


The complete schema for Windows Performance Recorder (WPR) recording profiles, **WPRControlProfiles.xsd**, is as follows:

``` syntax
<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<xs:schema
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    attributeFormDefault="unqualified"
    elementFormDefault="qualified"
    version="1.0"
    xml:lang="en-us"
    >
  <xs:simpleType name="SystemCollectorNameEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="NT Kernel Logger"/>
      <xs:enumeration value="Circular Kernel Context Logger"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SystemKeywordEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="AllFaults"/>
      <xs:enumeration value="Alpc"/>
      <xs:enumeration value="AntiStarvation"/>
      <xs:enumeration value="CC"/>
      <xs:enumeration value="ClockInterrupt"/>
      <xs:enumeration value="ClusterOff"/>
      <xs:enumeration value="CompactCSwitch"/>
      <xs:enumeration value="ContiguousMemorygeneration"/>
      <xs:enumeration value="CpuConfig"/>
      <xs:enumeration value="CSwitch"/>
      <xs:enumeration value="DiskIO"/>
      <xs:enumeration value="DiskIOInit"/>
      <xs:enumeration value="DPC"/>
      <xs:enumeration value="Drivers"/>
      <xs:enumeration value="FileIO"/>
      <xs:enumeration value="FileIOInit"/>
      <xs:enumeration value="Filename"/>
      <xs:enumeration value="FilterIO"/>
      <xs:enumeration value="FilterIOFailure"/>
      <xs:enumeration value="FilterIOFastIO"/>
      <xs:enumeration value="FilterIOInit"/>
      <xs:enumeration value="FootPrint"/>
      <xs:enumeration value="HalClock"/>
      <xs:enumeration value="Handle"/>
      <xs:enumeration value="HardFaults"/>
      <xs:enumeration value="IdleStates"/>
      <xs:enumeration value="InterProcessorInterrupt"/>
      <xs:enumeration value="Interrupt"/>
      <xs:enumeration value="KernelQueue"/>
      <xs:enumeration value="Loader"/>
      <xs:enumeration value="LoadBalancer"/>
      <xs:enumeration value="Memory"/>
      <xs:enumeration value="MemoryInfo"/>
      <xs:enumeration value="MemoryInfoWS"/>
      <xs:enumeration value="NetworkTrace"/>
      <xs:enumeration value="Object"/>
      <xs:enumeration value="OpticalIO"/>
      <xs:enumeration value="OpticalIOInit"/>
      <xs:enumeration value="Pool"/>
      <xs:enumeration value="Power"/>
      <xs:enumeration value="ProcessCounter"/>
      <xs:enumeration value="ProcessFreeze"/>
      <xs:enumeration value="ProcessThread"/>
      <xs:enumeration value="ReadyThread"/>
      <xs:enumeration value="ReferenceSet"/>
      <xs:enumeration value="Registry"/>
      <xs:enumeration value="RegistryHive"/>
      <xs:enumeration value="SampledProfile"/>
      <xs:enumeration value="SpinLock"/>
      <xs:enumeration value="SplitIO"/>
      <xs:enumeration value="SynchronizationObjects"/>
      <xs:enumeration value="SystemCall"/>
      <xs:enumeration value="ThreadPriority"/>
      <xs:enumeration value="Timer"/>
      <xs:enumeration value="VirtualAllocation"/>
      <xs:enumeration value="WakeCounter"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SystemStackEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="AlpcClosePort"/>
      <xs:enumeration value="AlpcConnectFail"/>
      <xs:enumeration value="AlpcConnectRequest"/>
      <xs:enumeration value="AlpcConnectSuccess"/>
      <xs:enumeration value="AlpcReceiveMessage"/>
      <xs:enumeration value="AlpcSendMessage"/>
      <xs:enumeration value="AlpcUnwait"/>
      <xs:enumeration value="AlpcWaitForNewMessage"/>
      <xs:enumeration value="AlpcWaitForReply"/>
      <xs:enumeration value="CcCanIWriteFail"/>
      <xs:enumeration value="CcFlushCache"/>
      <xs:enumeration value="CcFlushSection"/>
      <xs:enumeration value="CcLazyWriteScan"/>
      <xs:enumeration value="CcReadAhead"/>
      <xs:enumeration value="CcWorkitemComplete"/>
      <xs:enumeration value="CcWorkitemDequeue"/>
      <xs:enumeration value="CcWorkitemEnqueue"/>
      <xs:enumeration value="CcWriteBehind"/>
      <xs:enumeration value="ChargeWakeCounterUser"/>
      <xs:enumeration value="ChargeWakeCounterDevice"/>
      <xs:enumeration value="ChargeWakeCounterKernel"/>
      <xs:enumeration value="ChargeWakeCounterPower"/>
      <xs:enumeration value="ContiguousMemoryGeneration"/>
      <xs:enumeration value="CSwitch"/>
      <xs:enumeration value="DiskFlushInit"/>
      <xs:enumeration value="DiskReadInit"/>
      <xs:enumeration value="DiskWriteInit"/>
      <xs:enumeration value="ExecutiveResource"/>
      <xs:enumeration value="FileCleanup"/>
      <xs:enumeration value="FileClose"/>
      <xs:enumeration value="FileCreate"/>
      <xs:enumeration value="FileDelete"/>
      <xs:enumeration value="FileDirEnum"/>
      <xs:enumeration value="FileDirNotify"/>
      <xs:enumeration value="FileFlush"/>
      <xs:enumeration value="FileFSCTL"/>
      <xs:enumeration value="FileOpEnd"/>
      <xs:enumeration value="FileQueryInformation"/>
      <xs:enumeration value="FileRead"/>
      <xs:enumeration value="FileRename"/>
      <xs:enumeration value="FileSetInformation"/>
      <xs:enumeration value="FileWrite"/>
      <xs:enumeration value="HandleCreate"/>
      <xs:enumeration value="HandleClose"/>
      <xs:enumeration value="HandleDuplicate"/>
      <xs:enumeration value="HardFault"/>
      <xs:enumeration value="HeapAllocation"/>
      <xs:enumeration value="HeapCreate"/>
      <xs:enumeration value="HeapDestroy"/>
      <xs:enumeration value="HeapFree"/>
      <xs:enumeration value="HeapRangeCreate"/>
      <xs:enumeration value="HeapRangeDestroy"/>
      <xs:enumeration value="HeapRangeRelease"/>
      <xs:enumeration value="HeapRangeReserve"/>
      <xs:enumeration value="HeapReallocation"/>
      <xs:enumeration value="ImageLoad"/>
      <xs:enumeration value="ImageUnload"/>
      <xs:enumeration value="KernelQueueEnqueue"/>
      <xs:enumeration value="KernelQueueDequeue"/>
      <xs:enumeration value="KernelSignal"/>
      <xs:enumeration value="KernelSignalInit"/>
      <xs:enumeration value="KernelSync"/>
      <xs:enumeration value="KernelSyncAll"/>
      <xs:enumeration value="KernelWaitSync"/>
      <xs:enumeration value="KernelWaitSyncAll"/>
      <xs:enumeration value="MapFile"/>
      <xs:enumeration value="Mark"/>
      <xs:enumeration value="MiniFilterPreOpInit"/>
      <xs:enumeration value="MiniFilterPostOpInit"/>
      <xs:enumeration value="ObjectCreate"/>
      <xs:enumeration value="ObjectDelete"/>
      <xs:enumeration value="ObjectReference"/>
      <xs:enumeration value="PageAccess"/>
      <xs:enumeration value="PagefaultAV"/>
      <xs:enumeration value="PagefaultCopyOnWrite"/>
      <xs:enumeration value="PagefaultDemandZero"/>
      <xs:enumeration value="PagefaultGuard"/>
      <xs:enumeration value="PagefaultHard"/>
      <xs:enumeration value="PagefaultTransition"/>
      <xs:enumeration value="PagefileBackedImageMapping"/>
      <xs:enumeration value="PagefileMappedSectionCreate"/>
      <xs:enumeration value="PagefileMappedSectionDelete"/>
      <xs:enumeration value="PageRangeAccess"/>
      <xs:enumeration value="PageRangeRelease"/>
      <xs:enumeration value="PageRelease"/>
      <xs:enumeration value="PoolAllocation"/>
      <xs:enumeration value="PoolAllocationSession"/>
      <xs:enumeration value="PoolFree"/>
      <xs:enumeration value="PoolFreeSession"/>
      <xs:enumeration value="PowerDeviceNotify"/>
      <xs:enumeration value="PowerDeviceNotifyComplete"/>
      <xs:enumeration value="PowerIdleStateChange"/>
      <xs:enumeration value="PowerPerfStateChange"/>
      <xs:enumeration value="PowerPostSleep"/>
      <xs:enumeration value="PowerPreSleep"/>
      <xs:enumeration value="PowerSessionCallout"/>
      <xs:enumeration value="PowerSessionCalloutReturn"/>
      <xs:enumeration value="PowerSetDevicesState"/>
      <xs:enumeration value="PowerSetDevicesStateReturn"/>
      <xs:enumeration value="PowerSetPowerAction"/>
      <xs:enumeration value="PowerSetPowerActionReturn"/>
      <xs:enumeration value="PowerThermalConstraint"/>
      <xs:enumeration value="ProcessCreate"/>
      <xs:enumeration value="ProcessDelete"/>
      <xs:enumeration value="ProcessFreeze"/>
      <xs:enumeration value="ProcessResume"/>
      <xs:enumeration value="SampledProfile"/>
      <xs:enumeration value="SampledProfileSetInterval"/>
      <xs:enumeration value="ReadyThread"/>
      <xs:enumeration value="RegistryCloseKey"/>
      <xs:enumeration value="RegistryCreateKey"/>
      <xs:enumeration value="RegistryDeleteKey"/>
      <xs:enumeration value="RegistryDeleteValue"/>
      <xs:enumeration value="RegistryEnumerateKey"/>
      <xs:enumeration value="RegistryEnumerateValueKey"/>
      <xs:enumeration value="RegistryFlush"/>
      <xs:enumeration value="RegistryKcbCreate"/>
      <xs:enumeration value="RegistryKcbDelete"/>
      <xs:enumeration value="RegistryOpenKey"/>
      <xs:enumeration value="RegistryQueryKey"/>
      <xs:enumeration value="RegistryQueryMultipleValue"/>
      <xs:enumeration value="RegistryQuerySecurity"/>
      <xs:enumeration value="RegistryQueryValue"/>
      <xs:enumeration value="RegistrySetInformation"/>
      <xs:enumeration value="RegistrySetSecurity"/>
      <xs:enumeration value="RegistrySetValue"/>
      <xs:enumeration value="RegistryVirtualize"/>
      <xs:enumeration value="RegHiveInit"/>
      <xs:enumeration value="RegHiveDestroy"/>
      <xs:enumeration value="RegHiveLink"/>
      <xs:enumeration value="RegHiveDirty"/>
      <xs:enumeration value="ReleaseWakeCounterUser"/>
      <xs:enumeration value="ReleaseWakeCounterDevice"/>
      <xs:enumeration value="ReleaseWakeCounterKernel"/>
      <xs:enumeration value="ReleaseWakeCounterPower"/>
      <xs:enumeration value="SplitIO"/>
      <xs:enumeration value="SystemCallEnter"/>
      <xs:enumeration value="SystemCallExit"/>
      <xs:enumeration value="ThreadCreate"/>
      <xs:enumeration value="ThreadDCEnd"/>
      <xs:enumeration value="ThreadDCStart"/>
      <xs:enumeration value="ThreadDelete"/>
      <xs:enumeration value="ThreadPoolCallbackCancel"/>
      <xs:enumeration value="ThreadPoolCallbackDequeue"/>
      <xs:enumeration value="ThreadPoolCallbackEnqueue"/>
      <xs:enumeration value="ThreadPoolCallbackStart"/>
      <xs:enumeration value="ThreadPoolCallbackStop"/>
      <xs:enumeration value="ThreadPoolClose"/>
      <xs:enumeration value="ThreadPoolCreate"/>
      <xs:enumeration value="ThreadPoolSetMaxThreads"/>
      <xs:enumeration value="ThreadPoolSetMinThreads"/>
      <xs:enumeration value="ThreadSetBasePriority"/>
      <xs:enumeration value="ThreadSetPriority"/>
      <xs:enumeration value="TimerPeriodic"/>
      <xs:enumeration value="TimerOneShot"/>
      <xs:enumeration value="UnMapFile"/>
      <xs:enumeration value="VirtualAllocation"/>
      <xs:enumeration value="VirtualFree"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="LoggingModeEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="File"/>
      <xs:enumeration value="Memory"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DetailLevelEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="Light"/>
      <xs:enumeration value="Verbose"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="OperationEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="Set"/>
      <xs:enumeration value="Add"/>
      <xs:enumeration value="Remove"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TraceMergePropertiesCustomEventsEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="None"/>
      <xs:enumeration value="ImageId"/>
      <xs:enumeration value="BuildInfo"/>
      <xs:enumeration value="VolumeMapping"/>
      <xs:enumeration value="EventMetadata"/>
      <xs:enumeration value="PerfTrackMetadata"/>
      <xs:enumeration value="WinSAT"/>
      <xs:enumeration value="NetworkInterface"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="IdType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[^:\s]+"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="SystemKeywordType">
    <xs:attribute
        name="Value"
        type="SystemKeywordEnumeration"
        use="required"
        />
    <xs:attribute
        name="Strict"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:simpleType name="SystemCustomKeywordAttributeType">
    <xs:restriction base="xs:string">
      <xs:pattern value="0x[a-fA-F0-9]{1,8}"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="SystemCustomKeywordType">
    <xs:attribute
        name="Value"
        type="SystemCustomKeywordAttributeType"
        use="required"
        />
    <xs:attribute
        name="Strict"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:group name="SystemKeywordsGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="Keywords"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="Keyword"
                type="SystemKeywordType"
                />
            <xs:element
                maxOccurs="unbounded"
                minOccurs="0"
                name="CustomKeyword"
                type="SystemCustomKeywordType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
        <xs:key name="SystemProviderKeywordsKey">
          <xs:selector xpath="./*"/>
          <xs:field xpath="@Value"/>
        </xs:key>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="SystemStackType">
    <xs:attribute
        name="Value"
        type="SystemStackEnumeration"
        use="required"
        />
    <xs:attribute
        name="Strict"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:group name="SystemStacksGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="Stacks"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="Stack"
                type="SystemStackType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
        <xs:key name="SystemProviderStacksKey">
          <xs:selector xpath="./*"/>
          <xs:field xpath="@Value"/>
        </xs:key>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:simpleType name="SystemPoolTagAttributeType">
    <xs:restriction base="xs:string">
      <xs:minLength value="1"/>
      <xs:maxLength value="4"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="SystemPoolTagType">
    <xs:attribute
        name="Value"
        type="SystemPoolTagAttributeType"
        use="required"
        />
  </xs:complexType>
  <xs:group name="SystemPoolTagsGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="PoolTags"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="4"
                minOccurs="1"
                name="PoolTag"
                type="SystemPoolTagType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
        <xs:key name="SystemProviderPoolTagsKey">
          <xs:selector xpath="./*"/>
          <xs:field xpath="@Value"/>
        </xs:key>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="EventProviderKeywordType">
    <xs:attribute
        name="Value"
        type="xs:string"
        use="required"
        />
  </xs:complexType>
  <xs:group name="EventProviderKeywordsGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="Keywords"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="Keyword"
                type="EventProviderKeywordType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
        <xs:key name="EventProviderKeywordsKey">
          <xs:selector xpath="./*"/>
          <xs:field xpath="@Value"/>
        </xs:key>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:group name="EventProviderCaptureStateOnStartGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="CaptureStateOnStart"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="Keyword"
                type="EventProviderKeywordType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
        <xs:key name="EventProviderCaptureStateOnStartKey">
          <xs:selector xpath="./*"/>
          <xs:field xpath="@Value"/>
        </xs:key>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:group name="EventProviderCaptureStateOnSaveGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="CaptureStateOnSave"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="Keyword"
                type="EventProviderKeywordType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
        <xs:key name="EventProviderCaptureStateOnSaveKey">
          <xs:selector xpath="./*"/>
          <xs:field xpath="@Value"/>
        </xs:key>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:attributeGroup name="SystemCollectorAttributeGroup">
    <xs:attribute
        name="Id"
        type="IdType"
        use="required"
        />
    <xs:attribute
        name="Base"
        type="xs:string"
        use="optional"
        />
    <xs:attribute
        name="Name"
        type="SystemCollectorNameEnumeration"
        use="required"
        />
    <xs:attribute
        name="Realtime"
        type="xs:boolean"
        use="optional"
        />
  </xs:attributeGroup>
  <xs:attributeGroup name="CollectorAttributeGroup">
    <xs:attribute
        name="Id"
        type="IdType"
        use="required"
        />
    <xs:attribute
        name="Base"
        type="xs:string"
        use="optional"
        />
    <xs:attribute
        name="Name"
        type="xs:string"
        use="required"
        />
    <xs:attribute
        name="Realtime"
        type="xs:boolean"
        use="optional"
        />
  </xs:attributeGroup>
  <xs:complexType name="BuffersType">
    <xs:attribute
        name="Operation"
        type="OperationEnumeration"
        use="optional"
        />
    <xs:attribute
        name="Value"
        type="xs:unsignedLong"
        use="required"
        />
    <xs:attribute
        name="PercentageOfTotalMemory"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="BufferSizeType">
    <xs:attribute
        name="Operation"
        type="OperationEnumeration"
        use="optional"
        />
    <xs:attribute
        name="Value"
        type="xs:unsignedLong"
        use="required"
        />
  </xs:complexType>
  <xs:complexType name="StackCachingType">
    <xs:attribute
        name="BucketCount"
        type="xs:unsignedLong"
        use="required"
        />
    <xs:attribute
        name="CacheSize"
        type="xs:unsignedLong"
        use="required"
        />
  </xs:complexType>
  <xs:group name="SystemBufferElementGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="BufferSize"
          type="BufferSizeType"
          />
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="Buffers"
          type="BuffersType"
          />
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="StackCaching"
          type="StackCachingType"
          />
    </xs:sequence>
  </xs:group>
  <xs:group name="EventBufferElementGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="BufferSize"
          type="BufferSizeType"
          />
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="Buffers"
          type="BuffersType"
          />
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="StackCaching"
          type="StackCachingType"
          />
    </xs:sequence>
  </xs:group>
  <xs:complexType name="SystemCollectorType">
    <xs:group ref="SystemBufferElementGroup"/>
    <xs:attributeGroup ref="SystemCollectorAttributeGroup"/>
  </xs:complexType>
  <xs:complexType name="EventCollectorType">
    <xs:group ref="EventBufferElementGroup"/>
    <xs:attributeGroup ref="CollectorAttributeGroup"/>
    <xs:attribute
        name="Private"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="ProcessPrivate"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="Secure"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="HeapEventCollectorType">
    <xs:group ref="EventBufferElementGroup"/>
    <xs:attributeGroup ref="CollectorAttributeGroup"/>
    <xs:attribute
        name="Secure"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="SystemProviderType">
    <xs:sequence>
      <xs:group ref="SystemKeywordsGroup"/>
      <xs:group ref="SystemStacksGroup"/>
      <xs:group ref="SystemPoolTagsGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Id"
        type="IdType"
        use="required"
        />
    <xs:attribute
        name="Base"
        type="xs:string"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="EventProviderType">
    <xs:sequence>
      <xs:group ref="EventProviderKeywordsGroup"/>
      <xs:group ref="EventProviderCaptureStateOnStartGroup"/>
      <xs:group ref="EventProviderCaptureStateOnSaveGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Id"
        type="IdType"
        use="required"
        />
    <xs:attribute
        name="Name"
        type="xs:string"
        use="required"
        />
    <xs:attribute
        name="Base"
        type="xs:string"
        use="optional"
        />
    <xs:attribute
        name="NonPagedMemory"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="Stack"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="SID"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="TSID"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="Level"
        type="xs:unsignedByte"
        use="optional"
        />
    <xs:attribute
        name="CaptureStateOnly"
        type="xs:boolean"
        use="optional"
        />
    <xs:attribute
        name="Strict"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="HeapProcessIdType">
    <xs:attribute
        name="Value"
        type="xs:unsignedLong"
        use="required"
        />
  </xs:complexType>
  <xs:group name="HeapEventProcessIdsGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="HeapProcessIds"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="2"
                minOccurs="1"
                name="HeapProcessId"
                type="HeapProcessIdType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="HeapEventProviderType">
    <xs:sequence>
      <xs:group ref="HeapEventProcessIdsGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Id"
        type="IdType"
        use="required"
        />
    <xs:attribute
        name="Base"
        type="xs:string"
        use="optional"
        />
  </xs:complexType>
  <xs:group name="SystemProviderGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="SystemProvider"
          type="SystemProviderType"
          />
    </xs:sequence>
  </xs:group>
  <xs:group name="EventProviderGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="EventProvider"
          type="EventProviderType"
          />
    </xs:sequence>
  </xs:group>
  <xs:group name="HeapEventProviderGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="HeapEventProvider"
          type="HeapEventProviderType"
          />
    </xs:sequence>
  </xs:group>
  <xs:complexType name="SystemProviderIdType">
    <xs:sequence>
      <xs:group ref="SystemKeywordsGroup"/>
      <xs:group ref="SystemStacksGroup"/>
      <xs:group ref="SystemPoolTagsGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Value"
        type="IdType"
        use="required"
        />
  </xs:complexType>
  <xs:complexType name="EventProviderIdType">
    <xs:sequence>
      <xs:group ref="EventProviderKeywordsGroup"/>
      <xs:group ref="EventProviderCaptureStateOnStartGroup"/>
      <xs:group ref="EventProviderCaptureStateOnSaveGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Value"
        type="IdType"
        use="required"
        />
  </xs:complexType>
  <xs:complexType name="SystemCollectorIdType">
    <xs:sequence>
      <xs:group
          maxOccurs="1"
          minOccurs="0"
          ref="SystemBufferElementGroup"
          />
      <xs:element
          maxOccurs="1"
          minOccurs="0"
          name="SystemProviderId"
          type="SystemProviderIdType"
          />
      <xs:group
          maxOccurs="1"
          minOccurs="0"
          ref="SystemProviderGroup"
          />
    </xs:sequence>
    <xs:attribute
        name="Value"
        type="IdType"
        use="required"
        />
  </xs:complexType>
  <xs:group name="EventProvidersGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="EventProviders"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="0"
                name="EventProviderId"
                type="EventProviderIdType"
                />
            <xs:group
                maxOccurs="unbounded"
                minOccurs="0"
                ref="EventProviderGroup"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:group name="HeapEventProvidersGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="HeapEventProviders"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="0"
                name="HeapEventProviderId"
                type="HeapEventProviderIdType"
                />
            <xs:group
                maxOccurs="unbounded"
                minOccurs="0"
                ref="HeapEventProviderGroup"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="EventCollectorIdType">
    <xs:sequence>
      <xs:group
          maxOccurs="1"
          minOccurs="0"
          ref="EventBufferElementGroup"
          />
      <xs:group ref="EventProvidersGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Value"
        type="IdType"
        use="required"
        />
  </xs:complexType>
  <xs:complexType name="HeapEventProviderIdType">
    <xs:sequence>
      <xs:group
          maxOccurs="1"
          minOccurs="0"
          ref="HeapEventProcessIdsGroup"
          />
    </xs:sequence>
    <xs:attribute
        name="Value"
        type="IdType"
        use="required"
        />
  </xs:complexType>
  <xs:complexType name="HeapEventCollectorIdType">
    <xs:sequence>
      <xs:group
          maxOccurs="1"
          minOccurs="0"
          ref="EventBufferElementGroup"
          />
      <xs:group ref="HeapEventProvidersGroup"/>
    </xs:sequence>
    <xs:attribute
        name="Value"
        type="IdType"
        use="required"
        />
  </xs:complexType>
  <xs:complexType name="ProblemCategoryType">
    <xs:attribute
        name="Value"
        type="xs:string"
        use="required"
        />
  </xs:complexType>
  <xs:group name="ProblemCategoriesGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="ProblemCategories"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="ProblemCategory"
                type="ProblemCategoryType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:group name="CollectorsGroup">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="Collectors"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="1"
                minOccurs="0"
                name="SystemCollectorId"
                type="SystemCollectorIdType"
                />
            <xs:element
                maxOccurs="unbounded"
                minOccurs="0"
                name="EventCollectorId"
                type="EventCollectorIdType"
                />
            <xs:element
                maxOccurs="unbounded"
                minOccurs="0"
                name="HeapEventCollectorId"
                type="HeapEventCollectorIdType"
                />
          </xs:sequence>
          <xs:attribute
              name="Operation"
              type="OperationEnumeration"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="ProfilesType">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="SystemCollector"
          type="SystemCollectorType"
          />
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="EventCollector"
          type="EventCollectorType"
          />
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="HeapEventCollector"
          type="HeapEventCollectorType"
          />
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="SystemProvider"
          type="SystemProviderType"
          />
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="EventProvider"
          type="EventProviderType"
          />
      <xs:element
          maxOccurs="unbounded"
          minOccurs="0"
          name="HeapEventProvider"
          type="HeapEventProviderType"
          />
      <xs:element
          maxOccurs="unbounded"
          minOccurs="1"
          name="Profile"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:group ref="ProblemCategoriesGroup"/>
            <xs:group ref="CollectorsGroup"/>
          </xs:sequence>
          <xs:attribute
              name="Id"
              type="IdType"
              use="required"
              />
          <xs:attribute
              name="Name"
              type="xs:string"
              use="required"
              />
          <xs:attribute
              name="Description"
              type="xs:string"
              use="required"
              />
          <xs:attribute
              name="Base"
              type="xs:string"
              use="optional"
              />
          <xs:attribute
              name="LoggingMode"
              type="LoggingModeEnumeration"
              use="required"
              />
          <xs:attribute
              name="DetailLevel"
              type="DetailLevelEnumeration"
              use="required"
              />
          <xs:attribute
              name="Internal"
              type="xs:boolean"
              use="optional"
              />
          <xs:attribute
              name="Default"
              type="xs:boolean"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="TraceMergePropertiesCustomEventType">
    <xs:attribute
        name="Value"
        type="TraceMergePropertiesCustomEventsEnumeration"
        />
  </xs:complexType>
  <xs:complexType name="DeletePreMergedTraceFilesType">
    <xs:attribute
        name="Value"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="FileCompressionType">
    <xs:attribute
        name="Value"
        type="xs:boolean"
        use="optional"
        />
  </xs:complexType>
  <xs:complexType name="TraceMergePropertiesType">
    <xs:sequence>
      <xs:element
          maxOccurs="unbounded"
          minOccurs="1"
          name="TraceMergeProperty"
          >
        <xs:complexType>
          <xs:sequence>
            <xs:element
                maxOccurs="1"
                minOccurs="0"
                name="DeletePreMergedTraceFiles"
                type="DeletePreMergedTraceFilesType"
                />
            <xs:element
                maxOccurs="unbounded"
                minOccurs="1"
                name="CustomEvents"
                >
              <xs:complexType>
                <xs:sequence>
                  <xs:element
                      maxOccurs="unbounded"
                      minOccurs="1"
                      name="CustomEvent"
                      type="TraceMergePropertiesCustomEventType"
                      />
                </xs:sequence>
                <xs:attribute
                    name="Operation"
                    type="OperationEnumeration"
                    use="optional"
                    />
              </xs:complexType>
              <xs:key name="TraceMergePropertyCustomEventsKey">
                <xs:selector xpath="./*"/>
                <xs:field xpath="@Value"/>
              </xs:key>
            </xs:element>
            <xs:element
                maxOccurs="1"
                minOccurs="0"
                name="FileCompression"
                type="FileCompressionType"
                />
          </xs:sequence>
          <xs:attribute
              name="Id"
              type="IdType"
              use="required"
              />
          <xs:attribute
              name="Name"
              type="xs:string"
              use="required"
              />
          <xs:attribute
              name="Base"
              type="xs:string"
              use="optional"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="TransitionTagType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[^\\/:\*\?\|\x0C\&gt;\x22]+"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="OnOffTransitionEnumeration">
    <xs:restriction base="xs:string">
      <xs:enumeration value="On/Off - Boot"/>
      <xs:enumeration value="On/Off - FastStartup"/>
      <xs:enumeration value="On/Off - Shutdown"/>
      <xs:enumeration value="On/Off - RebootCycle"/>
      <xs:enumeration value="On/Off - Standby/Resume"/>
      <xs:enumeration value="On/Off - Hibernate/Resume"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SimpleValueType">
    <xs:restriction base="xs:unsignedShort">
      <xs:minInclusive value="1"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SimpleDelayValueType">
    <xs:restriction base="xs:unsignedShort">
      <xs:minInclusive value="1"/>
      <xs:maxInclusive value="3600"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="OnOffTransitionConfigurationsType">
    <xs:sequence
        maxOccurs="6"
        minOccurs="1"
        >
      <xs:element name="OnOffTransitionConfiguration">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="PrepareSystem">
              <xs:complexType>
                <xs:attribute
                    name="Value"
                    type="xs:boolean"
                    use="required"
                    />
              </xs:complexType>
            </xs:element>
            <xs:element name="NumberOfRuns">
              <xs:complexType>
                <xs:attribute
                    name="Value"
                    type="SimpleValueType"
                    use="required"
                    />
              </xs:complexType>
            </xs:element>
            <xs:element name="PostBootDelay">
              <xs:complexType>
                <xs:attribute
                    name="Value"
                    type="SimpleDelayValueType"
                    use="required"
                    />
              </xs:complexType>
            </xs:element>
            <xs:element name="WakeupDelay">
              <xs:complexType>
                <xs:attribute
                    name="Value"
                    type="SimpleDelayValueType"
                    use="required"
                    />
              </xs:complexType>
            </xs:element>
            <xs:element name="TransitionTag">
              <xs:complexType>
                <xs:attribute
                    name="Value"
                    type="TransitionTagType"
                    use="required"
                    />
              </xs:complexType>
            </xs:element>
          </xs:sequence>
          <xs:attribute
              name="Id"
              type="IdType"
              use="required"
              />
          <xs:attribute
              name="Name"
              type="xs:string"
              use="required"
              />
          <xs:attribute
              name="Type"
              type="OnOffTransitionEnumeration"
              use="required"
              />
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:element name="WindowsPerformanceRecorder">
    <xs:complexType>
      <xs:sequence>
        <xs:element
            maxOccurs="1"
            minOccurs="0"
            name="Profiles"
            type="ProfilesType"
            />
        <xs:element
            maxOccurs="unbounded"
            minOccurs="0"
            name="TraceMergeProperties"
            type="TraceMergePropertiesType"
            />
        <xs:element
            maxOccurs="1"
            minOccurs="0"
            name="OnOffTransitionConfigurations"
            type="OnOffTransitionConfigurationsType"
            />
      </xs:sequence>
      <xs:attribute
          name="Version"
          type="xs:float"
          use="required"
          />
      <xs:attribute
          name="Author"
          type="xs:string"
          use="optional"
          />
      <xs:attribute
          name="Team"
          type="xs:string"
          use="optional"
          />
      <xs:attribute
          name="Copyright"
          type="xs:string"
          use="optional"
          />
      <xs:attribute
          name="Company"
          type="xs:string"
          use="optional"
          />
      <xs:attribute
          name="Comments"
          type="xs:string"
          use="optional"
          />
      <xs:attribute
          name="Tag"
          type="xs:string"
          use="optional"
          />
    </xs:complexType>
    <xs:key name="IdKey">
      <xs:selector xpath="./*/*"/>
      <xs:field xpath="@Id"/>
    </xs:key>
    <xs:key name="OnOffTransitionKey">
      <xs:selector xpath="./OnOffTransitionConfigurations/*"/>
      <xs:field xpath="@Type"/>
    </xs:key>
  </xs:element>
</xs:schema>
```

## Related topics


[Recording Profile XML Reference](recording-profile-xml-reference.md)

 

 







