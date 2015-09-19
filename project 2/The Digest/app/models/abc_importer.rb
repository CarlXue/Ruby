# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

require 'date'
require 'rss'
require 'open-uri'

class ABC_Importer
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
      title = item.title
      summary = item.description
      pubDate = item.pubDate
      link = item.link
      #get the tag
      regex = /[A-Z][a-z]+/
      tags = title.scan(regex)
      #remove the first one
      tags.shift
      if tags.count == 0
        tags = ['boring', 'sports news']
      end
      #set different items to article object
      #how to get author, image ?
      article = Article.create(author: nil,
                          title: title,
                          summary: summary,
                          image: nil,
                          source: ABC_Importer.source_name,
                          pubDate: pubDate.to_s[0..15],
                          link: link,
                          tag_list: tags)

      #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title}"

    end
  end
end