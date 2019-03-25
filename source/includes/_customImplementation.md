# Custom implementation

If you are building a custom storefront using Vue.JS / React or Angular, check out [our fork] (https://github.com/saumitra2810/storefront-api-examples "Custom storefront example") from Shopify's React + GraphQL storefront example.

The [first commit] (https://github.com/saumitra2810/storefront-api-examples/commit/ffda26ce8f559f54497e125c50e34dcb662dd945 "Storefront changes commit") has all the changes necessary to get started with Swym APIs on a custom storefront on Bigcommerce / Magento or Shopify.

The APIs below document all the APIs you will need to implement the complete platform functionality into your storefront.

## Track pageview <span class="hidden"> - trackPageview</span>

### _swat.trackPageview(eventObject, callbackFn)

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
},
function(r) {
  console.log('Reported pageview event');
});
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
For response | function | A callback function, which takes a single argument (JSON response from the swym service)

## Track add to cart event <span class="hidden"> - addToCart</span>

### _swat.addToCart(eventObj, callbackFn)

Adds a new cart event. Please refer to the example. You can call this method once the <code>window._swat</code> object is initialized.

<aside class="notice">Note - This API does not add product to the cart, it registers an addToCart event for a product.</aside>

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
    console.log('Reported add to cart event');
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

## Track purchase event <span class="hidden"> - reportPurchase</span>

### _swat.reportPurchase(eventObj, callbackFn)

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

## Track drop from cart event <span class="hidden"> - dropFromCart</span>

### _swat.dropFromCart(eventObject, callbackFn)

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
    console.log('Reported dropped from cart');
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
