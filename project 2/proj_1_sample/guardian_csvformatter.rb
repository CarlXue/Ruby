require 'csv'
require_relative 'news.rb'

# Format CSV files based on data scraped from Guardian
class GuardianCSVFormatter < News::Formatter
  def initialize
    super
  end

  def extension
    'csv'
  end

  def header?
    true
  end

  def footer?
    false
  end

  def header(_article)
    'author,title,summary,images,source,date'
  end

  def article_representation(article)
    items = [article.author, article.title, article.summary,
             article.images, article.source, article.date]
    items.to_csv(row_sep: nil)
  end
end
