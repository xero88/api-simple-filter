require "active_record"

ActiveRecord::Base.establish_connection({
  adapter: "postgresql",
  encoding: "utf8",
  database: "api_simple_filter_spec", # TODO:
  host: "localhost",
  username: "postgres",
  password: "secret",
})

class User < ActiveRecord::Base
end
