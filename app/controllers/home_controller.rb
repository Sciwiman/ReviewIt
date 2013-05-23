class HomeController < ApplicationController
	#checks to make sure that a user is signed in except when going to the index page
	before_filter :authenticate_user!, :except => [:index]
end
