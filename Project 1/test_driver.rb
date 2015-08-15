require 'rss'
require 'open-uri'

url = 'http://feeds.news.com.au/public/rss/2.0/news_national_3354.xml'

open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  puts feed.items.link
  puts '===========mid============='
  feed.items.each do |item|
    puts item.title
    puts item.pubDate
    puts item.link
    puts item.description
    puts '===========mid============='
    puts item.id
  end

end

