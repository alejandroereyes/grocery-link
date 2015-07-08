class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :retailer_user
  has_one :retailer, through: :retailer_user
  validates_presence_of :name, message: 'Please enter name for user'
end
