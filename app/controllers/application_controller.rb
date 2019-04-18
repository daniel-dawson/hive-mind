require './config/environment'
require_relative 'concerns/helpers'

class ApplicationController < Sinatra::Base
  include Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    register Sinatra::Flash
  end

  get "/" do
    erb :landing
  end

  get '/search' do
    @beekeepers = Beekeeper.all
    erb :search
  end

end
