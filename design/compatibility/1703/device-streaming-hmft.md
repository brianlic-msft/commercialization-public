---
title: Device.Streaming.HMFT
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

<!--
# Device.Streaming.HMFT

 - [Device.Streaming.HMFT](#device.streaming.hmft)
 -->
 
<a name="device.streaming.hmft"></a>
## Device.Streaming.HMFT

### Device.Streaming.HMFT.Decoding

*Hardware Media Foundation Transform (HMFT) must support video decoding.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**Supported Formats**

HMFT video decoder is only supported for MPEG-4 Part 2 and MJPEG. Both of these formats are if-implemented.

**Media Foundation Compliance** 
The video decoder Hardware Media Foundation Transform (HMFT) must fully comply with the following Media Foundation Transform (MFT) interfaces:

-   IMFTransform
-   IMFMediaEventGenerator
-   IMFShutdown
-   IMFQualityAdvise
-   IMFRealTimeClientEx

The HMFT video decoder must use Media Foundation work queue support (no thread creation) via **IMFRealTimeCLientEx::SetWorkQueue**. This ensures the following:

-   Multimedia Class Scheduler Service (MMCSS) support for playback and capture/encode
-   Improved core scalability

The HMFT video decoder must support **IMF2DBuffer2** for enhanced security, but also work with input buffers of type **IMF2DBuffer**, and **IMFMediaBuffer** in that order of preference.

**DirectX Rendering**

The video decoder HMFT must support both DirectX (DX) 9 and, DX11 devices, and it must avoid copies in or out of DX11 components.

On MFT\_Set\_D3D\_Manager, the video decoder HMFT must first query for DirectX Graphics Infrastructure (DXGI) Manager and then query for D3D9 Manager if DXGI Manager is not found.

The HMFT video decoder must support system memory output because some transforms in the pipeline may support only system memory buffers.

If the HMFT video decoder is based on a GPU, it must support DX11.

**Memory Usage**

The HMFT video decoder must be an asynchronous MFT. This reduces the memory working set by about 50 percent.

**Trusted Merit Certification and Verification**

The video decoder HMFT must support the Trusted Merit Certification and Verification process, as defined across the Windows Hardware Certification Kit.

Each HMFT video decoder must be provided as a separate binary and must be individually signed.

HMFT video decoders must not advertise support for more than one compression standard.

All HMFTs must set the following Media Foundation attributes while registering the MFT with the system:

-   MFT\_ENUM\_HARDWARE\_URL\_Attribute
-   MFT\_ENUM\_HARDWARE\_VENDOR\_ID\_Attribute

**Format Requirements**

HMFT video decoders must not advertise support for inbox formats supported by DirectX Video Acceleration (DXVA) (H.264, H.264, WMV, MPEG2).

**If implemented**: the HMFT video decoder for MPEG-4 Part 2 must support Simple and Advanced Simple Profile (If Global Motion Compensation (GMC) is not supported, then the media type must be rejected to allow the software decoder to be used for playback), and all levels.

-   The decoder must be fully conformant to specifications that are defined for the format.

-   In addition, the MPEG-4 Part 2 decoder must fully support H.263 baseline content and advertise support for this media type.

In addition to the preceding requirements, we recommend that the decoder support post-processing for deblocking and deringing.

Vendors may provide other HMFTs video decoders for formats that are not supported inbox, but there are no verification tests or logo certification available.

**Note:** The recommendations and requirements that are defined in this document apply to all formats.

**Functionality**

The video decoder HMFT must support the following functionalities:

-   Dynamic format and resolution changes
-   Trick modes (playback rate control, thinning mode) and seek

**Interlace Support**

The HMFT video decoder must support the input format for both interlaced and progressive bit streams. It must not de-interlace. It may support inverse telecine (IVTC).

**Multiple Instances**

The HMFT video decoder must support multiple instances of the decoder in parallel (both in-process and out of process) to enable multiple concurrent video playback streams in the same or different applications.

**Design Notes**

The HMFT video decoder must be installed and uninstalled through a device driver that meets Windows security requirements.  The driver must not cause the operating system to crash or hang, and must disallow memory violations.

Each HMFT component must be a separate binary, individually certified and signed.

### Device.Streaming.HMFT.Encoding

*Hardware Media Foundation Transform (HMFT) must support video encoding.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 Mobile x86</p>
<p>Windows 10 Mobile x64</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

**A. H.264 Encode **


If your hardware supports H.264 Encode, you must:

**A.1 Input Format Support**

The encoder must support NV12 format for input frames. Optionally, the encoder can support IYUV and YUY2 formats.

The encoder must implement support for the [IMFMediaBuffer](http://msdn.microsoft.com/library/ms696261.aspx), [IMF2DBuffer](http://msdn.microsoft.com/en-us/library/ms699894.aspx), and [IMF2DBuffer2](http://msdn.microsoft.com/en-us/library/hh447827.aspx) media buffer interfaces.

**A.2 Profile Support**

The encoder must be capable of creating output content that is conformant to the following profiles:

 - Baseline profile
 - Constrained Baseline profile
 - Main profile
 - Constrained High profile

The encoder must be capable of generating the appropriate header syntax elements to signal that it is encoded to the above listed profiles.

**A.3 Interface Support Requirements**

The H.264 encoder must support the following interfaces:

A.3.1 [IMFTransform ](http://msdn.microsoft.com/library/ms696260.aspx)

Implementation of the following methods of the [IMFTransform](http://msdn.microsoft.com/library/ms696260.aspx) interface is required:

A.3.1.1 [IMFTransform::ProcessEvent::GetAttributes](http://msdn.microsoft.com/en-us/library/ms703141.aspx)

A.3.1.2 [IMFTransform::GetInputAvailableType](http://msdn.microsoft.com/en-us/library/ms704814.aspx)

A.3.1.3 [IMFTransform::GetInputCurrentType](http://msdn.microsoft.com/en-us/library/ms705607.aspx)

A.3.1.4 [IMFTransform::GetInputStatus](http://msdn.microsoft.com/en-us/library/ms697478.aspx)

A.3.1.5 [IMFTransform::GetInputStreamInfo](http://msdn.microsoft.com/en-us/library/ms703894.aspx)

A.3.1.6 [IMFTransform::GetOutputAvailableType](http://msdn.microsoft.com/en-us/library/ms703812.aspx)

A.3.1.7 [IMFTransform::GetOutputCurrentType](http://msdn.microsoft.com/en-us/library/ms696985.aspx)

A.3.1.8 [IMFTransform::GetOutputStatus](http://msdn.microsoft.com/en-us/library/ms696269.aspx)

A.3.1.9 [IMFTransform::GetOutputStreamInfo](http://msdn.microsoft.com/en-us/library/ms703886.aspx)

A.3.1.10 [IMFTransform::GetStreamCount](http://msdn.microsoft.com/en-us/library/ms697018.aspx)

A.3.1.11 [IMFTransform::GetStreamLimits](http://msdn.microsoft.com/en-us/library/ms697040.aspx)

A.3.1.12 [IMFTransform::ProcessEvent](http://msdn.microsoft.com/en-us/library/ms695394.aspx)

Must handle the MEEncodingParameters event

A.3.1.13 [IMFTransform::ProcessMessage](http://msdn.microsoft.com/en-us/library/ms701863.aspx)

A.3.1.14 [IMFTransform::ProcessInput](http://msdn.microsoft.com/en-us/library/ms703131.aspx)

A.3.1.15 [IMFTransform::ProcessOutput](http://msdn.microsoft.com/en-us/library/ms704014.aspx)

A.3.1.16 [IMFTransform::SetInputType](http://msdn.microsoft.com/en-us/library/ms700113.aspx)

A.3.1.17 [IMFTransform::SetOutputType](http://msdn.microsoft.com/en-us/library/ms702016.aspx)

A.3.1.18 [IMFTransform::SetOutputBounds](http://msdn.microsoft.com/en-us/library/ms693812.aspx)

A.3.2 [ICodecAPI](http://msdn.microsoft.com/library/dd311953.aspx)

The encoder must support certain methods and property GUIDs of the ICodecAPI interface.

A.3.2.1 Required Methods

Implementation of the following methods of the ICodecAPI interface is required:

A.3.2.1.1 [IsSupported ](http://msdn.microsoft.com/library/dd311960.aspx)

A.3.2.1.2 [GetValue ](http://msdn.microsoft.com/library/dd311958.aspx)

A.3.2.1.3 [SetValue ](http://msdn.microsoft.com/library/dd311966.aspx)

A.3.2.1.4 [GetParameterRange](http://msdn.microsoft.com/en-us/library/dd311956.aspx)

A.3.2.1.5 [GetParameterValues](http://msdn.microsoft.com/en-us/library/dd311957.aspx)

A.3.2.2 Required Properties

Support for the following ICodecAPI property GUIDs is required

A.3.2.2.1 CODECAPI\_AVEncCommonRateControlMode

A.3.2.2.2 CODECAPI\_AVEncCommonQuality

A.3.2.2.3 CODECAPI\_AVEncCommonMeanBitRate

A.3.2.2.4 CODECAPI\_AVEncCommonMaxBitRate

A.3.2.2.5 CODECAPI\_AVEncCommonBufferSize

A.3.2.2.6 CODECAPI\_AVEncMPVGOPSize

A.3.2.2.8 CODECAPI\_AVLowLatencyMode

A.3.2.2.9 CODECAPI\_AVEncCommonQualityVsSpeed

A.3.2.2.10 CODECAPI\_AVEncVideoForceKeyFrame

A.3.2.2.11 CODECAPI\_AVEncVideoEncodeQP

A.3.2.2.12 CODECAPI\_AVEncVideoTemporalLayerCount

A.3.2.2.13 CODECAPI\_AVEncVideoSelectLayer

A.3.2.3 Optional Properties

Support for the following ICodecAPI property GUIDs is optional.

A.3.2.3.1 CODECAPI\_AVEncH264CABACEnable

A.3.2.3.2 CODECAPI\_AVEncMPVDefaultBPictureCount

A.3.2.3.3 CODECAPI\_AVEncVideoEncodeFrameTypeQP

A.3.2.3.4 CODECAPI\_AVEncSliceControlMode

A.3.2.3.5 CODECAPI\_AVEncSliceControlSize

A.3.2.3.6 CODECAPI\_AVEncVideoMaxNumRefFrame

A.3.2.3.7 CODECAPI\_AVEncVideoMeanAbsoluteDifference

A.3.2.3.8 CODECAPI\_AVEncVideoROIEnabled

A.3.2.3.9 CODECAPI\_AVEncVideoMinQP

A.3.2.3.10 CODECAPI\_AVEncVideoMaxQP

A.3.2.3.11 CODECAPI\_AVEncVideoLTRBufferControl

A.3.2.3.12 CODECAPI\_AVEncVideoMarkLTRFrame

A.3.2.3.13 CODECAPI\_AVEncVideoUseLTRFrame

A.3.2.3.14 CODECAPI\_AVEncLowPowerEncoder

A.3.2.3.15 CODECAPI\_AVScenarioInfo

A.3.2.3.16 CODECAPI\_AVEncMPVGOPSizeMin

A.3.2.3.17 CODECAPI\_AVEncMPVGOPSizeMax

A.3.2.3.18 CODECAPI\_AVEncVideoMaxTem

A.3.2.3.19 CODECAPI\_AVEncMaxFrameRate

A.3.2.3.20 CODECAPI\_VideoEncoderDisplayContentType

A.3.2.3.22 CODECAPI\_AVEncEnableVideoProcessing

A.3.2.3.23 CODECAPI\_AVEncVideoGradualIntraRefresh

A.3.2.4 Optional Property Notes

If your H.264 encoder implements Long Term Reference frames, then the following CodecAPI interfaces should be implemented (completed within one frame delay):

CODECAPI\_AVEncVideoLTRBufferControl

CODECAPI\_AVEncVideoMarkLTRFrame

CODECAPI\_AVEncVideoUseLTRFrame

If your H.264 encoder implements Long Term Reference frames, then the IMFSample attribute LongTermReferenceFrameInfo must be supported.

**A.4 MF Media Type Attribute Requirements**

Support for the following MF media type attributes is required:

A.4.1 [MF\_MT\_INTERLACE\_MODE](http://msdn.microsoft.com/library/ms694868.aspx)

A.4.2 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE](http://msdn.microsoft.com/library/ms700173.aspx)

A.4.3 [MF\_MT\_SUBTYPE ](http://msdn.microsoft.com/library/ms700208.aspx)

A.4.4 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE ](http://msdn.microsoft.com/library/ms700173.aspx)

A.4.5 [MF\_MT\_FRAME\_RATE ](http://msdn.microsoft.com/library/ms700140.aspx)

A.4.6 [MF\_MT\_FRAME\_SIZE](http://msdn.microsoft.com/en-us/library/ms701619.aspx)

A.4.7 [MF\_MT\_AVG\_BITRATE ](http://msdn.microsoft.com/library/ms703792.aspx)

A.4.8 [MF\_MT\_MPEG2\_PROFILE](http://msdn.microsoft.com/library/ms700193.aspx) *(MF\_MT\_VIDEO\_PROFILE)*

A.4.9 [MF\_MT\_MPEG2\_LEVEL](http://msdn.microsoft.com/library/ms700203.aspx) *(MF\_MT\_VIDEO\_LEVEL)*

A.4.10 [MF\_MT\_PIXEL\_ASPECT\_RATIO](http://msdn.microsoft.com/library/ms704767.aspx)

A.4.11 [MF\_MT\_VIDEO\_NOMINAL\_RANGE](http://msdn.microsoft.com/en-us/library/ms699008.aspx)

A.4.12 [MF\_MT\_VIDEO\_PRIMARIES](http://msdn.microsoft.com/en-us/library/ms697241.aspx)

A.4.13 [MF\_MT\_TRANSFER\_FUNCTION](http://msdn.microsoft.com/en-us/library/ms703086.aspx)

A.4.14 [MF\_MT\_YUV\_MATRIX](http://msdn.microsoft.com/en-us/library/ms702203.aspx)

A.4.15 [MF\_MT\_VIDEO\_CHROMA\_SITING](http://msdn.microsoft.com/en-us/library/ms694178.aspx)

A.4.16 [MF\_NALU\_LENGTH\_SET](http://msdn.microsoft.com/en-us/library/hh870258.aspx)

**A.5 MF Sample Attribute Support Requirements**

A.5.1 Required Sample Attributes

Subject to whether an ICodecAPI or MF media type attribute is set, the following sample attributes must be present on input or output samples:

A.5.1.1 MFSampleExtension\_MeanAbsoluteDifference

The MFSampleExtension\_MeanAbsoluteDifference sample attribute is required on output samples if the CODECAPI\_AVEncVideoMeanAbsoluteDifference property has been set to a non-zero value. Note that because CODECAPI\_AVEncVideoMeanAbsoluteDifference is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoMeanAbsoluteDifference is supported.

A.5.1.2 MFSampleExtension\_LongTermReferenceFrameInfo

The MFSampleExtension\_LongTermReferenceFrameInfo sample attribute is required on output samples if the CODECAPI\_AVEncVideoLTRBufferControl has indicated that one or more long-term reference frames could be present. Note that because CODECAPI\_AVEncVideoLTRBufferControl is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoLTRBufferControl is supported.

A.5.1.3 MF\_NALU\_LENGTH\_INFORMATION

The MF\_NALU\_LENGTH\_INFORMATION sample attribute is required on output samples if the MF\_NALU\_LENGTH\_SET media type attribute has been set to a non-zero value.

A.5.1.4 MFSampleExtension\_ROIRectangle

The input sample may contain an MFSampleExtension\_ROIRectangle sample attribute if the CODECAPI\_AVEncVideoROIEnabled property has been set to a non-zero value. Note that because CODECAPI\_AVEncVideoROIEnabled is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoROIEnabled is supported.

A.5.2 Optional Sample Attributes

The following input sample attributes may be present. It is optional whether the encoder utilizes the information contained by these attributes.

A.5.2.1 MFSampleExtension\_DirtyRects

A.5.2.2 MFSampleExtension\_MoveRegions

**A.6 MFT Attributes**

The encoder is required to support the [IMFTransform::GetAttributes](http://msdn.microsoft.com/library/ms703141.aspx) which will return the [IMFAttributes](http://msdn.microsoft.com/library/ms704598.aspx) interface which allows access to MFT attributes. Support for handling the following MFT MF attributes is required:

A.6.1 [MFT\_ENUM\_HARDWARE\_URL\_Attribute](http://msdn.microsoft.com/library/dd388664.aspx)

A.6.2 [MFT\_ENUM\_HARDWARE\_VENDOR\_ID\_Attribute](http://msdn.microsoft.com/en-us/library/windows/desktop/hh162798.aspx)

A.6.3 [MFT\_ENCODER\_SUPPORTS\_CONFIG\_EVENT](http://msdn.microsoft.com/en-us/library/windows/desktop/dn302174.aspx)

A.6.4 [MF\_VIDEO\_MAX\_MB\_PER\_SEC](http://msdn.microsoft.com/en-us/library/windows/desktop/dn302206.aspx)

A.6.5 MFT\_GFX\_DRIVER\_VERSION\_ID\_Attribute

A.6.6 MFT\_ENCODER\_ERROR

**A.7 Functionality Support Requirements**

The H.264 encoder must support the following functionality:

A.7.1 Peak-constrained VBR rate control mode

The encoder will use the values of the CODECAPI\_AVEncCommonMeanBitRate, CODECAPI\_AVEncCommonMaxBitRate, and CODECAPI\_AVEncCommonBufferSize properties to ensure that the theoretical buffer is not violated at the peak bitrate (CODECAPI\_AVEncCommonMaxBitRate) while converging to a bitrate of CODECAPI\_AVEncCommonMeanBitRate for the entire video clip.

A.7.2 Quality-based VBR rate control mode

The encoder will use the value of CODECAPI\_AVEncCommonQuality or CODECAPI\_AVEncVideoEncodeQP to achieve constant quality of the compressed video. The encoder will use a constant QP for all frames.

A.7.3 CBR rate control mode

The encoder will use the values of the CODECAPI\_AVEncCommonMeanBitRate, or MF\_MT\_AVG\_BITRATE and CODECAPI\_AVEncCommonBufferSize properties to ensure that the theoretical buffer is not violated at the specified bitrate (CODECAPI\_AVEncCommonMeanBitRate or MF\_MT\_AVG\_BITRATE).

A.7.4 GOP distance

The encoder will produce a key-frame at the frame interval specified by the value of the CODECAPI\_AVEncMPVGOPSize property. A value of IntMAX for this property indicates that only the first frame should be a key frame.

A.7.5 Frame-based QP control

Must support at minimum QP range from 20 to 40. Must return an error when an invalid value (e.g., 52) is set.

A.7.6 Forced Key-frame control

IDR must be preceded with SPS/PPS. When the number of temporal layers &gt; 1, key frame must be inserted in the next base temporal layer frame in order to preserve the temporal structure. For a single layer bitstream, key frame must be inserted in the next frame.

A.7.7 Quality versus Speed control

A.7.8 Low-latency control

The encoder must support the ability to be set to low latency mode. In this mode, the encoder should not buffer any input samples. It must be capable of producing an output sample for each input sample.

The encoder also must either force POC type 2 or set the VUI bitstream\_restriction flag to TRUE and VUI num\_reorder\_frames to 0.

A.7.8 Temporal Layer Support

It is required that the encoder support hierarchical P frames encoding and be capable of generating bitreams of 1, 2, or 3 temporally-independent layers.

A.7.9 Long Term Reference Frame Support

If your H.264 encoder implements Long Term Reference frames, then the following CodecAPI interfaces should be implemented (completed within one frame delay):

CODECAPI\_AVEncVideoLTRBufferControl

CODECAPI\_AVEncVideoMarkLTRFrame

CODECAPI\_AVEncVideoUseLTRFrame

**A.8 Asynchronous MFT Support**

It is recommended that you implement an [asynchronous MFT](http://msdn.microsoft.com/library/dd317909.aspx). An asynchronous MFT requires that you implement the [IMFMediaEventGenerator](http://msdn.microsoft.com/library/ms701755.aspx) and [IMFShutdown](http://msdn.microsoft.com/library/ms703054.aspx) interfaces.

**A.9 IMFRealTimeClientEx**

Registration with MMCS via IMFRealTimeCLientEx::SetWorkQueue is critical to meet performance goals, therefore, the implementation of the [IMFRealTimeClientEx](http://msdn.microsoft.com/en-us/library/windows/desktop/hh448047.aspx) interface is recommended.

**A.9 Multiple Instance Requirements**

It is required that your H.264 encoder must support a minimum of 4 concurrent instances. The encoder should not put any limitation on the number of instances. It should be bounded by the memory usage.

These instances may be in the same process or in different processes.

**A.10 Merit Validation **

It is required that your H.264 encoder supports the trusted merit verification process.

It is required that your H.264 encoder be a separate binary, individually certified and signed.

**A.11 Additional Requirements **

Your H.264 encoder must work with the [Windows MP4 file sink](http://msdn.microsoft.com/library/dd757763.aspx).

Your H.264 encoder must implement the proper order of encoding configuration.

Your H.264 encoder must be capable of producing valid bitstreams with up to 3 temporal layers.

Your H.264 encoder prefix NALU prepends each slice and is syntax correct with bitstreams with 1-3 temporal layers.

Your H.264 encoder must send one batched GPU request per frame.

Your H.264 encoder must insert an AUD NALU before each frame.

Your H.264 encoder must work correctly in session 0.

**A.12 Installation **

It is required that your H.264 encoder is registered and unregistered along with the device driver used in the encoder.

**A.113 Dynamic Format Change**

It is required that your H.264 encoder supports dynamic format changes of the following within:

Profile Change

Resolution and Frame Rate Change

Add and Delete Temporal Layers

Maximum allowed number of reference frames

When multiple changes are requested before an output frame is produced, the last change should be honored.

**B. VC-1 Encode**

If your hardware supports VC-1 Encode, you must:

**B.1 On input: **

B.1.1 Support NV12

B.1.2 If your hardware supports it:

B.1.2.1 Support IYUV and YUY2

B.1.3 Support input buffers of (and query in this order):

B.1.3.1 IMF2DBuffer2

B.1.3.2 [IMF2DBuffer](http://msdn.microsoft.com/library/ms699894.aspx)

B.1.3.3 [IMFMediaBuffer](http://msdn.microsoft.com/library/ms696261.aspx)

**B.2 On output: **

B.2.1 Support Simple profile

B.2.2 Support Main profile

B.2.3 Support Advanced profile

**B.3 Your VC-1 encoder must expose the following interfaces: **

B.3.1 [IMFTransform ](http://msdn.microsoft.com/library/ms696260.aspx)

B.3.2 [ICodecAPI](http://msdn.microsoft.com/library/dd311953.aspx)

B.3.2.1 ICodecAPI requires the following functions to be implemented:

B.3.2.1.1 [IsSupported ](http://msdn.microsoft.com/library/dd311960.aspx)

B.3.2.1.2 [GetValue ](http://msdn.microsoft.com/library/dd311958.aspx)

B.3.2.1.3 [SetValue ](http://msdn.microsoft.com/library/dd311966.aspx)

B.3.2.2 ICodecAPI requires the following properties to be supported:

B.3.2.2.1 Peak-constrained VBR mode

B.3.2.2.2 Quality-based VBR mode

B.3.2.2.3 CBR encoding

B.3.2.2.4 GOP distance

B.3.2.2.5 Frame-QP control

B.3.2.2.6 Adaptive bitrate control

B.3.2.2.7 Force-Key-frame control

B.3.2.2.8 QualityVsSpeed control

B.3.2.2.9 Low-latency encoding

B.3.2.3 It is recommended that you additionally implement the following functions:

B.3.2.3.1 [GetDefaultValue ](http://msdn.microsoft.com/library/dd311955.aspx)

B.3.2.3.2 [GetParameterRange ](http://msdn.microsoft.com/library/dd311956.aspx)

B.3.2.3.3 [GetParameterValues ](http://msdn.microsoft.com/library/dd311957.aspx)

B.3.2.3.4 [IsModifiable ](http://msdn.microsoft.com/library/dd311959.aspx)

B.3.2.3.5 [SetAllDefaults](http://msdn.microsoft.com/library/dd311962.aspx)

B.3.3 [IMFAttributes](http://msdn.microsoft.com/library/ms704598.aspx)

B.3.3.1 Via [IMFTransform::GetAttributes](http://msdn.microsoft.com/library/ms703141.aspx)

B.3.3.2 The two required attributes are:

B.3.3.2.1 [MFT\_ENUM\_HARDWARE\_URL\_Attribute](http://msdn.microsoft.com/library/dd388664.aspx)

B.3.3.2.2 MFT\_ENUM\_HARDWARE\_VENDOR\_ID\_Attribute

B.3.4 It is recommended that you implement an [asynchronous MFT](http://msdn.microsoft.com/library/dd317909.aspx).

B.3.4.1 Asynchronous MFTs require the following additional interfaces:

B.3.4.1.1 [IMFMediaEventGenerator ](http://msdn.microsoft.com/library/ms701755.aspx)

B.3.4.1.2 [IMFShutdown](http://msdn.microsoft.com/library/ms703054.aspx)

B.3.4.2 Asynchronous MFTs are encouraged to avoid creating threads and are recommended to use the MF Thread Pool.

B.3.4.2.1 Registration with MMCS via IMFRealTimeCLientEx::SetWorkQueue is critical to meet performance goals.

B.3.5 IMFRealTimeClientEx is recommended

**B.4 Encoding Settings **

B.4.1 Through input media type negotiation, the VC-1 Encoder must support:

B.4.1.1 [MF\_MT\_INTERLACE\_MODE](http://msdn.microsoft.com/library/ms694868.aspx)

B.4.1.1.1 The encoder must preserve interlace from input to output or reject interlace.

B.4.1.2 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE](http://msdn.microsoft.com/library/ms700173.aspx)

B.4.2 Through output media type negotiation, the VC-1 Encoder must support:

B.4.2.1 [MF\_MT\_SUBTYPE](http://msdn.microsoft.com/library/ms700208.aspx)

B.4.2.2 [MF\_MT\_FRAME\_SIZE ](http://msdn.microsoft.com/library/ms701619.aspx)

BC.4.2.3 [MF\_MT\_FRAME\_RATE ](http://msdn.microsoft.com/library/ms700140.aspx)

B.4.2.4 [MF\_MT\_AVG\_BITRATE ](http://msdn.microsoft.com/library/ms703792.aspx)

B.4.2.5 [MF\_MT\_PIXEL\_ASPECT\_RATIO](http://msdn.microsoft.com/library/ms704767.aspx)

B.4.3 It is recommended that your VC-1 Encoder supports:

B.4.3.1. B frame encoding

**B.5 Multiple Instances **

B.5.1 It is required that your VC-1 encoder must support a minimum of 3 concurrent instances. Encoder should not put any limitation on number of instances. It should be bounded by the memory usage.

B.5.1.1 These instances may be in the same process or in different processes.

**B.6 Merit Validation **

B.6.1 It is required that your VC-1 encoder supports the trusted merit verification process.

B.6.2 It is required that your VC-1 encoder be a separate binary, individually certified and signed.

**B.7 Additional Requirements **

B.7.1 Your VC-1 encoder must work with the [Windows ASF file sink](http://msdn.microsoft.com/library/ee663576.aspx).

B.7.2 Your VC-1 encoder must implement proper order of encoding configuration.

B.7.3 Your VC-1 encoder must work correctly in session 0.

**B.8 Installation **

B.8.1 It is required that your VC-1 encoder is registered and unregistered along with the device driver used in the encoder.

**C. H.265 Encode **

If your hardware supports H.265 Encode, you must:

**C.1 Input Format Support**

The encoder must support NV12 format for input frames. Optionally, the encoder can support IYUV and YUY2 formats.

The encoder must implement support for the [IMFMediaBuffer](http://msdn.microsoft.com/library/ms696261.aspx), [IMF2DBuffer](http://msdn.microsoft.com/en-us/library/ms699894.aspx), and [IMF2DBuffer2](http://msdn.microsoft.com/en-us/library/hh447827.aspx) media buffer interfaces.

**C.2 Profile Support**

The encoder must be capable of creating output content that is conformant to the Main profile.

The encoder must be capable of generating the appropriate header syntax elements to signal that it is encoded to the Main profile.

**C.3 Interface Support Requirements**

The H.265 encoder must support the following interfaces:

C.3.1 [IMFTransform ](http://msdn.microsoft.com/library/ms696260.aspx)

Implementation of the following methods of the [IMFTransform](http://msdn.microsoft.com/library/ms696260.aspx) interface is required:

C.3.1.1 [IMFTransform::ProcessEvent::GetAttributes](http://msdn.microsoft.com/en-us/library/ms703141.aspx)

C.3.1.2 [IMFTransform::GetInputAvailableType](http://msdn.microsoft.com/en-us/library/ms704814.aspx)

C.3.1.3 [IMFTransform::GetInputCurrentType](http://msdn.microsoft.com/en-us/library/ms705607.aspx)

C.3.1.4 [IMFTransform::GetInputStatus](http://msdn.microsoft.com/en-us/library/ms697478.aspx)

C.3.1.5 [IMFTransform::GetInputStreamInfo](http://msdn.microsoft.com/en-us/library/ms703894.aspx)

C.3.1.6 [IMFTransform::GetOutputAvailableType](http://msdn.microsoft.com/en-us/library/ms703812.aspx)

C.3.1.7 [IMFTransform::GetOutputCurrentType](http://msdn.microsoft.com/en-us/library/ms696985.aspx)

C.3.1.8 [IMFTransform::GetOutputStatus](http://msdn.microsoft.com/en-us/library/ms696269.aspx)

C.3.1.9 [IMFTransform::GetOutputStreamInfo](http://msdn.microsoft.com/en-us/library/ms703886.aspx)

C.3.1.10 [IMFTransform::GetStreamCount](http://msdn.microsoft.com/en-us/library/ms697018.aspx)

C.3.1.11 [IMFTransform::GetStreamLimits](http://msdn.microsoft.com/en-us/library/ms697040.aspx)

C.3.1.12 [IMFTransform::ProcessEvent](http://msdn.microsoft.com/en-us/library/ms695394.aspx)

Must handle the MEEncodingParameters event:

C.3.1.13 [IMFTransform::ProcessMessage](http://msdn.microsoft.com/en-us/library/ms701863.aspx)

C.3.1.14 [IMFTransform::ProcessInput](http://msdn.microsoft.com/en-us/library/ms703131.aspx)

C.3.1.15 [IMFTransform::ProcessOutput](http://msdn.microsoft.com/en-us/library/ms704014.aspx)

C.3.1.16 [IMFTransform::SetInputType](http://msdn.microsoft.com/en-us/library/ms700113.aspx)

C.3.1.17 [IMFTransform::SetOutputType](http://msdn.microsoft.com/en-us/library/ms702016.aspx)

C.3.1.18 [IMFTransform::SetOutputBounds](http://msdn.microsoft.com/en-us/library/ms693812.aspx)

C.3.2 [ICodecAPI](http://msdn.microsoft.com/library/dd311953.aspx)

The encoder must support certain methods and property GUIDs of the ICodecAPI interface.

A.3.2.1 Required Methods

Implementation of the following methods of the ICodecAPI interface is required:

C.3.2.1.1 [IsSupported ](http://msdn.microsoft.com/library/dd311960.aspx)

C.3.2.1.2 [GetValue ](http://msdn.microsoft.com/library/dd311958.aspx)

C.3.2.1.3 [SetValue ](http://msdn.microsoft.com/library/dd311966.aspx)

C.3.2.1.4 [GetParameterRange](http://msdn.microsoft.com/en-us/library/dd311956.aspx)

C.3.2.1.5 [GetParameterValues](http://msdn.microsoft.com/en-us/library/dd311957.aspx)

C.3.2.2 Required Properties

Support for the following ICodecAPI property GUIDs is required:

C.3.2.2.1 CODECAPI\_AVEncCommonRateControlMode

C.3.2.2.2 CODECAPI\_AVEncCommonQuality

C.3.2.2.3 CODECAPI\_AVEncCommonMeanBitRate

C.3.2.2.4 CODECAPI\_AVEncCommonMaxBitRate

C.3.2.2.5 CODECAPI\_AVEncCommonBufferSize

C.3.2.2.6 CODECAPI\_AVEncMPVGOPSize

C.3.2.2.8 CODECAPI\_AVLowLatencyMode

C.3.2.2.10 CODECAPI\_AVEncVideoForceKeyFrame

C.3.2.2.11 CODECAPI\_AVEncVideoEncodeQP

C.3.2.3 Optional Properties

Support for the following ICodecAPI property GUIDs is optional.

C.3.2.3.1 CODECAPI\_AVEncCommonQualityVsSpeed

C.3.2.3.2 CODECAPI\_AVEncVideoTemporalLayerCount

C.3.2.3.3 CODECAPI\_AVEncVideoSelectLayer

C.3.2.3.4 CODECAPI\_AVEncMPVDefaultBPictureCount

C.3.2.3.5 CODECAPI\_AVEncVideoEncodeFrameTypeQP

C.3.2.3.6 CODECAPI\_AVEncSliceControlMode

C.3.2.3.7 CODECAPI\_AVEncSliceControlSize

C.3.2.3.8 CODECAPI\_AVEncVideoMaxNumRefFrame

C.3.2.3.9 CODECAPI\_AVEncVideoMeanAbsoluteDifference

C.3.2.3.10 CODECAPI\_AVEncVideoROIEnabled

C.3.2.3.11 CODECAPI\_AVEncVideoMinQP

C.3.2.3.12 CODECAPI\_AVEncVideoMaxQP

C.3.2.3.13 CODECAPI\_AVEncVideoLTRBufferControl

C.3.2.3.14 CODECAPI\_AVEncVideoMarkLTRFrame

C.3.2.3.15 CODECAPI\_AVEncVideoUseLTRFrame

C.3.2.3.16 CODECAPI\_AVEncLowPowerEncoder

C.3.2.3.17 CODECAPI\_AVScenarioInfo

C.3.2.3.18 CODECAPI\_AVEncMPVGOPSizeMin

C.3.2.3.19 CODECAPI\_AVEncMPVGOPSizeMax

C.3.2.3.20 CODECAPI\_AVEncVideoMaxTem

C.3.2.3.21 CODECAPI\_AVEncMaxFrameRate

C.3.2.3.22 CODECAPI\_VideoEncoderDisplayContentType

C.3.2.3.23 CODECAPI\_AVEncEnableVideoProcessing

C.3.2.3.24 CODECAPI\_AVEncVideoGradualIntraRefresh

C.3.2.4 Optional Property Notes

If your H.265 encoder implements Long Term Reference frames, then the following CodecAPI interfaces should be implemented (completed within one frame delay):

CODECAPI\_AVEncVideoLTRBufferControl

CODECAPI\_AVEncVideoMarkLTRFrame

CODECAPI\_AVEncVideoUseLTRFrame

If your H.265 encoder implements Long Term Reference frames, then the IMFSample attribute LongTermReferenceFrameInfo must be supported.

**C.4 MF Media Type Attribute Requirements**

Support for the following MF media type attributes is required:

C.4.1 [MF\_MT\_INTERLACE\_MODE](http://msdn.microsoft.com/library/ms694868.aspx)

C.4.2 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE](http://msdn.microsoft.com/library/ms700173.aspx)

C.4.3 [MF\_MT\_SUBTYPE ](http://msdn.microsoft.com/library/ms700208.aspx)

C.4.4 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE ](http://msdn.microsoft.com/library/ms700173.aspx)

C.4.5 [MF\_MT\_FRAME\_RATE ](http://msdn.microsoft.com/library/ms700140.aspx)

C.4.6 [MF\_MT\_FRAME\_SIZE](http://msdn.microsoft.com/en-us/library/ms701619.aspx)

C.4.7 [MF\_MT\_AVG\_BITRATE ](http://msdn.microsoft.com/library/ms703792.aspx)

C.4.8 [MF\_MT\_MPEG2\_PROFILE](http://msdn.microsoft.com/library/ms700193.aspx) *(MF\_MT\_VIDEO\_PROFILE)*

C.4.9 [MF\_MT\_MPEG2\_LEVEL](http://msdn.microsoft.com/library/ms700203.aspx) *(MF\_MT\_VIDEO\_LEVEL)*

C.4.10 [MF\_MT\_PIXEL\_ASPECT\_RATIO](http://msdn.microsoft.com/library/ms704767.aspx)

C.4.11 [MF\_MT\_VIDEO\_NOMINAL\_RANGE](http://msdn.microsoft.com/en-us/library/ms699008.aspx)

C.4.12 [MF\_MT\_VIDEO\_PRIMARIES](http://msdn.microsoft.com/en-us/library/ms697241.aspx)

C.4.13 [MF\_MT\_TRANSFER\_FUNCTION](http://msdn.microsoft.com/en-us/library/ms703086.aspx)

C.4.14 [MF\_MT\_YUV\_MATRIX](http://msdn.microsoft.com/en-us/library/ms702203.aspx)

C.4.15 [MF\_MT\_VIDEO\_CHROMA\_SITING](http://msdn.microsoft.com/en-us/library/ms694178.aspx)

C.4.16 [MF\_NALU\_LENGTH\_SET](http://msdn.microsoft.com/en-us/library/hh870258.aspx)

**C.5 MF Sample Attribute Support Requirements**

C.5.1 Required Sample Attributes

Subject to whether an ICodecAPI or MF media type attribute is set, the following sample attributes must be present on input or output samples:

C.5.1.1 MFSampleExtension\_MeanAbsoluteDifference

The MFSampleExtension\_MeanAbsoluteDifference sample attribute is required on output samples if the CODECAPI\_AVEncVideoMeanAbsoluteDifference property has been set to a non-zero value. Note that because CODECAPI\_AVEncVideoMeanAbsoluteDifference is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoMeanAbsoluteDifference is supported.

C5.1.2 MFSampleExtension\_LongTermReferenceFrameInfo

The MFSampleExtension\_LongTermReferenceFrameInfo sample attribute is required on output samples if the CODECAPI\_AVEncVideoLTRBufferControl has indicated that one or more long-term reference frames could be present. Note that because CODECAPI\_AVEncVideoLTRBufferControl is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoLTRBufferControl is supported.

C5.1.3 MF\_NALU\_LENGTH\_INFORMATION

The MF\_NALU\_LENGTH\_INFORMATION sample attribute is required on output samples if the MF\_NALU\_LENGTH\_SET media type attribute has been set to a non-zero value.

C.5.1.4 MFSampleExtension\_ROIRectangle

The input sample may contain an MFSampleExtension\_ROIRectangle sample attribute if the CODECAPI\_AVEncVideoROIEnabled property has been set to a non-zero value. Note that because CODECAPI\_AVEncVideoROIEnabled is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoROIEnabled is supported.

C.5.2 Optional Sample Attributes

The following input sample attributes may be present. It is optional whether the encoder utilizes the information contained by these attributes.

C.5.2.1 MFSampleExtension\_DirtyRects

The MFSampleExtension\_DirtyRects attribute is a BLOB type with the following structure:

```
typedef struct \_DIRTYRECT\_INFO
{
UINT FrameNumber;
UINT NumDirtyRects;
RECT DirtyRects\[1\];
} DIRTYRECT\_INFO;
```

This attribute is intended to be used for compressing screen content and allows the window manager to pass information about the dirty rectangles in the screen frame.

C.5.2.2 MFSampleExtension\_MoveRegions

The MFSampleExtension\_MoveRegions attribute is a BLOB type with the following structure:

```
typedef struct \_MOVE\_RECT
{
POINT SourcePoint;
RECT DestRect;
} MOVE\_RECT;

typedef struct \_MOVEREGION\_INFO
{
UINT FrameNumber;
UINT NumMoveRegions;
MOVE\_RECT MoveRegions\[1\];
} MOVEREGION\_INFO;
```

**C.6 MFT Attributes**

The encoder is required to support the [IMFTransform::GetAttributes](http://msdn.microsoft.com/library/ms703141.aspx) which will return the [IMFAttributes](http://msdn.microsoft.com/library/ms704598.aspx) interface which allows access to MFT attributes. Support for handling the following MFT MF attributes is required:

A.6.1 [MFT\_ENUM\_HARDWARE\_URL\_Attribute](http://msdn.microsoft.com/library/dd388664.aspx)

C.6.2 [MFT\_ENUM\_HARDWARE\_VENDOR\_ID\_Attribute](http://msdn.microsoft.com/en-us/library/windows/desktop/hh162798.aspx)

C.6.3 [MFT\_ENCODER\_SUPPORTS\_CONFIG\_EVENT](http://msdn.microsoft.com/en-us/library/windows/desktop/dn302174.aspx)

C.6.4 [MF\_VIDEO\_MAX\_MB\_PER\_SEC](http://msdn.microsoft.com/en-us/library/windows/desktop/dn302206.aspx)

C.6.5 MFT\_GFX\_DRIVER\_VERSION\_ID\_Attribute

C.6.6 MFT\_ENCODER\_ERROR

**C.7 Functionality Support Requirements**

The H.265 encoder must support the following functionality:

C.7.1 Peak-constrained VBR ratecontrol mode

The encoder will use the values of the CODECAPI\_AVEncCommonMeanBitRate, CODECAPI\_AVEncCommonMaxBitRate, and CODECAPI\_AVEncCommonBufferSize properties to ensure that the theoretical buffer is not violated at the peak bitrate (CODECAPI\_AVEncCommonMaxBitRate) while converging to a bitrate of CODECAPI\_AVEncCommonMeanBitRate for the entire video clip.

C.7.2 Quality-based VBR ratecontrol mode

The encoder will use the value of CODECAPI\_AVEncCommonQuality or CODECAPI\_AVEncVideoEncodeQP to achieve constant quality of the compressed video. The encoder will use a constant QP for all frames.

C.7.3 CBR ratecontrol mode

The encoder will use the values of the CODECAPI\_AVEncCommonMeanBitRate, or MF\_MT\_AVG\_BITRATE and CODECAPI\_AVEncCommonBufferSize properties to ensure that the theoretical buffer is not violated at the specified bitrate (CODECAPI\_AVEncCommonMeanBitRate or MF\_MT\_AVG\_BITRATE).

C.7.4 GOP distance

The encoder will produce a key-frame at the frame interval specified by the value of the CODECAPI\_AVEncMPVGOPSize property. A value of IntMAX for this property indicates that only the first frame should be a key frame.

C.7.5 Frame-based QP control

Must support at minimum QP range from 20 to 40. Must return an error when an invalid value (e.g., 52) is set.

C.7.6 Forced Key-frame control

IDR must be preceded with SPS/PPS. When the number of temporal layers &gt; 1, key frame must be inserted in the next base temporal layer frame in order to preserve the temporal structure. For a single layer bitstream, key frame must be inserted in the next frame.

C.7.7 Quality versus Speed control

C.7.8 Low-latency control

The encoder must support the ability to be set to low latency mode. In this mode, the encoder should not buffer any input samples. It must be capable of producing an output sample for each input sample.

The encoder also must either force POC type 2 or set the VUI bitstream\_restriction flag to TRUE and VUI num\_reorder\_frames to 0.

C.7.8 Temporal Layer Support

It is required that the encoder support hierarchical P frames encoding and be capable of generating bitreams of 1, 2, or 3 temporally-independent layers.

C.7.9 Long Term Reference Frame Support

If your H.265 encoder implements Long Term Reference frames, then the following CodecAPI interfaces should be implemented (completed within one frame delay):

CODECAPI\_AVEncVideoLTRBufferControl

CODECAPI\_AVEncVideoMarkLTRFrame

CODECAPI\_AVEncVideoUseLTRFrame

**C.8 Asynchronous MFT Support**

It is recommended that you implement an [asynchronous MFT](http://msdn.microsoft.com/library/dd317909.aspx). An asynchronous MFT requires that you implement the [IMFMediaEventGenerator](http://msdn.microsoft.com/library/ms701755.aspx) and [IMFShutdown](http://msdn.microsoft.com/library/ms703054.aspx) interfaces.

**C.9 IMFRealTimeClientEx**

Registration with MMCS via IMFRealTimeCLientEx::SetWorkQueue is critical to meet performance goals; therefore, the implementation of the [IMFRealTimeClientEx](http://msdn.microsoft.com/en-us/library/windows/desktop/hh448047.aspx) interface is recommended.

**C.9 Multiple Instance Requirements**

It is required that your H.265 encoder must support a minimum of 3 concurrent instances. The encoder should not put any limitation on the number of instances. It should be bounded by the memory usage.

These instances may be in the same process or in different processes.

**C.10 Merit Validation **

It is required that your H.265 encoder supports the trusted merit verification process.

It is required that your H.265 encoder be a separate binary, individually certified and signed.

**C.11 Additional Requirements **

Your H.265 encoder must work with the [Windows MP4 file sink](http://msdn.microsoft.com/library/dd757763.aspx).

Your H.265 encoder must implement proper order of encoding configuration.

Your H.265 encoder must be capable of producing valid bitstreams with up to 3 temporal layers.

Your H.265 encoder prefix NALU prepends each slice and is syntax correct with bitstreams with 1-3 temporal layers.

Your H.265 encoder must send one batched GPU request per frame.

Your H.265 encoder must insert an AUD NALU before each frame.

Your H.265 encoder must work correctly in session 0.

**C.12 Installation **

It is required that your H.265 encoder is registered and unregistered along with the device driver used in the encoder.

**C.113 Dynamic Format Change**

It is required that your H.265 encoder supports dynamic format changes of the following within:

Profile Change

Resolution and Frame Rate Change

Add and Delete Temporal Layers

Maximum allowed number of reference frames

When multiple changes are requested before an output frame is produced, the last change should be honored.

**D. VP9/VP8 Encode **

If your hardware supports VP9/VP8 Encode, you must:

**D.1 Input Format Support**

The encoder must support NV12 format for input frames. Optionally, the encoder can support IYUV and YUY2 formats.

The encoder must implement support for the [IMFMediaBuffer](http://msdn.microsoft.com/library/ms696261.aspx), [IMF2DBuffer](http://msdn.microsoft.com/en-us/library/ms699894.aspx), and [IMF2DBuffer2](http://msdn.microsoft.com/en-us/library/hh447827.aspx) media buffer interfaces.

**D.2 Profile Support**

The encoder must be capable of creating output content that is conformant to the Profile0.

The encoder must be capable of generating the appropriate header syntax elements to signal that it is encoded to the Profile0.

**D.3 Interface Support Requirements**

The VP9/VP8 encoder must support the following interfaces:

D.3.1 [IMFTransform ](http://msdn.microsoft.com/library/ms696260.aspx)

Implementation of the following methods of the [IMFTransform](http://msdn.microsoft.com/library/ms696260.aspx) interface is required:

D.3.1.1 [IMFTransform::ProcessEvent::GetAttributes](http://msdn.microsoft.com/en-us/library/ms703141.aspx)

D.3.1.2 [IMFTransform::GetInputAvailableType](http://msdn.microsoft.com/en-us/library/ms704814.aspx)

D.3.1.3 [IMFTransform::GetInputCurrentType](http://msdn.microsoft.com/en-us/library/ms705607.aspx)

D.3.1.4 [IMFTransform::GetInputStatus](http://msdn.microsoft.com/en-us/library/ms697478.aspx)

D.3.1.5 [IMFTransform::GetInputStreamInfo](http://msdn.microsoft.com/en-us/library/ms703894.aspx)

D.3.1.6 [IMFTransform::GetOutputAvailableType](http://msdn.microsoft.com/en-us/library/ms703812.aspx)

D.3.1.7 [IMFTransform::GetOutputCurrentType](http://msdn.microsoft.com/en-us/library/ms696985.aspx)

D.3.1.8 [IMFTransform::GetOutputStatus](http://msdn.microsoft.com/en-us/library/ms696269.aspx)

D.3.1.9 [IMFTransform::GetOutputStreamInfo](http://msdn.microsoft.com/en-us/library/ms703886.aspx)

D.3.1.10 [IMFTransform::GetStreamCount](http://msdn.microsoft.com/en-us/library/ms697018.aspx)

D.3.1.11 [IMFTransform::GetStreamLimits](http://msdn.microsoft.com/en-us/library/ms697040.aspx)

D.3.1.12 [IMFTransform::ProcessEvent](http://msdn.microsoft.com/en-us/library/ms695394.aspx)

Must handle the MEEncodingParameters event:

D.3.1.13 [IMFTransform::ProcessMessage](http://msdn.microsoft.com/en-us/library/ms701863.aspx)

D.3.1.14 [IMFTransform::ProcessInput](http://msdn.microsoft.com/en-us/library/ms703131.aspx)

D.3.1.15 [IMFTransform::ProcessOutput](http://msdn.microsoft.com/en-us/library/ms704014.aspx)

D.3.1.16 [IMFTransform::SetInputType](http://msdn.microsoft.com/en-us/library/ms700113.aspx)

D.3.1.17 [IMFTransform::SetOutputType](http://msdn.microsoft.com/en-us/library/ms702016.aspx)

D.3.1.18 [IMFTransform::SetOutputBounds](http://msdn.microsoft.com/en-us/library/ms693812.aspx)

D.3.2 [ICodecAPI](http://msdn.microsoft.com/library/dd311953.aspx)

The encoder must support certain methods and property GUIDs of the ICodecAPI interface.

A.3.2.1 Required Methods

Implementation of the following methods of the ICodecAPI interface is required:

D.3.2.1.1 [IsSupported ](http://msdn.microsoft.com/library/dd311960.aspx)

D.3.2.1.2 [GetValue ](http://msdn.microsoft.com/library/dd311958.aspx)

D.3.2.1.3 [SetValue ](http://msdn.microsoft.com/library/dd311966.aspx)

D.3.2.1.4 [GetParameterRange](http://msdn.microsoft.com/en-us/library/dd311956.aspx)

D.3.2.1.5 [GetParameterValues](http://msdn.microsoft.com/en-us/library/dd311957.aspx)

D.3.2.2 Required Properties

Support for the following ICodecAPI property GUIDs is required:

D.3.2.2.1 CODECAPI\_AVEncCommonRateControlMode

D.3.2.2.2 CODECAPI\_AVEncCommonQuality

D.3.2.2.3 CODECAPI\_AVEncCommonMeanBitRate

D.3.2.2.4 CODECAPI\_AVEncCommonMaxBitRate

D.3.2.2.5 CODECAPI\_AVEncCommonBufferSize

D.3.2.2.6 CODECAPI\_AVEncMPVGOPSize

D.3.2.2.8 CODECAPI\_AVLowLatencyMode

D.3.2.2.10 CODECAPI\_AVEncVideoForceKeyFrame

D.3.2.2.11 CODECAPI\_AVEncVideoEncodeQP

D.3.2.3 Optional Properties

Support for the following ICodecAPI property GUIDs is optional.

D.3.2.3.1 CODECAPI\_AVEncCommonQualityVsSpeed

**D.4 MF Media Type Attribute Requirements**

Support for the following MF media type attributes is required:

D.4.1 [MF\_MT\_INTERLACE\_MODE](http://msdn.microsoft.com/library/ms694868.aspx)

D.4.2 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE](http://msdn.microsoft.com/library/ms700173.aspx)

D.4.3 [MF\_MT\_SUBTYPE ](http://msdn.microsoft.com/library/ms700208.aspx)

D.4.4 [MF\_MT\_MINIMUM\_DISPLAY\_APERTURE ](http://msdn.microsoft.com/library/ms700173.aspx)

D.4.5 [MF\_MT\_FRAME\_RATE ](http://msdn.microsoft.com/library/ms700140.aspx)

D.4.6 [MF\_MT\_FRAME\_SIZE](http://msdn.microsoft.com/en-us/library/ms701619.aspx)

D.4.7 [MF\_MT\_AVG\_BITRATE ](http://msdn.microsoft.com/library/ms703792.aspx)

D.4.8 [MF\_MT\_MPEG2\_PROFILE](http://msdn.microsoft.com/library/ms700193.aspx) *(MF\_MT\_VIDEO\_PROFILE)*

D.4.9 [MF\_MT\_MPEG2\_LEVEL](http://msdn.microsoft.com/library/ms700203.aspx) *(MF\_MT\_VIDEO\_LEVEL)*

D.4.10 [MF\_MT\_PIXEL\_ASPECT\_RATIO](http://msdn.microsoft.com/library/ms704767.aspx)

D.4.11 [MF\_MT\_VIDEO\_NOMINAL\_RANGE](http://msdn.microsoft.com/en-us/library/ms699008.aspx)

D.4.12 [MF\_MT\_VIDEO\_PRIMARIES](http://msdn.microsoft.com/en-us/library/ms697241.aspx)

D.4.13 [MF\_MT\_TRANSFER\_FUNCTION](http://msdn.microsoft.com/en-us/library/ms703086.aspx)

D.4.14 [MF\_MT\_YUV\_MATRIX](http://msdn.microsoft.com/en-us/library/ms702203.aspx)

D.4.15 [MF\_MT\_VIDEO\_CHROMA\_SITING](http://msdn.microsoft.com/en-us/library/ms694178.aspx)

**D.5 MF Sample Attribute Support Requirements**

D.5.1 Required Sample Attributes

Subject to whether an ICodecAPI or MF media type attribute is set, the following sample attributes must be present on input or output samples:

D.5.1.1 MFSampleExtension\_MeanAbsoluteDifference

The MFSampleExtension\_MeanAbsoluteDifference sample attribute is required on output samples if the CODECAPI\_AVEncVideoMeanAbsoluteDifference property has been set to a non-zero value. Note that because CODECAPI\_AVEncVideoMeanAbsoluteDifference is an optional property, support for this attribute is only required for the case where CODECAPI\_AVEncVideoMeanAbsoluteDifference is supported.

D.5.2 Optional Sample Attributes

The following input sample attributes may be present. It is optional whether the encoder utilizes the information contained by these attributes.

D.5.2.1 MFSampleExtension\_DirtyRects

The MFSampleExtension\_DirtyRects attribute is a BLOB type with the following structure:

```
typedef struct \_DIRTYRECT\_INFO
{
UINT FrameNumber;
UINT NumDirtyRects;
RECT DirtyRects\[1\];
} DIRTYRECT\_INFO;
```

This attribute is intended to be used for compressing screen content and allows the window manager to pass information about the dirty rectangles in the screen frame.

D.5.2.2 MFSampleExtension\_MoveRegions

The MFSampleExtension\_MoveRegions attribute is a BLOB type with the following structure:

```
typedef struct \_MOVE\_RECT
{
POINT SourcePoint;
RECT DestRect;
} MOVE\_RECT;

typedef struct \_MOVEREGION\_INFO
{
UINT FrameNumber;
UINT NumMoveRegions;
MOVE\_RECT MoveRegions\[1\];
} MOVEREGION\_INFO;
```

**D.6 MFT Attributes**

The encoder is required to support the [IMFTransform::GetAttributes](http://msdn.microsoft.com/library/ms703141.aspx) which will return the [IMFAttributes](http://msdn.microsoft.com/library/ms704598.aspx) interface which allows access to MFT attributes. Support for handling the following MFT MF attributes is required:

A.6.1 [MFT\_ENUM\_HARDWARE\_URL\_Attribute](http://msdn.microsoft.com/library/dd388664.aspx)

D.6.2 [MFT\_ENUM\_HARDWARE\_VENDOR\_ID\_Attribute](http://msdn.microsoft.com/en-us/library/windows/desktop/hh162798.aspx)

D.6.3 [MFT\_ENCODER\_SUPPORTS\_CONFIG\_EVENT](http://msdn.microsoft.com/en-us/library/windows/desktop/dn302174.aspx)

D.6.4 [MF\_VIDEO\_MAX\_MB\_PER\_SEC](http://msdn.microsoft.com/en-us/library/windows/desktop/dn302206.aspx)

D.6.5 MFT\_GFX\_DRIVER\_VERSION\_ID\_Attribute

D.6.6 MFT\_ENCODER\_ERROR

**D.7 Functionality Support Requirements**

The VP9/VP8 encoder must support the following functionality:

D.7.1 Peak-constrained VBR ratecontrol mode

The encoder will use the values of the CODECAPI\_AVEncCommonMeanBitRate, CODECAPI\_AVEncCommonMaxBitRate, and CODECAPI\_AVEncCommonBufferSize properties to ensure that the theoretical buffer is not violated at the peak bitrate (CODECAPI\_AVEncCommonMaxBitRate) while converging to a bitrate of CODECAPI\_AVEncCommonMeanBitRate for the entire video clip.

D.7.2 Quality-based VBR ratecontrol mode

The encoder will use the value of CODECAPI\_AVEncCommonQuality or CODECAPI\_AVEncVideoEncodeQP to achieve constant quality of the compressed video. The encoder will use a constant QP for all frames.

D.7.3 CBR ratecontrol mode

The encoder will use the values of the CODECAPI\_AVEncCommonMeanBitRate, or MF\_MT\_AVG\_BITRATE and CODECAPI\_AVEncCommonBufferSize properties to ensure that the theoretical buffer is not violated at the specified bitrate (CODECAPI\_AVEncCommonMeanBitRate or MF\_MT\_AVG\_BITRATE).

D.7.4 GOP distance

The encoder will produce a key-frame at the frame interval specified by the value of the CODECAPI\_AVEncMPVGOPSize property. A value of IntMAX for this property indicates that only the first frame should be a key frame.

D.7.5 Frame-based QP control

Must support at minimum QP range from 20 to 40. Must return an error when an invalid value (e.g., 52) is set.

D.7.6 Forced Key-frame control

IDR must be preceded with SPS/PPS. When the number of temporal layers &gt; 1, key frame must be inserted in the next base temporal layer frame in order to preserve the temporal structure. For a single layer bitstream, key frame must be inserted in the next frame.

D.7.7 Quality versus Speed control

D.7.8 Low-latency control

The encoder must support the ability to be set to low latency mode. In this mode, the encoder should not buffer any input samples. It must be capable of producing an output sample for each input sample.

**D.8 Asynchronous MFT Support**

It is recommended that you implement an [asynchronous MFT](http://msdn.microsoft.com/library/dd317909.aspx). An asynchronous MFT requires that you implement the [IMFMediaEventGenerator](http://msdn.microsoft.com/library/ms701755.aspx) and [IMFShutdown](http://msdn.microsoft.com/library/ms703054.aspx) interfaces.

**D.9 IMFRealTimeClientEx**

Registration with MMCS via IMFRealTimeCLientEx::SetWorkQueue is critical to meet performance goals; therefore, the implementation of the [IMFRealTimeClientEx](http://msdn.microsoft.com/en-us/library/windows/desktop/hh448047.aspx) interface is recommended.

**D.9 Multiple Instance Requirements**

It is required that your VP9/VP8 encoder must support a minimum of 3 concurrent instances. The encoder should not put any limitation on the number of instances. It should be bounded by the memory usage.

These instances may be in the same process or in different processes.

**D.10 Merit Validation **

It is required that your VP9/VP8 encoder supports the trusted merit verification process.

It is required that your VP9/VP8 encoder be a separate binary, individually certified and signed.

**D.11 Additional Requirements **

Your VP9/VP8 encoder must implement proper order of encoding configuration.

Your VP9/VP8 encoder must send one batched GPU request per frame.

Your VP9/VP8 encoder must work correctly in session 0.

**D.12 Installation **

It is required that your VP9/VP8 encoder is registered and unregistered along with the device driver used in the encoder.

**D.113 Dynamic Format Change**

It is required that your VP9/VP8 encoder supports dynamic format changes of the following within:

Profile Change

Resolution and Frame Rate Change

When multiple changes are requested before an output frame is produced, the last change should be honored.
