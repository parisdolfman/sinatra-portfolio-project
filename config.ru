require './config/environment'

#if ActiveRecord::Base.connection.migration_context.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

# Need to add 'use' and 'run' methods for controllers

use Rack::MethodOverride

run ApplicationController
use UsersController
use PaintingsController
