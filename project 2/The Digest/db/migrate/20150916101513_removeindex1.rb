class Removeindex1 < ActiveRecord::Migration
  def change
    remove_index :posts, :user_id
  end

end
