# Custom implementation

## Track pageview

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
