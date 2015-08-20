require 'date'
require 'open-uri'
require 'json'
require 'net/http'
require_relative 'news.rb'
require_relative 'article.rb'
require_relative 'article_NYT.rb'

class Importer_JSON < News::Importer
  @myDeveloperKey = ''
  def initialize(start_date, end_date)
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
                                  key.fetch('abstract')? (key.fetch('abstract').to_s.delete(',')) : ('Blank'),
                                  'Blank',
                                  key.fetch('source'),
                                  key.fetch('pub_date').to_s.delete(','),
                                  key.fetch('web_url').to_s,
                                  key.fetch('document_type').to_s.delete(','),
                                  key.fetch('section_name').to_s.delete(','),
                                  key.fetch('subsection_name')? (key.fetch('subsection_name').to_s.delete(',')) : ('Blank'),
                                  key.fetch('word_count').to_s.delete(','),
                                  key.fetch('headline').fetch('main').to_s.delete(','),
                                  key.fetch('byline').fetch('original').to_s.delete(',')

      @articles << article
    end
    @articles.each do |article|
      puts "Author:#{article.author}\nTitle:#{article.title}\nSummary:#{article.summary}\nImages:#{article.images}\nSource:#{article.source}\nDate:#{article.date}\nLink:#{article.link}"
    end

    return @articles
  end


end