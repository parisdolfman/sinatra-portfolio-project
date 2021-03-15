ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'capybara/dsl'
Bundler.require(:default, ENV['SINATRA_ENV'])

# configure :development do
#  set :database, 'sqlite3:db/development.db'
# end

set :database, {adapter: "sqlite3", database: "development.db"} #fixed issue of rake db:migrate not working (changed from .sqlite3 to .db)


# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#  :database => "db/#{ENV['SINATRA_ENV']}.db" #what was being used last time functioned properly w/o activerecord error 3/14
# #  :database => "db/development.db"
#)

  # need a require_all here for controllers in app and 

  require_all 'app'