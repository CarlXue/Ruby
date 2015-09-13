# This script demonstrates how you would go about using the news scraper,
# adding in a basic dummy importer that returns canned data and then
# exports that to file
#
# Author::    Mathew Blair (mathew.blair@unimelb.edu.au)
# Copyright:: Copyright (c) 2015 The University Of Melbourne

# Import the news scraper
require_relative 'news.rb'
require_relative 'newsau_importer.rb'
require_relative 'newsau_csvformatter.rb'
require_relative 'newsau_jsonformatter.rb'
require_relative 'guardian_importer.rb'
require_relative 'guardian_csvformatter.rb'

# Implement a news scraper
scraper = News::Scraper.new

# Register the source and importer/formatter
scraper.register_source :newsau_csv, NewsAUImporter, NewsAUCSVFormatter
scraper.register_source :newsau_json, NewsAUImporter, NewsAUJSONFormatter
scraper.register_source :guardian_csv, GuardianImporter, GuardianCSVFormatter

# Run the scrape
scraper.scrape
