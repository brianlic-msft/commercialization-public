---
title: SuggestionsURL\_JSON
description: SuggestionsURL\_JSON
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a220f091-5364-476b-8c17-5271fdd39848
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SuggestionsURL\_JSON


The `SuggestionsURL_JSON` setting specifies the URL where search suggestions can be retrieved by using a search based on JavaScript Object Notation (JSON).

**Note**  
To specify search suggestions by using a search based on XML, use the [SuggestionsURL](microsoft-windows-ie-internetexplorer-searchscopes-scope-suggestionsurl.md) instead.

 

For information on creating Search Scopes, see [Search Provider Extensibility](http://go.microsoft.com/fwlink/?LinkId=137666).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>URL</em></p></td>
<td><p>Specifies the URL where search suggestions can be retrieved by using a search based on JavaScript Object Notation (JSON).</p>
<p><em>URL</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [SearchScopes](microsoft-windows-ie-internetexplorer-searchscopes.md) | [Scope](microsoft-windows-ie-internetexplorer-searchscopes-scope.md) | `SuggestionsURL_JSON`

## Applies To


For a list of the supported Microsoft Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML example shows how to specify a URL to provide search suggestions by using a search based on JavaScript Object Notation (JSON).

``` syntax
 
<SearchScopes>
   <Scope wcm:action="add">
      <ScopeDefault>true</ScopeDefault>
      <ScopeDisplayName>MyFirstSearchProvider</ScopeDisplayName>
      <ScopeKey>SearchProvider1</ScopeKey>
      <ScopeUrl>http://www.contoso.com/search?q={searchTerms}</ScopeUrl>
      <SuggestionsURL_JSON>http://suggestions.contoso.com/search?&search={searchTerms}</SuggestionsURL_JSON>
      <DisplayQuickPick>false</DisplayQuickPick>
   </Scope>
</SearchScopes>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

[SuggestionsURL](microsoft-windows-ie-internetexplorer-searchscopes-scope-suggestionsurl.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SuggestionsURL_JSON%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





