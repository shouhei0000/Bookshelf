class Tag < ApplicationRecord
    has_many :tag_relationships, dependent: :destroy, foreign_key: 'tag_id'
    has_many :reads, through: :tag_relationships
    has_many :reading, through: :tag_relationships
    has_many :willread, through: :tag_relationships

    validates :name, uniqueness: true


end
