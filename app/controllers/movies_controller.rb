class MoviesController < ApplicationController
  def index
    # movie_title = params[:movie_title]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['MOVIE_API_KEY']
    end

    response = conn.get('/3/movie/popular?language=en-US&page=1')
    json = JSON.parse(response.body, symbolize_names: true)
    
    # require 'pry'; binding.pry
    @top_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end