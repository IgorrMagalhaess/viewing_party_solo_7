class User < ApplicationRecord
   validates_presence_of :name, :email
   validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
   validates :password, presence: true
   has_secure_password
   
   has_many :user_parties
   has_many :viewing_parties, through: :user_parties

   def invited_to_viewing_parties
      viewing_parties.where.not(user_parties: { host: true })
   end

   def hosting_viewing_parties
      viewing_parties.where(user_parties: { host: true })
   end
end
