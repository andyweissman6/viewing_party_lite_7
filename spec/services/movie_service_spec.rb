require 'rails_helper'

RSpec.describe MovieService do
  it "can return the top rated movies" do
    response = MovieService.new.top_movies
    @movies = response[:results]
    expect(response).to be_a(Hash)
    expect(@movies).to be_a(Array)
    expect(@movies.count).to eq(20)
    expect(@movies.first).to have_key(:title)
    expect(@movies.first).to have_key(:vote_average)
    expect(@movies.first[:title]).to be_a(String)
    expect(@movies.first[:vote_average]).to be_a(Float)
  end
end