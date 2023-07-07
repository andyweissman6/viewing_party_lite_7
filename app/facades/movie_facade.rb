class MovieFacade
  def top_movies
    service = MovieService.new
    json = service.top_movies

    @top_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end