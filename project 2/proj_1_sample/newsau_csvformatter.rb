require_relative 'news.rb'

class NewsAUCSVFormatter < News::Formatter

  # Call super to guarantee that our checks are run
  def initialize
    super
  end

  # Define dummy extension type
  def extension
    "csv"
  end

  # Return true for header
  def header?
    true
  end

  def footer?
    false
  end

  # Return canned header data
  def header article
    "title, summary, image_ref, source, published_at"
  end

  # Return canned article representation
  def article_representation article
    "#{article.title}, #{article.summary.slice(1..15)}..., #{article.images}, #{article.source}, #{article.date}"
  end

end

