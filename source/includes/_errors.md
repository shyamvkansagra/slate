# Errors

Ideally there should not be any error while calling these APIs. In case if you encounter any such interruptions in the flow, please check the console of your web page and see if the error is coming from our end. Our Javascript APIs will leave a handy error message on the developer console if the error is caught at our level.

If you do see an error that isn't self-explanatory, please reach out to our developers’ team. In any case, we are monitoring our APIs. So, if any exceptions or errors are generated, we can check the logs and fix it for you even before you encounter them.

For the errors coming from the server, the Swym JS APIs use the following error codes :


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- You are not allowed to request this data.
404 | Not Found -- The specified requested data could not be found.
418 | I'm a teapot.
429 | Too Many Requests -- You're raising too many requests! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
