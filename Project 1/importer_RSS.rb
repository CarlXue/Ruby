require 'date'
require 'rss'
require 'open-uri'
require_relative 'article.rb'

class Importer_RSS < News::Importer
  def initialize(start_date, end_date)
    super(start_date,end_date)
  end
  # RETURN THE SOURCE NAME
  def self.source
    return 'The Age'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url = 'http://www.theage.com.au/rssreadlines'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
        #set different items to article object
        #how to get author, image ?
        article = News::Article.new(author: nil, title: item.title, summary: item.description, images: nil, source: item.link, date:item.pubDate)
        @articles.concat(article)
      end
    end
  end
end