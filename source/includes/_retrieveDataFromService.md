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
