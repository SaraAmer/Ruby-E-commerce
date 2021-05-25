class User < ApplicationRecord
  after_create :send_email
  has_one :cart
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

private
def send_email
UserMailer.with(user: @user).welcome_email.deliver_now
end

end
      
