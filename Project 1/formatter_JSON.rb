require 'Date'
require 'json'
require_relative 'news.rb'

class Formatter_JSON < News::Formatter
  #initializer
  def initialize
    super
  end
  #essential methods
  #DEFINE THE OUTPUT FORMAT
  def extension
    return 'JSON'
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
      return 'Content-type: application/json, charset=UTF-8'
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
    my_json = {}
    article.attributes.each do |key, value|
      my_json[key.to_sym] = value.to_s
    end
    return JSON.generate(my_json)
  end

end