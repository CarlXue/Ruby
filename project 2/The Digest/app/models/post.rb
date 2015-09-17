class Post < ActiveRecord::Base

  # define reader for the attributes
  attr_reader :author, :title, :summary, :images, :source, :date, :link

  # Relationship
  has_many :comments

  # Posts can have tags
  acts_as_taggable

  def can_edit? other
  	user ? user==other : true
  end

  # Initialize the news article, using named paraters to associate
  # the author, title, summary, images, source
  def initialize author: nil, title: nil, summary: nil, images: nil, source: nil, date: nil, link:nil
    @author = author
    @title = title
    @summary = summary
    @images = images
    @source = source
    @date = date
    @link = link
  end

  # Returns all of the attributes of an article as a hash.
  def attributes
    hash = {
        "author" => @author,
        "title" => @title,
        "summary" => @summary,
        "images" => @images,
        "source" => @source,
        "date" => @date,
        "link" => @link
    }
  end
end
