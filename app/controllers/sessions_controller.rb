class SessionsController < ApplicationController
  get '/login' do
    haml :'/sessions/login'
  end

  post '/login' do
    # Instantiate beekeeper here
    redirect "/beekeepers/#{beekeeper.id}"
  end

  get '/signup' do
    haml :'/sessions/signup'
  end

  delete '/logout' do
    session.clear
    @current_user = nil
    redirect '/login'
  end
end
