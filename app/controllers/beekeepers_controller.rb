class BeekeepersController < ApplicationController
  get '/beekeepers' do
    @beekeepers = Beekeeper.all
    erb :'/beekeepers/index'
  end

  get '/beekeepers/:id' do
    
  end

  get '/beekeepers/:id/edit' do

  end
end
