---
title: Device.Audio
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.Audio

 - [Device.Audio.APO](#device.audio.apo)
 - [Device.Audio.Base](#device.audio.base)
 - [Device.Audio.HardwareAudioProcessing](#device.audio.hardwareaudioprocessing)
 - [Device.Audio.HDAudio](#device.audio.hdaudio)
 - [Device.Audio.USB](#device.audio.usb)

<a name="device.audio.apo"></a>
## Device.Audio.APO

*This APO must match all APO tests.*

### Device.Audio.APO.BestPractices

*APOs should follow best practices for Windows APOs*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All APOs (Audio Processing Objects) should follow the best practices outlined in the Windows APO Best Practices white paper.

This white paper can be found on MSDN: <http://go.microsoft.com/fwlink/?LinkId=716913>

### Device.Audio.APO.MicArrayRawData

*System effect in the capture path provides RAW data from microphone array when requested by the client.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If a microphone array processing algorithm is provided in a Windows system effect audio processing object (APO) instantiated in a stream effect (SFX) insert point in capture path, it must provide all the individual audio streams as channels from the array when a client asks for a format with number of channels equal to the number of microphone elements in the array. This allows the APO to provide hardware compensation processing and microphone array processing to the client that takes advantage of the entire APO, but allows clients that rely on the microphone array processing that resides higher up in the audio subsystem to take advantage of hardware compensation in the APO but not the array processing in it.

It is highly recommended for onboard fixed-position microphone array (multiple combined elements) on a system to follow “Speech Platform Device Recommendations Specification” for an optimized experience.

<a name="device.audio.base"></a>
## Device.Audio.Base

*This device must match all base tests.*

### Device.Audio.Base.AudioProcessing

*Audio devices must support proper audio processing discovery and control.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Drivers

At a minimum, a driver must support a raw mode or a default mode pin on any render pins. At a minimum, drivers other than Bluetooth HFP, must support raw mode on any capture pins. Bluetooth HFP may support raw or default mode on capture. On the pins provided to the system the hardware must supply a post-mix volume if it supports a) mixing or b) audio offload. Also, the hardware must supply mute on the render side, if it supports a) mixing or b) audio offload or c) compressed.

Endpoint effects must be scenario neutral. The endpoint effects must work in all scenarios. For effects that may harm a scenario such as real time communications or only be beneficial to one scenario, the effect must be placed into the mode effects that are specific to that scenario. The only allowed Endpoint effects (EFX) and Raw Mode Effects (MFX in raw mode) are speaker compensation and speaker protection.

In addition drivers that support the RAW mode must support the following depending on your driver structure:

-   A driver that supports mixing without offload support (supports multiple concurrent modes but does not support offload) shall include a KSNODETYPE\_SUM node and no KSNODETYPE\_AUDIO\_ENGINE node. The node shall have a single input connection coming from the software pin factory, and represents the point where multiple instances of the pin are mixed.

-   The KSNODETYPE\_AUDIO\_ENGINE or KSNODETYPE\_SUM node shall be in the path between the software pin factories and the endpoint bridge pin. The node shall be in the same filter as the software pin factories.

-   The node shall support KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES.

    -   For Port Class drivers, the miniport shall support IMiniportAudioSignalProcessing. The port shall add KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES to the appropriate pin.<br/><br/>

-   A driver that supports mixing (with offload and/or multiple modes) shall support a loopback pin.

-   Loopback pins shall be in new pin category KSPINCATEGORY\_AUDIOLOOPBACK. The topology shall have a path from the software pin factory to the loopback pin factory.

-   A driver that does not support mixing shall support KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES on the endpoint’s software pin factory.

    -   For Port Class drivers, the miniport shall support IMiniportAudioSignalProcessing. The port shall add KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES to the appropriate pin.<br/><br/>

-   The software pin factory data ranges shall include KSATTRIBUTE\_AUDIO\_SIGNALPROCESSINGMODE. The attribute shall not be marked KSATTRIBUTE\_REQUIRED.

