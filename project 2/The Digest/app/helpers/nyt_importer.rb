require 'date'
require 'open-uri'
require 'json'
require 'net/http'
require_relative '../../app/models/post.rb'

#   This class is inherited from the Importer. It requires the native library 
# 'date', 'open-uri', 'json' and 'net/http'.
#
#   This class is responsible for importing the articles from New York Times. 
#
#   myDeveloperKey is assigned by the New York Times when applying the 
# permission of accesssing its source. It is used to getting the news with 
# authentication.
#
#   self.source_name return the name of this source.
#
#   scrape method performs a url request to the New York Times web service and 
# getting the neccessary information from the response. From each article, 
# those information will be fit into the Atricle_NYT class instances. 

# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class NYT_Importer < Importer
  @myDeveloperKey = ''
  def initialize
    super
    @myDeveloperKey = '199c76dd8907f94a71cf57d356e332b4:15:72719290'
  end
  # RETURN THE SOURCE NAME
  def self.source_name
    return 'The New York Times'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE
    url="http://api.nytimes.com/"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request_url = url + "svc/search/v2/articlesearch.json?fq=romney&facet_field=day_of_week&begin_date=#{@start.to_s.delete!('-')}&end_date=#{@end.to_s.delete!('-')}&api-key=#{@myDeveloperKey}"
    response = http.send_request('GET', request_url)
    jsonMessage = JSON.parse(response.body)
    jsonMessage.fetch('response').fetch('docs').each do |key|
      article = POST.create( author:'Blank',
                                  title: key.fetch('snippet'),
                                  summary: key.fetch('abstract')? (key.fetch('abstract')) : ('Blank'),
                                  image: 'Blank',
                                  source: key.fetch('source'),
                                  pubDate: key.fetch('pub_date').to_s.delete(','),
                                  link: key.fetch('web_url').to_s)
                                  # key.fetch('document_type').to_s.delete(','),
                                  # key.fetch('section_name').to_s.delete(','),
                                  # key.fetch('subsection_name')? (key.fetch('subsection_name').to_s.delete(',')) : ('Blank'),
                                  # key.fetch('word_count').to_s.delete(','),
                                  # key.fetch('headline').fetch('main').to_s.delete(','),
                                  # key.fetch('byline').fetch('original').to_s.delete(',')
                                  #DEBUGGING
      puts "Successfully scraped one article:\nTitle:#{article.title},\nSummary:#{article.summary},\npubDate:#{article.pubDate},\nlink: #{article.link}\n"
    end
  end
end