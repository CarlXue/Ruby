class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post_content
      t.string :title
      t.date :pub_date

      t.timestamps null: false
    end
  end
end
