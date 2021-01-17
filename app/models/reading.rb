class Reading < ApplicationRecord
  #読んでいる本に関するmodel
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :details, presence: true

  mount_uploader :image, ImageUploader
end
