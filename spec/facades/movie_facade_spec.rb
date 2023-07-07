require "rails_helper"

RSpec.describe MovieFacade do
  before(:each) do
    @mf = MovieFacade.new
  end

  it "exists" do
    expect(@mf).to be_a MovieFacade
  end
  
  describe "#top_movies" do
    it "returns the top movies" do
      movies = @mf.top_movies

      expect(movies).to all be_a Movie
      expect(movies.count <= 20).to be(true)
    end
  end
end