class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id]) 
  end

  def create
    @restaurant = Restaurant.find_or_initialize_by(restauraunt_params)
    current_user.restaurants << @restaurant
    if current_user.save
      # // do something
    else
      # do something
    end

  end

  def search

    #put api logic here
  end

  private

  def restauraunt_params
    # params.require()
  end

end