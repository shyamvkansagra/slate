# Retrieving data from service

## fetch

Fetch the history of events from the swym service.  The set of events fetched from the swym service is sorted by date (reverse chronological).  You can call this method once the <code>window._swat</code> object is initialized.

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

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response on success.

## fetchWrtEventType

Fetch the items based on a filter from the swym service.  The set of events fetched from the swym service is sorted by date (reverse chronological).  You can call this method once the window._swat object is initialized. This is used to fetch wishlist items, please see the example.

> Example request

```javascript
window._swat.fetchWrtEventType(
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

## authCheck

Query the swym service to see if the current browser is authenticated.

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

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response called by authCheck.

## wishlistCount

Get the current count of wishlist.

```javascript
window._swat.wishlistCount(
  function(r) {
    console.log('Wishlist items - ', r);
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function which receives a single argument, which is the number of wishlist items for the user
