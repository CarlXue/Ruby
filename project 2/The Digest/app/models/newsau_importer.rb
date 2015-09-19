require 'date'
require 'rss'
require 'open-uri'
require_relative 'post.rb'

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

class NEWSAU_Importer
  def initialize
    super

  end

  # RETURN THE SOURCE NAME
  def self.source_name
    'News AU'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url = 'http://feeds.news.com.au/public/rss/2.0/news_national_3354.xml'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
        #get the tag
        title = item.title
        regex = /[A-Z][a-z]+/
        tags = title.scan(regex)
        #remove the first one
        tags.shift
        if tags.count == 0
          tags = ['boring','National News']
        end
        article = Post.create( image: item.enclosure.url,
                               title: item.title, summary: item.description,
                               link: item.link, pubDate: item.pubDate.to_s[0..15],
                               source: NEWSAU_Importer.source_name, author: nil,
                               tag_list:tags)

        #DEBUGGING
        puts "Successfully scraped one article:\nTitle:#{article.title},\nSummary:#{article.summary},\npubDate:#{article.pubDate},\nlink: #{article.link}\n"
      end
    end
  end
end