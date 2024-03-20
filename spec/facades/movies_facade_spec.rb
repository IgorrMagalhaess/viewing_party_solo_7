require 'rails_helper'

RSpec.describe MoviesFacade do
   describe '#initialize' do
      it 'creates a MoviesFacade object', :vcr do
         facade = MoviesFacade.new("Star Wars")

         expect(facade).to be_a MoviesFacade
         expect(facade.params).to eq("Star Wars")
      end
   end

   describe '#movies' do
      it 'creates a Movies object', :vcr do
         facade = MoviesFacade.new("Star Wars")
         movies = facade.movies
         movie = movies.first

         expect(movie).to be_a Movie
         expect(movie.title).to be_a String
         expect(movie.review_count).to be_a Integer
         expect(movie.avg_rating).to be_a Float
         expect(movies).to be_a Array
      end
   end
end