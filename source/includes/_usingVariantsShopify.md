# Using variants - Shopify

## Collections page

Most themes do not allow changing variants in the collection view. In other cases if it is allowed, whenever variant is changed, please follow the below steps to use custom wishlist buttons.

1. check if variant is already in the Wishlist by checking with the “fetch” api

2. the event data passed to “addToWishList” has to be modified

For product’s ‘quick view’ and other third party widgets - Whenever variant is changed, please follow the below steps,

1. If tracking is required at granular level, call “trackPageView” for product data

2. check if variant is already in the Wishlist by checking with the “fetch” api

3. the event data passed to “addToWishList” has to be modified
