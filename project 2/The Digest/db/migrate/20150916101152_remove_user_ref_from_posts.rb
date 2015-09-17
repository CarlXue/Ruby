class RemoveUserRefFromPosts < ActiveRecord::Migration
  def change
    remove_reference :posts, :user_id, index: true
  end
end
