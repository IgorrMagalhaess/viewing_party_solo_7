require "rails_helper"

RSpec.describe "New Viewing Party Page", type: :feature do
   describe "when I visit the new viewing party page" do
      before(:each) do
         @user1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
         @user2 = User.create!(name: 'Sam', email: 'sam@email.com')
         @user3 = User.create!(name: 'Igor', email: 'magalhaess.igor@gmail.com')

         visit new_user_movie_viewing_party_path(@user1, 550)
      end

      it 'should have a title of the movie', :vcr do
         expect(page).to have_content("New Viewing Party")
         expect(page).to have_content("Movie: Fight Club")
      end

      it 'should have a pre-set duration with the runtime of the movie', :vcr do
         expect(page).to have_content("Duration (Min):")
         expect(page).to have_field(:duration, with: "139")
      end

      it 'should have an option to select date', :vcr do
         expect(page).to have_content("When:")
         expect(page).to have_content("March")
         expect(page).to have_content("2024")
         expect(page).to have_content("21")
      end

      it "should have an option to select time", :vcr do
         expect(page).to have_content("Start Time:")
      end

      it 'should have an option to select guests', :vcr do
         expect(page).to have_content("Guests:")

         User.all.each do |guest|
            checkbox = find("input[type='checkbox'][value='#{guest.id}']")
            expect(checkbox).to be_visible
         end
      end

      it 'Should not create a viewing party if the duration is smaller than the movie runtime', :vcr do
         fill_in :duration, with: "10"
         select "2024", from: "_date_1i"
         select "March", from: "_date_2i"
         select "23", from: "_date_3i"

         select "20", from: "_start_time_4i"
         select "00", from: "_start_time_5i"

         first('input[type="checkbox"]').check

         click_button "Create Viewing Party"

         expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 550))
         expect(page).to have_content("Duration cannot be lower than 139 minutes")
      end

      it 'Should create a viewing party if the duration is bigger or equal than the movie runtime', :vcr do
         fill_in :duration, with: "200"
         select "2024", from: "_date_1i"
         select "March", from: "_date_2i"
         select "23", from: "_date_3i"

         select "20", from: "_start_time_4i"
         select "00", from: "_start_time_5i"

         first('input[type="checkbox"]').check

         click_button "Create Viewing Party"

         expect(current_path).to eq(user_path(@user1))
         expect(page).to have_content("Viewing party created successfully.")
      end
   end
end