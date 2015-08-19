require 'rss'
require 'open-uri'

url = 'http://www.theage.com.au/rssheadlines/top.xml'

rss = open(url).read
feed = RSS::Parser.parse(rss,false)
puts "Title: #{feed.channel.title}"
puts "Link: #{feed.channel.link}"
puts "Image: #{feed.channel.image.title}\n#{feed.channel.image.url}"
feed.items.each.with_index {|item,i| puts "#{i+1}. #{item.title} \n Link: #{item.link} \n Description: #{item.description} \n Published Date: #{item.pubDate}"}
puts '===========mid============='
  # feed.items.each do |item|
  #   puts item.title
  #   puts item.pubDate
  #   puts item.link
  #   puts item.description
  #   puts '===========mid============='
  #   puts item.id
  # end

# end

