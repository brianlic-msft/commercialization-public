---
title: Windows Hello biometric requirements
description: Windows Hello biometric requirements
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8A910CB3-BAC3-408C-8194-8602D702C737
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Hello biometric requirements


Learn about the hardware requirements for biometric equipment, such as IR camera and fingerprint readers in order to support Windows Hello.

## Terminology


| Term                    | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| False Accept Rate (FAR) | Represents the number of instances that a biometric identification solution verifies an unauthorized person. This is normally represented as a ratio of number of instances in a given population size, for example 1 in 100,000. This can also be represented as a percentage of occurrence, for example, 0.001 percent. This measurement is heavily considered the most important with regards to the security of the biometric algorithm. |
| True Accept Rate (TAR)  | Represents the number of instances a biometric identification solution verifies the authorized user correctly. This is normally represented as a percentage. It is always held that the sum of the True Accept Rate and False Reject Rate is 1.                                                                                                                                                                                              |
| False Reject Rate (FRR) | Represents the number of instances a biometric identification solution fails to verify an authorized user correctly. Usually represented as a percentage, the sum of the True Accept Rate and False Reject Rate is 1.                                                                                                                                                                                                                        |
| Confidence              | The confidence in a claimed FAR represents the robustness of the analysis performed in verifying a claimed FAR. Depending on the target or claimed FAR and the importance of the target use case, confidence levels can be varied.                                                                                                                                                                                                           |
| Biometric sample        | This refers to the complete biometric sample required to perform a verification operation. For example, a single fingerprint is required to perform a verification.                                                                                                                                                                                                                                                                          |
| Biometric spoof         | This refers to a synthetic replica of a biometric sample.                                                                                                                                                                                                                                                                                                                                                                                    |

 

## Fingerprint reader requirements


Large Area sensors (a sensor matrix of 160 x160 Pixels or more at a dpi of 320 or greater):

-   FAR &lt; 0.001%.
-   Effective, real world FRR with antispoofing or liveness detection &lt;10%.
-   presentation attack defense measures are a requirement.

Small Area sensors (a sensor matrix of less than 160x160 at a dpi of 320 or greater):

-   FAR &lt; 0.002%.
-   Effective, real world FRR with antispoofing or liveness detection &lt;10%.
-   Presentation attack defense measures are a requirement.

Swipe sensors:

-   FAR &lt; 0.002%.
-   Effective, real world FRR with antispoofing or liveness detection &lt;10%.
-   Antispoofing measures are a requirement.

## Facial feature recognition requirements


-   FAR &lt; 0.001%.
-   TAR &gt; 95%.

## Appendix


The number of comparisons required to verify a particular level of confidence in a claimed FAR is shown below:

*\# of Unique Comparisons = C = 1/((1-Conf)) × 1/((FAR))*

where *FAR* is the desired False Accept Rate and *Conf* is the desired Confidence.

For example, with a desired FAR of 0.001%, at a confidence of 96%:

*\# of Unique Comparisions = C = 1/((1-0.96)) × 1/((0.00001))*

*C = 25 × 100,000*

*C = 2,500,000*

In this case, 2,500,000 comparisons would be required to reach the desired confidence in the claimed FAR.

To determine the number of unique biometric samples, *n*, to be collected to achieve these comparisons, the formula below can be used:

*\# of Comparisons = n!/2(n-2)!*

*C = n(n-1)/2*

*∴ n^2-n = 2C*

where *n* is the number of unique biometric samples.

In the cases where *n*^2&gt;&gt;*n*, the above formula can be simplified to:

*n^2 ≈ 2C*

*∴ n ≈ √2C*

Continuing with the example above, the number of unique biometric samples needed would be:

*n ≈ √(2×2,500,000)*

*n ≈ 2,236.1*

Meaning about 2,237 unique biometric samples will be needed to verify the confidence in the claimed FAR.

## Related topics


[Windows Hello face authentication](windows-hello-face-authentication.md)

[Windows Hello](windows-hello.md)

 

 







