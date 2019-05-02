class HivesController < ApplicationController
  get '/hives' do
    @hives = Hive.all
    haml :'hives/index'
  end

  get '/beekeepers/:username/hives/:name' do |username, hive_name|
    @beekeeper = get_beekeeper_with_username_or_redirect username
    @hive = Hive.where(beekeeper_id: @beekeeper.id, name: hive_name).first
    haml :'hives/show'
  end
end
