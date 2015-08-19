require 'date'
require 'rss'
require 'open-uri'
require_relative 'article.rb'
require_relative 'news.rb'

class Importer_RSS2 < News::Importer
  def initialize(start_date, end_date)
    super
    url = 'http://www.abc.net.au/sport/syndicate/sport_all.xml'
    rss = open(url).read
    @feed = RSS::Parser.parse(rss,false)
  end

  # RETURN THE SOURCE NAME
  def self.source_name
    return @feed.channel.title
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE

    @feed.items.each do |item|
      #set different items to article object
      #how to get author, image ?
      article = News::Article.new 'Blank', item.title.delete(','), item.description.to_s.delete(',','\s'), 'Blank', item.link, item.pubDate.to_s.delete(',')
      @articles << article
    end
    @articles.each do |article|
      puts "Author:#{article.author}\nTitle:#{article.title}\nSummary:#{article.summary}\nImages:#{article.images}\nSource:#{article.source}\nDate:#{article.date}"
    end
  end


end