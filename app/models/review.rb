class Review < ActiveRecord::Base
  
  #A review belongs to a user, indicaring a ont to one relationship
  belongs_to :user

  #Lists all the attributes that i can access
  attr_accessible :user_id, :content, :title, :timestamp, :rating, :updated_at

  #Validates it has an associated user
  validates_associated :user

  #This is for sunspot and solr
  #Lists the searchable attributes.
  #Gives title a boost so it will have a higher index as this is the most important field for distinguishing results
  searchable  do
  	text :title, :boost => 5
  	text :content
    time :updated_at
  	text :user do
  		user.username
  	end
  end
end
