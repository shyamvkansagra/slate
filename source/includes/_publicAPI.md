# Public API

This section outlines how to use the Swym Public API.

## Retrieving the swym.js and initializing it - Shopify

When you are using the Swym Shopify app, the reference to swym.js is already initialized for you. Wrap all calls referencing <code>window._swat</code> as below in a javascript file or within <code>script</code> tags.

```javascript
if(window._swat) {
  // call your function
} else {
  window.SwymCallbacks = window.SwymCallbacks || [];
  window.SwymCallbacks.push(function() {
    //call your function
  });
}
```

