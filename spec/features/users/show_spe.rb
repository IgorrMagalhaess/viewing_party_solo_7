require 'rails_helper'

RSpec.describe 'User Show Page' do
   describe 'as a user' do
      before(:each) do
         @user1 = User.create!(name: 'Tommy', email: 'tommy@email.com')

         visit user_path(@user1)
      end
   end
end