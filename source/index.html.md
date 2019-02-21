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

> Go to your retailer's store where swym 'wishlist' app is installed and perform the following on console of any product's page:

```javascript
// This command sets event type as 4 for this product,
// '4' is add to wishlist event
window.SwymPageData.et = 4;
```

> After that, execute the following to add that product to wishlist:

```javascript
// This will add product to wishlist
window._swat.addToWishlist(SwymPageData, function(res){console.log(res)});
```

> To verify whether the product was added to wishlist or not, use the following command:

```javascript
// In the response of this call, check for et 4.
// et 4 means product is added to wishlist
window._swat.fetch(function(r) { console.log(r); })
```

This document lists and explains various front-end javascript APIs exposed by Swym. One can refer this documentation to get the formal knowledge on how to manipulate front-end behaviour of Swym’s applications according to the respective needs. In case of any incorrect or incomplete information, please reach out to the developers’ team at Swym.

In this documentation, we have covered following topics for an individual API:

- What does a particular API do?
- When it should be called?
- What are the arguments?
- Example request and response
