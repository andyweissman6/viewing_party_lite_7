class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = if params[:search].present?
                MovieFacade.new(params[:search])
              else
                MovieFacade.new
              end
  end
  
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
  end
end