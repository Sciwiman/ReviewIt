class User < ActiveRecord::Base

  #A user has many reviews so when a user is destroyed all reviews attached must be destroyed
  has_many :reviews, :dependent => :destroy
  #A user has many users through subscriptionsso when a subscription is destroyed all subscriptions attached must be destroyed
  has_many :users, :through => :subscriptions

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Validates the uniqueness of username and presence of it
  validates_presence_of :username
  validates_uniqueness_of :username

  #All accessible attributes
  attr_accessible :id, :email, :password,:username, :password_confirmation, :remember_me

  #Sunspot searchable attributes to index
  searchable  do
    text :username
    integer :review_ids, :multiple=>true
  end
end
