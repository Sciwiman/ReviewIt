class Subscription < ActiveRecord::Base
	#Lists all the accesible attributes
  	attr_accessible :create, :destroy, :subscription_user_id, :user_id

  	#Belongs to a user
	belongs_to :user

	#the subscription_user_id belongs to a user also, but this will be viewed as a reference to itself
	belongs_to :subscription, :class_name => "User", :dependent => :destroy

	#Validates the uniqueness of the user_id
	validates_uniqueness_of :user_id, :scope => :subscription_user_id

	#Validates that this is associated with another user
	validates_associated :user
end
