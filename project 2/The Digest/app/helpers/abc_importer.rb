require 'date'
require 'rss'
require 'open-uri'
require_relative '../../app/models/post.rb'

#   This class is inherited from the Importer. It requires the native library 
# 'date', 'open-uri'and 'rss'.
#
#   This class is responsible for importing the articles from ABC. 
#
#   url is the address of the top sports news from ABC news source.
#
#   self.source_name return the name of this source.
#
#   scrape method performs an rss parsing and getting the information from it.

# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class ABC_Importer < Importer
  def initialize
    super

  end

  # RETURN THE SOURCE NAME
  def self.source_name
    'ABC'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url = 'http://www.abc.net.au/sport/syndicate/sport_all.xml'
    rss = open(url).read
    feed = RSS::Parser.parse(rss)
    feed.items.each do |item|
      #set different items to article object
      #how to get author, image ?
      title = item.title
      summary = item.description
      pubDate = item.pubDate
      link = item.link
      article = Post.create(author: 'Unknown',
                          title: title,
                          summary: summary,
                          image: 'Blank',
                          source: ABC_Importer.source_name,
                          pubDate: pubDate,
                          link: link)
      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title},\nSummary:#{article.summary},\npubDate:#{article.pubDate},\nlink: #{article.link}\n"

    end
  end

end