class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.headers['api_key'] = ENV['MOVIE_API_KEY']
      
    end
  end
end