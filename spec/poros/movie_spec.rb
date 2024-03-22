require 'rails_helper'

RSpec.describe Movie do
   it 'exists' do
      attributes = {
         id: 1,
         title: 'The Godfather',
         vote_average: 8.9,
         runtime: 120,
         genres: 'Action, Adventure, Fantasy',
         overview: "The Godfather is a classic drama film written and directed by <NAME>, based on the story of Don Corleone",
         cast_members: '<NAME>, <NAME>, <NAME>, <NAME>, <NAME>, <NAME>',
         vote_count: 100,
         reviews: [{author: "Jhonny", content: "Very good movie"}, {author: "Peter", content: "Very bad movie"}]
      }

      movie = Movie.new(attributes)
      
      expect(movie).to be_a Movie
      expect(movie.id).to eq 1
      expect(movie.title).to eq 'The Godfather'
      expect(movie.runtime).to eq 120
      expect(movie.genre).to eq 'Action, Adventure, Fantasy'
      expect(movie.overview).to eq "The Godfather is a classic drama film written and directed by <NAME>, based on the story of Don Corleone"
      expect(movie.review_count).to eq 100
      expect(movie.reviews).to be_a Hash
   end
end