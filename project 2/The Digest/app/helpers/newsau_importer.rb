
require 'Date'
require 'rss'
require 'open-uri'
require_relative '../../app/models/post.rb'

class NewsAUImporter < Importer


  # We call super in the initialize method
  def initialize(start_date, end_date)
    super
  end

  # Define the class method for file_name, this should
  # return something similar to the name for your importer
  def self.source_name
    'New AU'
  end

  # Define a dummy scrape method that saves canned article data
  def scrape

    url = 'http://feeds.news.com.au/public/rss/2.0/news_national_3354.xml'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
          article = Post.new( images: item.enclosure.url,
                                       title: item.title, summary: item.description,
                                       link: item.link, date: item.pubDate,
                                       source: self.source_name, author: 'Unknown')
          @articles << article
      end
    end


  end
end
