class Post < ActiveRecord::Base

  validates_uniqueness_of :title, scope: [:pubDate]
  # Relationship
  has_many :comments

  # Posts can have tags
  acts_as_taggable


  # Initialize the news article, using named paraters to associate
  # the author, title, summary, images, source


end
