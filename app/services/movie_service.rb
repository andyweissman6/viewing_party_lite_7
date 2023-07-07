class MovieService
  def top_movies
    get_url('/3/movie/popular?language=en-US&page=1')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['MOVIE_API_KEY']
    end
  end
end