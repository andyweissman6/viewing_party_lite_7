require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attributes = {
      title: "Ace Ventura 2",
      vote_average: "1"
    }

    movie = Movie.new(attributes)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Ace Ventura 2") 
    expect(movie.vote_average).to eq("1")
  end
end