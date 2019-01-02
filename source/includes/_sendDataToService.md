# Sending Data to the service

## trackPageView

Sends a page view event , by default. Specific information regarding the page is automatically collected and sent (if unspecified and detected from the page).  You can call this method once the <code>window._swat</code> object is initialized. 

This API can be called in below scenarios,

- A product page is loaded

- A product is loaded in a quick view popup

- A product variant is changed, if you want more granularity in tracking, at a variant level in addition to the above two scenarios

```javascript
window._swat.trackPageview({
  "epi": 123,
  "du": "https://www.understandfrance.org/AsterixObelix",
  "empi": 1234,
  "iu" : "//www.understandfrance.org/Images/AsterixObelix.jpg", 
  "pr": 50,
  "stk": 100,
  "variants": [{"Blue / XL": 123}]
});
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price

## addToWishlist

Adds a new wishlist event. Please refer to the example. You can call this method once the window._swat object is initialized. This API operates at the epi, i.e. product variant level as set by the store.

This API can be called in the below scenarios,

- 'onclick' button on a product page

- 'onclick' button on a product quick view

- 'onclick' buttons on a collections page with multiple products

- 'onclick' buttons on a widget of multiple products, Eg: related products, top wishlist products, etc.

Tip - Before showing a button for 'Add to Wishlist', it is best to first check if the product or variant is already in the wishlist, by using the "fetch" API. 

Please refer our blog/guide for directly connecting button to wishlist actions here - [Wishlist Plus Customization Cheatsheet](http://swym.it/wishlist-plus-customizations-cheatsheet/)

> In this example, the request adds the product variant to the wishlist. Please note that the parameters below are mandatory ones (epi, empi, du and iu).

```javascript
window._swat.addToWishList(
  {
    "epi": 123,
    "du": "https://yourstore.com/products/your-awesome-product",
    "empi": 1234,
    "iu" : "//www.understandfrance.org/Images/AsterixObelix.jpg",
    "pr": 50,
    "stk": 100,
    "variants": [{"Blue / XL": 123}]
  },
  function(r) {
    console.log('Added to wishlist');
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
For response | function | A callback function, which takes a single argument (JSON response from the swym service)

## removeFromWishList

Removes a previously added wishlist event. Please refer to the example. You can call this method once the <code>window._swat</code> object is initialized. This API can be used for the same scenarios as <code>addToWishList</code>.

> In this example, removeFromWishList removes  a previously added entry from the wish list.

```javascript
window._swat.removeFromWishList(
  {
    "epi": 123,
    "du": "https://yourstore.com/products/your-awesome-product",
    "empi": 1234,
    "iu" : "//www.understandfrance.org/Images/AsterixObelix.jpg",
    "pr": 50,
    "stk": 100,
    "variants": [{"Blue / XL": 123}]
  },
  function(r) {
    console.log('Removed to wishlist');
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
For response | function | A callback function, which takes a single argument (JSON response from the swym service)

## addToCart

Adds a new cart event. Please refer to the example. You can call this method once the <code>window._swat</code> object is initialized.

<aside class="notice">Note - This API does not add product to the cart.</aside>

```javascript
window._swat.addToCart(
  {
    "epi": 123,
    "du": "https://yourstore.com/products/your-awesome-product",
    "empi": 1234,
    "iu" : "//www.understandfrance.org/Images/AsterixObelix.jpg",
    "pr": 50,
    "qty": 4,
    "stk": 100,
    "variants": [{"Blue / XL": 123}]
  },
  function(r) {
    console.log('Added to cart');
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
For response | function | A callback function, which takes a single argument (JSON response from the swym service)

## reportPurchase

Adds a new purchase event. Please refer to the example. You can call this method once the <code>window._swat</code> object is initialized.

```javascript
window._swat.reportPurchase(
  {
    "epi": 123,
    "du": "https://yourstore.com/products/your-awesome-product",
    "empi": 1234,
    "iu" : "//www.understandfrance.org/Images/AsterixObelix.jpg",
    "pr": 50,
    "qty": 4,
    "stk": 96,
    "variants": [{"Blue / XL": 123}]
  },
  function(r) {
    console.log('Reported purchase');
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
For response | function | A callback function, which takes a single argument (JSON response from the swym service)

## dropFromCart

Adds a new removed from cart event. Please refer to the example. You can call this method once the <code>window._swat</code> object is initialized.

```javascript
window._swat.dropFromCart(
  {
    "epi": 123,
    "du": "https://yourstore.com/products/your-awesome-product",
    "empi": 1234,
    "iu" : "//www.understandfrance.org/Images/AsterixObelix.jpg",
    "pr": 50,
    "qty": 4,
    "stk": 100,
    "variants": [{"Blue / XL": 123}]
  },
  function(r) {
    console.log('Dropped from cart');
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
For response | function | A callback function, which takes a single argument (JSON response from the swym service)

## sendEmailWishlist

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
hashtag | string | If collections of wishlist is used, a particular collection name that needs to be shared (optional)

## sendWatchlist

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
medium | string | What id is collected
product | object | Object with keys - {"epi" (variant id), "empi" (product master id), "iu" (image url), "pr" (price)}
callbackFn | function | Function that gets called after a successful HTTP API call
errorFn | function | Function that gets called when an error occurs
addToMailingList | boolean | Boolean to tell if user opted in or out from the mailing list (Note:- requires mailing list feature to be set up from Swym's end)

## updateWishlistEvent

Allows updating "cprops" parameter for an array of events. More info on "cprops" is here.

```javascript
window._swat.updateWishlistEvent(
  [
    {
      epi: 123,
      cprops: { x: 1, y: 2 }
    }
  ],
  function(r) { console.log(r) },
  function(r) { console.log(r) }
);
```
Argument | Type | Description
--------- | ------- | -----------
eventsToUpdate | array | An array of objects containing the keys "epi" and "cprops" corresponding to the events that need to be updated
successCallback | function | Function that gets called if the events are updated successfully
errorCallback | function | Function that gets called if the update ran into an error
