require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get "/" do
    erb :landing
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    redirect 
  end

  get '/signup' do
    erb :signup
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/search' do
    @beekeepers = Beekeeper.all
    erb :search
  end

end
