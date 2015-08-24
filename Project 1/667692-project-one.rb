require_relative 'news.rb'
require_relative 'formatter_CSV.rb'
require_relative 'formatter_JSON.rb'
require_relative 'formatter_XML.rb'
require_relative 'importer_RSS.rb'
require_relative 'importer_RSS2.rb'
require_relative 'importer_JSON.rb'


# 	This is the driven program. Can be execute by command 
# 'ruby 667692-project-one.rb'
# 	This program creates three scraper instances scraping from three different 
# sources, which are 'The Age', 'ABC' and 'The New York Times', and output the 
# results in three different formatm, namely 'CSV', 'JSON' and 'XML'

# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

#CALL SCRAPER
scraper_CSV = News::Scraper.new
scraper_JSON = News::Scraper.new
scraper_XML = News::Scraper.new

#REGISTER WITH SOURCES, IMPORTERS, EXPORTERS
# SOURCE --> CSV
scraper_CSV.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_CSV
scraper_CSV.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_CSV
scraper_CSV.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_CSV

# SOURCE --> JSON
scraper_JSON.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_JSON
scraper_JSON.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_JSON
scraper_JSON.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_JSON

# SOURCE --> XML
scraper_XML.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_XML
scraper_XML.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_XML
scraper_XML.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_XML

#PERFORM SCRAPE
scraper_CSV.scrape
scraper_JSON.scrape
scraper_XML.scrape




