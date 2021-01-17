class ChangeDatatypeDetailsOfReads < ActiveRecord::Migration[5.2]
  def change
    change_column :reads, :details, :text, limit: 1000
  end
end
