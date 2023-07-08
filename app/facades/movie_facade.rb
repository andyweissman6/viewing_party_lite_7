class MovieFacade
  def initialize(search = nil)
    @search = search
  end

  def movie_index
    service = MovieService.new
    if @search.nil?
      json = service.top_movies
    else
      json = service.movie_search(@search)
    end
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end