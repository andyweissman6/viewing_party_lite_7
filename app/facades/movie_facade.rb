class MovieFacade
  attr_reader :search
  def initialize
    @search = search
  end
  #need to instantiate this^^

  def top_movies
    #dont name same b/c comfusing
    service = MovieService.new
    json = service.top_movies

    @top_movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def movie_search(title)
    MovieService.movie_search(title)[:results].map do |movie_data|
      Movie.new(movie)
    end
  end
end