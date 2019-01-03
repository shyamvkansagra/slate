# Authenticating with the service

## remoteAuthRequest -- Request Email Validation

Request  the swym service to send a one time email validation link.

<aside class="notice">
Currently, the validation link is not sent via email. Instead the validation link is logged to the local (javascript/browser console).  Once, you click on this link, that browser is assigned to the requested email.  Your next call will automatically fetch the updated credentials.
</aside>

<aside class="notice">You can refresh these credentials either explicitly by clicking on “Refresh Auth Credentials”. Although this is typically not needed.</aside>

> Example response

```html
<form name="ra">
  <input type="text" name="email">
  <input
    type="button"
    value="Request Email Validation"
    onClick="window._swat.remoteAuthRequest(function(r) {}, ra.email.value)"
  >
</form>
```

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response called by remoteAuthRequest
email address | string | A valid email address
