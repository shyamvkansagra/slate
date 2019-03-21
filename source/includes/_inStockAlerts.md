# In-stock alerts

## Show "Email me when available" widget

### _swat.addToWatchList(clickEvent, eventMap, callbackFn, renderIntoNode<sub class="subscript">opt</sub>)

When a product is out of stock and you want to show "Email me when available" subscription button, we can use this API to add a product to user's "watchlist". Whenever product is back in stock, an email will be sent to user automatically if `addToWatchlist` was performed for that product for user.

```javascript
window._swat.addToWatchList(
  clickEventObj,
  { epi: 10, empi: 10, iu: "IMAGE_URL" },
  function(r) {
    console.log("response", r);
  },
  document.querySelector(".INJECT-FORM");
);
```

Argument | Type | Description
--------- | ------- | -----------
clickEvent | object | event object of click listener event
evtMap | object | An object consisting epi, empi and iu
callbackFn | function | A callback function which will be called on success
renderIntoNode<span>optional</span> | DOM node | A DOM node where you want to show addToWatchlist as popup/inline form


## Request in-stock alert for a product

### _swat.sendWatchlist(mediumValue, sendMedium, eventObject, callbackFn, errorFn, addToMailingList<sub class="subscript">opt</sub>)

Sends an back-in-stock alert request to the Swym platform.

```javascript
window._swat.sendWatchlist(
  "demo@demo.com",
  "email",
  {
    epi: 123,
    empi: 12,
    iu: "https://a.com/b.jpeg",
    pr: 23
  },
  function(r) { console.log(r) },
  function(e) { console.log(e) }
);
```

Argument | Type | Description
--------- | ------- | -----------
mediumValue | string | Value of the medium (currently supported ‘email’, hence email Id)
medium | string | What id is collected (currently 'email' supported)
product | object | Object with keys - {"epi" (variant id), "empi" (product master id), "iu" (image url), "pr" (price)}
callbackFn | function | Function that gets called after a successful HTTP API call
errorFn | function | Function that gets called when an error occurs
addToMailingList<span>optional</span> | boolean | Boolean to tell if user opted in or out from the mailing list (Note:- requires mailing list feature to be set up from Swym's end)
