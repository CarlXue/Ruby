class Post < ActiveRecord::Base

  # define reader for the attributes
  attr_reader :author, :title, :summary, :image, :source, :pubDate, :link

  # Relationship
  has_many :comments

  # Posts can have tags
  acts_as_taggable


  # Initialize the news article, using named paraters to associate
  # the author, title, summary, images, source


end
