---
title: Swym JS API Info v2.0

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://swym.it/' target='_blank'>Visit our website</a>

includes:
  - publicAPI
  - sendDataToService
  - retrieveDataFromService
  - usingVariantsShopify
  - authWithService
  - deletingEvents
  - usingPremiumAPIs
  - usingPremiumAPIsSocialShare
  - enumReference
  - providerBasedValidationMagento
  - errors

search: true
---

# Introduction

This document lists and explains various front-end javascript APIs exposed by Swym. One can refer this documentation to get the formal knowledge on how to manipulate front-end behaviour of Swym’s applications according to the respective needs. In case of any incorrect or incomplete information, please reach out to the developers’ team at Swym.

In this documentation, we have covered following topics for an individual API:

- What does a particular API do?

- When it should be called?

- What are the arguments?

- Example request and response

# Authentication

There is no other authentication required except from the one which was provided while installation of Swym application. To use these APIs, only initialization of <code>_swat</code> object in window is required. Make sure it is available before calling the custom workflows. You can check the same by using simple <code>if</code> condition on <code>window._swat</code> in your code.
