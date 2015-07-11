class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :retailer_user
  has_many :retailer, through: :retailer_user
  after_create :add_tokens

  private
  def add_tokens
    User.last.update(client_id: SecureRandom.hex(8),
                     secret_id: SecureRandom.hex(32))
  end
end
