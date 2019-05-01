class HivesController < ApplicationController
  get '/hives' do
    @hives = Hive.all
    haml :'hives/index'
  end
end
