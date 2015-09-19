# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

require 'date'
require 'rss'
require 'open-uri'
require 'nokogiri'

class TC_Importer
  def initialize
    super

  end

  # RETURN THE SOURCE NAME
  def self.source_name
    'TechCrunch'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url = 'http://feeds.feedburner.com/TechCrunch/Gaming?format=xml'
    feeds = Nokogiri::XML(open(url))
    feeds.xpath('//item').map do |item|
      #get the tag
      title = item.at_xpath('title').text
      regex = /[A-Z][a-z]+/
      tags = title.scan(regex)
      #remove the first one
      tags.shift
      tags << item.at_xpath('category').text
      if tags.count == 0
        tags = ['boring','gaming']
      end
      #set different items to article object
      article = Article.create(author:nil,
                            title: item.at_xpath('title').text,
                            summary: item.at_xpath('description').text,
                            image: item.at_xpath('media:thumbnail').attr('url'),
                            source: TC_Importer.source_name,
                            pubDate: item.at_xpath('pubDate').text[0..15],
                            link: item.at_xpath('link').text,
                            tag_list: tags)
      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title}"
    end
  end
end