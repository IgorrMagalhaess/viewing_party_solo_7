require 'rails_helper'

RSpec.describe 'User Show Page' do
   describe 'as a user' do
      before(:each) do
         @user1 = User.create!(name: 'Tommy', email: 'tommy@email.com', password: 'password')
         @user2 = User.create!(name: 'Sam', email: 'sam@email.com', password: 'password')

         @viewing_party = ViewingParty.create!(duration: 139, date: "2024-03-24", start_time: "20:00", movie_id: 550)

         @user_party = UserParty.create!(viewing_party_id: @viewing_party.id, user_id: @user1.id, host: true)
         @user_party = UserParty.create!(viewing_party_id: @viewing_party.id, user_id: @user2.id, host: false)
      end

      it 'should see the viewing partys that the user is hosting', :vcr do
         visit user_path(@user1)

         expect(page).to have_content("Tommy's Dashboard")
         expect(page).to have_content("2024-03-24")
         expect(page).to have_content("20:00")
         expect(page).to have_content('Sam')

         expect(page).to have_content("Fight Club")
         expect(page).to have_content("You are the host!")
      end

      it 'should see the viewing partys that the user is hosting', :vcr do
         visit user_path(@user2)

         expect(page).to have_content("Sam's Dashboard")
         expect(page).to have_content("2024-03-24")
         expect(page).to have_content("20:00")
         expect(page).to have_content('Tommy')

         expect(page).to have_content("Fight Club")
      end
   end
end