ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'capybara/dsl'
Bundler.require(:default, ENV['SINATRA_ENV'])

#configure :development do
#  set :database, 'sqlite3:db/development.db'
#end


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.db"
)

  # need a require_all here for controllers in app and 

  require_all 'app'