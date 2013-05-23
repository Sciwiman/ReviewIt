class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  # GET /subscriptions
  # GET /subscriptions.json
  #Gets the subscriptions that match those of the user that is currently signed in
  def index
    @subscriptions = Subscription.where("user_id =?", current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end


  # POST /subscriptions
  # POST /subscriptions.json
  #Gets the id of the subscription user and assigns the curret user to be that of the one signed it. It then saves the subscription and redirects the user to the page of the user they subscribed to
  def create
    @subscription = Subscription.new()

    @sub_user = params[:subscription_user_id]
    @user = current_user.id


    @subscription.subscription_user_id = params[:subscription_user_id]
    @subscription.user_id = current_user.id

    @user = User.find(params[:subscription_user_id])
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to user_account_path(@user.username), notice: 'Subscribed to ' + @user.username }
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        format.html { redirect_to user_account_path(@user.username), notice: 'Already Subscribed' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  #Deletes the subscription with a given id
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    @user = User.find(@subscription.subscription_user_id)
    respond_to do |format|
      format.html { redirect_to :back, notice: "Unsubscribed from " + @user.username}
      format.json { head :no_content }
    end
  end
end
