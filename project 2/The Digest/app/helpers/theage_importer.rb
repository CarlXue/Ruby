require 'date'
require 'rss'
require 'open-uri'
require_relative '../../app/models/post.rb'

#   This class is inherited from the Importer. It requires the native library 
# 'date', 'open-uri'and 'rss'.
#
#   This class is responsible for importing the articles from The Age. 
#
#   url is the address of the top stories from The Age news source.
#
#   self.source_name return the name of this source.
#
#   scrape method performs an rss parsing and getting the information from it.

# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class THEAGE_Importer < Importer
  def initialize
    super
    url = 'http://www.theage.com.au/rssheadlines/top.xml'
    rss = open(url).read
    @feed = RSS::Parser.parse(rss,false)
    @source = @feed.channel.title.to_s
  end

  # RETURN THE SOURCE NAME
  def self.source_name
    'The Age'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    @feed.items.each do |item|
    #set different items to article object
      article = Post.create( author: 'Blank',
                                     title: item.title.delete(','),
                                     summary: item.description.to_s.delete(','),
                                     image: 'Blank',
                                     source: THEAGE_Importer.source_name,
                                     pubDate: item.pubDate.to_s.delete(','),
                                     link: item.link,
                                     tag_list: ['The Age','Top news', 'News'])
      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title},\nSummary:#{article.summary},\npubDate:#{article.pubDate},\nlink: #{article.link}\n"

    end
  end
end