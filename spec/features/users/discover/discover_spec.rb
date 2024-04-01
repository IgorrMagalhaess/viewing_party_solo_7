require 'rails_helper'

RSpec.describe 'User discover Pages', type: :feature do
   describe 'As a user' do
      before(:each) do
         @user = User.create!(name: 'Tommy', email: 'tommy@email.com', password: 'password')
   
         visit user_discover_index_path(@user)
      end

      it 'has a button to discover top rated movies', :vcr do
         expect(page).to have_button('Top Rated Movies')

         click_button "Discover Top Rated Movies"

         expect(current_path).to eq(user_movies_path(@user))
      end

      it 'has a text field to search for a movie title', :vcr do
         expect(page).to have_content('Search by Title')
         expect(page).to have_field('Search')

         fill_in :search, with: "Star Wars"
         click_button "Search"

         expect(current_path).to eq(user_movies_path(@user))
      end

      it 'has a button to search for a movie title', :vcr do
         expect(page).to have_button('Search')

         fill_in :search, with: "Shawshank"
         click_button "Search"

         expect(current_path).to eq(user_movies_path(@user))   
      end
   end
end