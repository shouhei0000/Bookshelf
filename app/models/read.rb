class Read < ApplicationRecord
  #読んだ本に関するmodel
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }

  validates :details, presence: true

  mount_uploader :image, ImageUploader #画像アップロード機能の搭載     
end
