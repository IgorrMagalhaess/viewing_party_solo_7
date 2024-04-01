class ApplicationController < ActionController::Base
   def current_user
      user.find(session[:user_id])
   end
   
   private
   def error_message(errors)
      errors.full_messages.join(', ')
   end
end
