class Article_OtherNews < News::Article

  def initialize(author, title, summary, images, source, date)    #WITH MORE ATTRIBUTES
    super(author, title, summary, images, source, date)
  end

  #RETURN ALL THE ATTRIBUTES AS A HASH
  def attributes

  end
end