-   The pin creation code shall check for KSDATAFORMAT\_ATTRIBUTES in the data format and process the KSATTRIBUTE\_AUDIOSIGNALPROCESSINGMODE if present.

For Port Class drivers, the driver’s implementation of NewStream on IMiniportWaveRT, IMiniportWavePci, or IMiniportWaveCyclic shall support KSDATAFORMAT\_ATTRIBUTES.APOs

-   If the driver’s APOs support DEFAULT then the offload pin shall support DEFAULT.

-   The APOs shall support all modes that are supported by the offload pin.

-   APOs shall support all the modes supported by the host pin.

Discovery

Driver must expose all audio effect via the FXStreamCLSID, FXModeCLSID, and FXEndpointCLSID APOs (or proxy APOs). The APOs must send an accurate list of effects that are enabled to the system when queried. Drivers must support APO change notifications and only notify the system when an APO change has occurred.

Loopback

The loopback stream should represent the stream coming out of the speaker. Drivers with hardware processing must provide the system an accurate loopback stream.

### Device.Audio.Base.Endpoints

*Audio subsystem properly reflects current system configuration*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**All Audio Devices**

Any audio device that is exposed by any of the audio device enumeration APIs must reflect the current state of all of its endpoints appropriately at all times when the system is powered on. This includes the case when the system is in connected standby. Built-in speakers and microphones must work while the system is operational.

If an endpoint is exposed by any of the device enumeration APIs, and its state reflects being connected and capable of streaming, it must be functional (capable of capture/render). Exposed audio end points need to continue to function even during system state changes such as:

 - While the power source changes from external to battery or vice versa

 - While switching from an integrated GPU to a descrete GPU or vice versa

**Devices that use Windows 10 Mobile**

The audio driver must not perform hidden stream redirection, routing, switching, splitting, mixing, muxing to other exposed or hidden logical audio devices, applications or other entities but it must ensure that the audio stream from the audio system endpoint for a particular logical device is only directed to that particular logical device that the application is streaming to, as set by the Windows user in the Windows Sound control panel.

**Headphone connectors, speaker connectors, HDMI connectors, DisplayPort connectors, devices connected through a docking station, wireless and network connected audio devices**

The driver needs to properly express the connection state of the corresponding devices.

If the connector is not plugged, or the wireless or network device is not in a connected usable state then the driver must either:

1.  Set the KSJACK\_DESCRIPTION.IsConnected member to FALSE, or

2.  Disable the KS filter interface

    -   For AvStream drivers: Declare a connector is unplugged by implementing the following properties and events:

        -   KSPROPSETID\_Jack

            -   KSPROPERTY\_JACK\_DESCRIPTION

            -   KSPROPERTY\_JACK\_DESCRIPTION2

        -   KSEVENTSETID\_PinCapsChange

            -   KSEVENT\_PINCAPS\_JACKINFOCHANGE

    -   For Port Class drivers: Unregister the Port Class subdevice by calling PcUnregisterSubdevice

Similarly, when the connector is plugged, or the wireless or network device is connected an in a usable state, then the driver must either:

1.  Set the KSJACK\_DESCRIPTION.IsConnected member to TRUE, or

2.  Enable the KS filter interface:

    -   For AvStream drivers: Declare a connector is plugged by implementing the following properties and events:

        -   KSPROPSETID\_Jack

            -   KSPROPERTY\_JACK\_DESCRIPTION

            -   KSPROPERTY\_JACK\_DESCRIPTION2

        -   KSEVENTSETID\_PinCapsChange

            -   KSEVENT\_PINCAPS\_JACKINFOCHANGE

    -   For Port Class drivers: Registers the Port Class subdevice by calling PcRegisterSubdevice

Whenever the driver changes the KSJACK\_DESCRIPTION.IsConnected member, the driver must generate the event KSEVENTSETID\_PinCapsChange / KSEVENT\_PINCAPS\_JACKINFOCHANGE.

The above behavior ensures Windows routes audio to the connector or device only when it is truly available for streaming.

For connectors and wireless or network devices, mechanism (a) is preferred. This makes the device visible in the system UI (e.g., the Windows Sound control panel), even though it might not be immediately usable, and it ensures that the device is displayed with correct status.

