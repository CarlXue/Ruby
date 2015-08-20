module News
  class Article_ABC < News::Article
    attr_reader :link
    def initialize(author, title, summary, images, source, date, link)
      super
      @link = link
    end
    def attributes
      super
      hash['link'] = @link
    end
  end
end