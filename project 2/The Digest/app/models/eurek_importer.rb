require 'date'
require 'rss'
require 'open-uri'
require 'nokogiri'

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

class EUREK_Importer
  def initialize
    super

  end

  # RETURN THE SOURCE NAME
  def self.source_name
    'EurekAlert'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url = 'http://www.eurekalert.org/rss/mathematics.xml'
    rss = open(url).read
    feed = RSS::Parser.parse(rss,false)
    feed.items.each do |item|
      #get the tag
      title = item.title
      regex = /[A-Z][a-z]+/
      tags = title.scan(regex)
      #remove the first one
      tags.shift
      if tags.count == 0
        tags = ['boring','mathematics','science']
      end
      #set different items to article object
      article = Article.create(author: nil,
                                title: item.title,
                                summary: item.description,
                                image: nil,
                                source: EUREK_Importer.source_name,
                                pubDate: item.pubDate.to_s[0..15],
                                link: item.link,
                                tag_list:tags)

      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title},\nSummary:#{article.summary},\npubDate:#{article.pubDate},\nlink: #{article.link}\n"
    end
  end
end