class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_one_attached :avatar
  has_one :payment
  # after_commit :add_default_avatar, on: %i[create update]

  # def avatar_thumbnail
  #   if avatar.attached?
  #   avatar.variant(resize: "150x150!").processed 
  #   else"https://image.shutterstock.com/image-photo/sunset-on-blue-sky-some-600w-1937399083.jpg"
  #   end
  # end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # private
  # def add_default_avatar
  #   unless avatar.attached?
  #     avatar.attach(
  #       io.File.Open(
  #         Rails.root.join(
  #           'app','assets','images', 'default_profile.png'
  #         )

  #         ), filename: 'default_profile.png',
  #         content_type: 'image/png'
  #       )

  #     end
  #   end
  end
      
