class ReviewsController < ApplicationController

  #Checks to make sure the user is signed in, except on the show and index pages
  before_filter :authenticate_user!, :except => [:show,:index,:about]

  # GET /reviews
  # GET /reviews.json
  #Performs a search via the given parameter and displays the results
  def index
    @search = Review.search do
      fulltext params[:search]
    end
    @reviews = @search.results
    
    respond_to do |format|
      format.html # index.html.erb current
      format.json { render json: @reviews }
    end
end

  # GET /reviews/1
  # GET /reviews/1.json
  #Shows an individual review based off the id given to it
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  # Sets up a new review
  def new
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  #passes in the review to be edited
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  #Creates a new review with the review user id by default set to the signed in user
  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to user_account_path(@review.user.username), notice: "Review Created"}
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  # Gets the review ready for editing given by an id for a review
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  #destroys a review
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to user_account_path(@review.user.username), notice: "Review was successfully deleted." }
      format.json { head :no_content }
    end
  end
end
