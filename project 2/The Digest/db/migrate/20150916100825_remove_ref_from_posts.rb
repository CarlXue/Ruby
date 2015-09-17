class RemoveRefFromPosts < ActiveRecord::Migration
  def change
    remove_reference :posts, :user_id
  end
end
