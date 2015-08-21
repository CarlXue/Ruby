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
scraper_AGE_1 = News::Scraper.new
scraper_AGE_2 = News::Scraper.new
scraper_AGE_3 = News::Scraper.new
scraper_ABC_1 = News::Scraper.new
scraper_ABC_2 = News::Scraper.new
scraper_ABC_3 = News::Scraper.new
scraper_NYT_1 = News::Scraper.new
scraper_NYT_2 = News::Scraper.new
scraper_NYT_3 = News::Scraper.new
#REGISTER WITH SOURCES, IMPORTERS, EXPORTERS
# SOURCE 1 The Age (RSS)
scraper_AGE_1.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_CSV
scraper_AGE_2.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_JSON
scraper_AGE_3.register_source 'http://www.theage.com.au/rssheadlines/top.xml',Importer_RSS, Formatter_XML

# SOURCE 2 ABC (RSS)
scraper_ABC_1.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_CSV
scraper_ABC_2.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_JSON
scraper_ABC_3.register_source 'http://www.abc.net.au/sport/syndicate/sport_all.xml',Importer_RSS2, Formatter_XML

# SOURCE 3 New York Times (JSON)
scraper_NYT_1.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_CSV
scraper_NYT_2.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_JSON
scraper_NYT_3.register_source 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&page=2&sort=oldest&api-key=199c76dd8907f94a71cf57d356e332b4:15:72719290',Importer_JSON, Formatter_XML

#PERFORM SCRAPE
scraper_AGE_1.scrape
scraper_AGE_2.scrape
scraper_AGE_3.scrape
scraper_ABC_1.scrape
scraper_ABC_2.scrape
scraper_ABC_3.scrape
scraper_NYT_1.scrape
scraper_NYT_2.scrape
scraper_NYT_3.scrape
#RETURN RESULTS


