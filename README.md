# ApiSimpleFilter

## TODO :warning:

complete documentation

publish on rubygems

## Table of contents

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
