[![Build Status](https://travis-ci.org/alejandroereyes/grocery-link.svg?branch=master)](https://travis-ci.org/alejandroereyes/grocery-link)    [![Code Climate](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/gpa.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link)    [![Test Coverage](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/coverage.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link/coverage)

# Grocery Link
  A web REST API for grocery retailers to upload their product data and for developers to access.

## Link
  [groceryLink](www.grocerylink.io)


## Process
  [My Trello Board with UMLs & wireframes](https://trello.com/b/j78ElnvB/alejandro-reyes-grocerylink)

## Method calls
  * To request all categories; returns all categories: `http://grocerylink.io/api/lookup/categories?client_id=560650ec4dd6dc9a&secret_id=95d5e9f6cf2ce347d0a0ba66d8baf005a14aeebc5bb68be6e0b54d803b4c3e2f`

  * To request all retailers; returns all retailers: `http://grocerylink.io/api/lookup/retailers?client_id=CLIENT_ID&secret_id=SECRECT_ID`

  * To request all retailers in area; returns all retailers in city & state: `http://grocerylink.io/api/lookup/retailersinarea??client_id=CLIENT_ID&secret_id=SECRECT_ID&city=CITY&state=STATE`

  * To request by id; returns all retailer's that carry the item and price for each retailer: `http://grocerylink.io/api/products/byid?client_id=CLIENT_ID&secret_id=SECRECT_ID&id=PRODUCT_ID`

  * To request products that match by name; returns each product's info and retailers that carry the item: `http://grocerylink.io/api/products/byname?client_id=CLIENT_ID&secret_id=SECRECT_ID&name=PRODUCT_NAME`

## Set up
  1. clone repo
  2. run `bundle install`
  3. run `rake db:create db:migrate db:seed`

## How to run tests
  * make sure the rake tasks above have run
  * unless you'll be using code climate, remove 1st two lines from `test_helper.rb`. If you wish to sign up to track coverage, go to: [Code Climate](https://codeclimate.com/) and follow their instructions.
  * to have tests run with each push and tracked from your github repo, go to: [Travis CI](https://travis-ci.org/) and follow their instructions to have them run your tests.
  * run `rake test` in the terminal to run locally.

## Dependancies
  * [Materializecss](http://materializecss.com/) was used to create style
  * [Canvas.JS](http://canvasjs.com/) was used to create dynamic charts, `http://creativecommons.org/licenses/by-nc/3.0/deed.en_US`
  * [DataTables](http://datatables.net/) was used to create data tables.
  * Notable gems:
    * `fiagro`
    * `codeclimate-test-reporter`
    * `mocha`
    * `devise`
    * `mandrill_dm`
    * `pg_search`
    * `react-rails`
    * `jquery_datatables-rails,  github: 'rweng/jquery-datatables-rails'`
    * `momentjs-rails`
    * `information_machine_api, github: 'information-machine/information-machine-api-ruby'`
    * `puma`
    * `materialize-sass`
    * `boostrap-sass`
    * `will_paginate`
    * `will_paginate-boostrap`
    * `faker`

