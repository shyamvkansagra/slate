# Collections of Wishlist (Premium)

The Swym platform supports having multiple wishlists for a user, eg: my lounge, my bedroom, etc. or in case of fashion eg: my outdoor collection, my summer list, etc. These APIs are available on the premium plans, please contact us to enable these APIs for your installation.

## Get products for a collection

### _swat.fetchWishlistWRTHashtag(callbackFn, hashtag)

```javascript
window._swat.fetchWishlistWRTHashtag(function(products){
  // Render products
}, "Summer Collection");
```

When we want to get the information about various wishlist related activities based on hashtags, we can use this API. We will get an array of products in response.

Argument | Type | Description
--------- | ------- | -----------
renderFn | function | A function to render the response product JSONs
hashtag | string | Name of the hashtag

## Add collections to a product

### _swat.addCollectionsToProduct(variantId, collectionsToAdd, callbackFn, errorFn)

Add an array of collections to a product. When adding a product to wishlist, this API has to be called before calling [addToWishlist](#addtowishlist) API.

```javascript
window._swat.addCollectionsToProduct(
  epi, // epi is the currently selected variant id
  ["My Lounge"],
  function(){
    console.log("Added to collection");
  }
);
```


Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
Collections to add | array | Array of hashtags eg: ["My Lounge"]
Success callback<span>optional</span> | function | Success callback function which will be called upon successful response.
Error callback<span>optional</span> | function | Error callback function which will be called if unsuccessful response.

<aside class="success">
This should be followed by a call to addToWishlist. To retrieve the collection for a wishlisted product, every object has a property “hashtags” containing the array of collections set for the product.
</aside>


## Add products to a collections

### _swat.addProductsToCollection(collection, variantIdsToAdd, callbackFn, errorFn)

Add a list of products to a collection.

```javascript
window._swat.addProductsToCollection(
  "My Lounge",
  [ epi ], // epi is the currently selected variant id
  function() {
    console.log("Added to collection");
  }
);
```

Argument | Type | Description
--------- | ------- | -----------
collection | string | e.g. “My Lounge”
productsToAdd | array | List of variant ids to add to the collection
Success callback<span>optional</span> | function | Success callback function which will be called upon successful response.
Error callback<span>optional</span> | function | Error callback function which will be called if unsuccessful response.

<aside class="success">
This should be followed by a call to addToWishlist. To retrieve the collection for a wishlisted product, every object has a property “hashtags” containing the array of collections set for the product.
</aside>

## Get all collections

### _swat.getAllCollections(callbackFn, bImmediate<sub class="subscript">opt</sub>)

Gets all collections for the current user.

```javascript
window._swat.getAllCollections(function(collections){
  // code to use the returned collections
})
var collections = window._swat.getAllCollections(
  function(collections){},
  true
); // with the bImmediate argument
```

Argument | Type | Description
--------- | ------- | -----------
callback | function | A callback function that will receive all the collections
bImmediate | boolean | Boolean for whether to get all collections from in-memory cache or make an API call. If true, the API will return results. If false, the results will be returned to the callback function.


## Remove collections from a product

### _swat.removeCollectionsFromProduct(variantId, collectionsToRemove, callbackFn, errorFn)

Remove a set of collections from a wishlisted product. Let’s say a product is added in some custom collections (product has hashtags) and we want to remove a product from some particular collections. Call this API and it will remove particular hashtags from a swym product’s data. Now, product will not be shown in those collections anymore.

```javascript
window._swat.removeCollectionsFromProduct(
  141445464108,
  [ "summer collection", "ann's birthday" ],
  function(data) {},
  function(err) {}
);
```

Argument | Type | Description
--------- | ------- | -----------
epi | int/string | External product unique id (variant level if applicable)
collectionsToRemove | array | An array of collections to remove
Success callback<span>optional</span> | function | Success callback function which will be called upon successful response.
Error callback<span>optional</span> | function | Error callback function which will be called if unsuccessful response.


## Remove products from a collection

### _swat.removeProductsFromCollection(collection, variantIdsToRemove, callbackFn, errorFn)

Remove an array of products from a collection.

```javascript
window._swat.removeProductsFromCollection(
  "summer collection",
  [ 141445464108 ],
  function(data) {},
  function(err) {}
);
```

Argument | Type | Description
--------- | ------- | -----------
collection | string | Collection name
productsToRemove | array | An array of variant ids to remove
Success callback<span>optional</span> | function | Success callback function which will be called upon successful response.
Error callback<span>optional</span> | function | Error callback function which will be called if unsuccessful response.

## Remove a collection

### _swat.removeWishlistCollection(collection, callbackFn, errorFn)

Removes a wishlist collection.

```javascript
window._swat.removeWishlistCollection(
  "Patio furniture",
  function(msg) {},
  function(err) {}
);
```

Argument | Type | Description
--------- | ------- | -----------
collectionToRemove | String | Name of the collection to remove
Success callback<span>optional</span> | function | Success callback function which will be called upon successful response.
Error callback<span>optional</span> | function | Error callback function which will be called if unsuccessful response.
