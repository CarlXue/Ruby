class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :source
      t.string :title
      t.date :pubDate
      t.text :summary
      t.string :author
      t.string :img
      t.string :link

      t.timestamps null: false
    end
  end
end
