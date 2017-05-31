
# Delivering a great browsing experience

Because all web browsers in today’s marketplace support similar standards, performance quickly becomes a key differentiator for customers. Consumers are keenly interested in the performance of all of the apps that they use, including browsers. This topic focuses on some of the performance challenges and what you can do to deliver a great Internet Explorer web browsing experience for your customers.

## Considerations

Anti-malware apps affect Internet Explorer web browsing performance. Page load time, a measurement of how long it takes to launch the browser and navigate to a web page, is an important part of the user experience. It’s important that you understand and consider what you’re installing on your PC, how it affects your customers, and their perception of your product’s performance.

### How anti-malware apps affect browsing

Anti-malware software affects browsing speed and fluidity in four major categories. Some examples of how anti-malware can slow down a browser include:

<ul>
<li>
<p>Network and disk interference:</p>
<ul>
<li>
<p>Outbound network traffic delays</p>
</li>
<li>
<p>Disk access interference</p>
</li>
<li>
<p>Reduced network parallelism</p>
</li>
</ul>
</li>
<li>
<p>JavaScript interference:</p>
<ul>
<li>
<p>Reverting to legacy JavaScript script engine</p>
</li>
<li>
<p>Redirecting JavaScript calls</p>
</li>
<li>
<p>Participating in dynamic JavaScript execution</p>
</li>
</ul>
</li>
<li>
<p>Visual interference:</p>
<ul>
<li>
<p>Redundant layout work</p>
</li>
<li>
<p>Competing with website code</p>
</li>
</ul>
</li>
<li>
<p>General interference:</p>
<ul>
<li>
<p>Synchronous server communication</p>
</li>
<li>
<p>Altering Internet Explorer assumptions</p>
</li>
</ul>
</li>
</ul>

### Selecting anti-malware apps

There are multiple factors to consider when choosing an anti-malware product to include on your PC. You can use the ADK assessments or other test tools to quantify the impact to the overall performance of your PC and to battery life. Keep in mind that you need not sacrifice performance to have a high level of protection. 

> [!IMPORTANT]
> The ADK assessments do not measure the level of security provided by anti-malware products. Many third parties produce reports measuring and comparing the effectiveness of various anti-malware packages.

## Recommended goals

To deliver a great Internet Explorer experience, a PC should meet the goals in the following table.

| **Scenario**                                                        | **Tablet (CS)** | **Convertible** | **Notebook** | **AIO**   |
|---------------------------------------------------------------------|-----------------|-----------------|--------------|-----------|
| IE Security Software Impact assessment: Page display time (seconds) | &lt;= 1.5       | &lt;= 0.5       | &lt;= 0.5    | &lt;= 0.5 |
| IE startup (User Perceived)(seconds)                                | &lt;= 1.0       | &lt;= 0.5       | &lt;= 0.5    | &lt;= 0.5 |

## Validation and testing

You can use the Windows Assessments Toolkit to improve performance of your PC beyond minimum requirements. Windows assessments related to Internet Explorer include:

<dl>
<dt><strong>Internet Explorer Startup Performance assessment</strong></dt>
<dd>
<p>Identifies components that can affect the time it takes to start Internet Explorer. The assessment measures the time to fully render a blank page, including the load time of the IExplore.exe process and the frame-creation and tab-creation intervals. It also measures the effect of all extensions add-ins, and toolbars installed on the system. It does not measure any network or browsing performance.</p>
</dd>
<dt><strong>Internet Explorer Security Software Impact assessment</strong></dt>
<dd>
<p>Measures aspects of Internet Explorer that are typically affected by anti-malware apps and other browser add-ins. The assessment measures the impact of security software on the display time, CPU time, and resource utilization of Internet Explorer.</p>
</dd>
</dl>

### Internet Explorer Security Software Impact assessment

The IE Security Software Impact Assessment is intended to measure more relevant browsing scenarios and focuses on the anti-malware impact on Internet Explorer browsing performance.

Anti-malware and browser add-ins have a large impact on the Windows experience. By expanding the number of assessments that reflect their impact, we help you develop a clearer picture of their overall impact on your users.

> [!NOTE]
> We recommend that you always compare results to a clean Windows image (with Windows Defender running) on the same system in order to quantify the impact introduced by the selected 3rd-party anti-malware solution.


This assessment covers page navigation and JavaScript performance, both of which are central to the browsing experience. It launches a page to exercise a number of key performance bottlenecks:

-   Significant use of JavaScript

-   Significant network usage

-   Complex page formatting

When doing the analysis, focus on Complete Page Load Duration and Page Usable metrics:

-   **Complete Page Load Duration**: Reports the total time that elapses before the test webpage is fully loaded in Internet Explorer. It measures the duration from page load until Internet Explorer CPU usage is relatively stable.

-   **Page Load to Usable**: Estimates the time that elapses between loading the page and when the page is usable. This metric is based on performance events.

Multiple types of impacts can be detected:

- **Network and disk interference**: Typically appears in network request metrics and in total CPU usage.

- **JavaScript interference**: Typically appears in JavaScript metric or in network request metrics.

- **Visual interference**: Typically appears in document paints metrics.

