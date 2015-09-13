# This script demonstrates how you would go about using the news scraper, 
# adding in a basic dummy importer that returns canned data and then
# exports that to file
#
# Author::    Mathew Blair (mathew.blair@unimelb.edu.au)
# Copyright:: Copyright (c) 2015 The University Of Melbourne

# Import the news scraper
require_relative 'news'
require_relative 'dummy_importer.rb'
require_relative 'dummy_formatter.rb'
require_relative 'newsau_formatter.rb'
require_relative 'newsau_importer.rb'
require_relative 'news_json.rb'

# Implement a news scraper
scraper = News::Scraper.new

# Register the source and importer/formatter
scraper.register_source :dummy_source, DummyImporter, DummyFormatter
scraper.register_source :newsau_csv, NewsAUImporter, NewsAUCSVFormatter
scraper.register_source :newsau_json, NewsAUImporter, NewsAUJSONFormatter

# Run the scrape
scraper.scrape
