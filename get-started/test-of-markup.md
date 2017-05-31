---
title: This is just a test of markup
description: This is just a test of markup
Search.SourceType: 
ms.assetid: 
---

# Lost space between character formatting tags

This topic exists only to demonstrate a problem. On the staging server, whitespace is zero between closing and opening formatting of characters. For example, either of these lines:

```
<b>command -option1</b> <i>parameter</i> <b>-option2</b>
**command -option1** *parameter* **-option2**
```

is rendered for publication with zero space before or after "parameter":

<b>command -option1</b> <i>parameter</i> <b>-option2</b>

**command -option1** *parameter* **-option2**

A workaround for both HTML and Markdown is to add **\&nbsp;** between the marked up strings. This probably works fine in most command lines, but it would be nicer to have whitespace retained rather than lost. There may be situations in which a non-breaking space isn't desirable.




