class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new
  end
  
  def show
    require 'pry'; binding.pry
    #   @user = User.find(params[:user_id])
  #   @facade = MovieFacade.new
  #   @movie = @facade.top_movies.find(params[:id])
  end
end