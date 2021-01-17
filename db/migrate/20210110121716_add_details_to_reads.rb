class AddDetailsToReads < ActiveRecord::Migration[5.2]
  def change
    add_column :reads, :details, :string
  end
end
