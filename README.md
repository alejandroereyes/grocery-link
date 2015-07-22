[![Build Status](https://travis-ci.org/alejandroereyes/grocery-link.svg?branch=master)](https://travis-ci.org/alejandroereyes/grocery-link)    [![Code Climate](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/gpa.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link)    [![Test Coverage](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/coverage.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link/coverage)

# Grocery Link
  A web REST API for grocery retailers to upload their product data and for developers to access.

## Link
  [groceryLink](https://grocerylink.io)


## Trello Board with UMLs
  [My Trello Board with UMLs](https://trello.com/b/j78ElnvB/alejandro-reyes-grocerylink)

## Method calls
  * To request all categories; returns all categories: `http://grocerylink.io/api/categories?client_id=CLIENT_ID&secret_id=SECRECT_ID`

  * To request all retailers; returns all retailers: `http://grocerylink.io/api/retailers?client_id=CLIENT_ID&secret_id=SECRECT_ID`

  * To request all retailers in area; returns all retailers in city & state: `http://grocerylink.io/api/retailersinarea??client_id=CLIENT_ID&secret_id=SECRECT_ID&city=CITY&state=STATE`

  * To request by id; returns all retailer's that carry the item and price for each retailer: `http://grocerylink.io/api/products/byid?client_id=CLIENT_ID&secret_id=SECRECT_ID&id=PRODUCT_ID`

  * To request products that match by name; returns each product's info and retailers that carry the item: `http://grocerylink.io/api/products/byname?client_id=CLIENT_ID&secret_id=SECRECT_ID&name=PRODUCT_NAME`

  ## Details
    * Canvas.JS was used to create dynamic charts, `http://creativecommons.org/licenses/by-nc/3.0/deed.en_US`
