require 'date'
require 'open-uri'
require 'json'
require 'net/http'
require_relative 'news.rb'
require_relative 'article.rb'

class Importer_JSON < News::Importer
  @myDeveloperKey = ''
  def initialize(start_date:, end_date:)
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
      article = News::Article_NYT.new 'Blank',
                                  key.fetch('snippet').to_s.delete(','),
                                  key.fetch('abstract').to_s.delete(','),
                                  'Blank',
                                  key.fetch('source'),
                                  key.fetch('pub_Date'),
                                  key.fetch('web_url'),
                                  key.fetch('document_type'),
                                  key.fetch('section_name'),
                                  key.fetch('subsection_name'),
                                  key.fetch('word-count'),
                                  key.fetch('headline').fetch('main'),
                                  key.fetch('byline').fetch('original')
      @articles << article
    end
    return @articles
  end


end