For devices that are in a detachable docking station, mechanism (b) is recommended.

For connectors that are on a detachable docking station, mechanism (b) is recommended to reflect the attachment of the dock. Mechanism (a) is recommended to reflect whether the connector is plugged.

*Design notes:* See the Microsoft UAA HD Audio Pin Configuration Programming Guidelines white paper for additional clarifications on the specified jack connectors that require jack detection.

http://go.microsoft.com/fwlink/?LinkId=716908

### Device.Audio.Base.FunctionsPostUpgrade

*Audio devices function properly after the OS has been upgraded*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

In order to support frequently upgrading the Windows OS, all audio drivers should properly migrate as part of the Windows upgrading process. Post upgrade, the audio device should function properly and have equal or greater functionality as it did before upgrade.

In order to meet this requirement, no function should depend on anything (files, registry settings, etc.) installed outside of a driver package with the exception of OS components or other drivers on the system. For example, driver customizations (e.g., presets, mic-array geometry info, OEM customization) should be included in the audio driver package rather than installed directly on the system on the factory floor. Ideally, the driver installation would be installed deterministically using only INF directives.

### Device.Audio.Base.HardwareArchitecture

*Audio subsystems must use a technology compatible with Windows.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Integrated audio devices**

An *integrated audio device* is one that supports an internal component or a port that’s used exclusively for media content. Here are some examples of integrated audio devices:

-   Speakers

-   Microphones and microphone arrays

-   Analog audio jacks (headphone jack, line out, line in, microphone jack)

-   S/PDIF

-   Digital outputs like HDMI and DisplayPort

For these devices, any audio hardware architecture can be used provided at least *one* of the following is true:

-   The device provides basic functionality for all of its endpoints when used with any of the audio class drivers packaged with Windows.

-   A driver is available through Windows Update that will enable basic functionality for all the device’s endpoints.

**Externally connected audio devices**

An *externally connected audio device* is one that isn’t integrated to the system and has a connection that isn’t specific to audio or media. Here are some examples of external audio devices:

-   USB audio

-   Bluetooth audio

For these devices, any audio hardware architecture can be used, but we strongly recommended that these devices conform to standard specifications and provide basic functionality with a Windows audio class driver. On certain Windows devices that don’t allow the installation of a third-party drivers, the only way for an external audio device to function is if it’s compatible with a class driver.

**All audio devices**

If the PnP ID of an audio device is compatible with any of the audio class drivers packaged with Windows, the device must provide basic functionality for all of its endpoints when using that driver.

A device provides *basic functionality* when it meets all the Windows Hardware Certification audio device requirements.

**For more info**

