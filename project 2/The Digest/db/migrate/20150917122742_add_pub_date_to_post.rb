class AddPubDateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :pubDate, :string
  end
end
