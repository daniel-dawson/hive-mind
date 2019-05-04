class HivesController < ApplicationController
  get '/hives' do
    @hives = Hive.all
    haml :'hives/index'
  end

  get '/beekeepers/:username/hives/new' do |username|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    if authorized? @beekeeper
      haml :'hives/new'
    else
      flash[:notice] = "You are not allowed to make hives for this user"
      redirect '/'
    end
  end

  post '/beekeepers/:username/hives' do |username|
    beekeeper = get_beekeeper_with_username_or_redirect username
    hive = beekeeper.hives.build(params[:hive])
    if hive.save
      redirect "/beekeepers/#{username}/hives/#{hive.name}"
    else
      flash[:errors] = hive.errors.messages
      redirect "/beekeepers/#{username}/hives/new"
    end
  end

  get '/beekeepers/:username/hives/:name' do |username, hive_name|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    @hive = get_hive_by_user_and_name @beekeeper, hive_name
    haml :'hives/show'
  end

  get '/beekeepers/:username/hives/:name/edit' do |username, hive_name|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    @hive = get_hive_by_user_and_name @beekeeper, hive_name
    haml :'hives/edit'
  end

  patch '/beekeepers/:username/hives/:name' do |username, hive_name|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    @hive = get_hive_by_user_and_name @beekeeper, hive_name
    if @hive.update(params[:hive])
      redirect "/beekeepers/#{username}/hives/#{@hive.name}"
    else
      flash[:errors] = @hive.errors.messages
      redirect "/beekeepers/#{username}/hives/#{hive_name}/edit"
    end
  end

  delete '/beekeepers/:username/hives/:name' do |username, hive_name|

  end

  private

  def get_hive_by_user_and_name(beekeeper, hive_name)
    Hive.where(beekeeper_id: beekeeper.id, name: hive_name).first
  end
end
