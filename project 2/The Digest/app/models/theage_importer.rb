# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

require 'date'
require 'rss'
require 'open-uri'

class THEAGE_Importer
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
      #get the tag
      title = item.title.to_s
      regex = /[A-Z][a-z]+/
      tags = title.scan(regex)
      #remove the first one
      tags.shift
      if tags.count == 0
        tags = ['boring','Top News']
      end
    #set different items to article object
      article = Article.create( author: nil,
                                 title: item.title.delete(','),
                                 summary: item.description.to_s.delete(','),
                                 image: nil,
                                 source: THEAGE_Importer.source_name,
                                 pubDate: item.pubDate.to_s.delete(',')[0..14],
                                 link: item.link,
                                 tag_list:tags)

      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title}"

    end
  end
end