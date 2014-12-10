class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
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

  def show
    @restaurant = Restaurant.find(params[:id]) 
  end

  def search
    # require 'factual'
    # factual = Factual.new(ENV['FACTUAL_API_KEY'], ENV['FACTUAL_API_SECRET'])
    # factual_array = factual.table("places-us").search("#{@factual_query}").filters("$and" => ["category_ids" => {"$includes_any" => [312, 347, 348, 349]}, "$or" => [{"locality" => {"$eq" =>"new york"}}, {"locality" => {"$eq" => "brooklyn"}}]]).rows

    # puts "Do you mean\n"
    
    # factual_array.each_with_index do |factual_array, index|
    #   puts "(#{index+1}) #{factual_array["name"]} at #{factual_array["address"]}?"
    # end

    # puts "search" #@restaurants = Restaurant.search(params[:search]) #from https://www.youtube.com/watch?v=jKSm8kOWd_0
    #@search_query = params[:search_query] #from joe leo
    #@cached_results = SearchResultsCache.new(search_query) #from joe leo
  end

  private

  def restauraunt_params
    params.require(:restaurant).permit(:title, :address, :website, :phone, :lat, :long)
  end

end