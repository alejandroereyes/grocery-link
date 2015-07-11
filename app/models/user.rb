class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :retailer_user, dependent: :destroy
  has_many :retailer, through: :retailer_user
  after_create :add_tokens, :send_email

  private
  def add_tokens
    User.last.update(client_id: SecureRandom.hex(8),
                     secret_id: SecureRandom.hex(32))
  end

  def send_email
    Welcome.send_keys_to(User.last).deliver_now
  end
end
