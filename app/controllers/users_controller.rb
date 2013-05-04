class UsersController < ApplicationController
  
  def index
  	if params[:username]
  		@user = User.where("username =?",params[:username]).first
  		@reviews = Review.where("user_id = ?",@user.id).all
  	end

  	respond_to do |format|
  		format.html
  		format.json{render json: @reviews}
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

end