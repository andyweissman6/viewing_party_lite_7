class MoviesController < ApplicationController
  def index
    # movie_title = params[:movie_title]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['MOVIE_API_KEY']
    end

    response = conn.get('/3/movie/popular?language=en-US&page=1')
    json = JSON.parse(response.body, symbolize_names: true)
    @top_movies = json[:results]
    # require 'pry'; binding.pry
  end
end