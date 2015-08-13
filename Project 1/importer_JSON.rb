require 'date'
require_relative 'article.rb'

class Importer_JSON < News::Importer
  def initialize(start_date, end_date)
    super(start_date,end_date)
  end
  # RETURN THE SOURCE NAME
  def self.source
    return 'WebHose.io'
  end
  # PERFORM SCRAPE AND STORE THE ARTICLES
  def scrape
    # CODE HERE

  end


end