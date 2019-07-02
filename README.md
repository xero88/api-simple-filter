# ApiSimpleFilter

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