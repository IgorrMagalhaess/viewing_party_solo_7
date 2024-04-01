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

         fill_in :name, with: name
         fill_in :email, with: email
         fill_in :password, with: password

         click_on "Register"

         expect(page).to have_content("Welcome, #{name}")
      end
   end
end