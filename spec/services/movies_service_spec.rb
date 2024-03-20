require 'rails_helper'

describe MoviesService do
   context "class methods" do
      context "#get_top_rated_movies" do
         it 'should return a list of movies', :vcr do
            search = MoviesService.new.get_top_rated_movies
   
            expect(search).to be_a(Hash)
            expect(search[:results]).to be_a(Array)
            movie_data = search[:results].first

            expect(movie_data).to have_key(:title)
            expect(movie_data[:title]).to be_a(String)

            expect(movie_data).to have_key(:vote_average)
            expect(movie_data[:vote_average]).to be_a(Float)

            expect(movie_data).to have_key(:overview)
            expect(movie_data[:overview]).to be_a(String)

            expect(movie_data).to have_key(:id)
            expect(movie_data[:id]).to be_a(Integer)

            expect(movie_data).to have_key(:vote_count)
            expect(movie_data[:vote_count]).to be_a(Integer)
         end
      end
   end
end