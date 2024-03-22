require 'rails_helper'

RSpec.describe 'Similar index page', type: :feature do
   describe 'as a user' do
      before(:each) do
         @user1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
         @user2 = User.create!(name: 'Sam', email: 'sam@email.com')

         visit user_movie_similar_index_path(@user1, 550)
      end

      it 'shows a list of movies similat to the movie we were viewing', :vcr do
         expect(page).to have_content 'Movies similar to Fight Club'
         
         expect(page).to have_content("Pulp Fiction")
         expect(page).to have_content("Average Rating:")
         expect(page).to have_content("Total Reviews: 26806")
         expect(page).to have_content("Description: A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.")
         expect(page).to have_content("Release Date: 1994-09-10")

         expect(page).to have_content("Forrest Gump")
         expect(page).to have_content("Average Rating: 8.476")
         expect(page).to have_content("Total Reviews: 26346")
         expect(page).to have_content("Description: A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.")
         expect(page).to have_content("Release Date: 1994-06-23")
         
         expect(page).to have_content("Se7en")
         expect(page).to have_content("Average Rating: 8.372")
         expect(page).to have_content("Total Reviews: 20127")
         expect(page).to have_content("Description: Two homicide detectives are on a desperate hunt for a serial killer whose crimes are based on the")
         expect(page).to have_content("Release Date: 1995-09-22")
      end
   end
end