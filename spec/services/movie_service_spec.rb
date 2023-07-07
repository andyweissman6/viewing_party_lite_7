require 'rails_helper'

RSpec.describe MovieService do
  it "can return the top rated movies" do
    movies = MovieService.new.top_movies
    movie = movies.first
require 'pry'; binding.pry
    expect(movies).to be_a Hash
    expect(movies[:results]).to be_an Array
    expect(movie).to have_key(:title)
    expect(movie[:title]).to be_a String
    expect(movie).to have_key(:vote_average)
    expect(movie[:vote_average]).to be_a String
  end
end