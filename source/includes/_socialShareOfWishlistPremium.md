# Social sharing of Wishlist (Premium)

## Share wishlist on social media <span class="hidden"> - shareWishlistSocial</span>

### _swat.shareWishlistSocial(hashtag, shareUrlTemplate, platform, note, errCallBack)

This API creates the unique URL for a particular sharing platform and opens a new dialog in that platform to perform the sharing step. For eg., for facebook, the share page will be opened in a new window.

<aside class="success">
Please note that this API needs an authenticated user. i.e. you need to login into the site or login via 'connect' from wishlist modal.
</aside>

```javascript
window._swat.shareWishlistSocial(
  null,
  "https://www.facebook.com/sharer.php?u={{shareurl}}&t={{note}}",
  "facebook",
  "Hello World",
  function(err) { console.log(data) }
); // will open facebook share dialog
```

Argument | Type | Description
--------- | ------- | -----------
hashtag | string | If collections of Wishlist is not enabled, hashtag has to be set as null.
platformShareUrlTemplate | string | The social platform-specific share URL with Mustache tags. Out of the box, platforms supported are "facebook", "twitter", "googleplus". To get share urls for these, use the variable - `_swat.retailerSettings.Wishlist.SharingModes`. This has the default icon url, share url and key for each of these platforms. Again, new platforms can be added here and/or default icons can be changed for you if you need it.
platform | string | The key to one of the sharing platforms. By default, one of "facebook", "twitter", "googleplus"
note | string | Some platforms allow to send a custom note along with shared url. This field is to capture that message. Amongst the defaults, at the moment, notes only work with twitter.
errCallBack | function | Function that gets called if there is an error. Called with error message as argument.

## Generate shareable wishlist URL <span class="hidden"> - generateSharedWishlistURL</span>

### _swat.generateSharedWishlistURL(hashtag, callbackFn, errCallBack)

A lower level API that returns the unique wishlist URL that can be shared anywhere. This URL will return the user who clicks on it back to the site into the default share wishlist page. This page can be overridden from the retailer settings if need be.

<aside class="success">
Please note that this API needs an authenticated user. i.e. you need to login into the site or login via 'connect' from wishlist modal.
</aside>

```javascript
window._swat.generateSharedWishlistURL(
  null,
  function(data) { console.log(data); },     // returns the generated url
  function(data) { console.log(data); }
;)
```

Argument | Type | Description
--------- | ------- | -----------
hashtag | string | If collections of Wishlist is not enabled, hashtag has to be set as `null`.
successFn | function | Function that gets called if the URL is generated successfully. The generated url is sent as argument to this function.
errorFn | function | Function that gets called if the URL generation fails. Error message is passed as argument.
