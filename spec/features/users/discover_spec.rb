require 'rails_helper'

RSpec.describe 'User discover Pages', type: :feature do
   describe 'As a user' do
      before(:each) do
         @user = User.create!(name: 'Tommy', email: 'tommy@email.com')
   
         visit user_discover_index_path(@user)
      end

      it 'has a button to discover top rated movies' do
         expect(page).to have_button('Top Rated Movies')
      end

      it 'has a text field to search for a movie title' do
         expect(page).to have_content('Search by Title')
         expect(page).to have_field('Search')
      end

      it 'has a button to search for a movie title' do
         expect(page).to have_button('Search')
      end
   end
end