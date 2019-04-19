require 'pry'
class BeekeepersController < ApplicationController
  get '/beekeepers' do
    @beekeepers = Beekeeper.all
    erb :'/beekeepers/index'
  end

  post '/beekeepers' do
    beekeeper = Beekeeper.new(params[:beekeeper])
    if beekeeper.save
      redirect "/beekeepers/#{beekeeper.username}"
    else
      flash[:errors] = beekeeper.errors
      redirect "/signup"
    end
  end

  get '/beekeepers/:username' do

  end

  get '/beekeepers/:username/edit' do

  end
end
