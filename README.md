[![Build Status](https://travis-ci.org/alejandroereyes/grocery-link.svg?branch=master)](https://travis-ci.org/alejandroereyes/grocery-link)    [![Code Climate](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/gpa.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link)    [![Test Coverage](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/coverage.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link/coverage)

# Grocery Link
  A web api for grocery retailers to upload their data product data.

## Method calls

  * To request by id. Returns all retailer's that carry the item and price for each retailer. `/api/products/byid?client_id=CLIENT_ID&secret_id=SECRECT_ID&id=PRODUCT_ID`

  * To request products that match by name. Returns each product's info and retailers that carry the item. `/api/products/byname?client_id=CLIENT_ID&secret_id=SECRECT_ID&name=PRODUCT_NAME`
