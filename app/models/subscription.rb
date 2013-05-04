class Subscription < ActiveRecord::Base
  attr_accessible :create, :destroy, :subscription_user_id, :user_id
  belongs_to :user
  belongs_to :subscription, :class_name => "User"

  validates_uniqueness_of :user_id, :scope => :subscription_user_id
end
