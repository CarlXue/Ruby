# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

require 'date'
require 'rss'
require 'open-uri'

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
        article = Article.create( image: item.enclosure.url,
                            title: item.title, summary: item.description,
                            link: item.link, pubDate: item.pubDate.to_s[0..15],
                            source: NEWSAU_Importer.source_name, author: nil,
                            tag_list:tags)

        #DEBUGGING
        puts "Successfully scraped one article:\nTitle:#{article.title}"
      end
    end
  end
end