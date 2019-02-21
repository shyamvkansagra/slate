# Sending Data to service

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
