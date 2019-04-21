require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use BeekeepersController
use CommentsController
use EntriesController
use HivesController
use PostsController
use SessionsController
run ApplicationController
