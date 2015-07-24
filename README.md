[![Build Status](https://travis-ci.org/alejandroereyes/grocery-link.svg?branch=master)](https://travis-ci.org/alejandroereyes/grocery-link)    [![Code Climate](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/gpa.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link)    [![Test Coverage](https://codeclimate.com/github/alejandroereyes/grocery-link/badges/coverage.svg)](https://codeclimate.com/github/alejandroereyes/grocery-link/coverage)

# Grocery Link
  A web REST API for grocery retailers to upload their product data and for developers to access that data through HTTP Requests. Built using the [Rails](http://rubyonrails.org/) MVC framework  and using a [PostgreSQL](http://www.postgresql.org/) database.

## Link
  [groceryLink](http://grocerylink.io)
  * example user: [user@example.com](http://grocerylink.io)
  * example password: password

## Process
  [My Trello Board with UMLs & wireframes](https://trello.com/b/j78ElnvB/alejandro-reyes-grocerylink)

## Example Method calls
  * To request all categories; returns all categories: `http://grocerylink.io/api/lookup/categories?client_id=b9a39a944f59043f&secret_id=79b0a9758fa7712a3444bfab75241f2c04b1bf786fb0f88e27eb415211cf19f6`

  * To request all retailers; returns all retailers: `http://grocerylink.io/api/lookup/retailers?client_id=b9a39a944f59043f&secret_id=79b0a9758fa7712a3444bfab75241f2c04b1bf786fb0f88e27eb415211cf19f6`

  * To request all retailers in area; returns all retailers in city & state: `http://grocerylink.io/api/lookup/retailersinarea?client_id=b9a39a944f59043f&secret_id=79b0a9758fa7712a3444bfab75241f2c04b1bf786fb0f88e27eb415211cf19f6&city=Austin&state=TX`

  * To request by id; returns all retailer's that carry the item and price for each retailer: `http://grocerylink.io/api/products/byid?client_id=b9a39a944f59043f&secret_id=79b0a9758fa7712a3444bfab75241f2c04b1bf786fb0f88e27eb415211cf19f6&id=4`

  * To request products that match by name; returns each product's info and retailers that carry the item: `http://grocerylink.io/api/products/byname?client_id=b9a39a944f59043f&secret_id=79b0a9758fa7712a3444bfab75241f2c04b1bf786fb0f88e27eb415211cf19f6&name=Amy`

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
  * [Materializecss](http://materializecss.com/) was used to create most of the styling.
  * [Canvas.JS](http://canvasjs.com/) was used to create dynamic charts, `http://creativecommons.org/licenses/by-nc/3.0/deed.en_US`
  * [DataTables](http://datatables.net/) was used to create data tables.
  * [React](https://facebook.github.io/react/index.html) was used to run and display reports.
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

## Contact Info
  * [LinkedIn](https://www.linkedin.com/in/alexereyes)
  * alejandroereyes@gmail.com
