class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews, :dependent => :destroy
  has_many :subscriptions,  :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username
  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password,:username, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  searchable  do
    text :username
    integer :review_ids, :multiple=>true
  end
end
