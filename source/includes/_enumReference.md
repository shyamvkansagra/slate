# Enum reference

## EventType (et)

"et"

0 - Unknown, 

1 - product, 

2 - category, 

3 - cart

4 - wishlist

5 - coupon

6 - product purchase

7 - removed from cart

## DeviceCategory (dcat)

“DeviceCategory” is an enum that will typically return one of these three types:

- "Personal computer"

- “Tablet”

- “Smartphone”

## JSON key reference for sending pageview/wishlist/cart events

Argument | Type | Description
--------- | ------- | -----------
et | int/enum | event-type (see above)
pr | float | price
dt | string | doc-title
du | string | doc-uri - Full url with protocol
iu | string | image-uri - Without protocol so protocol can be decided while rendering to http or https
ru | string | referrer-uri
ct | string | category-type (Example; Womens Shoes)
bt | string | brand-type (Example: Nike)
epi | int/string | external product unique id (variant level if available)
empi | int/string | external product master id (if there is a group product id with different variant ids)
qty | int | quantity
stk | int | stock value
variants | JSON | variants (Example - <code>[{"Black/blue": <<epi-value>>}])</code>
cprops | object | custom parameter to add any custom data to the event. Fetch will return this data.

<aside class="notice">
Shopify’s product handle only returns handle, if you are using liquid, try using
<code>{{ shop.url }}{{ product.url }}</code> expression to get the full url of the product
</aside>

# Provider based validation - Shopify

As part of the Swym Shopify app install, provider based logins are picked automatically and validated the user to Swym.