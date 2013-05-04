class Review < ActiveRecord::Base
  
  belongs_to :user

  attr_accessible :user_id, :content, :title, :timestamp, :rating
  validates_associated :user

  searchable  do
  	text :title, :boost => 5
  	text :content
  	text :user do
  		user.username
  	end
  end
end
