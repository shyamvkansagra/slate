# Custom wishlist page

## Get all tracked products

Same as [fetch](#get-all-tracked-products).


## Get products by event type <span class="hidden"> - fetchWrtEventTypeET</span>

### _swat.fetchWrtEventTypeET(callbackFn, eventType)

Fetch the items based on a filter from the swym service.  The set of events fetched from the swym service is sorted by date (reverse chronological).  You can call this method once the window._swat object is initialized. This is used to fetch wishlist items, please see the example.

> Example request

```javascript
window._swat.fetchWrtEventTypeET(
  function(r) {
    // Get wishlist items
    console.log(r);
    document.getElementById('demo').innerHTML = r;
  },
  window._swat.EventTypes.addToWishList
);
```

> Example response

```json
[
  {
    "di": "deviceid",
    "_id": "deviceid.ts",
    "date": "2017-01-16",
    "pt": "Your Awesome Product",
    "rc": "default",
    "variants": "[{\"Blue\":123}]",
    "dt": "Your Awesome Product - Blue",
    "et": 4,
    "raw-du": "https://yourstore/products/your-awesome-product?v=123",
    "act": true,
    "empi": 1234,
    "ts": 1111,
    "du": "https://yourstore/products/your-awesome-product?v=123",
    "pid": "yourstorepid",
    "epi": 123,
    "iu": "//yourstore.com/images/your-awesome-product-123",
    "dcat1": "Personal computer",
    "pr": 50,
    "ct": "Accessories",
    "dcat": "Mac",
    "type": "product-variant"
  },
  {
    "di": "deviceid",
    "_id": "deviceid.ts",
    "date": "2017-01-16",
    "pt": "Your Awesome Product",
    "rc": "default",
    "variants": "[{\"Red\":134}]",
    "dt": "Your Awesome Product - Red",
    "et": 4,
    "raw-du": "https://yourstore/products/your-awesome-product?v=134",
    "act": true,
    "empi": 1234,
    "ts": 11,
    "du": "https://yourstore/products/your-awesome-product?v=134",
    "pid": "yourstorepid",
    "epi": 134,
    "iu": "//yourstore.com/images/your-awesome-product-134",
    "dcat1": "Personal computer",
    "pr": 45,
    "ct": "Accessories",
    "dcat": "Mac",
    "type": "product-variant"
  }
]
```

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response on success.
event type | int | enum Reference


## Email Wishlist <span class="hidden"> - sendEmailWishList</span>

### _swat.sendEmailWishList(callbackFn, toEmailId, fromName, note, hashtag<sub class="subscript">opt</sub>)

Sends an email with the wishlist contents of the current user to a given email id.

```javascript
window._swat.sendEmailWishList(
  function(r) {
    console.log('Email sent!');
  },
  "abc@xyz.com",
  "Admin",
  "Hey, check out these products!"
);
```

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function which takes a single argument (JSON response from the swym service)
emailId | string | An email Id to send the favorites to
fromEmailId | string | The sender's email id / name
note | string | Some personal note that needs to be sent along with the email contents
hashtag<span>optional</span> | string | If collections of wishlist is used, a particular collection name that needs to be shared


## Add product to cart <span class="hidden"> - replayAddToCart</span>

### _swat.replayAddToCart(productJson, variantId, callbackFn, errorFn)

From your wishlist popup or page, when you want to add a product to the cart of the store, create your add to cart button (if you are using custom button) and call this API.

```javascript
window._swat.replayAddToCart(
  {empi: 1234, du: "https://yourstore.com/products/your-another-awesome-product"},
  67,
  function() {
    console.log("Successfully added product to cart.");
  },
  function(e) {
    console.log(e);
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
product | object | An object of the product which needs to be added to cart with keys "empi" (product master id) and "du" (product url)
epi | integer | epi of the product which will be added to cart
successFn | function | A function which will be called when product is successfully added to card
errorFn | function | A function which will be called if case of any errors


## Get complete product details <span class="hidden"> - getProductDetails</span>

### _swat.getProductDetails(productObject, callbackFn, errorFn)

Let's say we want entire details about a product, which includes variants, stock level etc (all such info about product), then we can use this API which will return a productJson object on successful call.

```javascript
window._swat.getProductDetails(
  params,
  function(productJson) {
    console.log("Entire product json:", productJson);
  },
  function(e) {
    console.log(e);
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
params | object | An object with product keys epi (variant id), empi (product master id), du (product url)
successFn | function | A function which will be called with productJson
errorFn | function | A function which will be called if case of any errors


## Connect device to email address <span class="hidden"> - remoteAuthRequest</span>

### _swat.remoteAuthRequest(callbackFn, errorFn, toEmailId)

Request  the swym service to send a one time email validation link. A mail will be sent on the email address which is given as argument to this API. Upon clicking "Confirm", user will be redirected to site and authenticated.

```javascript
window._swat.remoteAuthRequest(
  function(resp) { console.log(resp); },
  function(err) { console.log(err); },
  "my.email@domain.com"
);
```

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response called by remoteAuthRequest
errorFn | function | A function which will be called in case of any errors
email address | string | A valid email address


## Check if device has an associated email <span class="hidden"> - authCheck</span>

### _swat.authCheck(callbackFn)

> Example request

```javascript
window._swat.authCheck(
  function(r) {
    console.log(r);
    document.getElementById('demo').innerHTML = r;
  }
);
```
> Example response if auth

```json
{
  "email": "r@foo.com",
  "authn": true
}
```

> Example response if not auth

```json
{
  "authn": false
}
```

Query the swym service to see if the current browser is authenticated.

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response called by authCheck.


## Update a wishlist event <span class="hidden"> - updateWishlistEvent</span>

### _swat.updateWishlistEvent(eventsToUpdate, callbackFn, errorFn)

Allows updating "cprops" parameter for an array of events. More info on "cprops" is [here](#json-key-reference-for-sending-pageview-wishlist-cart-events).

```javascript
window._swat.updateWishlistEvent(
  [
    {
      epi: 123,
      cprops: { x: 1, y: 2 }
    }
  ],
  function(r) { console.log(r) },
  function(e) { console.log(e) }
);
```
Argument | Type | Description
--------- | ------- | -----------
eventsToUpdate | array | An array of objects containing the keys "epi" and "cprops" corresponding to the events that need to be updated
successCallback | function | Function that gets called if the events are updated successfully
errorCallback | function | Function that gets called if the update ran into an error
