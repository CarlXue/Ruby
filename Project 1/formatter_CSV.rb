require 'Date'
require_relative 'news.rb'

class Formatter_CSV < News::Formatter
  #initializer
  def initialize
    super
  end

  #essential methods
  #DEFINE THE OUTPUT FORMAT
  def extension
    return 'CSV'
  end
  #CHECK WHETHER THERE IS A HEADER
  def header?
    true
  end
  #CHECK WHETHER THERE IS A FOOTER
  def footer?
    false
  end

  #PRESENT THE HEADER
  def header(article)
    if header?
      return article.attributes.keys.join(' ,')
    end
  end
  #PRESENT THE FOOTER
  def footer(article)
    if footer?
      return
    end
  end
  #PRESENT THE ARTICLE
  def article_representation(article)
    return article.attributes.values.map(&:to_s).join("\t")
  end
end