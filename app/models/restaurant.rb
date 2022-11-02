class Restaurant < ApplicationRecord
  # relation
  belongs_to :area
  belongs_to :genre
  mount_uploader :image, ImageUploader
  has_many :keeps
  has_many :users, through: :keeps

  # constant
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/

  # validation
  validates :name,
            presence: true
            # length: { in: 5..30 }
  validates :opening_date,
            date: {
              after: Date.new(1900, 1, 1),
              before: ->(obj) { Date.today }
            }
  # validates :phone,
  #           format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :remarks,
            length: { in: 10..300 }
end
