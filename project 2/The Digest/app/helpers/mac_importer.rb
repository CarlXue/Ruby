require 'date'
require 'rss'
require 'open-uri'
require 'nokogiri'
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

class MAC_Importer < Importer
  def initialize
    super

  end

  # RETURN THE SOURCE NAME
  def self.source_name
    'Mac Rumor'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url = 'http://www.macrumors.com/macrumors.xml'
    feeds = Nokogiri::XML(open(url))
    feeds.xpath('//item').map do |item|
      tmp_html = Nokogiri::HTML(open(item.at_xpath('description').text))
      tmp_img = tmp_html.xpath("//img")[0].attr('src')
      tmp_des = tmp_html.xpath("//p").text
      #set different items to article object
      article = Post.create(author:'Unknown',
                                title: item.at_xpath('title').text,
                                summary: tmp_des,
                                image: tmp_img,
                                source: MAC_Importer.source_name,
                                pubDate: item.at_xpath('pubDate').text,
                                link: item.at_xpath('link').text)
      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title},\nSummary:#{article.summary},\npubDate:#{article.pubDate},\nlink: #{article.link}\n"
    end
  end
end