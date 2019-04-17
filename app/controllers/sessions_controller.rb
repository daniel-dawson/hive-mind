class SessionsController < ApplicationController
  get '/login' do
    erb :login
  end

  post '/login' do
    redirect ''
  end

  get '/signup' do
    erb :signup
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
