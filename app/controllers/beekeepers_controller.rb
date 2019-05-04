require 'pry'
class BeekeepersController < ApplicationController
  get '/beekeepers' do
    @beekeepers = Beekeeper.all
    haml :'/beekeepers/index'
  end

  post '/beekeepers' do
    beekeeper = Beekeeper.new(params[:beekeeper])
    if beekeeper.save
      session[:user_id] = beekeeper.id
      redirect "/beekeepers/#{beekeeper.username}"
    else
      flash[:errors] = beekeeper.errors
      redirect "/signup"
    end
  end

  get '/beekeepers/:username' do |username|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    @hives = @beekeeper.hives
    haml :"beekeepers/show"
  end

  get '/beekeepers/:username/edit' do |username|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    if authorized? @beekeeper
      haml :'beekeepers/edit'
    else
      flash[:notice] = "You are not allowed to edit this user"
      redirect '/'
    end
  end

  patch '/beekeepers/:username' do |username|
    beekeeper = get_beekeeper_with_username_or_redirect username
    if beekeeper.update(params[:beekeeper])
      redirect "/beekeepers/#{beekeeper.username}"
    else
      flash[:errors] = beekeeper.errors
      redirect "/beekeepers/#{username}/edit"
    end
  end

end
