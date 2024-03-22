require "rails_helper"

RSpec.describe "Movie Detail Page", type: :feature do
   describe "As a user" do
      before(:each) do
         @user1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
         @user2 = User.create!(name: 'Sam', email: 'sam@email.com')

         visit user_movie_path(@user1, 550)
      end

      it "should see a button to create a viewing party", :vcr do
         expect(page).to have_button("Create a viewing party")

         click_button("Create a viewing party")

         expect(current_path).to eq (new_user_movie_viewing_party_path(@user1, 550))
      end

      it 'Should have a button to return to the discover page', :vcr do
         expect(page).to have_button("Return to Discover Page")
      end

      it "should have the information about the movie", :vcr do
         expect(page).to have_content("Fight Club")
         expect(page).to have_content("Average Rating: 8.4")
         expect(page).to have_content("Runtime: 2 hours, 19 minutes")
         expect(page).to have_content("Drama")
         expect(page).to have_content("Description")
         expect(page).to have_content("Total Reviews: 28221")
      end

      it "shoud show the cast of the movie", :vcr do
         expect(page).to have_content("Edward Norton")
         expect(page).to have_content("Brad Pitt")
         expect(page).to have_content("Helena Bonham Carter")
         expect(page).to have_content("Meat Loaf")
         expect(page).to have_content("Jared Leto")
         expect(page).to have_content("Zach Grenier")
         expect(page).to have_content("Holt McCallany")
         expect(page).to have_content("Eion Bailey")
         expect(page).to have_content("Richmond Arquette")
         expect(page).to have_content("David Andrews")
      end

      it "should show the top 10 reviews of the movie", :vcr do
         expect(page).to have_content("Author: Goddard")
         expect(page).to have_content("Review: Pretty awesome movie. It shows what one crazy person can convince other crazy people to do. Everyone needs something to believe in. I recommend Jesus Christ, but they want Tyler Durden.")
         expect(page).to have_content("Author: Brett Pascoe")
         expect(page).to have_content("Review: In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again.")
      end

      it 'has a link to get similar movies', :vcr do
         expect(page).to have_button("Get Similar Movies")

         click_button "Get Similar Movies"

         expect(current_path).to eq(user_movie_similar_index_path(@user1, 550))
      end
   end
end