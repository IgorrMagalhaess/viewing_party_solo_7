require "rails_helper"

RSpec.describe "Movies result Page", type: :feature do
   describe "When I visit the discover page" do
      before(:each) do
         @user = User.create!(name: 'Tommy', email: 'tommy@email.com')   
      end

      it 'redirects me to the movies page' do
         visit user_discover_index_path(@user)

         click_button "Discover Top Rated Movies"

         expect(current_path).to eq(user_movies_path(@user))
         expect(page).to have_content("Title:")
         expect(page).to have_content("Average Rating:")
         expect(page).to have_button("Discover Page")
      end

      it 'redirects me to the movies page' do
         visit user_discover_index_path(@user)

         fill_in :search, with: "Star Wars"
         click_button "Search"

         expect(current_path).to eq(user_movies_path(@user))
         expect(page).to have_content("Star Wars")
         expect(page).to have_content("Title:")
         expect(page).to have_content("Average Rating:")
         expect(page).to have_button("Discover Page")
      end
   end
end