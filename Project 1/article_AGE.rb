module News
  class Article_AGE < News::Article
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
end