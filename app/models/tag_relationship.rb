class TagRelationship < ApplicationRecord
  belongs_to :read,optional: true

  belongs_to :reading,optional: true

  belongs_to :willread
  belongs_to :tag


  validates :tag_id, presence: true
  #validates :read_id, presence: true
  #validates :reading_id, presence: true
  #validates :willread, presence: true
end
