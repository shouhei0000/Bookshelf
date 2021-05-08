class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.references :read, foreign_key: true
      t.references :reading, foreign_key: true
      t.references :willread, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :tag_relationships, [:read_id, :tag_id],unique: true
    add_index :tag_relationships, [:reading_id, :tag_id],unique: true
    add_index :tag_relationships, [:willread_id, :tag_id],unique: true
  end
end
