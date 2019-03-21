---
title: Swym JS API Info v2.0

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://swym.it/' target='_blank'>Visit our website</a>

includes:
  - errors
  - wishlistButton
  - wishlistCount
  - customWishlistPage
  - inStockAlerts
  - collectionOfWishlistPremium
  - socialShareOfWishlistPremium
  - enumReference
  - glossary
  - customImplementation

search: true
---

# Introduction

Swym JS loads asynchronously to ensure it does not fall in site's critical loading path. To ensure all calls to Swym APIs are made only once Swym is loaded and ready, please wrap all calls to the API in a construct as shown on the right.


```javascript
function swymCallbackFn(){
   // your API calls go here
}
if(!window.SwymCallbacks){
 window.SwymCallbacks = [];
}
window.SwymCallbacks.push(swymCallbackFn);
```

This document lists and explains various front-end javascript APIs exposed by Swym. One can refer this documentation to get the formal knowledge on how to manipulate front-end behaviour of Swym’s applications according to the respective needs. In case of any incorrect or incomplete information, please reach out to the developers’ team at Swym.

In this documentation, we have covered following topics for an individual API:

- What does a particular API do?
- When it should be called?
- What are the arguments?
- Example request and response
