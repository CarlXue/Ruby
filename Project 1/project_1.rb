require_relative 'importer'
require_relative 'formatter'
require_relative 'news'
require_relative 'formatter_CSV'
require_relative 'formatter_JSON'
require_relative 'formatter_XML'
require_relative 'importer_RSS'
require_relative 'importer_RSS2'
require_relative 'importer_JSON'

# DRIVER PROGRAM

#CALL SCRAPER
scraper = News::Scraper.new
#REGISTER WITH SOURCES, IMPORTERS, EXPORTERS
#SOURCE 1 The Age (RSS)
#scraper.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_CSV
#scraper.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_JSON
#scraper.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_XML

#SOURCE 2 ABC (RSS)
#scraper.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_CSV
#scraper.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_JSON
#scraper.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_XML

#SOURCE 3 New York Times (JSON)
#scraper.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_CSV
#scraper.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_JSON
#scraper.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_XML

#PERFORM SCRAPE
scraper.scrape
#RETURN RESULTS


