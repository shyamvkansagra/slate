# Using variants - Shopify

## Product details page

In Shopify, each product has multiple variants. In many stores, it is very important to capture events at a variant level, such as the variant id, variant price, variant stock, variant options, variant image, etc. The end user interacts with the product from the product details page, a collections page, a quick view popup or a widget of products. Swym provides support for managing events at product and variant levels for each of those scenarios. Find the detailed explanation below:

For a product details page - Let’s take the “onload” and “afterload”  scenarios and break it down to use cases - 

“onload” - When a product page is opened, following are the usual patterns,

- First variant is picked 

- First variant that is in stock and available to purchase is picked

- The variant specified in the query parameter <code>variant=<<variantid>></code> to the url is picked

For most themes, scenarios 1 and 3 are common, but there are no defined rules. Also, it can be the theme developer’s choice as how to control product details page. Swym has inbuilt support for scenarios 1 and 3. For ensuring scenario 2, the below snippet needs to be called to let Swym know of the current variant, once <code>window._swat</code> is initialized.


<aside>window.triggerSwymVariantEvent(variantid); // variantid is the currently selected variant id</aside>


“afterload” - After page is opened, user can switch variants. Most themes use Shopify’s <code>Shopify.OptionSelector</code> library to enable variant selection elegantly. Swym has inbuilt support for this plugin. However there are no defined rules for this and hence in cases where the implementation is different, the below snippet needs to be called to let Swym know of the current variant whenever it is changed.


<aside>window.triggerSwymVariantEvent(variantid);</aside>

## Collections page

Most themes do not allow changing variants in the collection view. In other cases if it is allowed, whenever variant is changed, please follow the below steps to use custom wishlist buttons.

1. check if variant is already in the Wishlist by checking with the “fetch” api

2. the event data passed to “addToWishList” has to be modified

For product’s ‘quick view’ and other third party widgets - Whenever variant is changed, please follow the below steps,

1. If tracking is required at granular level, call “trackPageView” for product data

2. check if variant is already in the Wishlist by checking with the “fetch” api

3. the event data passed to “addToWishList” has to be modified
