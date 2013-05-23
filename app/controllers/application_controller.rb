class ApplicationController < ActionController::Base
  protect_from_forgery
  	
  	#Changes the default devise sign in path
	def after_sign_in_path_for(resource)
    	user_account_page_path(current_user.username)
	end

	def user_not_found
  		raise ActionController::RoutingError.new('User does not exist')
	end
end
