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
         password = 

         fill_in "user[name]", with: name
         fill_in "user[email]", with: email
         fill_in "user[password]", with: "testpassword"
         click_on "Create New User"
         
         expect(page).to have_content("Welcome, #{name}")
      end
   end
end