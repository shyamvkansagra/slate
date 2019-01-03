# Provider based validation - Magento

We provide an endpoint, where a Magento server can call to validate a logged in user. Here are the details of the API and a working CURL example.

Endpoint: /provider/validate

Method Type: POST

## Request parameters

A JSON map with the following parameters

JSON Key | Value
-------- | --------
pid | An alphanumeric string representing the retailer’s pid
e | Encrypted/base64 encoded email (authenticated by Magento)
reg-id | Represents the registration identifier; (optionally can also be sent via the HTTP headers)

## Request headers

Name | Value
-------- | --------
x-swym-regid | Represents the registration identifier. (optionally can be sent via reg-id in the POST request)
Content-Type | application/json

## Response

- HTTP 200 OK response. if the request is good

- HTTP 400 response, if one or more the arguments is incorrect

- HTTP 401 unauthorized, if the encryption is incorrect

## Examples

### Example 1 - Example showing sending all the content in JSON 

Send a request via CURL where all the parameters in a JSON

>\> cat content.json

```json
{
  "e": "jACjc3XtT14RV20G43cDd5Vt/QRVluX7cbo7e2JExKyMXgFpTnw/kqV4AAjlKADDJepzFn7jHRIvElNf97vmn8Cnna4B8653DrO1nesLErhzAOWKcQUHuDR1dGN1aNUany9ej4GfOgsj9uMyBGJyXcIWK0DxAHqqjQTSAfscCmqg0sXuvNRX8VZrzhnXLjvKJqaQ0iqDoLhbruXE7cAHvYCEdytYCBdKfJLmgeGF+PEAd8+lWxJ7pEhTxgd1jM6CgbO23wc6pOse6I8QKUY5X4Tyuzup5SOGCUpLe1tzxauE/fkq5YErAs1/rUooRfyLzcoB303x4lQTaKQKNR7HaQ==",
  "pid": "y4/8LjPDkpzNr7Jxiy2b3r0RMZ/fK4GpSS55qhn3tcU=",
  "reg-id": "4Egh4idjJRctwKv6vsTiryPZKVMpUK3LK6LTS1PhQY9of2Qs6IEm_MkioJy3Y8HrBFo2Ky5epGHf2IYJwWT4ND_lNXCoB8RdD7PVIaE4xH5ozZRahfnefr4l64L3oTf8HWx1qeZSR4IaPEPVoM6ugKOhfJJKlV2m95CRI-wp3h8"
}
```

Send a CURL request via POST using application/json header and using content.json file in the body

\> curl -vvv  -X POST  -H "Content-Type:application/json"  -d @content.json http://swymstoragestaging-785025156.us-east-1.elb.amazonaws.com/provider/validate 

\* Hostname was NOT found in DNS cache

\*   Trying 54.88.195.236...

