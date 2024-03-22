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

      context "#get_movies_by_title" do
         it 'should return a list of movies with similar titles', :vcr do
            search = MoviesService.new.get_movies_by_title("Star Wars")
   
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

      context "#get_movie_by_id" do
         it 'should return a specific movie', :vcr do
            search = MoviesService.new.get_movie_by_id(550)

            expect(search).to be_a(Hash)

            expect(search).to have_key(:title)
            expect(search[:title]).to eq("Fight Club")

            expect(search).to have_key(:genres)
            expect(search[:genres]).to be_a(Array)

            expect(search).to have_key(:id)
            expect(search[:id]).to be_a(Integer)

            expect(search).to have_key(:overview)
            expect(search[:overview]).to be_a(String)

            expect(search).to have_key(:runtime)
            expect(search[:runtime]).to be_a(Integer)

            expect(search).to have_key(:vote_average)
            expect(search[:vote_average]).to be_a(Float)

            expect(search).to have_key(:vote_count)
            expect(search[:vote_count]).to be_a(Integer)
         end
      end

      context "#get_movie_cast_by_id" do
         it 'should return a list of cast names', :vcr do
            search = MoviesService.new.get_movie_cast_by_id(550)
   
            expect(search).to be_a(Hash)
            expect(search[:cast]).to be_a(Array)
            cast_1 = search[:cast].first
            cast_2 = search[:cast].last

            expect(cast_1).to have_key(:name)
            expect(cast_2).to have_key(:name)
            expect(cast_1[:name]).to be_a(String)
            expect(cast_2[:name]).to be_a(String)

            expect(cast_1).to have_key(:character)
            expect(cast_2).to have_key(:character)
            expect(cast_1[:character]).to be_a(String)
            expect(cast_2[:character]).to be_a(String)
         end
      end

      context "#get_movie_reviews_by_id" do
         it 'should return a list of reviews for the movie', :vcr do
            search = MoviesService.new.get_movie_reviews_by_id(550)

            expect(search).to be_a(Hash)
            expect(search[:results]).to be_a(Array)
            result_1 = search[:results].first
            result_2 = search[:results].last

            expect(result_1).to have_key(:author)
            expect(result_2).to have_key(:author)
            expect(result_1[:author]).to be_a(String)
            expect(result_2[:author]).to be_a(String)

            expect(result_1).to have_key(:content)
            expect(result_2).to have_key(:content)
            expect(result_1[:content]).to be_a(String)
            expect(result_2[:content]).to be_a(String)
         end
      end

      context "#get_where_to_watch" do
         it 'should return a list where I can buy or rent the movie', :vcr do
            search = MoviesService.new.get_where_to_watch(550)
            
            expect(search).to be_a(Hash)
            expect(search[:results]).to be_a(Hash)
            us_where_to_watch = search[:results][:US]

            buy = us_where_to_watch[:buy]
            provider_1 = buy.first

            expect(provider_1).to be_a(Hash)
            expect(provider_1).to have_key(:logo_path)
            expect(provider_1[:logo_path]).to be_a(String)

            expect(provider_1).to have_key(:provider_name)
            expect(provider_1[:provider_name]).to be_a(String)

            rent = us_where_to_watch[:rent]
            provider_2 = rent.first

            expect(provider_2).to be_a(Hash)
            expect(provider_2).to have_key(:logo_path)
            expect(provider_2[:logo_path]).to be_a(String)

            expect(provider_2).to have_key(:provider_name)
            expect(provider_2[:provider_name]).to be_a(String)
         end
      end

      context "#get_similar_movies" do
         it 'should return a list of movies with similar titles', :vcr do
            search = MoviesService.new.get_similar_movies(550)
   
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