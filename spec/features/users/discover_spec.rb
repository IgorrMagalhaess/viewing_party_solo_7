require 'rails_helper'

RSpec.describe 'User discover Pages', type: :feature do
   describe 'As a user' do
      it 'has different options to discover new movies' do
         visit user_discover_path
      end
   end
end