\* Connected to swymstoragestaging-785025156.us-east-1.elb.amazonaws.com (54.88.195.236) port 80 (#0)

\> POST /provider/validate HTTP/1.1

\> User-Agent: curl/7.35.0

\> Host: swymstoragestaging-785025156.us-east-1.elb.amazonaws.com

\> Accept: */*

\> Content-Type:application/json

\> Content-Length: 592

\> 

\* upload completely sent off: 592 out of 592 bytes

< HTTP/1.1 200 OK

< Date: Mon, 09 Feb 2015 20:21:39 GMT

\* Server Jetty(7.x.y-SNAPSHOT) is not blacklisted

< Server: Jetty(7.x.y-SNAPSHOT)

< Content-Length: 19

< Connection: keep-alive

< 

\* Connection #0 to host swymstoragestaging-785025156.us-east-1.elb.amazonaws.com left intact
Requested validated

### Example 2 - Example showing sending regid in header and the rest of the content in JSON

Send a curl request using x-swym-regid header and the rest of the content in JSON body

> cat content-2.json

```json
{
    "e": "jACjc3XtT14RV20G43cDd5Vt/QRVluX7cbo7e2JExKyMXgFpTnw/kqV4AAjlKADDJepzFn7jHRIvElNf97vmn8Cnna4B8653DrO1nesLErhzAOWKcQUHuDR1dGN1aNUany9ej4GfOgsj9uMyBGJyXcIWK0DxAHqqjQTSAfscCmqg0sXuvNRX8VZrzhnXLjvKJqaQ0iqDoLhbruXE7cAHvYCEdytYCBdKfJLmgeGF+PEAd8+lWxJ7pEhTxgd1jM6CgbO23wc6pOse6I8QKUY5X4Tyuzup5SOGCUpLe1tzxauE/fkq5YErAs1/rUooRfyLzcoB303x4lQTaKQKNR7HaQ==",
    "pid": "y4/8LjPDkpzNr7Jxiy2b3r0RMZ/fK4GpSS55qhn3tcU="
}
```


\> /usr/bin/curl -vvv  -X POST  -H "Content-Type:application/json" -H "x-swym-regid: 4Egh..."  -d @content-2.json http://swymstoragestaging-785025156.us-east-1.elb.amazonaws.com/provider/validate

\* Hostname was NOT found in DNS cache

\*   Trying 54.88.195.236...

\* Connected to swymstoragestaging-785025156.us-east-1.elb.amazonaws.com (54.88.195.236) port 80 (#0)

\> POST /provider/validate HTTP/1.1

\> User-Agent: curl/7.35.0

\> Host: swymstoragestaging-785025156.us-east-1.elb.amazonaws.com

\> Accept: */*

\> Content-Type:application/json

\> x-swym-regid: 4Egh4idjJRctwKv6vsTiryPZKVMpUK3LK6LTS1PhQY9of2Qs6IEm_MkioJy3Y8HrBFo2

\> Content-Length: 407

\> 

\* upload completely sent off: 407 out of 407 bytes

< HTTP/1.1 200 OK

< Date: Mon, 09 Feb 2015 20:27:39 GMT

\* Server Jetty(7.x.y-SNAPSHOT) is not blacklisted

< Server: Jetty(7.x.y-SNAPSHOT)

< Content-Length: 19

< Connection: keep-alive

### Example 3 - Example showing a HTTP 401 (unauthorized)

Send a bad encrypted email to the server

/usr/bin/curl -vvv  -X POST  -H "Content-Type:application/json" -H "x-swym-regid: 4Egh4idjJRctwKv6vsTiryPZKVMpUK3LK6LTS1PhQY9of2Qs6IEm_MkioJy3Y8HrBFo2Ky5
WT4ND_lNXCoB8RdD7PVIaE4xH5ozZRahfnefr4l64L3oTf8HWx1qeZSR4IaPEPVoM6ug
-wp3h8"  -d @bad-content.json 
http://swymstoragestaging-785025156.us-east-1.elb.amazonaws.com/provider/validate

\* Hostname was NOT found in DNS cache

\*   Trying 54.88.195.236...

\* Connected to swymstoragestaging-785025156.us-east-1.elb.amazonaws.com (54.88.195.236) port 80 (#0)

\> POST /provider/validate HTTP/1.1

\> User-Agent: curl/7.35.0

\> Host: swymstoragestaging-785025156.us-east-1.elb.amazonaws.com

\> Accept: */*

\> Content-Type:application/json

\> x-swym-regid: 
4Egh4idjJRctwKv6vsTiryPZKVMpUK3LK6LTS1PhQY9of2Qs6IEm_MkioJy3Y8HrBFo2Ky
5epGHf2IYJwWT4ND_lNXCoB8RdD7PVIaE4xH5ozZRahfnefr4l64L3oTf8HWx1qeZSR4Ia
PEPVoM6ugKOhfJJKlV2m95CRI-wp3h8

\> Content-Length: 406

\> 

\* upload completely sent off: 406 out of 406 bytes

< HTTP/1.1 401 Unauthorized

< Date: Mon, 09 Feb 2015 20:29:54 GMT

\* Server Jetty(7.x.y-SNAPSHOT) is not blacklisted

< Server: Jetty(7.x.y-SNAPSHOT)

< Content-Length: 50

< Connection: keep-alive

< 

\* Connection #0 to host swymstoragestaging-785025156.us-east-1.elb.amazonaws.com left intact
javax.crypto.BadPaddingException: Decryption error

### Example 4: Showing a null providerid

usr/bin/curl -vvv  -X POST  -H "Content-Type:application/json" -H "x-swym-regid: 4Egh4idjJRctwKv6vsTiryPZKVMpUK3LK6LTS1PhQY9of2Qs6IEm_MkioJy3Y8HrBFo2Ky5epGHf2IYJ
wWT4ND_lNXCoB8RdD7PVIaE4xH5ozZRahfnefr4l64L3oTf8HWx1qeZSR4IaPEPVoM6ugKOhfJJKlV2m
95CRI-wp3h8"  -d '{}' 
http://swymstoragestaging-785025156.us-east-1.elb.amazonaws.com/provider/validate

\* Hostname was NOT found in DNS cache

\*   Trying 54.88.195.236...

\* Connected to swymstoragestaging-785025156.us-east-1.elb.amazonaws.com (54.88.195.236) port 80 (#0)

\> POST /provider/validate HTTP/1.1

\> User-Agent: curl/7.35.0

\> Host: swymstoragestaging-785025156.us-east-1.elb.amazonaws.com

\> Accept: */*

\> Content-Type:application/json

\> x-swym-regid: 
4Egh4idjJRctwKv6vsTiryPZKVMpUK3LK6LTS1PhQY9of2Qs6IEm_MkioJy3Y8HrBFo2Ky5
epGHf2IYJwWT4ND_lNXCoB8RdD7PVIaE4xH5ozZRahfnefr4l64L3oTf8HWx1qeZSR4IaPE
PVoM6ugKOhfJJKlV2m95CRI-wp3h8

\> Content-Length: 2

\> 

\* upload completely sent off: 2 out of 2 bytes

< HTTP/1.1 400 Bad Request

< Date: Mon, 09 Feb 2015 20:34:17 GMT

\* Server Jetty(7.x.y-SNAPSHOT) is not blacklisted

< Server: Jetty(7.x.y-SNAPSHOT)

< Content-Length: 20

< Connection: keep-alive

< 

\* Connection #0 to host swymstoragestaging-785025156.us-east-1.elb.amazonaws.com left intact
pid empty/null param
