class HivesController < ApplicationController
  get '/hives' do
    @hives = Hive.all
    haml :'hives/index'
  end

  get '/beekeepers/:username/hives/new' do |username|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    haml :'hives/new'
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
    @hive = Hive.where(beekeeper_id: @beekeeper.id, name: hive_name).first
    haml :'hives/show'
  end

  patch '/beekeepers/:username/hives/:name' do |username, hive_name|

  end
end
