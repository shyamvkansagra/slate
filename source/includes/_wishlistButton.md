# Wishlist button

## Add to wishlist <span class="hidden"> - addToWishList</span>

### _swat.addToWishList(eventObject, callbackFn, noShowNotification<sub class="subscript">opt</sub>)

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

// example with cprops and hashtags
window._swat.addToWishList(
  {
    "epi": 456,
    "du": "https://yourstore.com/products/your-another-awesome-product",
    "empi": 6789,
    "iu" : "//www.understandfrance.org/Images/AsterixObelix2.jpg",
    "pr": 70,
    "stk": 10,
    "variants": [{"Yellow / XL": 123}],
    "cprops": {personalised: true},
    "hashtags": ["summer dresses", "party wear"]
  },
  function(r) {
    console.log('Added to wishlist');
  }
);
```

Adds a new wishlist event. Please refer to the example. You can call this method once the window._swat object is initialized. This API operates at the epi, i.e. product variant level as set by the store.

This API can be called in the below scenarios,

- 'onclick' button on a product page
- 'onclick' button on a product quick view
- 'onclick' buttons on a collections page with multiple products
- 'onclick' buttons on a widget of multiple products, Eg: related products, top wishlist products, etc.

Tip - Before showing a button for 'Add to Wishlist', it is best to first check if the product or variant is already in the wishlist, by using the "fetch" API.

Please refer our blog/guide for directly connecting button to wishlist actions here - [Wishlist Plus Customization Cheatsheet](http://swym.it/wishlist-plus-customizations-cheatsheet/)


Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
empi | int/string | External product master id (if there is a group product id with different variant ids)
iu | string | Image-uri - Without protocol so protocol can be decided while rendering to http or https
pr | float | Price
cprops<span>optional</span> | object | data object that can be used to pass any custom data about the event
hashtags<span>optional</span> | array | array of wishlist collections to which this product needs to be added
For response | function | A callback function, which takes a single argument (JSON response from the swym service)
noShowNotification | boolean | Boolean for should the slide-out notification be shown. By default, this argument is false and the notification is shown

In the example, the request adds the product variant to the wishlist.
Please note that the these parameters are mandatory ones (epi, empi, du and iu).


## Remove from wishlist <span class="hidden"> - removeFromWishList</span>

### _swat.removeFromWishList(eventObject, callbackFn)

Removes a previously added wishlist event. Please refer to the example. You can call this method once the <code>window._swat</code> object is initialized. This API can be used for the same scenarios as <code>addToWishList</code>.

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

In the example, removeFromWishList removes a previously added entry from the wish list.

## Get all tracked products <span class="hidden"> - fetch</span>

### _swat.fetch(callbackFn)

> Example request

```javascript
window._swat.fetch( function(r) {
  console.log(r);
  document.getElementById('demo').innerHTML = r;
});
```

> Exmaple response

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
    "et": 1,
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

Fetch the history of events from the swym service.  The set of events fetched from the swym service is sorted by date (reverse chronological).  You can call this method once the <code>window._swat</code> object is initialized.

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response on success.


## Initialize custom button <span class="hidden"> - initializeActionButtons</span>

Let's say we have a custom button which should act as a wishlist button for a retailer. In this case, we need to add `data-swaction='addToWishlist'` or `data-swaction='addToWatchlist'` (depending on which app it is) attribute to that particular custom button HTML element on the retailer's store. We can use any custom selector as well if we don't want to use the `data-swaction`. Now, during run-time, all such buttons will be checked and initialized by Swym. In order to do that, we have to call this API: `initializeActionButtons`.

```javascript
window._swat.initializeActionButtons('.product-grid', '[my-custom-wishlist-btn]');
```

Argument | Type | Description
--------- | ------- | -----------
containerSelector | string | A container selector which is parent of all such custom wishlist buttons
selector<span>optional</span> | string | A selector for custom wishlist button, by default it is `data-swaction`

## Trigger variant change <span class="hidden"> - triggerSwymVariantEvent</span>

In Shopify, each product has multiple variants. In many stores, it is very important to capture events at a variant level, such as the variant id, variant price, variant stock, variant options, variant image, etc. The end user interacts with the product from the product details page, a collections page, a quick view popup or a widget of products. Swym provides support for managing events at product and variant levels for each of those scenarios. Find the detailed explanation below:

For a product details page - Let’s take the “onload” and “afterload”  scenarios and break it down to use cases -

“onload” - When a product page is opened, following are the usual patterns,

- First variant is picked
- First variant that is in stock and available to purchase is picked
- The variant specified in the query parameter <code>variant=<<variantid>></code> to the url is picked

For most themes, scenarios 1 and 3 are common, but there are no defined rules. Also, it can be the theme developer’s choice as how to control product details page. Swym has inbuilt support for scenarios 1 and 3. For ensuring scenario 2, the below snippet needs to be called to let Swym know of the current variant, once <code>window._swat</code> is initialized.


<aside><code>window.triggerSwymVariantEvent(variantid);</code> // variantid is the currently selected variant id</aside>


“afterload” - After page is opened, user can switch variants. Most themes use Shopify’s <code>Shopify.OptionSelector</code> library to enable variant selection elegantly. Swym has inbuilt support for this plugin. However there are no defined rules for this and hence in cases where the implementation is different, the below snippet needs to be called to let Swym know of the current variant whenever it is changed.



<!-- # Public API

This section outlines how to use the Swym JS API.

## Retrieving the swym.js and initializing it

When you are using the Swym Shopify app, the reference to swym.js is already initialized for you. Wrap all calls referencing <code>window._swat</code> as below in a javascript file or within <code>script</code> tags.

```javascript
  function swymCallbackFn(){

  }
  if(!window.SwymCallbacks){
   window.SwymCallbacks = [];
  }
  window.SwymCallbacks.push(swymCallbackFn);
```
 -->
