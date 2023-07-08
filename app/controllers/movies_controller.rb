class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @facade = MovieFacade.new
    @facade = if params[:search].present?
                MovieFacade.new(params[:search])
              else
                MovieFacade.new
              end
  end
  
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:movie_id])
  end
end