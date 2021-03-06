class CreateWillreads < ActiveRecord::Migration[5.2]
  def change
    create_table :willreads do |t|
      t.string :title
      t.string :image
      t.text :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