[Audio Device Technologies](http://msdn.microsoft.com/en-us/library/windows/hardware/gg454527.aspx): http://go.microsoft.com/fwlink/?LinkId=716909

### Device.Audio.Base.PowerManagement

*Audio device must comply with related power management specifications.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**All Audio Devices and Drivers**

Audio devices must comply with Audio Device Class Power Management Reference Specification, which provides definitions of the device power states (D0–D3) for these devices. The specification also covers the device functionality expected in each power state and the possible wake-up event definitions for the class. The device and driver must implement support for power state D3. Support for other device power management states is optional.

**Bluetooth Audio Devices**

Bluetooth audio devices must complete an HCIDisconnect before powering down.

The HCIDisconnect is required to allow for timely notification to the system that the device is no longer available. This is used to reroute audio to an alternate audio sink seamlessly when the Bluetooth audio device is powered off.

**Reference(s)**

ACPI Specification: <http://www.acpi.info/>

Bluetooth Specifications: <https://www.bluetooth.org/en-us/specification/adopted-specifications>

MSDN: http://go.microsoft.com/fwlink/?LinkId=716910

### Device.Audio.Base.SamplePositionAccuracy

*Audio driver reports render sample position with defined accuracy for stream synchronization.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

For all audio endpoints, IAudioClock::GetPosition shall report timestamps with:

-   |bias| &lt;= 1ms

-   |skew| &lt;= 1%

-   Jitter &lt;= 1ms

This requirement applies to both render and capture for all formats, modes, and pins (host, offload, loopback).

### Device.Audio.Base.StreamingFormats

*Audio subsystems must use formats supported by Windows.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**All Audio Devices**

This requirement applies to both input (capture) and output (render) devices.

An audio device must expose support for at least one PCM (Pulse Code Modulation) encoded format compatible with Windows.

At least one of the following bit depths and containers must be used:

-   8-bit (unsigned)
-   16-bit
-   20-bit in a 24-bit container
-   24-bit
-   24-bit in a 32-bit container
-   32-bit

The samples must be either integer or IEEE 754 float.

Any sampling rate will work with the windows audio pipeline; however, it is suggested that 48 kHz and 44.1 kHz be supported for optimal power performance in media scenarios.

If the device supports both input and output capabilities, the audio device must support independent selection of formats and support concurrent streaming at arbitrarily selected formats.

Channel configurations must be at least one of the following:

-   (mono)
-   (stereo)
-   2.1
-   3.1
-   4.0
-   5.0
-   5.1
-   7.1

If the audio device supports multichannel audio formats, the audio device driver must deal with channel masks consistent with the content and the current selected speaker configuration.

Loopback pins should match the format of their corresponding default mode host render pins.

**Digital Devices with External Connections**

For devices where there exists a source and sink relationship (such as HDMI and Bluetooth), a source device must support and expose all required sink formats. For example, HDMI requires a sink support 48 kHz *or* 44.1 kHz; therefore, an HDMI source must support (at a minimum) both 48 kHz *and* 44.1 kHz so that any HDMI sink device connected will function properly. It is suggested that sources support all possible sink formats for the best user experience.

**Hardware Acceleration (Offloading)**

Devices that leverage a DSP for audio offloading must support a superset of formats that are supported by the host (system) pin on the same device. This ensures that offloading is used whenever possible and avoids unnecessary fall back to the host pin.

At a minimum, offloaded pins must support both 48 kHz and 44.1 kHz sampling rates.

**Reference(s)**

MSDN: <http://go.microsoft.com/fwlink/?LinkId=716911>

MSDN: <https://msdn.microsoft.com/en-us/library/windows/hardware/ff537083.aspx>

### Device.Audio.Base.SupportWindowsAPIs

*Drivers should function properly with all Windows Audio APIs*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Drivers should stream properly when using any of the Windows Audio APIs. This includes, but is not limited to, the following:

-   Media Foundation APIs

<!-- -->

-   XAudio2 APIs

-   WASAPI

-   MediaCapture APIs

### Device.Audio.Base.VolumeControl

*Audio driver volume controls are linear and have adequate resolution.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Signal response (as measured by electrical or digital signal level) changes in linearity with the volume control within 3% tolerance. For example: a volume slider change of 10 dB should result in a measured volume change between 9.7 dB and 10.3 dB + or – 0.3dB.

Topology volume nodes must have a resolution equal to or better than 1.5 dB and implement driver support for volume level as defined in the Windows Driver Kit.

See the Windows Driver Kit, "KSPROPERTY\_AUDIO\_VOLUMELEVEL” for more details.

<a name="device.audio.hardwareaudioprocessing"></a>
## Device.Audio.HardwareAudioProcessing

*HardwareAudioProcessing*

### Device.Audio.HardwareAudioProcessing.AudioHardwareOffloading

*Hardware that supports offloaded audio render processing must meet this requirement.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**If a hardware solution supports offloaded audio render processing, the driver must expose a KS filter and a single KSNODETYPE\_AUDIO\_ENGINE node with appropriate pin factories connected.**

If a hardware solution supports the offloading of audio render processing, mixing, or decoding, the driver must expose a KS filter. For each rendering path through that filter that supports hardware offloading the driver must expose a single KSNODETYPE\_AUDIO\_ENGINE node, connecting directly to only the following pin factories:

-   Two KS sink pin factories

-   a single KS source pin factory for reference stream support

**If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver and hardware must support base-level functionality.**

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver and hardware must support the following capabilities:

-   Audio mixer with at least 3 simultaneous inputs (2 offload and 1 host process)

-   Volume and mute capabilities both pre- and post-mixing

-   Reference stream (support for sending the audio stream post-mix back to the Windows audio stack)

-   The reference stream provided should be the final output to the audio device, or, if encoding is taking place, just prior to encoding.

**If hardware supports metering reporting (support for querying per-stream peak values, both pre & post-mix) **

-   For stream metering (pre-mixing), metering levels should be reported after the SFX and before volume control

-   For endpoint metering (post-mixing), metering levels should be reported:

    -   Before volume control and EFX, when the EFX is an encoder

    -   After the EFX and before volume control, when the EFX is not an encoder

**If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must expose certain pin factories.**

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must expose the following pin factories:

-   Host process pin factory

    -   Must support at least one instance

-   Offload pin factory

    -   Must support at least two instances

-   Loopback pin factory

    -   Must support at least a single instance

In addition, the following must be met:

-   Loopback pins must:

    -   Have a “Possible Global Instances” of at least 1

    -   Support at least 1 instance regardless of what else is going on in the system

-   To enable scenarios like cross-fade, offload-capable endpoints must support 1 loopback pin instance + 1 host pin instance + each of the following in isolation, assuming no other offload endpoints are being used at the time:

    -   Any of supported PCM format + Any of supported PCM format (the same, or different)

<!-- -->

-   The loopback pin must support

    -   The HW mix format

    -   The device format (which can be publically queried from the endpoint property store)

**If a hardware solution supports offloaded audio render processing, the same functionality provided in hardware (e.g., processing, effects, etc.) must be available on the host pin as well.**

In order to provide a consistent user experience and prevent confusion when a user enables or configures functionality that exists in only hardware or only software, the capabilities provided must be equal in both hardware and software.

**Other Considerations**

Offloaded audio devices must accept and properly react to end of segment (EOS) communication from the operating system.

If a hardware solution supports offloaded audio render processing, the driver must implement IMiniportAudioEngineNode and IMiniportStreamAudioEngineNode2

IMiniportAudioEngineNode contains a list of methods related to the offload KS properties targeting the audio engine node via KS filter handle. A miniport driver's WaveRT miniport class needs to inherit not only from IMiniportWaveRT interface, it also needs to inherit IMiniportAudioEngineNode interface and implement all the defined methods.

<a name="device.audio.hdaudio"></a>
## Device.Audio.HDAudio

*This audio device uses the HD audio driver.*

### Device.Audio.HDAudio.HDAudioSpecCompliance

*HD Audio codec for audio must comply with the Intel High Definition Audio specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A **High Definition Audio codec** must comply with the following specifications:

-   Intel High Definition Audio Specification and DCNs

-   Plug and Play Guidelines for High Definition Audio Devices

Additionally, the code must implement the following features, which are not necessarily required by the Intel High Definition Audio Specification:

Speaker compensation is the only valid scenario for audio signal processing of an audio stream by a codec, and then it is valid only if the speakers are hardwired to the pin complex that contains the processing node (such as integrated laptop speakers). This requirement does not apply to the decryption of protected audio streams.

<ol style="list-style-type: decimal">
<li><p>When all of an HDAudio codec's widgets are configured in the benign processing state, the codec performs no nonlinear or time-variant processing on the audio streams that pass through it.</p></li>
<li><p>An HDAudio codec must be accessible only through the HDAudio bus controller. The codec must not expose registers or other hardware mechanisms that are accessible through either memory or I/O address space. This requirement does not encompass HDMI or DisplayPort. For HDMI or DisplayPort, please refer to the HD audio HDMI DCN.</p></li>
<li><p>Modem and audio functionality must not be combined. Although the same piece of silicon can house both modem and audio devices, the functions must be separate devices and must not share any software or hardware resources (such as ADCs or DACs).</p></li>
<li><p>When the HD Audio link is in a running state (HD Audio controller is in D0), HD Audio codecs must respond to commands even when powered down in all required device power-management states. In effect, the digital section of the codec must remain powered.</p></li>
<li><p>Codecs must respond to a verb even if addressed at a nonexistent widget or if the verb itself is invalid.</p></li>
<li><p>Function group nodes must have node IDs in the range 0 to 127. This restriction does not apply to node IDs for widget nodes.</p></li>
<li><p>The default data in the HD Audio codec pin configuration registers must not misrepresent the hardware capabilities, and the Configuration Default Registers must not be null (all zeros).</p></li>
<li><p>A function group in an HDAudio codec must expose a nonzero subsystem ID. The BIOS overwrites the subsystem ID if necessary. If the BIOS cannot program the subsystem ID or if it does so incorrectly, the hardware must supply a default, vendor-specific subsystem ID.</p></li>
<li><p>Each HD Audio codec port connects to one and only one audio source, destination, or jack. For compatibility with the class driver, do not double-up on input or output ports in ways that cannot be exposed to the class driver through the information in the pin configuration registers. Designs that use GPIOs under control of third-party function drivers must default to an appropriate hardware configuration when the class driver is loaded.</p></li>
<li><p>HD Audio Codec Driver Must Not Leave Function Group in D3Cold State Upon Unload. By the exit of the IRP handler for IRP_MJ_PNP/IRP_MN_REMOVE_DEVICE, an HD Audio Codec driver must have:</p>
<ol style="list-style-type: lower-alpha">
<li><p>Remembered or discovered the current power state of the function group</p></li>
<li><p>If that current function group power state was D3 Cold, the driver must have changed it to a different power state. The function group power state upon exit is required to be D3.</p></li>
</ol></li>
</ol>

**HD Audio controllers must comply with the following requirements:**

1.  Intel High Definition Audio Controller specification

2.  Be updated to comply with future specification revisions

3.  Comply with the latest HD Audio specification ECRs in accordance with policies around new hardware requirements.

4.  HD Audio hardware that complies with HD Audio specification version 1.0 must set the correct version number in the appropriate registers. The VMAJ and VMIN registers must specify a major version number of 01h and a minor version number of 00h.

<a name="device.audio.usb"></a>
## Device.Audio.USB

*This audio device uses the USB audio driver.*

### Device.Audio.USB.HIDControls

*USB audio device uses USB HID audio controls to keep the operating system informed of user interactions with the device.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

USB audio devices must use USB HID specification-compliant HID to control basic functions. If volume adjustment controls are implemented on the USB audio device, it must declare itself as a consumer control device (usage 0x01), as defined in Consumer Page (page 0x0C) in the USB Usage Tables for HID Power Devices, Release 1.1, and in Windows support for HID-based audio controls.

Communication devices that implement a USB HID interface must be compliant with the USB Device Class Definition for Human Interface Devices (HID), Version 1.1, and USB Usage Tables for HID Power Devices, Version 1.12.

Devices may not use Reserved usages from any Standard Usage Page.

See "HID Audio Controls and Windows" at <http://go.microsoft.com/fwlink/?LinkId=40491> and the Windows Driver Kit, "HID and Windows" for more design information.

### Device.Audio.USB.USB

*USB audio device must follow UAA USB audio design guidelines.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Description: A USB audio-based audio device in a stand-alone external form factor, or in an AVR or in other permutations complies with the Device.Audio.Base.HardwareArchitecture.

Special attention should be made to the following:

-   USB audio device must properly set descriptor to indicate the purpose of device according to the USB spec <http://www.usb.org/developers/devclass_docs/termt10.pdf>.

-   An externally connected USB based microphone array device must comply with the USB Device Class Definition for Audio Devices 2.0, and must be implemented according to the guidelines in "Microphone Array Support in Windows Vista." The device must report itself and its capabilities according to the design guidelines in the Microsoft USB Audio Microphone Array Design Guidelines.

**Reference:**

Universal Serial Bus Device Class Definition for Audio Devices 2.0 at [*http://www.usb.org/developers/docs/devclass\_docs/*](http://www.usb.org/developers/docs/devclass_docs/)
