require_relative 'importer'
require_relative 'formatter'
require_relative 'news'
require_relative 'formatter_CSV'
require_relative 'formatter_JSON'
require_relative 'formatter_XML'
require_relative 'importer_RSS'

# DRIVER PROGRAM

#CALL SCRAPER
scraper = News::Scraper.new
#REGISTER WITH SOURCES, IMPORTERS, EXPORTERS
#scraper.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_CSV
#scraper.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_JSON
scraper.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_XML
#PERFORM SCRAPE
scraper.scrape
#RETURN RESULTS


