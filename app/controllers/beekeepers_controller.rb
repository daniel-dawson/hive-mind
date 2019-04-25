require 'pry'
class BeekeepersController < ApplicationController
  get '/beekeepers' do
    @beekeepers = Beekeeper.all
    erb :'/beekeepers/index'
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
    haml :"beekeepers/show"
  end

  get '/beekeepers/:username/edit' do |username|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    if logged_in? && current_user?(@beekeeper)
      haml :'beekeepers/edit'
    else
      flash[:warning] = "Unauthorized access"
      redirect '/'
    end
  end

end
