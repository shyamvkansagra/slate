# Delete event(s)

## deleteEvent

Basically, this is a stubbed API to delete one or all events associated with a device(s).

deleteEvent - deletes a single event, You need to specify the event _id, an alphanumeric value. Refer the [fetch](#fetch) method for this highlighted event.

```javascript
window._swat.deleteEvent(
  function() {
    console.log('deleted')
  },
  _id
);
```

Argument | Type | Description
--------- | ------- | -----------
callbackFn | function | A callback function with a single argument, which is a  JSON response called by remoteAuthRequest
id | string | An alphanumeric event id value
