# :fire: ApiSimpleFilter :fire:

Enable smart filters for your API.

Example of feature :

`GET /products?name_contains=tesla&price_gte=2000&color_in=white,black`

Inspired by [strapi filters](https://strapi.io/documentation/3.0.0-beta.x/guides/filters.html#available-operators)

## :warning: TODO

- "in" operator not working

- complete documentation

- publish on rubygems

- rename in api_smart_filters

- decouple of rails (hard)

- site statique github de présentation

## :blue_book: Table of contents

### [Requirements](#requirements)

### [Installation](#installation)

### [Usage](#usage)

### [Testing](#testing)

## Requirements

Rails

Postgres

## Installation

`gem 'api_simple_filter', :git => 'https://github.com/xero88/api-simple-filter'`

`bundle install`

## Usage

In your controller, in the index action, replace your `Product.all` with the following lines :

`@products = ApiSimpleFilter::Reduce.new.call( Product.all, request.query_parameters )`

## Testing

Create this database structure :

`
ActiveRecord::Schema.define do
self.verbose = false

create_table :users do |t|
t.string :login
t.datetime :created_at
end
end
`
Then

`spec`
