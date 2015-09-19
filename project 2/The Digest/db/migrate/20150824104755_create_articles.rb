class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :source
      t.string :author
      t.string :image
      t.string :link
      t.string :pubDate
      t.text   :summary
      t.timestamps null: false
    end
  end
end
