require "rails_helper"

RSpec.describe "Movies result Page", type: :feature do
   describe "When I visit the discover page" do
      before(:each) do
         @user = User.create!(name: 'Tommy', email: 'tommy@email.com')  

         visit user_discover_index_path(@user)
      end

      it 'redirects me to the movies page', :vcr do
         click_button "Discover Top Rated Movies"
         
         expect(page).to have_content("Title:")
         expect(page).to have_content("Average Rating:")
         expect(page).to have_button("Return to Discover Page")
      end

      it 'redirects me to the movies page from search', :vcr do
         fill_in :search, with: "Shawshank"
         click_button "Search"

         expect(current_path).to eq(user_movies_path(@user))
         expect(page).to have_content("The Shawshank Redemption")
         expect(page).to have_content("Title:")
         expect(page).to have_content("Average Rating:")
         expect(page).to have_button("Return to Discover Page")
      end
   end
end