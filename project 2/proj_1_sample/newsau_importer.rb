
require 'Date'
require 'rss'
require 'open-uri'

require_relative 'news.rb'


class NewsAUImporter < News::Importer


  # We call super in the initialize method
  def initialize start_date, end_date
    super
  end

  # Define the class method for file_name, this should
  # return something similar to the name for your importer
  def self.source_name
    "news_au"
  end

  # Define a dummy scrape method that saves canned article data
  def scrape

    url = 'http://feeds.news.com.au/public/rss/2.0/news_national_3354.xml'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
          article = News::Article.new( images: item.enclosure.url,
                                       title: item.title, summary: item.description,
                                       source: item.link, date: item.pubDate)
          @articles << article
      end
    end


  end
end
