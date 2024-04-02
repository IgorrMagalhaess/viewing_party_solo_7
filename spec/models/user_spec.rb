require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should allow_value('something@something.something').for(:email) }
    it { should_not allow_value('something somthing@something.something').for(:email) }
    it { should_not allow_value('something.something@').for(:email) }
    it { should_not allow_value('something').for(:email) }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end

  describe 'associations' do
    it { should have_many :user_parties }
    it { should have_many(:viewing_parties).through(:user_parties) }
  end
  
  describe '#invited_to_viewing_parties' do
    it 'returns viewing parties user is invited to' do
      user = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
      hosted_party = ViewingParty.create!(duration: 120, date: Date.today + 3.days, start_time: '18:00', movie_id: 1)
      invited_party = ViewingParty.create!(duration: 90, date: Date.today + 5.days, start_time: '20:00', movie_id: 2)
      UserParty.create!(user: user, viewing_party: hosted_party, host: true)
      UserParty.create!(user: user, viewing_party: invited_party, host: false)

      invited_viewing_parties = user.invited_to_viewing_parties

      expect(invited_viewing_parties).to include(invited_party)
      expect(invited_viewing_parties).not_to include(hosted_party)
    end
  end

  describe '#hosting_viewing_parties' do
    it 'returns viewing parties user is hosting' do
      user = User.create!(name: 'Jane Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
      hosted_party = ViewingParty.create!(duration: 120, date: Date.today + 3.days, start_time: '18:00', movie_id: 1)
      invited_party = ViewingParty.create!(duration: 90, date: Date.today + 5.days, start_time: '20:00', movie_id: 2)
      UserParty.create!(user: user, viewing_party: hosted_party, host: true)
      UserParty.create!(user: user, viewing_party: invited_party, host: false)

      hosting_viewing_parties = user.hosting_viewing_parties

      expect(hosting_viewing_parties).to include(hosted_party)
      expect(hosting_viewing_parties).not_to include(invited_party)
    end
  end
end
