require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
   describe 'as a User' do
      it 'can log in with valid credentials' do
         user = User.create(name: "Igor", email: "Igor@gmail.com", password: "password")

         visit root_path

         click_button "Login"

         expect(current_path).to eq(login_path)
         fill_in :email, with: user.email
         fill_in :password, with: user.password

         click_on "Login"

         expect(current_path).to eq(root_path)
         expect(page).to have_content("Welcome, Igor")
      end

      it 'can not log in with invalid credentials' do
         user = User.create(name: "Igor", email: "Igor@gmail.com", password: "password")

         visit login_path

         fill_in :email, with: user.email
         fill_in :password, with: "incorrect password"

         click_on "Login"

         expect(current_path).to eq(login_path)
         expect(page).to have_content("Sorry, your credentials are invalid")
      end
   end
end