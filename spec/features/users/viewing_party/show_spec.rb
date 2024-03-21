require 'rails_helper'

RSpec.describe 'Viweing Party Show Page', type: :feature do
   describe 'As a User' do
      before(:each) do
         @user1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
         @user2 = User.create!(name: 'Sam', email: 'sam@email.com')
         @user3 = User.create!(name: 'Igor', email: 'magalhaess.igor@gmail.com')

         @viewing_party = ViewingParty.create(duration: 139, date: "2024-03-24", start_time: "20:00")

         visit user_movie_viewing_party_path(@user1, 550, @viewing_party)
      end

      it 'shows logos of the video providers for where to buy the movie', :vcr do
         expect(page).to have_content("Fight Club")
         expect(page).to have_content("Where to buy:")
         expect(page).to have_content("Where to rent:")
      end
   end
end