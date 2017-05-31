---
title: Audio
description: Audio
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 50D6AD0A-42CE-4A92-88BA-ED300150D1F0
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Audio


This document provides recommendations for the design and development of audio devices, including audio playback and audio input devices intended for use with Microsoft’s Speech Platform. The Speech Platform is used to power all of the speech experiences in Windows 10 such as Cortana and Voice Dictation. The goal for this document is to enable ecosystem partners to build device with optimized audio experience with Microsoft technology.

The minimum hardware requirements and Windows Hardware Compatibility Program requirements are fundamental for creating Windows-compatible audio solutions. Although the programs are optional, it is highly recommended that audio products meet both sets of requirements to ensure basic audio quality.

## Minimum hardware requirements for Audio


The following table summarizes the minimum hardware requirements for Audio. For more detail, see section 6.2.2 in [Minimum hardware requirements](https://msdn.microsoft.com/library/windows/hardware/dn915086.aspx).

<table>
<tbody valign="top">
<tr class="odd">
<td>Audio decode and encode</td>
<td>The codecs supplied by Windows 10 must not be removed or modified. OEMs may add software or hardware audio decoders or encoders not provided by Microsoft.</td>
</tr>
<tr class="even">
<td>Audio codec hardware</td>
<td><ul>
<li>The codec must support at least one of the bit depths and containers listed in section 6.2.2 in Minimum hardware requirements.</li>
<li>The codec must support at least one of the channel configurations listed in section 6.2.2 in Minimum hardware requirements.</li>
<li>The samples must be either integer or IEEE 754 float.</li>
<li>Devices that support both audio input and output must support independent selection of formats and support concurrent streaming at arbitrarily selected formats subject to resource limitation.</li>
</ul></td>
</tr>
<tr class="odd">
<td>Audio input routing for cellular devices</td>
<td>The device must route audio input from these sources:
<ul>
<li>Handset microphone</li>
<li>Wired headset microphone</li>
<li>Bluetooth Hands-Free Profile microphone</li>
<li>Processor (optional)</li>
</ul></td>
</tr>
<tr class="even">
<td>Audio output routing for cellular devices</td>
<td>The device must route audio output to these destinations:
<ul>
<li>Handset speaker</li>
<li>Loudspeaker</li>
<li>Wired headset/headphone</li>
<li>Bluetooth Hands-Free Profile</li>
<li>Processor (Optional for Cellular RX source; required for voice call recording if there is a mix of cellular RX and TX)</li>
</ul></td>
</tr>
<tr class="odd">
<td>Audio output for FM stereo devices</td>
<td>The device must route audio output between the FM stereo and these destinations:
<ul>
<li>Loudspeaker</li>
<li>Wired headset microphone</li>
<li>Processor (Optional)</li>
</ul></td>
</tr>
</tbody>
</table>

 

### Windows Hardware Compatibility Program requirements for Audio

The following table lists the requirements for Audio devices for the [Windows Hardware Compatibility Program](https://msdn.microsoft.com/library/windows/hardware/dn922588.aspx). Click the corresponding link for more details about each requirement.

| Requirement                                                                                                                                                  | Description                                                                                                                                                                                                                                                                                                                                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Device.Audio.APO.MicArrayRawData](../compatibility/device-audio.md#deviceaudioapomicarrayrawdata)                                                           | If a microphone array processing algorithm is provided in a Windows system effect APO instantiated in a stream effect (SFX) insert point in the capture path, it must provide all the individual audio streams as channels from the array when a client asks for a format with number of channels equal to the number of microphone elements in the array.   |
| [Device.Audio.Base.AudioProcessing](../compatibility/device-audio.md#deviceaudiobaseaudioprocessing)                                                         | Audio devices must support proper audio processing discovery and control.                                                                                                                                                                                                                                                                                    |
| Device.Audio.Base.DRM                                                                                                                                        | Audio device must implement DRM support as defined in [Digital Rights Management](https://msdn.microsoft.com/library/windows/hardware/ff536260.aspx) in the Windows Driver Kit.                                                                                                                                                                              |
| [Device.Audio.Base.Endpoints](../compatibility/device-audio.md#deviceaudiobaseendpoints)                                                                     | Any audio device that is exposed by any of the audio device enumeration APIs must reflect the current state of all of its endpoints appropriately at all times when the system is powered on.                                                                                                                                                                |
| [Device.Audio.Base.HardwareArchitecture](../compatibility/device-audio.md#deviceaudiobasehardwarearchitecture)                                               | Audio subsystems must use a technology compatible with Windows.                                                                                                                                                                                                                                                                                              |
| [Device.Audio.Base.PowerManagement](../compatibility/device-audio.md#deviceaudiobasepowermanagement)                                                         | Audio device must comply with related power management specifications.                                                                                                                                                                                                                                                                                       |
| [Device.Audio.Base.SamplePositionAccuracy](../compatibility/device-audio.md#deviceaudiobasesamplepositionaccuracy)                                           | Audio driver reports render sample position with defined accuracy for stream synchronization.                                                                                                                                                                                                                                                                |
| [Device.Audio.Base.StreamingFormats](../compatibility/device-audio.md#deviceaudiobasestreamingformats)                                                       | Audio subsystems must use formats supported by Windows.                                                                                                                                                                                                                                                                                                      |
| [Device.Audio.Base.VolumeControl](../compatibility/device-audio.md#deviceaudiobasevolumecontrol)                                                             | Audio driver volume controls are linear and have adequate resolution.                                                                                                                                                                                                                                                                                        |
| [Device.Audio.HardwareAudioProcessing.AudioHardwareOffloading](../compatibility/device-audio.md#deviceaudiohardwareaudioprocessingaudiohardwareoffloading)   | Hardware that supports offloaded audio render processing must meet this requirement.                                                                                                                                                                                                                                                                         |
| [Device.Audio.HDAudio.HDAudioSpecCompliance](../compatibility/device-audio.md#deviceaudiohdaudiohdaudiospeccompliance)                                       | HD Audio codec for audio must comply with the Intel High Definition Audio specification.                                                                                                                                                                                                                                                                     |
| [Device.Audio.USB.HIDControls](../compatibility/device-audio.md#deviceaudiousbhidcontrols)                                                                   | USB audio device uses USB HID audio controls to keep the operating system informed of user interactions with the device.                                                                                                                                                                                                                                     |
| [Device.Audio.USB.USB](../compatibility/device-audio.md#deviceaudiousbusb)                                                                                   | USB audio device must follow UAA USB audio design guidelines.                                                                                                                                                                                                                                                                                                |

 

## Scenario for optimizing multi-stream audio playback


Although Multi-streaming is no longer a requirement for the Windows 10 Desktop edition, it is highly recommended to have a minimum of two Digital-to-Analog Converters (DAC) to support Multi-streaming scenarios. If a single DAC (such as a Redirected headphone) is used, it is highly recommended to support audio volume control and status independently for each audio endpoint (such as e.g. integrated speakers, or a 3.5mm audio jack) so that user setting preferences can be retained.

## Optimizing an audio solution for speech and communications


Once the audio solution meets both minimum hardware requirements and Windows Compatibility Program requirements, the audio solution will provide basic audio experiences in Windows. Depending on the targeted market segment, a device may support two additional optimizations: Speech Platform and Skype. Recommendations for both Speech Platform and Skype build upon the requirements for a basic audio experience. It would be a challenge to optimize for Speech Platform or Skype if the audio solution does not fully meet the basic requirements.

**Note**  Guidelines for Telephony and applications such as Skype will be supplemented to this topic when they are available.

 

![audio recommendations](../images/audiorecommendationsv2.png)

## Speech recognition in Windows 10


Device manufacturers are encouraged to integrate and tune speech enhancement processing into their device in order to optimize performance relative to the [Speech Recognition test criteria](https://msdn.microsoft.com/library/windows/hardware/dn957009.aspx).

For devices without integrated speech enhancement processing, Microsoft provides default processing in Windows 10. The speech enhancement processing from Microsoft does not need device-specific tuning by the IHV.

The following flowchart shows how either a third-party or the Microsoft speech enhancement processing gets used.

The Microsoft speech enhancement pipeline will be used if the audio driver does not expose a microphone geometry and audio signal processing for speech. To utilize third-party enhancements, the microphone geometry must be provided, support “speech” signal processing mode on the audio input, and ensure that the effects provided by the audio driver or its software APOs include at least noise suppression and echo cancellation.

## Difference between Speech Recognition and Telephony


Many devices that target Speech Recognition functionality will also target Telephony usage. The similarities are evident – both scenarios use devices with microphones to pick up human speech, audio processing pipelines to remove noise from the environment and enhance human speech, and consuming applications that rely on a clear speech signal in order to understand the speech.

The differences lie in who or what consumes the speech signal. Telephony has a human consumer, for whom perceptual voice quality and speech intelligibility are paramount. Speech recognition has an algorithmic consumer, where machine learning trained on specific features of the speech signal determine what is recognized, and where those features do not necessarily align to perceptual norms.

Perceptual voice quality is often correlated with speech recognition accuracy, but this is not always the case. This document focuses on methods of evaluating and maximizing speech recognition accuracy. It is recommended to support the “speech” signal processing mode and to tune that mode specifically for speech recognition.

Passing [Skype/Lync audio certification](https://technet.microsoft.com/office/dn788953) is a strong indicator of good device audio performance.

## Audio device recommendations


The following sections cover recommendations for speech. To ensure a high quality speech experience, all devices should be tested against these performance requirements.

| Area                                                  | Type of guidance                                                                                                                                | Which devices should be tested                                                     |
|-------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Device.SpeechRecognition | Provides the speech recognition performance requirements to ensure a high quality speech experience.                                            | All devices should be tested against these performance requirements.               |
| Device.Audio                         | Provides guidelines in order to function optimally with the host OS in terms of software interfaces, communication protocols, and data formats. | All devices should be tested against these guidelines.                             |
| Device.Audio.Acoustics     | Provides recommendations and best practices for acoustics and related properties of device design.                                              | Most relevant for devices that will use Microsoft’s speech enhancement processing. |

 

### Device.SpeechRecognition

The following table summarizes Microsoft recommendations for target speech recognition accuracy for devices in various environments. For test steps, see [Cortana Device Test Setup](https://msdn.microsoft.com/library/windows/hardware/dn957009.aspx). All targets are in speech accuracy. All three tests must reach Standard to be classified as Standard.

| Test                                  | Description                                                                                                         | Target                               | Recommendation             |
|---------------------------------------|---------------------------------------------------------------------------------------------------------------------|--------------------------------------|----------------------------|
| Device.SpeechRecognition.Quiet        | An ideal environment with minimal ambient noise (noise floor &lt; 35 dBA SPL) and no receive (echo path) noise.     | Quiet &lt;= 35 dBA SPL               | Premium: 95% Standard: 90% |
| Device.SpeechRecognition.AmbientNoise | Various levels and types of noisy environments, e.g. [Café & Pub](http://go.microsoft.com/fwlink/p/?linkid=528451). | Ambient Noise @ DUT &gt;= 57 dBA SPL | Premium: 90% Standard: 85% |
| Device.SpeechRecognition.EchoNoise    | Various levels and types of render playback scenarios (e.g. media playing).                                         | Echo Noise @ LRP &gt;= 70 dBA SPL    | Premium: 90% Standard: 85% |

 

The microphone gain setting should be set to an optimal level used to pass the above tests. The resulting gain setting can then be set in a registry key as follows:

HKLM\\SOFTWARE\\Microsoft\\Speech\_OneCore\\AudioInput\\MicWiz\\DefaultDefaultMicGain

For examples, this registry key sets the microphone gain as 42.00%, which is 0x1068:

"DefaultDefaultMicGain"=dword:00001068

For more information and examples, see [Cortana Device Recommendations](https://msdn.microsoft.com/library/windows/hardware/dn957008.aspx).

### Device.Audio

Recommendations in this section are made regarding the software and hardware interfaces, communication protocols, and data formats of the device. Devices intended to use speech recognition functionality must meet all [Device.Audio Requirements](https://msdn.microsoft.com/library/windows/hardware/jj134354.aspx).

| Name                                     | Recommendation                                                                                                                                                                                                                                                                                                           |
|------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Device.Audio.Base.AudioProcessing        | Drivers must expose all audio effect via the FXStreamCLSID, FXModeCLSID, and FXEndpointCLSID APOs (or proxy APOs). The APOs must send an accurate list of effects that are enabled to the system when queried. Drivers must support APO change notifications and only notify the system when an APO change has occurred. |
| Device.Audio.Base.StreamingFormats       | Speech recognition functions under all audio capture and render streaming formats defined in the StreamingFormats HLK, with the optimum being 16 kHz with 24-bit capture and mono render.                                                                                                                                |
| Device.Audio.Base.SamplePositionAccuracy | It is important that render and capture audio signals are both 1) sampled accurately and 2) time-stamped accurately.                                                                                                                                                                                                     |
| Device.Audio.USB.USB                     | All USB audio input devices must properly set descriptor according to the [USB.org device class spec](http://www.usb.org/developers/docs/devclass_docs/).                                                                                                                                                                |
| Driver Guidelines                        | [Roadmap for developing WDM Audio Drivers](http://www.microsoft.com/whdc/device/audio/wavertport.mspx)                                                                                                                                                                                                                   |

 

### Device.Audio.Acoustics

Recommendations in this section are made regarding the acoustic and related properties of the device, such as microphone and loudspeaker placement, microphone responses, received noise from the device, and so on. Microphone selection, placement, integration, and array design are some of the most important factors to support quality speech recognition performance.

The recommendations and tests are relative to the signal before the speech enhancement processing but after microphone equalization and fixed microphone gain.

For more details about all of these recommendations, including recommended mic array geometries, see [Device.AudioAcoustics Recommendations](https://msdn.microsoft.com/library/windows/hardware/dn957008.aspx#section-4--device-audioacoustics-recommendations).

| Name                                            | Recommendation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Device.Audio.Acoustics.MicArray                 | Refer to [Microphone Array Support in Windows](http://msdn.microsoft.com/library/windows/hardware/dn613960.aspx). The audio driver must implement the [KSPROPERTY\_AUDIO\_MIC\_ARRAY\_GEOMETRY](https://go.microsoft.com/fwlink/p/?linkid=528456) property. Then the System.Devices.MicrophoneArray.Geometry property can be accessed via the Windows.Devices.Enumeration API. The USB audio driver will support this property for USB microphone arrays that have the appropriate fields set in the USB descriptor. |
| Microphone Array Descriptor                     | The device must describe its microphone type and geometry using the mic array descriptor.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Device.Audio.Acoustics.MicSensitivity           | The Max recommendation is set to be able to support speech input levels considered to be “loud” and the Min recommendation is set to be able to support speech input levels considered to be “quiet.”                                                                                                                                                                                                                                                                                                                |
| Device.Audio.Acoustics.MicIntegration           | The microphones must be integrated to ensure a good acoustic seal between the microphone and the device chassis, and if appropriate, along the microphone porting tube. Minimize the acoustic noise and vibration between the system and the microphone. Two typical solutions are to use a rubber boot or a gasket. Whichever method is chosen check that the acoustic seal is sufficient across all production tolerances and over both environmental and lifetime changes.                                        |
| Device.Audio.Acoustics.MicPlacement             | Place the mic as far as possible from noise sources such as loudspeakers, fans, keyboards, hard drives, and the user’s hands, and as close as possible to the speaker’s mouth.                                                                                                                                                                                                                                                                                                                                       |
| Device.Audio.Acoustics.MicSelfNoise             | Use of a high quality microphone will minimize the microphone internal noise. Microphones with an SNR of at least 61 dB nominal is recommended for Standard and 63 dB for Premium.                                                                                                                                                                                                                                                                                                                                   |
| Device.Audio.Acoustics.MicReceivedNoise         | The two main sources of received noise are acoustic noise and electrical noise. Acoustic noise may come from outside the device, or be generated internally in the device due to fans, hard disks etc. The acoustic noise can also be transmitted through the device mechanics. Electrical noise can be minimized by using digital microphones rather than analog microphones.                                                                                                                                       |
| Device.Audio.Acoustics.MicMagnitudeResponse     | The Premium and Standard masks apply to all device tiers under Device.Audio.Acoustics.Bandwidth e.g. a device can have Standard bandwidth (narrow-band) and a Premium magnitude response within that band.                                                                                                                                                                                                                                                                                                           |
| Device.Audio.Acoustics.MicPhaseResponseMatching | This recommendation ensures that the temporal relationship between signals received via microphone elements in an array is consistent with the physical geometry of the microphone elements in the array.                                                                                                                                                                                                                                                                                                            |
| Device.Audio.Acoustics.MicDistortion            | The distortion is recommended to be measured using SDNR (pulsed noise signal-to-distortion-and-noise ratio), although THD targets are also given.                                                                                                                                                                                                                                                                                                                                                                    |
| Device.Audio.Acoustics.MicBandwidth             | The sample rate of the capture signal is the primary factor in determining the effective bandwidth of the speech signal. As the speech platform uses 16 kHz acoustic models in the speech recognizer, a 16 kHz minimum sample rate is recommended. 300 Hz is the effective lower end of the speech recognizer, however 200 Hz is the recommended acoustical limit for devices also targeting voice communications.                                                                                                   |
| Device.Audio.Acoustics.RenderDistortion         | The distortion is recommended to be measured using SDNR (pulsed noise signal-to-distortion-and-noise ratio), although THD targets are also given.                                                                                                                                                                                                                                                                                                                                                                    |
| Device.Audio.Acoustics.RenderPlacement          | To enable the acoustic echo canceller to work well, the device speakers should be placed at a maximum distance from the microphones, or place directivity nulls towards loudspeakers.                                                                                                                                                                                                                                                                                                                                |

 

## Requirements to enable a third-party enhancement pipeline


The following requirements are key to enable a third-party enhancement pipeline. These and other recommendations are covered in more detail in the following sections:

-   [Device.SpeechRecognition.DefaultMicGain](..\device-experiences\speechplatformdevicesrecommendations.md#device-speechrecognition-defaultmicgain) – explains how to set microphone gain to an optimal level to pass Device.SpeechRecognition tests.

-   [Device.Audio.Acoustics.MicArray](..\device-experiences\speechplatformdevicesrecommendations.md#device-audio-acoustics-micarray) – covers mic array geometries that are recommended and known to work well with Windows.

-   Microphone location reporting –explains how to implement a reporting structure for a mic array.

-   Speech mode supports:

    -   How to register APOs for specific modes

    -   Audio signal processing modes

-   [Device.Audio.Base.Audioprocessing](https://msdn.microsoft.com/library/windows/hardware/jj134354.aspx) – Acoustic Echo Cancellation (AEC) and Nosie Suppression (NS) are required for third-party pipeline:

    -   Implementing Audio Processing Objects

    -   Audio Processing Object Architecture

## Related topics


[Windows Hardware Compatibility Program](https://msdn.microsoft.com/library/windows/hardware/dn922588.aspx)

[Windows Hardware Lab Kit](https://msdn.microsoft.com/library/windows/hardware/dn930814.aspx)

[Skype/Lync audio certification](https://technet.microsoft.com/office/dn788953)

[Microphone Array Support in Windows](http://msdn.microsoft.com/library/windows/hardware/dn613960.aspx)