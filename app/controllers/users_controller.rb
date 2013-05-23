class UsersController < ApplicationController
  #It gets the user of the username passed in and finds all their reviews, it then displays the results
  def index
  	if params[:username]
  		@user = User.where("username =?",params[:username]).first || user_not_found
  		@reviews = Review.where("user_id = ?",@user.id).all
  	end

  	respond_to do |format|
  		format.html
  		format.json{render json: @reviews}
  	end
  end

  #Firstly it finds the user of the user being passed to it
  # It then finds all the subscriptions that user is subscribed to
  #Then gets the last review from each of those subscriptions and stores them in @reviews. This is then displayed to the user depending on a few conditions
  #The user msut be logged in and in the correct account to view the corresponding homepage
  def show
    @user = User.where('username =?',params[:username]).first

    @subscriptions = Subscription.where("user_id =?",@user.id).all
    @reviews = []
    @isEmpty = false

    @subscriptions.each do |subscription|
      @count = Review.where('user_id =?',subscription.subscription_user_id).count

      if @count != 0
          temp = Review.where('user_id =?',subscription.subscription_user_id).last
          @reviews << temp
      else
        @isEmpty = true
      end
    end
    if user_signed_in? == false
      respond_to do |format|
        format.html{redirect_to user_account_path(params[:username])}
      end
    else
      if (current_user.username == params[:username]) && @isEmpty == false
        respond_to do |format|
          format.html
          format.json{render json: @reviews}
        end
      else
        respond_to do |format|
          format.html{redirect_to user_account_path(params[:username]) }
        end
      end
    end
  end

end