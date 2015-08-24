#   This class is inherited from Article class. It add one more attribute, which
# is "link" to the articles from ABC.
#   There is one initializer and one method return all the attributes of an
# article in a hash

# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class Article_ABC < News::Article
  attr_reader :link
  def initialize(author, title, summary, images, source, date, link)
    super(author, title, summary, images, source, date)
    @link = link
  end
  def attributes
    hash = {
        'author' => @author,
        'title' => @title,
        'summary' => @summary,
        'images' => @images,
        'source' => @source,
        'date' => @date,
        'link' => @link
    }
  end
end
