# Wishlist count

## Get user's wishlist count

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


## Render user's wishlist count

In order to render the number of wishlisted items (generally on swym's anchor/launcher) use this API. We can also attach it to custom element. Manual style modification might be needed in that case.

```javascript
window._swat.renderWishlistCount(anchorElem.querySelector('.swym-anchor-badge'), function(cnt, elem){
  console.log("renderWishlistCount was called", cnt, elem);
}, 1500);
```

Argument | Type | Description
--------- | ------- | -----------
elem | DOM element | A DOM element to update the badge on
callback | function | A callback function with an object that gives event after default actions
timeout | integer | Miliseconds after which you want to update the render count on screen