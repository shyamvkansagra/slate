# REST APIs (Premium)

## Intro

In addition to our JavaScript SDK, Swym APIs are also available as REST endpoints. Developers can use these endpoints to integrate functionalities of the Swym platform in mobile apps, embedded devices, third-party software etc.

## Authentication

Swym REST APIs follow [Basic Authentication](https://swagger.io/docs/specification/authentication/basic-authentication/). In the Authorization header of your request, you will need username and API key. Use your "provider id" as username. You can find your "provider id" by typing `_swat.pid` in the developer console after opening your site.

For the API key, please contact our support team by <a href="https://swym.freshdesk.com/support/tickets/new" target="_blank">raising a ticket</a>. Since REST APIs are a Premium plan and above feature only, we provision API keys on a case by case basis. Also, the API endpoint is determined by the tier on which your store is provisioned on the Swym platform. Our support team will be able to provide you with the correct endpoint using your store details.

## Fetch wishlist products for a user

```shell:cURL
curl -X GET \
  'https://YOUR_SWYM_ENDPOINT/storeadmin/user/wishlist?useremail=demouser@demo.com' \
  -H 'Authorization: Basic BASE64-ENCODING-OF-"username:password"' \
  -H 'Content-Type: application/x-www-form-urlencoded'

```
```
Example response:
```

```json
{
    "metadata": [
        {
            "inactive": false,
            "vendor": "Pure Fix Cycles",
            "vval1": "50 cm",
            "iqty": 100,
            "_hv": "Oi+ZI8dGO/d6bPkDuNzX61IGrc/PQPBOq9HmMfjy9iI=",
            "empi": 1483962056779,
            "title": "Alfa",
            "prodtype": "Fixed Gear Bicycle",
            "sku": "The Alfa - Small",
            "du": "https://engagedemo.myshopify.com/products/the-alfa",
            "pid": "Muz0BmP2s4Nu+YhQLYhKKRqe11LtYYeC/2Ju3Z0yYqk=",
            "epi": 13585114988619,
            "id": "a4c07b32-cc59-4abd-807b-32cc598abd87",
            "iu": "https://cdn.shopify.com/s/files/1/2241/2845/products/ALFA_SIDE_WEB.jpg?v=1542443636",
            "uri": "http://engagedemo.myshopify.com/products/the-alfa?variant=13585114988619",
            "pr": 1981.77,
            "vkey1": "Size"
        }
    ],
    "epis": [
        {
            "epi": 13585114988619,
            "ts": 1561451272218,
            "_id": "8c09ffe4-1262-4b6d-b203-98bd0ac593af.1561451272218",
            "date": "2019-06-25",
            "dcat": "Mac",
            "dcat1": "Personal computer",
            "di": "8c09ffe4-1262-4b6d-b203-98bd0ac593af",
            "et": 4
        }
    ]
}
```
```
Example call with "cached-products" parameter:
```

```shell:cURL
curl -g -X GET \
  'https://YOUR_SWYM_ENDPOINT/storeadmin/user/wishlist?useremail=demouser@demo.com&cached-products=[{%22epi%22:%2013585114988619,%20%22_hv%22:%20%22Oi%2BZI8dGO%2Fd6bPkDuNzX61IGrc%2FPQPBOq9HmMfjy9iI%3D%22}]' \
  -H 'Authorization: Basic BASE64-ENCODING-OF-"username:password"' \
  -H 'Content-Type: application/x-www-form-urlencoded'

```
With this API, you can fetch all the wishlisted products for a shopper given email address.

The response here contains two important keys - `metadata` and `epis`. The `epis` key contains data about the wishlist event (when it happened, device info, etc) while the `metadata` key contains data about the product for which the event happened. While rendering with this data, loop over the `epis` key, take the epi (variant id) and merge it with its corresponding object in the `metadata` key (using the `epi` key in each object inside `metadata` key). This will give you a list that has complete data about a wishlist event.

To optimise data sent over the wire, this API also provides a "cached-products" parameter. This parameter determines the client's product metadata state. If the client already has the latest metadata about a product, it's not sent again for that product. Whenever metadata about a product is sent by a Swym API, "_hv" key is returned along with it. This key is the "freshness stamp" for a product. While making the next request, if the client sends the "cached-product" parameter with the variant id and the stamp for the product's metadata that the client has, Swym checks if the stamp represents the most recent state. If it does, Swym API will not return the product metadata again.

Field | Type | Description
--------- | ------- | -----------
useremail | string | The customer's email address
cached-products <span>optional</span> | Array[object] | Array of json objects containing the variant id and hash value of product data available to the client

## Add products to user's wishlist

```shell:cURL
curl -X POST \
  'http://YOUR_SWYM_ENDPOINT/storeadmin/user/add-wishlist?useremail=demouser@demo.com' \
  -H 'Authorization: Basic BASE64-ENCODING-OF-"username:password"' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d epis=%5B13585100865611%5D
```
```
Example response:
```

```
{"message":"Product(s) added to user collection"}
```
Using this API, you can add an array of products to a user's wishlist, given their email address.

### Query Parameters

Field | Type | Description
--------- | ------- | -----------
useremail | string | The customer's email address
appId <span>optional</span> | string | the type of client making this request. Defaults to "StoreadminApi". Can be "mobileApp" if app is making the request.

### Request Body

Field | Type | Description
--------- | ------- | -----------
epis | Array[object] | Array of variant ids of the products to be added to wishlist.

## Remove a product from a  user's wishlist

```shell:cURL
curl -X POST \
  'http://YOUR_SWYM_ENDPOINT/storeadmin/user/remove-wishlist?useremail=demouser@demo.com' \
  -H 'Authorization: Basic BASE64-ENCODING-OF-"username:password"' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d epis=%5B13585100865611%5D
```
```
Example response:
```
```
{"message":"Product(s) removed from user's collection"}
```

Using this API, you can remove an array of products from a user's wishlist, given their email address.

Note: ensure the product is available in the user's wishlist before removing.

### Query Parameters

Field | Type | Description
--------- | ------- | -----------
useremail | string | The customer's email address
appId <span>optional</span> | string | the type of client making this request. Defaults to "StoreadminApi". Can be "mobileApp" if app is making the request.

### Request Body

Field | Type | Description
--------- | ------- | -----------
epis | Array[variantid1, variantid2 ... variantidn] | Array of variant ids of the products to be added to wishlist.


## Subscribe to Back In Stock Product Alerts on a product

Using this API, you can subscribe users to Back In Stock Product Alerts on products when they are currently out of stock. Please note, this only works if your inventory is managed by your e-commerce platform i.e. Shopify, Bigcommerce or Magento. You will also have to ensure on your end that the user is only able to subscribe to alerts on a product that's out of stock.

```shell:cURL
curl -X POST \
  'http://YOUR_SWYM_ENDPOINT/storeadmin/user/subscribe-isa?useremail=demouser@demo.com' \
  -H 'Authorization: Basic BASE64-ENCODING-OF-"username:password"' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d epis=%5B13585100865611%5D
```
```
Example response:
```

```
{"message":"Product(s) added to user collection"}
```

### Query Parameters

Field | Type | Description
--------- | ------- | -----------
useremail | string | The customer's email address

### Request Body

Field | Type | Description
--------- | ------- | -----------
epis | Array[object] | Array of variant ids of the products for which the user needs to be subscribed for alerts.
