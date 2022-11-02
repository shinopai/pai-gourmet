class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relation
   mount_uploader :profile_image, ProfileImageUploader
   has_many :keeps
   has_many :restaurants, through: :keeps
end
