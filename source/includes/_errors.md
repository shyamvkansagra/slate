# Errors

Ideally there should not be any error while calling these APIs, but in case if you encounter any such interruptions in the flow, check the console of your web page and see if that error is coming from our end. If yes, reach out to our developers’ team. In any case, we are monitoring our APIs. So if any exceptions or errors are generated, we can check the logs and fix it for you even before you encounter them.

The Swym JS APIs use the following error codes if error is from server side:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- You are not allowed to request this data.
404 | Not Found -- The specified requested data could not be found.
405 | Method Not Allowed -- You tried to access a API with an invalid method.
406 | Not Acceptable -- You requested a format that isn't accepted.
410 | Gone -- The requested API has been removed from our servers.
418 | I'm a teapot.
429 | Too Many Requests -- You're raising too many requests! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
