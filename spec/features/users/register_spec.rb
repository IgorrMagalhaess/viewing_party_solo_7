require 'rails_helper'

RSpec.describe 'Register User', type: :feature do
   describe 'as a User' do
      it 'has a form to fill in my name, email, password and password confirmation' do
         visit "/register"

         expect(page).to have_field("user[name]")
         expect(page).to have_field('user[email]')
         expect(page).to have_field("user[password]")

         name = "Igor Magalhaes"
         email = "magalhaess.igor@gmail.com"
         password = "testpassword"

         fill_in "user[name]", with: name
         fill_in "user[email]", with: email
         fill_in "user[password]", with: password
         fill_in "user[password_confirmation]", with: password

         click_on "Create New User"
         
         expect(page).to have_content("Welcome, #{name}")
         expect(current_path).to eq(user_path(User.last.id))
      end

      it 'has a form to fill in my name, email, password and password confirmation' do
         visit "/register"

         expect(page).to have_field("user[name]")
         expect(page).to have_field('user[email]')
         expect(page).to have_field("user[password]")

         name = "Igor Magalhaes"
         email = "magalhaess.igor@gmail.com"
         password = "testpassword"

         fill_in "user[name]", with: name
         fill_in "user[email]", with: email
         fill_in "user[password]", with: password
         fill_in "user[password_confirmation]", with: password
         click_on "Create New User"
         
         expect(page).to have_content("Welcome, #{name}")
         expect(current_path).to eq(user_path(User.last.id))
      end
   end
end