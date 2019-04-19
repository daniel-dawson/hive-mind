class SessionsController < ApplicationController
  get '/login' do
    haml :'/sessions/login'
  end

  post '/login' do
    beekeeper = Beekeeper.find_by(email: params[:beekeeper][:email])
    if beekeeper && beekeeper.authenticate(params[:beekeeper][:password])
      log_in beekeeper
      redirect "/beekeepers/#{beekeeper.username}"
    else
      redirect '/login'
    end

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
