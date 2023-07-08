class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new
    @movies = if params[:search].present?
                MoviesFacade.new.movie_search(params[:search])
              else
                MovieFacade.new.top_movies
              end
  end
  
  def show
    #   @user = User.find(params[:user_id])
  #   @facade = MovieFacade.new
  #   @movie = @facade.top_movies.find(params[:id])
  end
end