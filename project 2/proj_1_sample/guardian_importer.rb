require 'json'
require 'net/http'

require_relative 'news.rb'

# Import from Guardian JSON API
class GuardianImporter < News::Importer
  def initialize(start_date, end_date)
    super
  end

  def self.source_name
    'guardian'
  end

  def scrape
    url = 'http://content.guardianapis.com/'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    path = '/search?api-key=a8cmjya9kseh5cvx2k2t6dqn&show-fields=all'
    response = http.send_request('GET', path)
    json_data = JSON.parse(response.body)
    article_list = json_data['response']['results']
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    article_list.each do |item|
      a_title = item['webTitle']
      a_summary = item['fields']['body']
      a_summary.gsub!(re, '')
      a_summary = a_summary[0...400]
      a_source = item['webUrl']
      a_date = DateTime.parse(item['webPublicationDate'])
      a_author = item['fields']['byline']
      a_images = item['fields']['thumbnail']
      article = News::Article.new(title: a_title, summary: a_summary,
                                  source: a_source, date: a_date,
                                  images: a_images, author: a_author)
      @articles << article
    end
  end
end
