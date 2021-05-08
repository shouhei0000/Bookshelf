class Willread < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :details, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      willread_tags = Tag.find_or_create_by(name: new)
      self.tags << willread_tags
    end
  end  
end
